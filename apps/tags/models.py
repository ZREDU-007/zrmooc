# -*- coding: utf-8 -*-
from __future__ import unicode_literals
__author__ = 'Kris，QQ：1209304692。QQ群：知尔MOOC，760196377'

from django.db import models


# Create your models here.
class Tag(models.Model):
    name = models.CharField(max_length=16, verbose_name='标签')

    class Meta:
        verbose_name = u"标签"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name