# -*- coding: utf-8 -*-
__author__ = 'Kris，QQ：1209304692。QQ群：知尔MOOC，760196377'
import xadmin

from .models import UserAsk, UserStudy, TeacherCourse, UserMessage, UserComment, UserFavorite


class UserAskAdmin(object):
    list_display = ['name', 'mobile', 'course_name', 'add_time']
    search_fields = ['name', 'mobile', 'course_name']
    list_filter = ['name', 'mobile', 'course_name', 'add_time']
    model_icon = 'fa fa-question-circle'

    def has_add_permission(self):
        return False


class UserStudyAdmin(object):
    list_display = ['user', 'course', 'add_time']
    search_fields = ['user', 'course']
    list_filter = ['user', 'course', 'add_time']
    model_icon = 'fa fa-address-book'

    def has_add_permission(self):
        return False


class TeacherCourseAdmin(object):
    list_display = ['user', 'course', 'add_time']
    search_fields = ['user', 'course']
    list_filter = ['user', 'course', 'add_time']
    model_icon = 'fa fa-address-book'

    def has_add_permission(self):
        return False


class UserMessageAdmin(object):
    list_display = ['user', 'message', 'has_read', 'add_time']
    search_fields = ['user', 'message', 'has_read']
    list_filter = ['user', 'message', 'has_read', 'add_time']
    model_icon = 'fa fa-envelope-o'


class UserCommentAdmin(object):
    list_display = ['user', 'course', 'comments', 'add_time']
    search_fields = ['user', 'course', 'comments']
    list_filter = ['user', 'course', 'comments', 'add_time']
    model_icon = 'fa fa-comment'

    def has_add_permission(self):
        return False


class UserFavoriteAdmin(object):
    list_display = ['user', 'fav_id', 'fav_type', 'add_time']
    search_fields = ['user', 'fav_id', 'fav_type']
    list_filter = ['user', 'fav_id', 'fav_type', 'add_time']
    model_icon = 'fa fa-heart'

    def has_add_permission(self):
        return False


xadmin.site.register(UserAsk, UserAskAdmin)
xadmin.site.register(UserStudy, UserStudyAdmin)
xadmin.site.register(TeacherCourse, TeacherCourseAdmin)
xadmin.site.register(UserMessage, UserMessageAdmin)
xadmin.site.register(UserComment, UserCommentAdmin)
xadmin.site.register(UserFavorite, UserFavoriteAdmin)