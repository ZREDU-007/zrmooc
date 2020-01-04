# _*_ encoding:utf-8 _*_
from __future__ import unicode_literals
__author__ = 'Kris，QQ：1209304692。QQ群：知尔MOOC，760196377'
from datetime import datetime

from django.db import models
from DjangoUeditor.models import UEditorField
# Create your models here.


class OrgType(models.Model):
    name = models.CharField(max_length=20, verbose_name=u'机构类型')
    desc = models.TextField(max_length=50, verbose_name=u'备注')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'类型'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name


class CityDict(models.Model):
    name = models.CharField(max_length=20, verbose_name=u"城市")
    desc = models.CharField(max_length=200, verbose_name=u"描述")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'加入时间')

    class Meta:
        verbose_name = u"城市"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name


class CourseOrg(models.Model):
    name = models.CharField(max_length=50, verbose_name=u"机构名称")
    type = models.ForeignKey(OrgType, verbose_name=u'机构类型', null=True, blank=True)
    desc = UEditorField(verbose_name=u"机构描述",width=800, height=300, imagePath="organization/courseorg/ueditor/%Y/%m",
                                         filePath="organization/courseorg/ueditor/%Y/%m", default='')
    click_nums = models.IntegerField(default=0, verbose_name=u"点击数")
    fav_nums = models.IntegerField(default=0, verbose_name=u"收藏数")
    image = models.ImageField(upload_to="org/%Y/%m", verbose_name=u"logo", max_length=100)
    address = models.CharField(max_length=150, verbose_name=u"机构地址")
    city = models.ForeignKey(CityDict, verbose_name=u"所在城市")
    students = models.IntegerField(default=0, verbose_name=u"学习人数")
    course_nums = models.IntegerField(default=0, verbose_name=u"课程数")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'加入时间')
    verify = models.CharField(max_length=3, verbose_name=u'是否认证', default='no', choices=(('no', u'否'), ('yes', u'是')))

    class Meta:
        verbose_name = u"机构"
        verbose_name_plural = verbose_name

    def get_teacher_nums(self):
        #获取课程机构的教师数量
        return self.teacher_set.all().count()

    def __unicode__(self):
        return self.name


class Teacher(models.Model):
    org = models.ForeignKey(CourseOrg, verbose_name=u"所属机构")
    name = models.CharField(max_length=50, verbose_name=u"教师名")
    work_years = models.IntegerField(default=0, verbose_name=u"工作年限")
    work_company = models.CharField(max_length=50, verbose_name=u"就职公司")
    work_position = models.CharField(max_length=50, verbose_name=u"公司职位")
    points = models.CharField(max_length=50, verbose_name=u"教学特点")
    click_nums = models.IntegerField(default=0, verbose_name=u"点击数")
    fav_nums = models.IntegerField(default=0, verbose_name=u"收藏数")
    age = models.IntegerField(default=18, verbose_name=u"年龄")
    image = models.ImageField(default='', upload_to="organization/teacher/%Y/%m", verbose_name=u"头像", max_length=100)
    add_time = models.DateTimeField(default=datetime.now,verbose_name=u'加入时间')
    verify = models.CharField(max_length=3, verbose_name=u'是否认证', default='no', choices=(('no', u'否'), ('yes', u'是')))

    class Meta:
        verbose_name = u"讲师"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name

    def get_course_nums(self):
        return self.course_set.all().count()


