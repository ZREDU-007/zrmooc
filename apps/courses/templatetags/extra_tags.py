# _*_ encoding:utf-8 _*_
from django import template
from operation.models import UserStudy
from users.models import UserProfile

register = template.Library()
@register.filter
def get_course_learn_users(study_id):
    course_users = UserStudy.objects.filter(study_id=study_id, study_type=1)
    user_ids = [course_user.user.id for course_user in course_users]
    course_users = UserProfile.objects.filter(id__in=user_ids)[:5]
    return course_users
