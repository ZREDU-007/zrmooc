# -*- coding: utf-8 -*-
from __future__ import division
__author__ = 'Kris，QQ：1209304692。QQ群：知尔MOOC，760196377'

from django.shortcuts import render
from django.views.generic.base import View
from pure_pagination import Paginator, PageNotAnInteger
from django.http import HttpResponse
from django.db.models import Q

from .models import Course, Resource, Category, Video
from operation.models import UserComment, UserFavorite, UserStudy
from organization.models import Teacher
from utils.mixin_utils import LoginRequiredMixin


# Create your views here.
class CourseListView(View):
    def get(self, request):
        all_courses = Course.objects.all().order_by("-add_time")

        # 一级分类
        root_categorys = Category.objects.filter(is_root='1')
        # 二级分类
        ids = []
        for temp in root_categorys:
            ids.append(temp.id)
        second_categorys = Category.objects.filter(parent_id__in=ids)

        # 课程搜索
        search_keywords = request.GET.get('keywords', "")
        if search_keywords:
            all_courses = all_courses.filter(Q(name__icontains=search_keywords) | Q(desc__icontains=search_keywords))

        # 分类筛选，当前分类及其子类下的所有课程
        breadcrumbs = []
        current_sub_categorys = []
        has_sub_category = 1
        category_id = request.GET.get('category', "")
        if category_id:
            # 课程内容
            category_instance = Category.objects.get(id=category_id)
            all_courses = Category.get_category_content(category_instance, 1000)
            # 导航面包屑，若不再有子类，则不把当前类加入到面包屑
            sub_category_instance = Category.objects.filter(parent_id=category_instance.id)
            breadcrumbs = [category_instance]
            if sub_category_instance:
                print("stil has sub category")
            else:
                has_sub_category = 0
                print("does't have sub category");
            if category_instance.is_root == 0:
                s_category = Category.objects.get(id=category_instance.parent_id)
                breadcrumbs.append(s_category)
                if s_category.is_root == 0:
                    r_category = Category.objects.get(id=s_category.parent_id)
                    breadcrumbs.append(r_category)
            breadcrumbs.reverse()
            # 二级分类区域显示当前类的一级子类，若不再有子类，则显示当前类父类的子类
            current_sub_categorys = Category.objects.filter(parent_id=category_id)
            if current_sub_categorys:
                print("stil has sub category")
            else:
                pid = Category.objects.get(id=category_id).parent_id
                current_sub_categorys = Category.objects.filter(parent_id=pid)
                has_sub_category = 0
                print("does't have sub category")

        # teacher course list
        teacher_id =request.GET.get('teacher', '')
        if teacher_id:
            all_courses = all_courses.filter(teacher=teacher_id)

        # degree choice
        degree = request.GET.get('degree', '')
        if degree:
            all_courses = all_courses.filter(degree=degree)

        # course sort by students & click_nums
        sort = request.GET.get('sort', "")
        if sort:
            if sort == "students":
                all_courses = all_courses.order_by("-students")
            elif sort == "hot":
                all_courses = all_courses.order_by("-click_nums")

        # course page
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_courses, 30, request=request)
        courses = p.page(page)

        courses_num = all_courses.count();

        return render(request, 'mooc/course-list.html', {
            "all_courses": courses,
            "root_categorys": root_categorys,
            "second_categorys": second_categorys,
            "breadcrumbs": breadcrumbs,
            "current_sub_categorys": current_sub_categorys,
            "category_id": category_id,
            "has_sub_category": has_sub_category,
            "degree": degree,
            "courses_num": courses_num,
            "sort": sort,
        })


# course detail
class CourseDetailView(LoginRequiredMixin, View):

    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))

        # click save
        course.click_nums += 1
        course.save()

        # fav course status
        has_fav_course = False
        # fav org status
        has_fav_teacher = False

        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course.id, fav_type=1):
                has_fav_course = True
            '''
            if UserFavorite.objects.filter(user=request.user, fav_id=course.course_org.id, fav_type=2):
                has_fav_org = True
            '''
            if UserFavorite.objects.filter(user=request.user, fav_id=course.teacher.id, fav_type=4):
                has_fav_teacher = True
        '''
        tag = course.tag
        if tag:
            relate_coures = Course.objects.filter(tag=tag)[:1]
        else:
        
        relate_coures = []
        '''
        # get learn this course have learned other course
        user_courses = UserStudy.objects.filter(study_id=course_id, study_type=1)
        user_ids = [user_course.user.id for user_course in user_courses]
        all_user_courses = UserStudy.objects.filter(user_id__in=user_ids, study_type=1)
        course_ids = [user_study.study_id for user_study in all_user_courses]
        relate_courses = Course.objects.exclude(id__in=course_id).filter(id__in=course_ids).order_by("-click_nums")[:5]

        # Generate current course's breadcrumb,default:three class category
        breadcrumbs = [course.category]
        s_category = Category.objects.get(id=course.category.parent_id)
        breadcrumbs.append(s_category)
        r_category = Category.objects.get(id=s_category.parent_id)
        breadcrumbs.append(r_category)
        breadcrumbs.reverse()

        # course comments
        course_comments = UserComment.objects.filter(comment_id=course_id, comment_type=1).order_by("-add_time")

        # course teacher
        teacher = Teacher.objects.get(id=course.teacher_id)

        # course fav numbers
        course_fav_nums = UserFavorite.objects.filter(fav_type=4,fav_id=course_id).count()
        if course_fav_nums:
            pass
        else:
            course_fav_nums = 0

        # course resource
        course_resources = Resource.objects.filter(course=course)

        return render(request, "mooc/course-detail.html", {
            "course": course,
            "course_comments": course_comments,
            "course_fav_nums": course_fav_nums,
            "breadcrumbs": breadcrumbs,
            "relate_courses": relate_courses,
            "has_fav_course": has_fav_course,
            "has_fav_teacher": has_fav_teacher,
            # "has_fav_org":has_fav_org,
            "teacher": teacher,
            "course_resources": course_resources
        })


# play video
class VideoPlayView(LoginRequiredMixin, View):

    def get(self, request, video_id):
        video = Video.objects.get(id=int(video_id))
        # get course by video foreign key
        course = video.lesson.course

        course.students += 1
        course.save()

        # get course teacher
        teacher = Teacher.objects.get(id=course.teacher_id)

        return render(request, 'mooc/course-play.html', {
            'course': course,
            'video': video,
            'teacher': teacher,
        })


# get video url to change play video
class GetVideoView(LoginRequiredMixin, View):

    def get(self, request, video_id):
        video = Video.objects.get(id=int(video_id))
        return HttpResponse(video.url)
