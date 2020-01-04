# _*_ encoding:utf-8 _*_
from __future__ import unicode_literals
__author__ = 'Kris，QQ：1209304692。QQ群：知尔MOOC，760196377'
from datetime import datetime

from django.db import models
from django.contrib.auth.models import AbstractUser


# Create your models here.
class UserProfile(AbstractUser):
    nick_name = models.CharField(max_length=30, verbose_name=u"昵称", null=True, blank=True, default="")
    image = models.ImageField(verbose_name='头像', upload_to="image/users/%Y/%m", max_length=100, null=True, blank=True,
                              default="")
    gender = models.CharField(verbose_name=u'性别', max_length=1, choices=(("1", u"男"), ("0", "女")),
                              default="1")
    mobile = models.CharField(verbose_name='手机', max_length=11, null=True, blank=True, default="")
    qq = models.CharField(verbose_name='QQ', max_length=15, null=True, blank=True, default="")
    wechat = models.CharField(verbose_name='微信', max_length=30, null=True, blank=True, default="")
    birthday = models.DateField(verbose_name=u"生日", default='2000-10-01')
    address = models.CharField(verbose_name=u'地址', max_length=100, null=True, blank=True, default="")
    personal = models.CharField(verbose_name='个性签名', max_length=80, null=True, blank=True, default="")

    class Meta:
        verbose_name = "用户信息"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.username

    def unread_nums(self):
        # get user unread message numbers
        from operation.models import UserMessage
        return UserMessage.objects.filter(user=self.id, has_read=False).count()


class Banner(models.Model):
    title = models.CharField(max_length=100, verbose_name=u"标题")
    image = models.ImageField(upload_to="users/banner/%Y/%m", verbose_name=u"轮播图", max_length=100)
    url = models.URLField(max_length=200, verbose_name=u"访问地址")
    index = models.IntegerField(default=100, verbose_name=u"顺序")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"轮播图"
        verbose_name_plural = verbose_name


class EmailVerifyRecord(models.Model):
    code = models.CharField(max_length=20, verbose_name=u"验证码")
    email = models.EmailField(max_length=50, verbose_name=u"邮箱")
    send_type = models.CharField(verbose_name=u"验证码类型",
                                 choices=(("register", u"注册"), ("forget", u"找回密码"), ("update_email", u"修改邮箱")),
                                 max_length=30)
    send_time = models.DateTimeField(verbose_name=u"发送时间", default=datetime.now)

    class Meta:
        verbose_name = u"邮箱验证码"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return '{0}({1})'.format(self.code, self.email)
