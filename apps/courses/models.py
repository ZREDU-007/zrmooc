# _*_ encoding:utf-8 _*_
from __future__ import unicode_literals
__author__ = 'Kris，QQ：1209304692。QQ群：知尔MOOC，760196377'

from datetime import datetime

from DjangoUeditor.models import UEditorField
from django.db import models

from organization.models import CourseOrg, Teacher
from tags.models import Tag
from users.models import UserProfile


# Create your models here.
class Category(models.Model):
    name = models.CharField(max_length=20, verbose_name=u'分类名称')
    desc = models.CharField(max_length=100, verbose_name=u'分类描述', default=u'暂无描述')
    sort = models.IntegerField(default=0, verbose_name=u'排序')
    parent = models.ForeignKey('self', default=0, null=True, blank=True, verbose_name=u'上级分类')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")
    is_root = models.BooleanField(default=False, verbose_name=u'是否是一级分类')

    class Meta:
        verbose_name = u'课程分类'
        verbose_name_plural = verbose_name

    # 获取当前分类及其子类下的课程
    def get_category_content(self, nums=10):
        cids = []
        second_category = Category.objects.filter(parent_id=self.id)
        if second_category:
            for temp in second_category:
                third_category = Category.objects.filter(parent_id=temp.id)
                if third_category:
                    for temp1 in third_category:
                        cids.append(int(temp1.id))
                else:
                    cids.append(int(temp.id))
        else:
            cids.append(self.id)
        courses = Course.objects.filter(category_id__in=cids)[:nums]
        return courses

    # 获取当前类下的一级子类
    def get_sub_category(self):
        sub_category = Category.objects.filter(parent_id=self.id)
        return sub_category

    def __unicode__(self):
        return self.name


class Course(models.Model):
    course_org = models.ForeignKey(CourseOrg, verbose_name=u"课程机构", null=True, blank=True)
    name = models.CharField(max_length=50, verbose_name=u"课程名")
    desc = models.CharField(max_length=300, verbose_name=u"课程简介", default=u'暂无')
    notice = models.CharField(max_length=300, verbose_name=u"课程公告", default=u'暂无')
    detail = UEditorField(verbose_name=u"课程详情", width=800, height=300, imagePath="courses/course/ueditor/",
                         filePath="courses/course/ueditor/", default='')
    teacher = models.ForeignKey(Teacher, verbose_name=u"讲师")
    degree = models.CharField(verbose_name=u"难度", choices=(("cj","初级"), ("zj","中级"), ("gj","高级")), max_length=2)
    learn_times = models.CharField(default=0, max_length=8, verbose_name=u"学习时长(分钟数)")
    students = models.IntegerField(default=0, verbose_name=u'学习人数')
    fav_nums = models.IntegerField(default=0, verbose_name=u'收藏人数')
    image = models.ImageField(upload_to="course/course/%Y/%m", verbose_name=u"封面图", max_length=100)
    click_nums = models.IntegerField(default=0, verbose_name=u"点击数")
    category = models.ForeignKey(Category, verbose_name=u'课程类别')
    tag = models.ManyToManyField(Tag, verbose_name=u"课程标签")
    youneed_know = models.CharField(default=u'暂无', max_length=300, verbose_name=u"课程须知")
    teacher_tell = models.CharField(default=u'暂无', max_length=300, verbose_name=u"老师告诉你")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"课程"
        verbose_name_plural = verbose_name

    def get_zj_nums(self):
        # 获取课程章节数
        return self.lesson_set.all().count()
    get_zj_nums.short_description = "章节数"

    def go_to(self):
        from django.utils.safestring import mark_safe
        return mark_safe("<a href='http://www.website.com'>跳转</>")
    go_to.short_description = "跳转"

    def get_course_lesson(self):
        # 获取课程所有章节
        return self.lesson_set.all()

    def __unicode__(self):
        return self.name


class Lesson(models.Model):
    course = models.ForeignKey(Course, verbose_name=u"课程")
    name = models.CharField(max_length=100, verbose_name=u"章节名")
    desc = models.CharField(max_length=200, verbose_name=u"章节简介", default=u"暂无介绍")
    learn_times = models.CharField(default='00:00', max_length=8, verbose_name=u"学习时长(分钟数)")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"课程章节"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name

    def get_lesson_video(self):
        # 获取章节视频
        return self.video_set.all()


class Video(models.Model):
    lesson = models.ForeignKey(Lesson, verbose_name=u"章节")
    name = models.CharField(max_length=100, verbose_name=u"视频名")
    learn_times = models.CharField(default='00:00', max_length=8, verbose_name=u"学习时长(分钟数)")
    url = models.CharField(max_length=200, default="", verbose_name=u"访问地址")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"章节视频"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name


class Resource(models.Model):
    course = models.ForeignKey(Course, verbose_name=u"课程")
    name = models.CharField(max_length=100, verbose_name=u"名称")
    download = models.FileField(upload_to="courses/resource/%Y/%m", verbose_name=u"资源文件", max_length=100)
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"课程资料"
        verbose_name_plural = verbose_name

