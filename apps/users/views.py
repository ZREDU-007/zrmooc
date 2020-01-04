# _*_ encoding:utf-8 _*_
__author__ = 'Kris，QQ：1209304692。QQ群：知尔MOOC，760196377'

import re

from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password, check_password
from django.http import HttpResponseRedirect
from django.http import JsonResponse
from pure_pagination import Paginator, PageNotAnInteger
from django.core.urlresolvers import reverse

from .models import UserProfile, EmailVerifyRecord
from utils.email_send import send_register_email

from utils.mixin_utils import LoginRequiredMixin
from operation.models import UserStudy, UserFavorite, UserMessage
from organization.models import Teacher
from courses.models import Course, Category
from .models import Banner


# authenticate
class CustomBackend(ModelBackend):
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username)|Q(email=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None


# register
class RegisterView(View):
    def get(self, request):
        return render(request, "mooc/register.html")

    def post(self, request):
        phone = request.POST.get("phone")
        pass_word = request.POST.get("password", "")
        res = check_password(pass_word)
        if res:
            user_profile = UserProfile()
            user_profile.mobile = phone
            user_profile.username = phone
            user_profile.password = make_password(pass_word)
            user_profile.save()
            # insert welcome message
            user_message = UserMessage()
            user_message.user = user_profile
            user_message.message = "欢迎注册慕课学院"
            user_message.save()
            return JsonResponse({"Code": 0, "Msg": "注册成功，即将前往登录页面！"})
        else:
            return JsonResponse({"Code": 2, "Msg": "密码中必须包含字母和数字！"})


# password login
class LoginView(View):

    def get(self, request):
        return render(request, "mooc/login.html", {})

    def post(self, request):
        user_name = request.POST.get("username", "")
        pass_word = request.POST.get("password", "")
        user = authenticate(username=user_name, password=pass_word)
        if user is not None:
            login(request, user)
            return JsonResponse({"Code": 0, "Msg": "登录成功！"})
        else:
            return JsonResponse({"Code": 1, "Msg": "用户名或密码错误！"})



# user logout
class LogoutView(View):

    def get(self, request):
        logout(request)
        return HttpResponseRedirect(reverse("index"))


# forget password
class ForgetPwdView(View):

    def get(self, request):
        return render(request, "mooc/forget_password.html")

    def post(self, request):
        phone = request.POST.get("phone")
        user = UserProfile.objects.get(mobile=phone)
        pass_word = request.POST.get("password")
        res = check_password_complex(pass_word)
        if res:
            user.password = make_password(pass_word)
            user.save()
            return JsonResponse({"Code": 0, "Msg": "修改密码成功！"})
        else:
            return JsonResponse({"Code": 1, "Msg": "密码中必须包含6到15位字母和数字组合！"})


# user info
class UserinfoView(LoginRequiredMixin, View):

    def get(self, request):
        current_page = "info"
        return render(request, 'mooc/usercenter-info.html', {'current_page': current_page})

    def post(self, request):
        nickname = request.POST.get("nickname", "")
        gender = request.POST.get("gender", "")
        qq = request.POST.get("qq", "")
        wechat = request.POST.get("wechat", "")
        birthday = request.POST.get("birthday", "")
        address = request.POST.get("address", "")
        personal = request.POST.get("personal", "")

        user = request.user
        user.nick_name = nickname
        user.gender = gender
        user.qq = qq
        user.wechat = wechat
        user.birthday = birthday
        user.address = address
        user.personal = personal
        user.save()
        return JsonResponse({"Code": 1, "Msg": "资料修改成功！"})


# update profile picture
class UploadImageView(LoginRequiredMixin, View):

    def post(self, request):
        print(request.FILES)
        print(request.POST)
        image_form = UploadImageForm(request.POST, request.FILES, instance=request.user)
        if image_form.is_valid():
            image_form.save()
            return JsonResponse({"Code": 0, "Msg": "上传成功！"})
        else:
            return JsonResponse({"Code": 1, "Msg": "上传失败！"})


# reset password
class UpdatePwdView(View):

    def post(self, request):
        oldpwd = request.POST.get("oldpwd", "")
        pwd1 = request.POST.get("pwd1", "")
        pwd2 = request.POST.get("pwd2", "")
        if check_password(oldpwd, UserProfile.objects.get(id=request.user.id).password):
            if pwd1 != pwd2:
                return JsonResponse({"Code": 0, "Msg": "两次密码不一致！"})

            user = request.user
            user.password = make_password(pwd2)
            user.save()
            return JsonResponse({"Code": 1, "Msg": "密码修改成功！"})
        else:
            return JsonResponse({"Code": 2, "Msg": "旧密码错误！"})


# send email code
class SendEmailCodeView(LoginRequiredMixin, View):

    def post(self, request):
        email = request.POST.get('new_email', '')
        if UserProfile.objects.filter(email=email):
            return JsonResponse({"Code": 0, "Msg": "邮箱已经存在！"})
        send_register_email(email, "update_email")
        return JsonResponse({"Code": 1, "Msg": "邮件发送成功,请前往邮件查看！"})


# update email
class UpdateEmailView(LoginRequiredMixin, View):

    def post(self, request):
        email = request.POST.get('new_email', '')
        code = request.POST.get('code', '')
        existed_records = EmailVerifyRecord.objects.filter(email=email, code=code, send_type='update_email')
        if existed_records:
            user = request.user
            user.email = email
            user.save()
            return JsonResponse({"Code": 0, "Msg": "邮件修改成功！"})
        else:
            return JsonResponse({"Code": 1, "Msg": "验证码出错！"})


# study course
class MyCourseView(LoginRequiredMixin, View):

    def get(self, request):
        user_courses = UserStudy.objects.filter(user=request.user, study_type=1)
        course_ids = [user_course.study_id for user_course in user_courses]
        courses = Course.objects.filter(id__in=course_ids)
        is_free = request.GET.get('vip', '')
        if is_free:
            courses = courses.filter(is_free=is_free)
        course_num = courses.count()
        current_page = 'mycourse'
        return render(request, 'mooc/usercenter-mycourse.html', {
            "course_num": course_num,
            "courses": courses,
            'current_page': current_page
        })


# fav course
class MyFavCourseView(LoginRequiredMixin, View):

    def get(self, request):
        fav_courses_ids = UserFavorite.objects.filter(user=request.user, fav_type=1).values_list("fav_id", flat=True)
        fav_courses = Course.objects.filter(id__in=fav_courses_ids)
        is_free = request.GET.get('vip', '')
        if is_free:
            fav_courses = fav_courses.filter(is_free=is_free)
        fav_courses_num = fav_courses.count()
        current_page = 'myfav_course'
        return render(request, 'mooc/usercenter-fav-course.html', {
            "fav_courses_num": fav_courses_num,
            "fav_courses": fav_courses,
            'current_page': current_page
        })


# my subcribe teacher
class MyFavTeacherView(LoginRequiredMixin, View):

    def get(self, request):
        fav_teacher_ids = UserFavorite.objects.filter(user=request.user, fav_type=4).values_list("fav_id", flat=True)
        fav_teachers = Teacher.objects.filter(id__in=fav_teacher_ids)
        verify = request.GET.get('verify', '')
        if verify:
            fav_teachers = fav_teachers.filter(verify=verify)
        fav_teachers_num = fav_teachers.count()
        current_page = 'myfav_teacher'
        return render(request, 'mooc/usercenter-fav-teacher.html', {
            "fav_teachers_num": fav_teachers_num,
            "fav_teachers": fav_teachers,
            'current_page': current_page
        })


class MymessageView(LoginRequiredMixin, View):
    """
    我的消息
    """

    def get(self, request):
        all_messages = UserMessage.objects.filter(user=request.user.id)
        current_page = 'mymessage'

        # 用户进入个人消息后清空未读消息的记录
        all_unread_messages = UserMessage.objects.filter(user=request.user.id, has_read=False)
        for unread_message in all_unread_messages:
            unread_message.has_read = True
            unread_message.save()

        # 对个人消息进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_messages, 5, request=request)

        messages = p.page(page)
        return render(request, 'usercenter-message.html', {
            "messages": messages,
            'current_page': current_page
        })


# index page
class IndexView(View):

    def get(self, request):
        # get banner course
        all_banners = Banner.objects.all().order_by('index')
        # get root category
        root_category = Category.objects.filter(is_root=True)

        user = request.user.id
        usercourse_count = UserStudy.objects.filter(user_id=user).count()
        userfavcourse_count = UserFavorite.objects.filter(user_id=user, fav_type=1).count()

        return render(request, 'mooc/index.html', {
            'all_banners': all_banners,
            'usercourse_count': usercourse_count,
            'userfavcourse_count': userfavcourse_count,
            'root_category': root_category,
        })


# check password
def check_password_complex(password):
    password_re = re.compile('^(?=.*[0-9])(?=.*[a-zA-Z]).{6,15}$')
    res = re.search(password_re, password)
    if res:
        return True
    else:
        return False


# global 404 page
def page_not_found(request):
    from django.shortcuts import render_to_response
    response = render_to_response('404.html', {})
    response.status_code = 404
    return response


# global 500 page
def page_error(request):
    from django.shortcuts import render_to_response
    response = render_to_response('500.html', {})
    response.status_code = 500
    return response
