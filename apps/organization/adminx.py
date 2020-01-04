# -*- coding: utf-8 -*-
__author__ = 'Kris，QQ：1209304692。QQ群：知尔MOOC，760196377'

import xadmin

from .models import CityDict, CourseOrg, Teacher, OrgType

class CityDictAdmin(object):
    list_display = ['name', 'desc', 'add_time']
    search_fields = ['name', 'desc']
    list_filter = ['name', 'desc', 'add_time']
    model_icon = 'fa fa-university'


class CourseOrgAdmin(object):
    list_display = ['name', 'click_nums', 'fav_nums', 'students']
    search_fields = ['name', 'desc', 'click_nums', 'fav_nums']
    list_filter = ['name', 'desc', 'click_nums', 'fav_nums']
    relfield_style = 'fk-ajax'
    style_fields = {"desc":"ueditor"}
    model_icon = 'fa fa-university'


class TeacherAdmin(object):
    list_display = ['name', 'org', 'work_years', 'work_company']
    search_fields = ['name', 'org', 'work_years', 'work_company']
    list_filter = ['name', 'org', 'work_years', 'work_company']
    model_icon = 'fa fa-user-md'

    def has_add_permission(self):
        return True


class OrgTypeAdmin(object):
    list_display = ['name', 'desc']
    search_fields = ['name']
    list_filter = []
    model_icon = ''


xadmin.site.register(OrgType, OrgTypeAdmin)
xadmin.site.register(CityDict, CityDictAdmin)
xadmin.site.register(CourseOrg, CourseOrgAdmin)
xadmin.site.register(Teacher, TeacherAdmin)

