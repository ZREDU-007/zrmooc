# -*- coding: utf-8 -*-
__author__ = 'Kris，QQ：1209304692。QQ群：知尔MOOC，760196377'

from django import forms

from .models import UserProfile


class UploadImageForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['image']




