# -*- coding: utf-8 -*-
__author__ = 'Kris，QQ：1209304692。QQ群：知尔MOOC，760196377'
import xadmin

from .models import Tag


# Register your models here.
class TagAdmin(object):
    list_display = ['name']
    search_fields = ['name']
    list_filter = []
    model_icon = ''


xadmin.site.register(Tag, TagAdmin)
