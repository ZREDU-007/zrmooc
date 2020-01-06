## ZRMOOC（知尔慕课系统）
基于python2.7 和 django1.9 慕课（mooc）系统


## 如何开始使用？
1. 先后安装python2.7和安装mysql5.5(初始数据库密码设置为168168)

2. 新建数据库 库名为mooc2

3. 打开终端，进入工程根目录

4. mysqladmin 导入sql文件，导入的管理员账户密码是admin 123456a
(失败的话，就在终端执行makemigrations和migrate)

5. pip install -r requirements.txt 安装依赖包

6. python manage.py createsuperuser

7. python manage.py runserver

8. 浏览器中输入 127.0.0.1:9000访问


## Bug反馈，建议和获取最新动态
加QQ群（760196377）
![avatar](https://github.com/ZREDU-007/zrmooc/blob/master/qqg.png?raw=true)

## 功能预览（部分功能仅限PRO版）
PRO版本目前基于python3.7和django3.0，后期将推出基于Go的版本

1. 课程收藏，老师关注
2. 课程购买，支持微信，支付宝，银联支付
3. 课程学习跟踪记录
4. 课程分享，评论，笔记，评分,wiki
5. 支持微信，微博，qq，手机验证码，以及账号密码登录
6. 文库，考试，资源，社区问答（开发中）

## SNAPSHOT
![avatar](https://github.com/ZREDU-007/zrmooc/blob/master/index.jpg?raw=true)

![avatar](https://github.com/ZREDU-007/zrmooc/blob/master/course_detail.jpg?raw=true)
