# _*_ encoding:utf-8 _*_
__author__ = 'Kris，QQ：1209304692。QQ群：知尔MOOC，760196377'

from django.conf import settings


# config
def siteconfig(request):
    return {'company': settings.SITE_CFG}
