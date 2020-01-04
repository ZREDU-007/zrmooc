# -*- coding: utf-8 -*-
__author__ = 'Kris，QQ：1209304692。QQ群：知尔MOOC，760196377'

from django.conf.urls import url

from .views import UserCommentView, UserFavoriteView, UserStudyView

urlpatterns = [

    # user comment
    url(r'^user_comment/$', UserCommentView.as_view(), name="user_comment"),

    # user favorite
    url(r'^user_favorite/$', UserFavoriteView.as_view(), name="user_favorite"),

    # user study
    url(r'^user_study/$', UserStudyView.as_view(), name="user_study"),

]
