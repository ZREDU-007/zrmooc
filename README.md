# ZRMOOC（知尔慕课系统）

基于python2.7 和 django1.9 慕课（mooc）系统


# 如何开始使用？
1. 先后安装python2.7和安装mysql5.5(初始数据库密码设置为168168)

2. 新建数据库 库名为mooc2

3. 打开终端，进入工程根目录

4. mysqladmin 导入sql文件，导入的管理员账户密码是admin 123456a
(失败的话，就在终端执行makemigrations和migrate)

5. pip install -r requirements.txt 安装依赖包

6. python manage.py createsuperuser

7. python manage.py runserver

8. 浏览器中输入 127.0.0.1:9000访问


# Bug反馈和获取最新版
加QQ群（760196377）


# 预览截图（部分功能仅限PRO版）
PRO目前基于python3.7 django3.0，后期推出基于go的版本。
![image](https://github.com/xxx/xx.png)
