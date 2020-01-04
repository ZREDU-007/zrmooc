# -*- coding: utf-8 -*-
__author__ = 'Kris，QQ：1209304692。QQ群：知尔MOOC，760196377'

from datetime import datetime

from django.db import models

from users.models import UserProfile
from courses.models import Course


# user comment
class UserComment(models.Model):
    user = models.ForeignKey(UserProfile, verbose_name=u"用户")
    comment_id = models.IntegerField(default=0, verbose_name=u"评论对象")
    comment_type = models.IntegerField(choices=((1, "课程"), (2, "文库"), (3, "资源"),), default=1, verbose_name=u"评论类型")
    content = models.CharField(max_length=200, verbose_name=u"评论内容")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"评论时间")

    class Meta:
        verbose_name = u"用户评论"
        verbose_name_plural = verbose_name


# comment reply
class CommentReply(models.Model):
    user = models.ForeignKey(UserProfile, verbose_name=u"用户")
    comment = models.ForeignKey(UserComment, verbose_name=u"所回评论")
    content = models.CharField(max_length=200, verbose_name=u"回复内容")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"回复时间")

    class Meta:
        verbose_name = u"评论回复"
        verbose_name_plural = verbose_name


# user favorite
class UserFavorite(models.Model):
    user = models.ForeignKey(UserProfile, verbose_name=u"用户")
    fav_id = models.IntegerField(default=0, verbose_name=u"收藏内容")
    fav_type = models.IntegerField(choices=((1, "课程"), (2, "文库"), (3, "资源"), (4, "讲师")), default=1,
                                   verbose_name=u"收藏类型")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"收藏时间")

    class Meta:
        verbose_name = u"用户收藏"
        verbose_name_plural = verbose_name


# user study
class UserStudy(models.Model):
    user = models.ForeignKey(UserProfile, verbose_name=u"用户")
    study_id = models.IntegerField(default=0, verbose_name=u"学习内容")
    study_type = models.IntegerField(choices=((1, "课程"), (2, "文库"), (3, "资源")), default=1, verbose_name=u"学习类型")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"学习时间")

    class Meta:
        verbose_name = u"用户学习"
        verbose_name_plural = verbose_name


# user message
class UserMessage(models.Model):
    user = models.ForeignKey(UserProfile, verbose_name=u'接收用户')
    message = models.CharField(max_length=500, verbose_name=u"消息内容")
    has_read = models.BooleanField(default=False, verbose_name=u"是否已读")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"发布时间")

    class Meta:
        verbose_name = u"用户消息"
        verbose_name_plural = verbose_name


# user ask
class UserAsk(models.Model):
    name = models.CharField(max_length=20, verbose_name=u"姓名")
    mobile = models.CharField(max_length=11, verbose_name=u"手机")
    course_name = models.CharField(max_length=50, verbose_name=u"课程名")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"咨询时间")

    class Meta:
        verbose_name = u"用户咨询"
        verbose_name_plural = verbose_name


# teacher course
class TeacherCourse(models.Model):
    user = models.ForeignKey(UserProfile, verbose_name=u"讲师")
    course = models.ForeignKey(Course, verbose_name=u"课程")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"发布时间")

    class Meta:
        verbose_name = u"讲师课程"
        verbose_name_plural = verbose_name
