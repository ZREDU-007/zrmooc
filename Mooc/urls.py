# _*_ encoding:utf-8 _*_
"""AutoMooc URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Import the include() function: from django.conf.urls import url, include
    3. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
__author__ = 'Kris，QQ：1209304692。QQ群：知尔MOOC，760196377'

from django.conf.urls import url, include
from django.contrib import admin

import xadmin
from django.views.static import serve

from users.views import LogoutView, LoginView, RegisterView, ForgetPwdView
from users.views import IndexView
from Mooc.settings import MEDIA_ROOT

urlpatterns = [
    url(r'^xadmin/', xadmin.site.urls),
    url(r'^admin/', admin.site.urls),
    url('^$', IndexView.as_view(), name="index"),
    url('^login/$', LoginView.as_view(), name="login"),
    url('^logout/$', LogoutView.as_view(), name="logout"),
    url('^register/$', RegisterView.as_view(), name="register"),
    url(r'^captcha/', include('captcha.urls')),
    url(r'^forget/$', ForgetPwdView.as_view(), name="forget_pwd"),

    # 机构url配置
    url(r'^org/', include('organization.urls', namespace="org")),

    # course
    url(r'^course/', include('courses.urls', namespace="course")),

    # 配置上传文件的访问处理函数
    url(r'^media/(?P<path>.*)$', serve, {"document_root": MEDIA_ROOT}),

    # users
    url(r'^users/', include('users.urls', namespace="users")),

    # operation
    url(r'^operation/', include('operation.urls', namespace="operation")),

    # rich text
    url(r'^ueditor/', include('DjangoUeditor.urls')),
]

# 全局404页面配置
handler404 = 'users.views.page_not_found'
handler500 = 'users.views.page_error'
