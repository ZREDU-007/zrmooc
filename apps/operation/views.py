# -*- coding: utf-8 -*-
__author__ = 'Kris，QQ：1209304692。QQ群：知尔MOOC，760196377'

from django.views.generic.base import View
from django.http import JsonResponse

from .models import UserComment, UserFavorite, UserStudy
from courses.models import Course
from organization.models import CourseOrg, Teacher
from utils.mixin_utils import LoginRequiredMixin


# user comments
class UserCommentView(View):

    def post(self, request):

        if not request.user.is_authenticated():
            return JsonResponse({"Code": 1000, "Msg": "用户未登录！"})

        comment_id = request.POST.get("comment_id")
        comment_type = request.POST.get("comment_type")
        content = request.POST.get("content", "")

        if comment_id and comment_type and content:
            user_comment = UserComment()
            user_comment.comment_id = comment_id
            user_comment.comment_type = comment_type
            user_comment.content = content
            user_comment.user = request.user
            user_comment.save()
            return JsonResponse({"Code": 0, "Msg": "评论成功！"})
        else:
            return JsonResponse({"Code": 2000, "Msg": "操作异常！"})


# user favorite
class UserFavoriteView(View):

    def post(self, request):

        if not request.user.is_authenticated():
            return JsonResponse({"Code": 1000, "Msg": "用户未登录！"})

        fav_id = request.POST.get('fav_id', 0)
        fav_type = request.POST.get('fav_type', 0)

        user_favorite = UserFavorite.objects.filter(user=request.user, fav_id=int(fav_id), fav_type=int(fav_type))
        if user_favorite:
            # cancel favorite
            user_favorite.delete()
            # course
            if int(fav_type) == 1:
                course = Course.objects.get(id=int(fav_id))
                course.fav_nums -= 1
                if course.fav_nums < 0:
                    course.fav_nums = 0
                course.save()
            elif int(fav_type) == 2:
                # course org
                course_org = CourseOrg.objects.get(id=int(fav_id))
                course_org.fav_nums -= 1
                if course_org.fav_nums < 0:
                    course_org.fav_nums = 0
                course_org.save()
            elif int(fav_type) == 4:
                # course teacher
                teacher = Teacher.objects.get(id=int(fav_id))
                teacher.fav_nums -= 1
                if teacher.fav_nums < 0:
                    teacher.fav_nums = 0
                teacher.save()
            return JsonResponse({"Code": 1, "Msg": "已取消收藏！"})
        else:
            user_fav = UserFavorite()
            if int(fav_id) > 0 and int(fav_type) > 0:
                user_fav.user = request.user
                user_fav.fav_id = int(fav_id)
                user_fav.fav_type = int(fav_type)
                user_fav.save()

                if int(fav_type) == 1:
                    course = Course.objects.get(id=int(fav_id))
                    course.fav_nums += 1
                    course.save()
                elif int(fav_type) == 2:
                    course_org = CourseOrg.objects.get(id=int(fav_id))
                    course_org.fav_nums += 1
                    course_org.save()
                elif int(fav_type) == 4:
                    teacher = Teacher.objects.get(id=int(fav_id))
                    teacher.fav_nums += 1
                    teacher.save()

                return JsonResponse({"Code": 0, "Msg": "已经收藏！"})
            else:
                return JsonResponse({"Code": 2000, "Msg": "操作异常！"})


# user study
class UserStudyView(LoginRequiredMixin, View):

    def post(self, request):

        if not request.user.is_authenticated():
            return JsonResponse({"Code": 1000, "Msg": "用户未登录！"})

        study_id = request.POST.get("study_id")
        study_type = request.POST.get("study_type")
        operation = request.POST.get("operation")

        if study_id and study_type and operation:
            if operation == 'add':
                user_study = UserStudy.objects.filter(user=request.user, study_id=study_id)
                if user_study:
                    return JsonResponse({"Code": 1, "Msg": "学习已关联！"})
                else:
                    user_course = UserStudy(user=request.user, study_id=study_id)
                    user_course.save()
                    return JsonResponse({"Code": 0, "Msg": "学习关联成功！"})

            else:
                UserStudy.objects.filter(user=request.user, study_id=study_id).delete()
                return JsonResponse({"Code": 2, "Msg": "取消学习成功！"})
        else:
            return JsonResponse({"Code": 2000, "Msg": "操作异常！"})



