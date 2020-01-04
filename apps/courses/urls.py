# -*- coding: utf-8 -*-
__author__ = 'Kris，QQ：1209304692。QQ群：知尔MOOC，760196377'

from django.conf.urls import url, include

from .views import CourseListView, CourseDetailView, VideoPlayView,  GetVideoView
urlpatterns = [
    # course list
    url(r'^list/$', CourseListView.as_view(), name="course_list"),

    # course detail
    url(r'^detail/(?P<course_id>\d+)/$', CourseDetailView.as_view(), name="course_detail"),

    # course video play
    url(r'^video/(?P<video_id>\d+)/$', VideoPlayView.as_view(), name="video_play"),

    # video url
    url(r'^get_video/(?P<video_id>\d+)/$', GetVideoView.as_view(), name="get_video"),

]
