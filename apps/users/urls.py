# -*- coding: utf-8 -*-
__author__ = 'Kris，QQ：1209304692。QQ群：知尔MOOC，760196377'

from django.conf.urls import url, include

from .views import UserinfoView, UploadImageView, UpdatePwdView, SendEmailCodeView
from .views import UpdateEmailView, MyCourseView, MyFavTeacherView, MyFavCourseView, \
    MymessageView, ForgetPwdView

urlpatterns = [
    # user info
    url(r'^info/$', UserinfoView.as_view(), name="user_info"),

    # user photo upload
    url(r'^image/upload/$', UploadImageView.as_view(), name="image_upload"),

    # update password
    url(r'^update/pwd/$', UpdatePwdView.as_view(), name="update_pwd"),

    # forget password
    url(r'^forget_pwd/$', ForgetPwdView.as_view(), name="forget_pwd"),

    # send email
    url(r'^sendemail_code/$', SendEmailCodeView.as_view(), name="sendemail_code"),

    # update email
    url(r'^update_email/$', UpdateEmailView.as_view(), name="update_email"),

    # my study course
    url(r'^mycourse/$', MyCourseView.as_view(), name="mycourse"),

    # my subcribe teacher
    url(r'^myfav/teacher/$', MyFavTeacherView.as_view(), name="myfav_teacher"),

    # my fav course
    url(r'^myfav/course/$', MyFavCourseView.as_view(), name="myfav_course"),

    # 我的消息
    url(r'^mymessage/$', MymessageView.as_view(), name="mymessage"),
]
