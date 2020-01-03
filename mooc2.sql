-- phpMyAdmin SQL Dump
-- version 4.0.10.11
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2020-01-03 19:13:09
-- 服务器版本: 5.7.17-log
-- PHP 版本: 7.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `mooc2`
--

-- --------------------------------------------------------

--
-- 表的结构 `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=253 ;

--
-- 转存表中的数据 `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can add group', 3, 'add_group'),
(9, 'Can change group', 3, 'change_group'),
(10, 'Can delete group', 3, 'delete_group'),
(11, 'Can view group', 3, 'view_group'),
(12, 'Can view permission', 2, 'view_permission'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add 用户信息', 6, 'add_userprofile'),
(22, 'Can change 用户信息', 6, 'change_userprofile'),
(23, 'Can delete 用户信息', 6, 'delete_userprofile'),
(24, 'Can add 轮播图', 7, 'add_banner'),
(25, 'Can change 轮播图', 7, 'change_banner'),
(26, 'Can delete 轮播图', 7, 'delete_banner'),
(27, 'Can add 邮箱验证码', 8, 'add_emailverifyrecord'),
(28, 'Can change 邮箱验证码', 8, 'change_emailverifyrecord'),
(29, 'Can delete 邮箱验证码', 8, 'delete_emailverifyrecord'),
(30, 'Can view 轮播图', 7, 'view_banner'),
(31, 'Can view 邮箱验证码', 8, 'view_emailverifyrecord'),
(32, 'Can view 用户信息', 6, 'view_userprofile'),
(33, 'Can add 课程分类', 9, 'add_category'),
(34, 'Can change 课程分类', 9, 'change_category'),
(35, 'Can delete 课程分类', 9, 'delete_category'),
(36, 'Can add 课程', 10, 'add_course'),
(37, 'Can change 课程', 10, 'change_course'),
(38, 'Can delete 课程', 10, 'delete_course'),
(39, 'Can add 章节', 11, 'add_lesson'),
(40, 'Can change 章节', 11, 'change_lesson'),
(41, 'Can delete 章节', 11, 'delete_lesson'),
(42, 'Can add 视频', 12, 'add_video'),
(43, 'Can change 视频', 12, 'change_video'),
(44, 'Can delete 视频', 12, 'delete_video'),
(45, 'Can add 课程资源', 13, 'add_resource'),
(46, 'Can change 课程资源', 13, 'change_resource'),
(47, 'Can delete 课程资源', 13, 'delete_resource'),
(55, 'Can view 课程分类', 9, 'view_category'),
(56, 'Can view 课程', 10, 'view_course'),
(58, 'Can view 章节', 11, 'view_lesson'),
(59, 'Can view 课程资源', 13, 'view_resource'),
(60, 'Can view 视频', 12, 'view_video'),
(61, 'Can add 类型', 16, 'add_orgtype'),
(62, 'Can change 类型', 16, 'change_orgtype'),
(63, 'Can delete 类型', 16, 'delete_orgtype'),
(64, 'Can add 城市', 17, 'add_citydict'),
(65, 'Can change 城市', 17, 'change_citydict'),
(66, 'Can delete 城市', 17, 'delete_citydict'),
(67, 'Can add 机构', 18, 'add_courseorg'),
(68, 'Can change 机构', 18, 'change_courseorg'),
(69, 'Can delete 机构', 18, 'delete_courseorg'),
(70, 'Can add 讲师', 19, 'add_teacher'),
(71, 'Can change 讲师', 19, 'change_teacher'),
(72, 'Can delete 讲师', 19, 'delete_teacher'),
(73, 'Can view 城市', 17, 'view_citydict'),
(74, 'Can view 机构', 18, 'view_courseorg'),
(75, 'Can view 类型', 16, 'view_orgtype'),
(76, 'Can view 讲师', 19, 'view_teacher'),
(77, 'Can add 用户咨询', 20, 'add_userask'),
(78, 'Can change 用户咨询', 20, 'change_userask'),
(79, 'Can delete 用户咨询', 20, 'delete_userask'),
(83, 'Can add 用户收藏', 22, 'add_userfavorite'),
(84, 'Can change 用户收藏', 22, 'change_userfavorite'),
(85, 'Can delete 用户收藏', 22, 'delete_userfavorite'),
(86, 'Can add 用户消息', 23, 'add_usermessage'),
(87, 'Can change 用户消息', 23, 'change_usermessage'),
(88, 'Can delete 用户消息', 23, 'delete_usermessage'),
(92, 'Can add 讲师课程', 25, 'add_teachercourse'),
(93, 'Can change 讲师课程', 25, 'change_teachercourse'),
(94, 'Can delete 讲师课程', 25, 'delete_teachercourse'),
(100, 'Can view 讲师课程', 25, 'view_teachercourse'),
(101, 'Can view 用户咨询', 20, 'view_userask'),
(103, 'Can view 用户收藏', 22, 'view_userfavorite'),
(104, 'Can view 用户消息', 23, 'view_usermessage'),
(105, 'Can add 问题类别', 27, 'add_category'),
(106, 'Can change 问题类别', 27, 'change_category'),
(107, 'Can delete 问题类别', 27, 'delete_category'),
(108, 'Can add 问题', 28, 'add_question'),
(109, 'Can change 问题', 28, 'change_question'),
(110, 'Can delete 问题', 28, 'delete_question'),
(111, 'Can add 回复', 29, 'add_answer'),
(112, 'Can change 回复', 29, 'change_answer'),
(113, 'Can delete 回复', 29, 'delete_answer'),
(114, 'Can view 回复', 29, 'view_answer'),
(115, 'Can view 问题类别', 27, 'view_category'),
(116, 'Can view 问题', 28, 'view_question'),
(117, 'Can add 手记栏目', 30, 'add_category'),
(118, 'Can change 手记栏目', 30, 'change_category'),
(119, 'Can delete 手记栏目', 30, 'delete_category'),
(120, 'Can add 手记', 31, 'add_article'),
(121, 'Can change 手记', 31, 'change_article'),
(122, 'Can delete 手记', 31, 'delete_article'),
(123, 'Can add 手记评论', 32, 'add_comment'),
(124, 'Can change 手记评论', 32, 'change_comment'),
(125, 'Can delete 手记评论', 32, 'delete_comment'),
(126, 'Can view 手记', 31, 'view_article'),
(127, 'Can view 手记栏目', 30, 'view_category'),
(128, 'Can view 手记评论', 32, 'view_comment'),
(129, 'Can add 单选题', 33, 'add_examschoice'),
(130, 'Can change 单选题', 33, 'change_examschoice'),
(131, 'Can delete 单选题', 33, 'delete_examschoice'),
(132, 'Can add 多选题', 34, 'add_exammchoice'),
(133, 'Can change 多选题', 34, 'change_exammchoice'),
(134, 'Can delete 多选题', 34, 'delete_exammchoice'),
(135, 'Can add 判断题', 35, 'add_examjudge'),
(136, 'Can change 判断题', 35, 'change_examjudge'),
(137, 'Can delete 判断题', 35, 'delete_examjudge'),
(138, 'Can add 试卷', 36, 'add_exampaper'),
(139, 'Can change 试卷', 36, 'change_exampaper'),
(140, 'Can delete 试卷', 36, 'delete_exampaper'),
(141, 'Can view 判断题', 35, 'view_examjudge'),
(142, 'Can view 多选题', 34, 'view_exammchoice'),
(143, 'Can view 试卷', 36, 'view_exampaper'),
(144, 'Can view 单选题', 33, 'view_examschoice'),
(145, 'Can add 资源分类', 37, 'add_category'),
(146, 'Can change 资源分类', 37, 'change_category'),
(147, 'Can delete 资源分类', 37, 'delete_category'),
(148, 'Can add 资源', 38, 'add_resource'),
(149, 'Can change 资源', 38, 'change_resource'),
(150, 'Can delete 资源', 38, 'delete_resource'),
(151, 'Can view 资源分类', 37, 'view_category'),
(152, 'Can view 资源', 38, 'view_resource'),
(153, 'Can add 文库类别', 39, 'add_category'),
(154, 'Can change 文库类别', 39, 'change_category'),
(155, 'Can delete 文库类别', 39, 'delete_category'),
(156, 'Can add 文库', 40, 'add_webdoc'),
(157, 'Can change 文库', 40, 'change_webdoc'),
(158, 'Can delete 文库', 40, 'delete_webdoc'),
(159, 'Can view 文库类别', 39, 'view_category'),
(160, 'Can view 文库', 40, 'view_webdoc'),
(161, 'Can add 标签', 41, 'add_tag'),
(162, 'Can change 标签', 41, 'change_tag'),
(163, 'Can delete 标签', 41, 'delete_tag'),
(164, 'Can view 标签', 41, 'view_tag'),
(165, 'Can add 活动', 42, 'add_event'),
(166, 'Can change 活动', 42, 'change_event'),
(167, 'Can delete 活动', 42, 'delete_event'),
(168, 'Can view 活动', 42, 'view_event'),
(169, 'Can add 订单列表', 43, 'add_order'),
(170, 'Can change 订单列表', 43, 'change_order'),
(171, 'Can delete 订单列表', 43, 'delete_order'),
(172, 'Can view 订单列表', 43, 'view_order'),
(173, 'Can add Bookmark', 44, 'add_bookmark'),
(174, 'Can change Bookmark', 44, 'change_bookmark'),
(175, 'Can delete Bookmark', 44, 'delete_bookmark'),
(176, 'Can add User Setting', 45, 'add_usersettings'),
(177, 'Can change User Setting', 45, 'change_usersettings'),
(178, 'Can delete User Setting', 45, 'delete_usersettings'),
(179, 'Can add User Widget', 46, 'add_userwidget'),
(180, 'Can change User Widget', 46, 'change_userwidget'),
(181, 'Can delete User Widget', 46, 'delete_userwidget'),
(182, 'Can add log entry', 47, 'add_log'),
(183, 'Can change log entry', 47, 'change_log'),
(184, 'Can delete log entry', 47, 'delete_log'),
(185, 'Can view Bookmark', 44, 'view_bookmark'),
(186, 'Can view log entry', 47, 'view_log'),
(187, 'Can view User Setting', 45, 'view_usersettings'),
(188, 'Can view User Widget', 46, 'view_userwidget'),
(189, 'Can add captcha store', 48, 'add_captchastore'),
(190, 'Can change captcha store', 48, 'change_captchastore'),
(191, 'Can delete captcha store', 48, 'delete_captchastore'),
(192, 'Can view captcha store', 48, 'view_captchastore'),
(197, 'Can add user social auth', 50, 'add_usersocialauth'),
(198, 'Can change user social auth', 50, 'change_usersocialauth'),
(199, 'Can delete user social auth', 50, 'delete_usersocialauth'),
(200, 'Can add nonce', 51, 'add_nonce'),
(201, 'Can change nonce', 51, 'change_nonce'),
(202, 'Can delete nonce', 51, 'delete_nonce'),
(203, 'Can add association', 52, 'add_association'),
(204, 'Can change association', 52, 'change_association'),
(205, 'Can delete association', 52, 'delete_association'),
(206, 'Can add code', 53, 'add_code'),
(207, 'Can change code', 53, 'change_code'),
(208, 'Can delete code', 53, 'delete_code'),
(209, 'Can add partial', 54, 'add_partial'),
(210, 'Can change partial', 54, 'change_partial'),
(211, 'Can delete partial', 54, 'delete_partial'),
(212, 'Can view association', 52, 'view_association'),
(213, 'Can view code', 53, 'view_code'),
(214, 'Can view nonce', 51, 'view_nonce'),
(215, 'Can view partial', 54, 'view_partial'),
(216, 'Can view user social auth', 50, 'view_usersocialauth'),
(217, 'Can add 用户点赞', 55, 'add_userlike'),
(218, 'Can change 用户点赞', 55, 'change_userlike'),
(219, 'Can delete 用户点赞', 55, 'delete_userlike'),
(220, 'Can view 用户点赞', 55, 'view_userlike'),
(224, 'Can add 评论回复', 57, 'add_commentreply'),
(225, 'Can change 评论回复', 57, 'change_commentreply'),
(226, 'Can delete 评论回复', 57, 'delete_commentreply'),
(230, 'Can view 评论回复', 57, 'view_commentreply'),
(237, 'Can add 用户评论', 60, 'add_usercomment'),
(238, 'Can change 用户评论', 60, 'change_usercomment'),
(239, 'Can delete 用户评论', 60, 'delete_usercomment'),
(240, 'Can view 用户评论', 60, 'view_usercomment'),
(241, 'Can add 用户评价', 61, 'add_userrate'),
(242, 'Can change 用户评价', 61, 'change_userrate'),
(243, 'Can delete 用户评价', 61, 'delete_userrate'),
(244, 'Can add 用户学习', 62, 'add_userstudy'),
(245, 'Can change 用户学习', 62, 'change_userstudy'),
(246, 'Can delete 用户学习', 62, 'delete_userstudy'),
(247, 'Can add 课程笔记', 63, 'add_usernote'),
(248, 'Can change 课程笔记', 63, 'change_usernote'),
(249, 'Can delete 课程笔记', 63, 'delete_usernote'),
(250, 'Can view 课程笔记', 63, 'view_usernote'),
(251, 'Can view 用户评价', 61, 'view_userrate'),
(252, 'Can view 用户学习', 62, 'view_userstudy');

-- --------------------------------------------------------

--
-- 表的结构 `captcha_captchastore`
--

CREATE TABLE IF NOT EXISTS `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `captcha_captchastore`
--

INSERT INTO `captcha_captchastore` (`id`, `challenge`, `response`, `hashkey`, `expiration`) VALUES
(1, 'ZWUM', 'zwum', 'e21a88c73cda60cbb19924b55a7b08d997a19172', '2019-12-26 16:26:30'),
(2, 'WRKP', 'wrkp', 'f3f9b6ff7d41b531f903b1ebef838b5020933deb', '2019-12-26 16:28:44'),
(3, 'RQWL', 'rqwl', 'd428156d2848ff7c50e5af275a35cb03a0b1ae15', '2019-12-26 16:29:16'),
(4, 'GZQD', 'gzqd', 'a6bb17a27f3fb31d188205fcb6a3545a68f12ea1', '2019-12-26 16:29:33'),
(5, 'UCPD', 'ucpd', '5b0765493bec38423d08dc03c9372430019f7923', '2019-12-26 16:41:25'),
(6, 'MNTA', 'mnta', 'fcaa1b8e6d917c1bbc2652aba5d89f14e130c22c', '2019-12-26 16:41:48');

-- --------------------------------------------------------

--
-- 表的结构 `courses_category`
--

CREATE TABLE IF NOT EXISTS `courses_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(100) NOT NULL,
  `sort` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  `is_root` tinyint(1) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_category_parent_id_5fb86d36_fk_courses_category_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=92 ;

--
-- 转存表中的数据 `courses_category`
--

INSERT INTO `courses_category` (`id`, `name`, `desc`, `sort`, `add_time`, `is_root`, `parent_id`) VALUES
(1, 'IT互联网', '暂无描述', 0, '2019-11-28 11:57:00', 1, NULL),
(2, '设计创作', '暂无描述', 0, '2019-11-28 11:57:00', 1, NULL),
(3, '实用外语', '暂无描述', 0, '2019-11-28 11:57:00', 1, NULL),
(4, '兴趣艺术', '暂无描述', 0, '2019-11-28 11:57:00', 1, NULL),
(5, '农业生产', '暂无描述', 0, '2019-11-28 11:57:00', 1, NULL),
(6, '编程语言', '暂无描述', 0, '2019-11-28 11:58:00', 0, 1),
(7, '互联网运营', '暂无描述', 0, '2019-11-28 11:58:00', 0, 1),
(8, '前端开发', '暂无描述', 0, '2019-11-28 11:58:00', 0, 1),
(9, '移动开发', '暂无描述', 0, '2019-11-28 11:58:00', 0, 1),
(10, '游戏开发', '暂无描述', 0, '2019-11-28 11:59:00', 0, 1),
(11, '云计算大数据', '暂无描述', 0, '2019-11-28 11:59:00', 0, 1),
(12, 'C', '暂无描述', 0, '2019-11-28 11:59:00', 0, 6),
(13, 'PHP', '暂无描述', 0, '2019-11-28 11:59:00', 0, 6),
(14, 'Python', '暂无描述', 0, '2019-11-28 12:00:00', 0, 6),
(15, 'C++', '暂无描述', 0, '2019-11-28 12:00:00', 0, 6),
(16, 'JAVA', '暂无描述', 0, '2019-11-28 12:00:00', 0, 6),
(17, 'Linux', '暂无描述', 0, '2019-11-28 12:00:00', 0, 6),
(18, '淘宝运营', '暂无描述', 0, '2019-11-28 12:00:00', 0, 7),
(19, '新媒体运营', '暂无描述', 0, '2019-11-28 12:00:00', 0, 7),
(20, 'SEO', '暂无描述', 0, '2019-11-28 12:00:00', 0, 7),
(21, 'SEM', '暂无描述', 0, '2019-11-28 12:01:00', 0, 7),
(22, '网络营销', '暂无描述', 0, '2019-11-28 12:01:00', 0, 7),
(23, '天猫运营', '暂无描述', 0, '2019-11-28 12:01:00', 0, 7),
(24, '营销实战', '暂无描述', 0, '2019-11-28 12:01:00', 0, 7),
(25, 'JavaScript', '暂无描述', 0, '2019-11-28 12:01:00', 0, 8),
(26, 'DIV', '暂无描述', 0, '2019-11-28 13:14:00', 0, 8),
(27, 'Android', '暂无描述', 0, '2019-11-28 13:14:00', 0, 9),
(28, 'iOS', '暂无描述', 0, '2019-11-28 13:14:00', 0, 9),
(29, 'Cocos2d-x游戏开发', '暂无描述', 0, '2019-11-28 13:15:00', 0, 10),
(30, 'Unity3d游戏开发', '暂无描述', 0, '2019-11-28 13:16:00', 0, 10),
(31, '大数据', '暂无描述', 0, '2019-11-28 13:16:00', 0, 11),
(32, '云计算', '暂无描述', 0, '2019-11-28 13:16:00', 0, 11),
(33, '区块链', '暂无描述', 0, '2019-11-28 13:17:00', 0, 11),
(34, '视觉设计', '暂无描述', 0, '2019-11-28 13:17:00', 0, 2),
(35, '游戏动漫', '暂无描述', 0, '2019-11-28 13:17:00', 0, 2),
(36, '摄影', '暂无描述', 0, '2019-11-28 13:17:00', 0, 2),
(37, '环境艺术', '暂无描述', 0, '2019-11-28 13:17:00', 0, 2),
(38, '工业设计', '暂无描述', 0, '2019-11-28 13:18:00', 0, 2),
(39, '平面设计', '暂无描述', 0, '2019-11-28 13:18:00', 0, 34),
(40, 'Photoshop', '暂无描述', 0, '2019-11-28 13:18:00', 0, 34),
(41, 'UI设计', '暂无描述', 0, '2019-11-28 13:19:00', 0, 34),
(42, '形象设计', '暂无描述', 0, '2019-11-28 13:19:00', 0, 34),
(43, '服装设计', '暂无描述', 0, '2019-11-28 13:19:00', 0, 34),
(44, '淘宝美工', '暂无描述', 0, '2019-11-28 13:19:00', 0, 34),
(45, '游戏模型', '暂无描述', 0, '2019-11-28 13:19:00', 0, 35),
(46, '插画', '暂无描述', 0, '2019-11-28 13:20:00', 0, 35),
(47, '游戏原画', '暂无描述', 0, '2019-11-28 13:20:00', 0, 35),
(48, '影视后期', '暂无描述', 0, '2019-11-28 13:20:00', 0, 36),
(49, '摄影拍摄', '暂无描述', 0, '2019-11-28 13:20:00', 0, 36),
(50, '后期修图', '暂无描述', 0, '2019-11-28 13:20:00', 0, 36),
(51, '室内设计', '暂无描述', 0, '2019-11-28 13:21:00', 0, 37),
(52, '建筑设计', '暂无描述', 0, '2019-11-28 13:21:00', 0, 37),
(53, '塑胶模具设计', '暂无描述', 0, '2019-11-28 13:21:00', 0, 38),
(54, '五金模具设计', '暂无描述', 0, '2019-11-28 13:22:00', 0, 38),
(55, '机械设计', '暂无描述', 0, '2019-11-28 13:22:00', 0, 38),
(56, 'UG产品设计', '暂无描述', 0, '2019-11-28 13:22:00', 0, 38),
(57, 'CAD', '暂无描述', 0, '2019-11-28 13:22:00', 0, 38),
(58, '人工智能', '暂无描述', 0, '2019-11-28 13:22:00', 0, 38),
(59, '英语', '暂无描述', 0, '2019-11-28 13:23:00', 0, 3),
(60, '日语', '暂无描述', 0, '2019-11-28 13:24:00', 0, 3),
(61, '韩语', '暂无描述', 0, '2019-11-28 13:24:00', 0, 3),
(62, '法语', '暂无描述', 0, '2019-11-28 13:24:00', 0, 3),
(63, '泰语', '暂无描述', 0, '2019-11-28 13:24:00', 0, 3),
(64, '基础英语', '暂无描述', 0, '2019-11-28 13:24:00', 0, 59),
(65, '英语口语', '暂无描述', 0, '2019-11-28 13:24:00', 0, 59),
(66, '日语零基础', '暂无描述', 0, '2019-11-28 13:24:00', 0, 60),
(67, '日语初级', '暂无描述', 0, '2019-11-28 13:25:00', 0, 60),
(68, '日语中级', '暂无描述', 0, '2019-11-28 13:25:00', 0, 60),
(69, '日语高级', '暂无描述', 0, '2019-11-28 13:25:00', 0, 60),
(70, '韩语零基础', '暂无描述', 0, '2019-11-28 13:25:00', 0, 61),
(71, '韩语初级', '暂无描述', 0, '2019-11-28 13:25:00', 0, 61),
(72, '韩语中级', '暂无描述', 0, '2019-11-28 13:26:00', 0, 61),
(73, '韩语高级', '暂无描述', 0, '2019-11-28 13:26:00', 0, 61),
(74, '美术', '暂无描述', 0, '2019-11-28 13:28:00', 0, 4),
(75, '音乐', '暂无描述', 0, '2019-11-28 13:28:00', 0, 4),
(76, '生活百科', '暂无描述', 0, '2019-11-28 13:28:00', 0, 4),
(77, '成人教育', '暂无描述', 0, '2019-11-28 13:28:00', 0, 4),
(78, '播音主持', '暂无描述', 0, '2019-11-28 13:28:00', 0, 4),
(79, '素描', '暂无描述', 0, '2019-11-28 13:29:00', 0, 74),
(80, '彩铅', '暂无描述', 0, '2019-11-28 13:29:00', 0, 74),
(81, '水彩', '暂无描述', 0, '2019-11-28 13:29:00', 0, 74),
(82, '油画', '暂无描述', 0, '2019-11-28 13:29:00', 0, 74),
(83, '手绘', '暂无描述', 0, '2019-11-28 13:29:00', 0, 74),
(84, '国画', '暂无描述', 0, '2019-11-28 13:30:00', 0, 74),
(85, '书法', '暂无描述', 0, '2019-11-28 13:30:00', 0, 74),
(86, '种植', '暂无描述', 0, '2019-11-28 13:30:00', 0, 5),
(87, '水产养殖', '暂无描述', 0, '2019-11-28 13:30:00', 0, 5),
(88, '畜牧养殖', '暂无描述', 0, '2019-11-28 13:30:00', 0, 5),
(89, '蔬菜种植', '暂无描述', 0, '2019-11-28 13:31:00', 0, 86),
(90, '果树种植', '暂无描述', 0, '2019-11-28 13:31:00', 0, 86),
(91, '葡萄种植', '暂无描述', 0, '2019-11-28 13:31:00', 0, 86);

-- --------------------------------------------------------

--
-- 表的结构 `courses_course`
--

CREATE TABLE IF NOT EXISTS `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `notice` varchar(300) NOT NULL,
  `degree` varchar(2) NOT NULL,
  `learn_times` varchar(8) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `youneed_know` varchar(300) NOT NULL,
  `teacher_tell` varchar(300) NOT NULL,
  `add_time` datetime NOT NULL,
  `category_id` int(11) NOT NULL,
  `course_org_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) NOT NULL,
  `detail` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_category_id_d64b93bf_fk_courses_category_id` (`category_id`),
  KEY `courses_cour_course_org_id_4d2c4aab_fk_organization_courseorg_id` (`course_org_id`),
  KEY `courses_course_teacher_id_846fa526_fk_organization_teacher_id` (`teacher_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- 转存表中的数据 `courses_course`
--

INSERT INTO `courses_course` (`id`, `name`, `desc`, `notice`, `degree`, `learn_times`, `students`, `fav_nums`, `image`, `click_nums`, `youneed_know`, `teacher_tell`, `add_time`, `category_id`, `course_org_id`, `teacher_id`, `detail`) VALUES
(1, '手把手教你开网店', '暂无描述', '本课程从最基本的概念开始讲起，步步深入，带领大家学习HTML、CSS样式基础知识，了解各种常用标签的意义以及基本用法，后半部分教程主要讲解CSS样式代码添加，为后面的案例课程打下基础。', 'cj', '03:00', 1657, 0, 'courses/2019/11/10.png', 1652, '没有任何WEB经验的WEB应用程序开发者、对WEB前端技术感兴趣的用户均可学习本教程', '本教程代领大家轻松学习HTML、CSS样式基础知识，可以利用HTML、CSS样式技术制作出简单页面。', '2019-11-28 13:32:00', 18, NULL, 1, '<p><img src="/media/courses/course/ueditor/course_desc_20191216165300_606.jpg" title="" alt="course_desc.jpg"/> </p>'),
(2, '自媒体从0到1，助你成为大V', '暂无', '暂无', 'cj', '00:05', 500, 0, 'courses/2019/11/11.png', 8, '暂无', '暂无', '2019-11-28 13:47:00', 19, NULL, 1, ''),
(3, '7天网站搭建速成班', '暂无', '暂无', 'zj', '04:00', 1230, 0, 'courses/2019/11/12.png', 25, '暂无', '暂无', '2019-11-28 13:49:00', 13, NULL, 1, ''),
(4, 'web前端从0基础到开发', '暂无', '暂无', 'zj', '03:00', 0, 0, 'courses/2019/11/13.png', 1, '暂无', '暂无', '2019-11-28 13:49:00', 25, NULL, 1, ''),
(5, 'SEM竞价/信息流优化师高薪必学课', '暂无', '暂无', 'cj', '04:00', 0, 0, 'courses/2019/11/14.png', 0, '暂无', '暂无', '2019-11-28 13:50:00', 21, NULL, 1, ''),
(6, '零基础小白轻松入门web前端', '暂无', '暂无', 'zj', '00:05', 1008, 0, 'courses/2019/11/15.png', 2, '暂无', '暂无', '2019-11-28 13:52:00', 26, NULL, 1, ''),
(7, '淘宝自然搜索得秘密玩法', '暂无', '暂无', 'zj', '04:00', 0, 0, 'courses/2019/11/16.png', 4, '暂无', '暂无', '2019-11-28 13:53:00', 18, NULL, 1, ''),
(8, '电商淘宝运营开店指导运营全套实战培训', '暂无', '暂无', 'zj', '04:00', 0, 0, 'courses/2019/11/17.png', 0, '暂无', '暂无', '2019-11-28 13:57:00', 18, NULL, 1, ''),
(9, 'Python入门到精通', '暂无', '暂无', 'cj', '00:04', 0, 0, 'courses/2019/11/18.png', 2, '暂无', '暂无', '2019-11-28 14:07:00', 14, NULL, 1, ''),
(10, 'C/C++实战VIP体验课', '暂无', '暂无', 'cj', '04:00', 0, 1, 'courses/2019/11/19.png', 42, '暂无', '暂无', '2019-11-28 14:08:00', 15, NULL, 1, ''),
(11, '看动漫学日语「アニメで日本語を勉強しましょう」', '暂无', '暂无', 'gj', '04:00', 630, 0, 'courses/2019/11/20.png', 25, '暂无', '暂无', '2019-11-29 14:39:00', 67, NULL, 1, ''),
(12, '浪漫西班牙语发音教学', '暂无', '暂无', 'zj', '0', 0, 0, 'courses/2019/11/21.png', 2, '暂无', '暂无', '2019-11-29 14:42:00', 66, NULL, 3, ''),
(13, '趣烩韩语大神进阶', '暂无', '暂无', 'gj', '04:00', 576, 0, 'courses/2019/11/22.png', 0, '暂无', '暂无', '2019-11-29 14:43:00', 73, NULL, 1, ''),
(14, '史上最强日本旅游攻略！带你玩转日本！', '暂无', '暂无', 'zj', '00:05', 2368, 0, 'courses/2019/11/23.png', 0, '暂无', '暂无', '2019-11-29 14:44:00', 66, NULL, 1, ''),
(15, '零基础韩语入门教学', '暂无', '暂无', 'cj', '04:00', 11148, 0, 'courses/2019/11/24.png', 0, '暂无', '暂无', '2019-11-29 14:45:00', 73, NULL, 1, ''),
(16, '疯狂学日语', '暂无', '暂无', 'zj', '04:00', 29316, 0, 'courses/2019/11/25.png', 0, '暂无', '暂无', '2019-11-29 14:46:00', 68, NULL, 1, ''),
(17, '零基础趣味实用日语', '暂无', '暂无', 'cj', '04:00', 1485, 0, 'courses/2019/11/26.png', 0, '暂无', '暂无', '2019-11-29 14:47:00', 67, NULL, 1, ''),
(18, '趣烩韩语轻松学', '暂无', '暂无', 'cj', '04:00', 4369, 0, 'courses/2019/11/27.png', 0, '暂无', '暂无', '2019-11-29 14:48:00', 67, NULL, 1, ''),
(19, '趣烩韩语轻松学', '暂无', '暂无', 'cj', '00:04', 1518, 0, 'courses/2019/11/28.png', 0, '暂无', '暂无', '2019-11-29 14:49:00', 67, NULL, 1, ''),
(20, '萌新轻松日语', '暂无', '暂无', 'cj', '00:04', 13519, 0, 'courses/2019/11/29.png', 1, '暂无', '暂无', '2019-11-29 14:49:00', 67, NULL, 1, ''),
(21, '3Dmax软件入门教程', '暂无', '暂无', 'cj', '04:00', 1556, 0, 'courses/2019/11/30.png', 5, '暂无', '暂无', '2019-11-29 15:34:00', 51, NULL, 1, ''),
(22, '【优课推荐】电商设计初养成-老被说文案缺乏层次怎么办？', '暂无', '暂无', 'cj', '04:00', 656, 0, 'courses/2019/11/31.png', 16, '暂无', '暂无', '2019-11-29 15:36:00', 44, NULL, 1, ''),
(23, 'AI卡通形象教程—捕捉你的小可爱，设计你的表情包', '暂无', '暂无', 'cj', '04:00', 656, 0, 'courses/2019/11/32.png', 5, '暂无', '暂无', '2019-11-29 15:37:00', 46, NULL, 1, ''),
(24, '3D模型动漫游戏大咖分', '暂无', '暂无', 'zj', '04:00', 65161, 0, 'courses/2019/11/33.png', 0, '暂无', '暂无', '2019-11-29 15:38:00', 35, NULL, 1, ''),
(25, '3DMAX游戏建模基本操作入门与基础案例教学', '暂无', '暂无', 'zj', '04:00', 563, 0, 'courses/2019/11/34.png', 0, '暂无', '暂无', '2019-11-29 15:38:00', 45, NULL, 1, ''),
(26, 'B站UP直播课堂', '暂无', '暂无', 'zj', '00:04', 52165, 0, 'courses/2019/11/35.png', 1, '暂无', '暂无', '2019-11-29 15:39:00', 49, NULL, 1, ''),
(27, '3D游戏建模-新手入门', '暂无', '暂无', 'gj', '04:00', 656, 0, 'courses/2019/11/36.png', 0, '暂无', '暂无', '2019-11-29 15:40:00', 45, NULL, 1, ''),
(28, 'UG数控编程加工VIP体验课', '暂无', '暂无', 'zj', '04:00', 3366, 0, 'courses/2019/11/37.png', 0, '暂无', '暂无', '2019-11-29 15:41:00', 56, NULL, 1, ''),
(29, 'CAD/UG冲压五金模具VIP体验课', '暂无', '暂无', 'zj', '04:00', 5656, 0, 'courses/2019/11/38.png', 0, '暂无', '暂无', '2019-11-29 15:41:00', 54, NULL, 1, ''),
(30, '平面设计排版思维', '暂无', '暂无', 'zj', '04:00', 656, 0, 'courses/2019/11/39.png', 3, '暂无', '暂无', '2019-11-29 15:42:00', 39, NULL, 1, ''),
(31, '3D模型动漫游戏大咖分', '暂无', '暂无', 'cj', '04:00', 565, 0, 'courses/2019/11/33_tJjhLpz.png', 0, '暂无', '暂无', '2019-11-29 15:43:00', 45, NULL, 1, ''),
(32, '零基础二胡教学', '暂无', '暂无', 'zj', '00:00', 0, 0, 'courses/2019/11/40.png', 1, '暂无', '暂无', '2019-11-29 15:46:00', 79, NULL, 1, ''),
(33, '【升级版】明星都在用的懒人减肥法：让我两个月内狂瘦32斤！', '暂无', '暂无', 'zj', '04:00', 66, 0, 'courses/2019/11/41.png', 4, '暂无', '暂无', '2019-11-29 15:48:00', 79, NULL, 1, ''),
(34, '14堂基本功跟练课-解决古典舞难题', '暂无', '暂无', 'zj', '04:00', 99, 0, 'courses/2019/11/42.png', 2, '暂无', '暂无', '2019-11-29 15:49:00', 79, NULL, 1, ''),
(35, '歌唱技巧训练 助你成为K歌之王', '暂无', '暂无', 'zj', '04:00', 6546, 0, 'courses/2019/11/43.png', 10, '暂无', '暂无', '2019-11-29 15:50:00', 79, NULL, 1, ''),
(36, '【零基础古筝教学】学会弹古筝并非难事', '暂无', '暂无', 'zj', '04:00', 66, 0, 'courses/2019/11/44.png', 42, '暂无', '暂无', '2019-11-29 15:51:00', 79, NULL, 1, ''),
(37, '酷玩声乐一沐老师VIP试学课堂', '暂无', '暂无', 'zj', '04:00', 656, 0, 'courses/2019/11/45.png', 0, '暂无', '暂无', '2019-11-29 15:51:00', 79, NULL, 1, ''),
(38, '酷玩播音VIP课程试听课', '暂无', '暂无', 'zj', '00:04', 64564, 0, 'courses/2019/11/46.png', 0, '暂无', '暂无', '2019-11-29 15:52:00', 79, NULL, 1, ''),
(39, '零基础素描体验课', '暂无', '暂无', 'zj', '00:04', 555, 0, 'courses/2019/11/47.png', 2, '暂无', '暂无', '2019-11-29 15:53:00', 79, NULL, 1, ''),
(40, '古筝试听课', '暂无', '暂无', 'zj', '04:00', 656, 0, 'courses/2019/11/48.png', 0, '暂无', '暂无', '2019-11-29 15:53:00', 79, NULL, 1, ''),
(41, '水彩基础试听', '暂无', '暂无', 'zj', '00:00', 54654, 0, 'courses/2019/11/49.png', 0, '暂无', '暂无', '2019-11-29 15:54:00', 79, NULL, 1, ''),
(42, '小龙虾公开课', '暂无', '暂无', 'zj', '0', 0, 0, 'courses/2019/11/50.png', 0, '暂无', '暂无', '2019-11-29 15:58:00', 89, NULL, 1, ''),
(43, '农业蔬菜种植技术', '暂无', '暂无', 'zj', '0', 0, 0, 'courses/2019/11/51.png', 0, '暂无', '暂无', '2019-11-29 15:59:00', 89, NULL, 1, ''),
(44, '农业种植技术大讲堂', '暂无', '暂无', 'zj', '0', 0, 0, 'courses/2019/11/52.png', 0, '暂无', '暂无', '2019-11-29 15:59:00', 90, NULL, 1, ''),
(45, '农业种植技术大讲堂', '暂无', '暂无', 'zj', '0', 0, 0, 'courses/2019/11/53.png', 0, '暂无', '暂无', '2019-11-29 16:00:00', 90, NULL, 1, ''),
(46, '水产养殖技术大讲堂', '暂无', '暂无', 'zj', '04:00', 0, 0, 'courses/2019/11/54.png', 0, '暂无', '暂无', '2019-11-29 16:01:00', 89, NULL, 1, ''),
(47, '蔬菜种植技术免费公开课', '暂无', '暂无', 'zj', '04:00', 0, 0, 'courses/2019/11/55.png', 1, '暂无', '暂无', '2019-11-29 16:02:00', 90, NULL, 1, ''),
(48, '养猪公开课', '暂无', '暂无', 'zj', '0', 0, 0, 'courses/2019/11/59.png', 1, '暂无', '暂无', '2019-11-29 16:04:00', 89, NULL, 1, ''),
(49, '蔬菜种植技术公开课', '暂无', '暂无', 'zj', '0', 0, 0, 'courses/2019/11/58.png', 8, '暂无', '暂无', '2019-11-29 16:05:00', 89, NULL, 1, ''),
(50, '农业养殖系列之养鸡公开课', '暂无', '暂无', 'zj', '0', 0, 0, 'courses/2019/11/57.png', 10, '暂无', '暂无', '2019-11-29 16:06:00', 89, NULL, 1, ''),
(51, '农业小龙虾公开课', '暂无', '暂无', 'zj', '0', 0, 0, 'courses/2019/11/56.png', 8, '暂无', '暂无', '2019-11-29 16:08:00', 89, NULL, 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `courses_course_tag`
--

CREATE TABLE IF NOT EXISTS `courses_course_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courses_course_tag_course_id_ba11be39_uniq` (`course_id`,`tag_id`),
  KEY `courses_course_tag_tag_id_507e8dd6_fk_tags_tag_id` (`tag_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- 转存表中的数据 `courses_course_tag`
--

INSERT INTO `courses_course_tag` (`id`, `course_id`, `tag_id`) VALUES
(1, 1, 2),
(2, 2, 2),
(3, 3, 2),
(4, 4, 2),
(5, 5, 2),
(6, 6, 2),
(7, 7, 2),
(8, 8, 1),
(9, 9, 2),
(10, 10, 1),
(11, 11, 2),
(12, 12, 2),
(13, 13, 2),
(14, 14, 2),
(15, 15, 2),
(16, 16, 2),
(17, 17, 2),
(18, 18, 2),
(19, 19, 2),
(20, 20, 2),
(21, 21, 1),
(22, 22, 1),
(23, 23, 2),
(24, 24, 1),
(25, 25, 2),
(26, 26, 2),
(27, 27, 2),
(28, 28, 2),
(29, 29, 2),
(30, 30, 1),
(31, 31, 2),
(32, 32, 1),
(33, 33, 2),
(34, 34, 1),
(35, 35, 2),
(36, 36, 1),
(37, 37, 2),
(38, 38, 2),
(39, 39, 2),
(40, 40, 2),
(41, 41, 2),
(42, 42, 1),
(43, 43, 2),
(44, 44, 2),
(45, 45, 2),
(46, 46, 2),
(47, 47, 2),
(48, 48, 2),
(49, 49, 2),
(50, 50, 1),
(51, 51, 1);

-- --------------------------------------------------------

--
-- 表的结构 `courses_lesson`
--

CREATE TABLE IF NOT EXISTS `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `learn_times` varchar(8) NOT NULL,
  `add_time` datetime NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `courses_lesson`
--

INSERT INTO `courses_lesson` (`id`, `name`, `desc`, `learn_times`, `add_time`, `course_id`) VALUES
(1, '01 开店步骤（注册店铺+支付宝）', '暂无介绍', '00:00', '2019-11-29 17:33:00', 1),
(2, '02 认识后台及缴纳保证金', '暂无介绍', '00:00', '2019-11-29 17:34:00', 1),
(3, '03 选类目及选产品', '暂无介绍', '00:00', '2019-11-29 17:35:00', 1),
(4, '04 做标题及发布宝贝', '暂无介绍', '00:00', '2019-11-29 17:35:00', 1),
(5, '05 神笔的应用', '暂无介绍', '00:00', '2019-11-29 17:35:00', 1);

-- --------------------------------------------------------

--
-- 表的结构 `courses_resource`
--

CREATE TABLE IF NOT EXISTS `courses_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_resource_course_id_ce3f78d9_fk_courses_course_id` (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `courses_resource`
--

INSERT INTO `courses_resource` (`id`, `name`, `download`, `add_time`, `course_id`) VALUES
(1, '手把手教你开网店PPT', 'courses/resource/2019/12/standby_list.txt', '2019-12-17 16:04:00', 1),
(2, '图片账号素材', 'courses/resource/2019/12/standby_list_4tOzoaG.txt', '2019-12-17 16:05:00', 1);

-- --------------------------------------------------------

--
-- 表的结构 `courses_video`
--

CREATE TABLE IF NOT EXISTS `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `learn_times` varchar(8) NOT NULL,
  `url` varchar(200) NOT NULL,
  `is_free` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `add_time` datetime NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `courses_video`
--

INSERT INTO `courses_video` (`id`, `name`, `learn_times`, `url`, `is_free`, `price`, `add_time`, `lesson_id`) VALUES
(1, '1.1 开店步骤（注册店铺+支付宝）', '00:00', 'https://www.w3school.com.cn/example/html5/mov_bbb.mp4', 0, NULL, '2019-11-29 17:35:00', 1),
(2, '2.1 认识后台及缴纳保证金', '00:00', 'https://media.w3.org/2010/05/sintel/trailer.mp4', 0, NULL, '2019-11-30 08:36:00', 2),
(3, '3.1 选类目及选产品', '00:00', 'http://mirror.aarnet.edu.au/pub/TED-talks/911Mothers_2010W-480p.mp4', 0, NULL, '2019-11-30 08:37:00', 3),
(4, '4.1 做标题及发布宝贝', '00:00', 'https://media.w3.org/2010/05/sintel/trailer.mp4', 0, NULL, '2019-11-30 08:37:00', 4),
(5, '5.1 神笔的应用神笔的应用神笔的应用', '00:00', 'http://vjs.zencdn.net/v/oceans.mp4', 0, NULL, '2019-11-30 08:37:00', 5),
(6, '1.2 开店步骤（店铺设置）', '00:00', 'http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4', 0, NULL, '2019-11-30 08:38:00', 1),
(7, '1.3 开店步骤（店铺装修）', '00:00', 'http://www.baidu.com/1.mp4', 0, NULL, '2019-12-29 17:06:00', 1),
(8, '1.4 开店步骤（身份认证）', '00:00', 'http://www.baidu.com/1.mp4', 0, NULL, '2019-12-29 17:07:00', 1),
(9, '5.2 神笔的来源神笔的来源', '00:00', 'http://www.baidu.com/1.mp4', 0, NULL, '2019-12-29 17:07:00', 5),
(10, '5.3 神笔的神奇神笔的神奇', '00:00', 'http://www.baidu.com/1.mp4', 0, NULL, '2019-12-29 17:08:00', 5),
(11, '4.2 标题的优化标题的优化', '00:00', 'http://www.baidu.com/1.mp4', 0, NULL, '2019-12-29 17:08:00', 4),
(12, '4.3 标题的整理标题的整理标题的整理', '00:00', 'http://www.baidu.com/1.mp4', 0, NULL, '2019-12-29 17:08:00', 4);

-- --------------------------------------------------------

--
-- 表的结构 `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=64 ;

--
-- 转存表中的数据 `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(31, 'articles', 'article'),
(30, 'articles', 'category'),
(32, 'articles', 'comment'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(48, 'captcha', 'captchastore'),
(4, 'contenttypes', 'contenttype'),
(9, 'courses', 'category'),
(10, 'courses', 'course'),
(11, 'courses', 'lesson'),
(13, 'courses', 'resource'),
(12, 'courses', 'video'),
(42, 'events', 'event'),
(35, 'exams', 'examjudge'),
(34, 'exams', 'exammchoice'),
(36, 'exams', 'exampaper'),
(33, 'exams', 'examschoice'),
(57, 'operation', 'commentreply'),
(25, 'operation', 'teachercourse'),
(20, 'operation', 'userask'),
(60, 'operation', 'usercomment'),
(22, 'operation', 'userfavorite'),
(55, 'operation', 'userlike'),
(23, 'operation', 'usermessage'),
(63, 'operation', 'usernote'),
(61, 'operation', 'userrate'),
(62, 'operation', 'userstudy'),
(43, 'orders', 'order'),
(17, 'organization', 'citydict'),
(18, 'organization', 'courseorg'),
(16, 'organization', 'orgtype'),
(19, 'organization', 'teacher'),
(29, 'questions', 'answer'),
(27, 'questions', 'category'),
(28, 'questions', 'question'),
(37, 'resources', 'category'),
(38, 'resources', 'resource'),
(5, 'sessions', 'session'),
(52, 'social_django', 'association'),
(53, 'social_django', 'code'),
(51, 'social_django', 'nonce'),
(54, 'social_django', 'partial'),
(50, 'social_django', 'usersocialauth'),
(41, 'tags', 'tag'),
(7, 'users', 'banner'),
(8, 'users', 'emailverifyrecord'),
(6, 'users', 'userprofile'),
(39, 'webdocs', 'category'),
(40, 'webdocs', 'webdoc'),
(44, 'xadmin', 'bookmark'),
(47, 'xadmin', 'log'),
(45, 'xadmin', 'usersettings'),
(46, 'xadmin', 'userwidget');

-- --------------------------------------------------------

--
-- 表的结构 `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=73 ;

--
-- 转存表中的数据 `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-12-13 16:02:02'),
(2, 'contenttypes', '0002_remove_content_type_name', '2019-12-13 16:02:02'),
(3, 'auth', '0001_initial', '2019-12-13 16:02:03'),
(4, 'auth', '0002_alter_permission_name_max_length', '2019-12-13 16:02:03'),
(5, 'auth', '0003_alter_user_email_max_length', '2019-12-13 16:02:03'),
(6, 'auth', '0004_alter_user_username_opts', '2019-12-13 16:02:03'),
(7, 'auth', '0005_alter_user_last_login_null', '2019-12-13 16:02:03'),
(8, 'auth', '0006_require_contenttypes_0002', '2019-12-13 16:02:03'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2019-12-13 16:02:03'),
(10, 'users', '0001_initial', '2019-12-13 16:02:03'),
(11, 'admin', '0001_initial', '2019-12-13 16:02:03'),
(12, 'admin', '0002_logentry_remove_auto_add', '2019-12-13 16:02:03'),
(13, 'tags', '0001_initial', '2019-12-13 16:02:03'),
(14, 'articles', '0001_initial', '2019-12-13 16:02:03'),
(15, 'captcha', '0001_initial', '2019-12-13 16:02:03'),
(16, 'organization', '0001_initial', '2019-12-13 16:02:03'),
(17, 'courses', '0001_initial', '2019-12-13 16:02:04'),
(18, 'events', '0001_initial', '2019-12-13 16:02:04'),
(19, 'exams', '0001_initial', '2019-12-13 16:02:04'),
(20, 'operation', '0001_initial', '2019-12-13 16:02:04'),
(21, 'orders', '0001_initial', '2019-12-13 16:02:04'),
(22, 'questions', '0001_initial', '2019-12-13 16:02:05'),
(23, 'resources', '0001_initial', '2019-12-13 16:02:05'),
(24, 'sessions', '0001_initial', '2019-12-13 16:02:05'),
(25, 'webdocs', '0001_initial', '2019-12-13 16:02:05'),
(26, 'xadmin', '0001_initial', '2019-12-13 16:02:05'),
(27, 'xadmin', '0002_log', '2019-12-13 16:02:05'),
(28, 'xadmin', '0003_auto_20160715_0100', '2019-12-13 16:02:05'),
(29, 'users', '0002_auto_20191215_1419', '2019-12-15 14:19:11'),
(30, 'users', '0003_auto_20191215_1501', '2019-12-15 15:01:06'),
(31, 'users', '0004_auto_20191215_1504', '2019-12-15 15:04:34'),
(32, 'courses', '0002_auto_20191216_1532', '2019-12-16 15:33:37'),
(33, 'courses', '0003_auto_20191217_1043', '2019-12-17 10:43:49'),
(34, 'courses', '0004_auto_20191217_1125', '2019-12-17 11:29:02'),
(35, 'courses', '0005_auto_20191217_1128', '2019-12-17 11:29:02'),
(36, 'courses', '0006_auto_20191217_1323', '2019-12-17 13:23:33'),
(37, 'users', '0005_auto_20191221_0841', '2019-12-21 08:41:58'),
(38, 'users', '0006_auto_20191221_0936', '2019-12-21 09:37:05'),
(39, 'users', '0007_auto_20191221_0944', '2019-12-21 09:44:25'),
(40, 'default', '0001_initial', '2019-12-22 15:40:33'),
(41, 'social_auth', '0001_initial', '2019-12-22 15:40:33'),
(42, 'default', '0002_add_related_name', '2019-12-22 15:40:33'),
(43, 'social_auth', '0002_add_related_name', '2019-12-22 15:40:33'),
(44, 'default', '0003_alter_email_max_length', '2019-12-22 15:40:33'),
(45, 'social_auth', '0003_alter_email_max_length', '2019-12-22 15:40:33'),
(46, 'default', '0004_auto_20160423_0400', '2019-12-22 15:40:33'),
(47, 'social_auth', '0004_auto_20160423_0400', '2019-12-22 15:40:33'),
(48, 'social_auth', '0005_auto_20160727_2333', '2019-12-22 15:40:33'),
(49, 'social_django', '0006_partial', '2019-12-22 15:40:33'),
(50, 'social_django', '0007_code_timestamp', '2019-12-22 15:40:33'),
(51, 'social_django', '0008_partial_timestamp', '2019-12-22 15:40:33'),
(52, 'social_django', '0004_auto_20160423_0400', '2019-12-22 15:40:33'),
(53, 'social_django', '0003_alter_email_max_length', '2019-12-22 15:40:33'),
(54, 'social_django', '0005_auto_20160727_2333', '2019-12-22 15:40:33'),
(55, 'social_django', '0002_add_related_name', '2019-12-22 15:40:33'),
(56, 'social_django', '0001_initial', '2019-12-22 15:40:33'),
(57, 'orders', '0002_order_pay_method', '2019-12-26 10:27:13'),
(58, 'orders', '0003_auto_20191226_1136', '2019-12-26 11:36:46'),
(59, 'courses', '0007_auto_20191229_1600', '2019-12-29 16:01:12'),
(60, 'users', '0008_auto_20191229_1600', '2019-12-29 16:01:14'),
(61, 'courses', '0008_course_qqg', '2019-12-29 16:31:26'),
(62, 'courses', '0009_auto_20191229_1653', '2019-12-29 16:53:52'),
(63, 'organization', '0002_teacher_qq', '2019-12-29 16:54:13'),
(64, 'operation', '0002_userlike', '2019-12-29 22:05:23'),
(65, 'operation', '0003_auto_20191229_2218', '2019-12-29 22:21:01'),
(66, 'operation', '0004_auto_20191229_2246', '2019-12-29 22:46:39'),
(67, 'courses', '0010_auto_20191230_1929', '2019-12-30 19:30:10'),
(68, 'operation', '0005_auto_20191230_1931', '2019-12-30 19:31:17'),
(69, 'operation', '0006_auto_20191231_0905', '2019-12-31 09:06:02'),
(70, 'courses', '0011_auto_20191231_1309', '2019-12-31 13:09:13'),
(71, 'operation', '0007_auto_20191231_1309', '2019-12-31 13:09:15'),
(72, 'courses', '0012_auto_20191231_1433', '2019-12-31 14:33:31');

-- --------------------------------------------------------

--
-- 表的结构 `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2xxpahrbbigc9bi08csiqkgtwsona0xr', 'NTkxYzk4MDE1MDFmOWJiYjRiMTMzMTkzODIxODc3NDQzODE3NTI0Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiTElTVF9RVUVSWSI6W1siY291cnNlcyIsImNvdXJzZSJdLCIiXSwiX2F1dGhfdXNlcl9oYXNoIjoiMDQ1YTA4N2M1OTkwNjM3NTEwN2VkYWFjMDY5MGVmMDgyOWU0NjE0YyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQifQ==', '2019-12-30 17:01:12'),
('6ajz50mdr27yyptgb9h602havphn3kj5', 'NjBjMzdkNDhmOGE0ZDYyYjk2NGIyNmQ3ODY5MmEzN2NhODBhZmY2YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjA0NWEwODdjNTk5MDYzNzUxMDdlZGFhYzA2OTBlZjA4MjllNDYxNGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2019-12-31 09:54:33'),
('81opg4f0l991emn4hyss5cwgb3dglnqp', 'ZWU3MDhlZjU4ZjgyODIzMjgyYjIyNjZjMjNhYjJlNGU2NDY2Mzk0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ1MmExZjg1MzdiNmE2NjY2NDcyNGExNDY3YmNiZWU0MzAyODk0M2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIifQ==', '2019-12-31 14:04:24'),
('bljujjzwvu4nt5unpyt60ehrmue2za9h', 'NjBjMzdkNDhmOGE0ZDYyYjk2NGIyNmQ3ODY5MmEzN2NhODBhZmY2YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjA0NWEwODdjNTk5MDYzNzUxMDdlZGFhYzA2OTBlZjA4MjllNDYxNGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2020-01-01 14:40:48'),
('ela14m5x8ixd1hrotzkgvu62mzwdjblg', 'ZWU3MDhlZjU4ZjgyODIzMjgyYjIyNjZjMjNhYjJlNGU2NDY2Mzk0ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ1MmExZjg1MzdiNmE2NjY2NDcyNGExNDY3YmNiZWU0MzAyODk0M2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIifQ==', '2019-12-31 15:08:35'),
('grwv2026h7gx0ge6pbyww6sziovzrj60', 'NjBjMzdkNDhmOGE0ZDYyYjk2NGIyNmQ3ODY5MmEzN2NhODBhZmY2YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjA0NWEwODdjNTk5MDYzNzUxMDdlZGFhYzA2OTBlZjA4MjllNDYxNGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2019-12-31 10:22:39'),
('i3gi9v6c7tbdf7rme84t0vgeflml6a3o', 'NjBjMzdkNDhmOGE0ZDYyYjk2NGIyNmQ3ODY5MmEzN2NhODBhZmY2YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjA0NWEwODdjNTk5MDYzNzUxMDdlZGFhYzA2OTBlZjA4MjllNDYxNGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2019-12-31 10:12:00'),
('vpy7iosaia82fdjxtx8r8ewlasu538fa', 'OTY3YzlkYzMzMmNkNWI3OWE3M2NmZjhjM2UzYzg5MTRjYjc4MDQ1Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjJjM2VkNTNhYjgwZmE5MDhkZTc3OTA0YmRmOGVjNjdmNDBiMTRjMjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2020-01-17 18:46:16'),
('w6ksrl5l2dl31pn3xl3gqrrwrqtdktq2', 'NjBjMzdkNDhmOGE0ZDYyYjk2NGIyNmQ3ODY5MmEzN2NhODBhZmY2YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjA0NWEwODdjNTk5MDYzNzUxMDdlZGFhYzA2OTBlZjA4MjllNDYxNGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2019-12-31 10:15:38'),
('wjgpqa4pz411rqe3ipe3suug5lfrdgwz', 'NWE5NTkyNTQyNTU2MzgwODYxMjA0MmQzZDE3ZmMxZGJlMDkwZDhiMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJMSVNUX1FVRVJZIjpbWyJvcmdhbml6YXRpb24iLCJ0ZWFjaGVyIl0sIiJdLCJfYXV0aF91c2VyX2hhc2giOiIwNDVhMDg3YzU5OTA2Mzc1MTA3ZWRhYWMwNjkwZWYwODI5ZTQ2MTRjIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2020-01-01 11:47:34'),
('zfpqklvzzm5rwuigvs3d3tm27nddzwgz', 'NjBjMzdkNDhmOGE0ZDYyYjk2NGIyNmQ3ODY5MmEzN2NhODBhZmY2YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjA0NWEwODdjNTk5MDYzNzUxMDdlZGFhYzA2OTBlZjA4MjllNDYxNGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2019-12-31 10:21:10');

-- --------------------------------------------------------

--
-- 表的结构 `operation_commentreply`
--

CREATE TABLE IF NOT EXISTS `operation_commentreply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(200) NOT NULL,
  `add_time` datetime NOT NULL,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_commentreply_69b97d17` (`comment_id`),
  KEY `operation_commentreply_e8701ad4` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `operation_teachercourse`
--

CREATE TABLE IF NOT EXISTS `operation_teachercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_teachercourse_course_id_982c7ef6_fk_courses_course_id` (`course_id`),
  KEY `operation_teachercourse_user_id_1db7f13c_fk_users_userprofile_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `operation_userask`
--

CREATE TABLE IF NOT EXISTS `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `operation_usercomment`
--

CREATE TABLE IF NOT EXISTS `operation_usercomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `comment_type` int(11) NOT NULL,
  `content` varchar(200) NOT NULL,
  `add_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercomment_user_id_b9976ec4_fk_users_userprofile_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `operation_usercomment`
--

INSERT INTO `operation_usercomment` (`id`, `comment_id`, `comment_type`, `content`, `add_time`, `user_id`) VALUES
(1, 1, 1, '第一章第二小节，老师讲得有点听不懂', '2019-12-31 16:40:19', 1),
(2, 1, 1, '第一章第二小节，的确是听不懂', '2019-12-31 16:40:46', 2);

-- --------------------------------------------------------

--
-- 表的结构 `operation_userfavorite`
--

CREATE TABLE IF NOT EXISTS `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=86 ;

--
-- 转存表中的数据 `operation_userfavorite`
--

INSERT INTO `operation_userfavorite` (`id`, `fav_id`, `fav_type`, `add_time`, `user_id`) VALUES
(57, 10, 1, '2019-12-17 18:21:34', 1),
(85, 1, 4, '2020-01-03 19:03:30', 1);

-- --------------------------------------------------------

--
-- 表的结构 `operation_usermessage`
--

CREATE TABLE IF NOT EXISTS `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(500) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usermessage_user_id_716f8b9d_fk_users_userprofile_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `operation_usermessage`
--

INSERT INTO `operation_usermessage` (`id`, `message`, `has_read`, `add_time`, `user_id`) VALUES
(1, '欢迎注册汽车慕课学院', 0, '2019-12-19 18:00:36', 5),
(2, '欢迎注册汽车慕课学院', 0, '2019-12-20 09:11:56', 6),
(3, '欢迎注册慕课学院', 0, '2019-12-27 14:30:45', 8);

-- --------------------------------------------------------

--
-- 表的结构 `operation_userstudy`
--

CREATE TABLE IF NOT EXISTS `operation_userstudy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `study_id` int(11) NOT NULL,
  `study_type` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userstudy_user_id_2ce25020_fk_users_userprofile_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `operation_userstudy`
--

INSERT INTO `operation_userstudy` (`id`, `study_id`, `study_type`, `add_time`, `user_id`) VALUES
(1, 1, 1, '2019-12-31 14:03:27', 1),
(2, 1, 1, '2019-12-31 14:43:44', 2),
(3, 9, 1, '2019-12-31 14:43:49', 2),
(4, 3, 1, '2019-12-31 14:43:54', 2),
(5, 7, 1, '2019-12-31 14:43:56', 2),
(6, 4, 1, '2019-12-31 14:44:01', 2),
(7, 6, 1, '2019-12-31 14:44:03', 2);

-- --------------------------------------------------------

--
-- 表的结构 `organization_citydict`
--

CREATE TABLE IF NOT EXISTS `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `organization_citydict`
--

INSERT INTO `organization_citydict` (`id`, `name`, `desc`, `add_time`) VALUES
(1, '北京·', 'BJ', '2019-06-12 14:04:00'),
(2, '长沙', 'CS', '2019-06-13 11:32:00'),
(3, '上海', 'SH', '2019-06-13 13:29:00'),
(4, '广州', 'GZ', '2019-06-13 13:31:00'),
(5, '海口', 'HK', '2019-06-13 13:37:00'),
(6, '杭州', 'HZ', '2019-06-13 13:38:00');

-- --------------------------------------------------------

--
-- 表的结构 `organization_courseorg`
--

CREATE TABLE IF NOT EXISTS `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `students` int(11) NOT NULL,
  `course_nums` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  `verify` varchar(3) NOT NULL,
  `city_id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_course_city_id_4a842f85_fk_organization_citydict_id` (`city_id`),
  KEY `organization_courseorg_94757cae` (`type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `organization_courseorg`
--

INSERT INTO `organization_courseorg` (`id`, `name`, `desc`, `click_nums`, `fav_nums`, `image`, `address`, `students`, `course_nums`, `add_time`, `verify`, `city_id`, `type_id`) VALUES
(1, '北京大学', '<p>北京大学（Peking University），简称“北大”，由中华人民共和国教育部直属，中央直管副部级建制，位列“211工程”、“985工程”、“世界一流大学和一流学科”，入选“基础学科拔尖学生培养试验计划”、“高等学校创新能力提升计划”、“高等学校学科创新引智计划”，为九校联盟、中国大学校长联谊会、京港大学联盟、亚洲大学联盟、东亚研究型大学协会、国际研究型大学联盟、环太平洋大学联盟、21世纪学术联盟、东亚四大学论坛、国际公立大学论坛、中俄综合性大学联盟成员。</p><p>北京大学创立于1898年维新变法之际，初名京师大学堂，是中国近现代第一所国立综合性大学，创办之初也是国家最高教育行政机关。1912年改为国立北京大学。1937年南迁至长沙，与国立清华大学和私立南开大学组成国立长沙临时大学，1938年迁至昆明，更名为国立西南联合大学。1946年复员返回北平。1952年经全国高校院系调整，成为以文理基础学科为主的综合性大学，并自北京城内沙滩等地迁至现址。2000年与原北京医科大学合并，组建为新的北京大学。</p><p>北京大学是新文化运动的中心和五四运动的策源地，最早在中国传播马克思主义和科学、民主思想，是创建中国共产党的重要基地之一。长期以来，北京大学始终与中国和中国人民共命运，与时代和社会同前进，是培养和造就高素质创造性人才的摇篮，恰如蔡元培先生所言：“大学者，囊括大典，网罗众家之学府也……此思想自由之通则，而大学之所以为大也。”</p><p><br/> </p>', 64, 1, 'org/2019/06/a08b87d6277f9e2fbf05793e1130e924b899f3d0_llHMnTE.jpg', '北京市海淀区颐和园路5号', 1, 15, '2019-06-12 14:04:00', 'yes', 1, 2),
(2, '奥迪', '<p>奥迪（Audi）是德国大众汽车集团子公司奥迪汽车公司旗下的豪华汽车品牌，作为高技术水平、质量标准、创新能力、以及经典车型款式的代表，奥迪是汽车品牌之一。公司总部设在德国的英戈尔施塔特，并在中国等许多国家有分公司。<a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[1]_6979550"></a>&nbsp;</p><p>2018年12月20日，2018世界品牌500强排行榜发布，奥迪位列51位。</p><p><br/> </p>', 41, 1, 'org/2019/06/a08b87d6277f9e2fbf05793e1130e924b899f3d0_d0fdT9t.jpg', '北京市朝阳区酒仙桥路4号', 0, 0, '2019-06-13 08:44:00', 'no', 1, 3),
(3, '宝马', '<p>宝马(BMW)是享誉世界的豪华汽车品牌。宝马的车系有1、2、3、4、5、6、7、8、i、X、Z等几个系列，还有在各系基础上进行改进的M系（宝马官方的高性能改装部门）。</p><p>宝马公司创建于1916年，总部设在德国巴伐利亚州慕尼黑。BMW的蓝白标志宝马总部所在地巴伐利亚州州旗的颜色。百年来，宝马汽车由最初的一家飞机引擎生产厂发展成为以高级轿车为主导，并生产享誉全球的飞机引擎、越野车和摩托车的企业集团，名列世界汽车公司前列。其全称为Bavarian Motor Work。</p><p>2018年7月10日，长城公司与宝马公司签署合资协议，合资成立光束汽车有限公司。2018年10月11日，宝马集团举行了中国战略协议签字仪式和华晨宝马铁西新工厂开工仪式。宝马对华晨宝马投资新增30亿欧元，合资协议延至2040年。<span class="sup--normal" data-sup="1" data-ctrmap=":1," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">&nbsp;</span></p><p>2018年12月18日，世界品牌实验室编制的《2018世界品牌500强》揭晓，宝马排名第16位。</p><p><br/> </p>', 0, 0, 'org/2019/06/a08b87d6277f9e2fbf05793e1130e924b899f3d0_b0Mpoqd.jpg', '北京市朝阳区东三环北路霞光里18号佳程大厦B座25层', 0, 0, '2019-06-13 08:50:00', 'yes', 1, 3),
(4, '官方', '<p>我们是博信官方<br/> </p>', 0, 0, 'org/2019/06/a08b87d6277f9e2fbf05793e1130e924b899f3d0_d0RlMEk.jpg', '湖南省长沙市', 0, 0, '2019-06-13 11:33:00', 'yes', 2, 7),
(5, '清华大学', '<p>清华大学（Tsinghua University），简称“清华”，由中华人民共和国教育部直属，中央直管副部级建制，位列“211工程”、“985工程”、“世界一流大学和一流学科”，入选“基础学科拔尖学生培养试验计划”、“高等学校创新能力提升计划”、“高等学校学科创新引智计划”，为九校联盟、中国大学校长联谊会、亚洲大学联盟、环太平洋大学联盟、清华—剑桥—MIT低碳大学联盟成员，被誉为“红色工程师的摇篮”。</p><p>清华大学的前身清华学堂始建于1911年，校名“清华”源于校址“清华园”地名，是清政府设立的留美预备学校，其建校的资金源于1908年美国退还的部分庚子赔款。1912年更名为清华学校。1928年更名为国立清华大学。1937年抗日战争全面爆发后南迁长沙，与国立北京大学、私立南开大学组建国立长沙临时大学，1938年迁至昆明改名为国立西南联合大学。1946年迁回清华园。1949年中华人民共和国成立，清华大学进入新的发展阶段。1952年全国高等学校院系调整后成为多科性工业大学。1978年以来逐步恢复和发展为综合性的研究型大学。</p><p>水木清华，钟灵毓秀，清华大学秉持“自强不息、厚德载物”的校训和“行胜于言”的校风，坚持“中西融汇、古今贯通、文理渗透”的办学风格和“又红又专、全面发展”的培养特色，弘扬“爱国奉献、追求卓越”传统和“人文日新”精神。恰如清华园工字厅内对联所书——“槛外山光，历春夏秋冬、万千变幻，都非凡境；窗中云影，任东西南北、去来澹荡，洵是仙居”</p><p><br/> </p>', 0, 0, 'org/2019/06/a08b87d6277f9e2fbf05793e1130e924b899f3d0_IcoVpV4.jpg', '北京市海淀区清华大学', 0, 0, '2019-06-13 13:18:00', 'yes', 1, 2),
(6, '大众', '<p>大众汽车（德语：Volkswagen）是一家总部位于德国沃尔夫斯堡的汽车制造公司，也是世界四大汽车生产商之一的大众集团的核心企业。2016年位居《财富》世界500强第7位。<span class="sup--normal" data-sup="1" data-ctrmap=":1," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">&nbsp;[1]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[1]_63293"></a>&nbsp;</p><p>Volks在德语中意思为“国民”，Wagen在德语中意思为“汽车”，全名的意思即“国民的汽车”，故又常简称为“VW”。台湾译为福斯汽车，港澳、大陆译为大众汽车或福士汽车，意思是“人民的汽车”。整个汽车集团在2012年产销超过907万辆，大众品牌则超过574万辆。</p><p>2013年11月14日，国家质检总局通报，大众汽车（中国）销售有限公司、一汽－大众汽车有限公司、上海大众汽车有限公司决定自2013年11月25日起，召回部分大众、奥迪和斯柯达汽车，共计640309辆（落地)。2014年10月，一汽-大众再次宣布召回部分新速腾和甲壳虫汽车。</p><p>国家质检总局发布公告说明，大众将在华召回7.8万辆进口汽车，因车辆的转向柱存在缺陷。召回的车型包括2009年1月22日至2014年5月6日期间生产的部分进口2009-2014年款途威、奕鸥、尚酷、尚酷R、跨界高尔夫、高尔夫旅行版、高尔夫R、迈腾旅行轿车、迈腾全路况车、CC及夏朗汽车。<span class="sup--normal" data-sup="2" data-ctrmap=":2," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">&nbsp;[2]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[2]_63293"></a>&nbsp;&nbsp;2018年3月15日，央视3·15晚会曝光，大众途锐发动机进水故障导致无法启动。<span class="sup--normal" data-sup="3-4" data-ctrmap=":3,:4," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">[3-4]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[3-4]_63293"></a>&nbsp;&nbsp;2018年8月25日，大众官方宣布，将独立推出电动“We Share”汽车共享服务。这项汽车共享服务将于明年春季首次在德国柏林推出。<span class="sup--normal" data-sup="5-6" data-ctrmap=":5,:6," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">&nbsp;[5-6]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[5-6]_63293"></a>&nbsp;</p><p>2018年12月，世界品牌实验室编制的《2018世界品牌500强》揭晓，排名第39。</p><p><br/></p>', 2, 0, 'org/2019/06/a08b87d6277f9e2fbf05793e1130e924b899f3d0.jpg', '北京市大众有限公司', 0, 0, '2019-06-13 13:20:00', 'yes', 1, 3),
(7, '北京理工大学出版社', '<p><span style="font-family: ����; font-size: 12px; background-color: rgb(255, 255, 255);">北京理工大学出版社创建于1985年2月，是一家由国防科学技术工业委员会主管、北京理工大学主办，以出版科技图书为主、多学科、综合性的中央级出版社。</span><br style="font-family: ����; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"/> <span style="font-family: ����; font-size: 12px; background-color: rgb(255, 255, 255);">　　自成立以来，北京理工大学出版社始终坚持社会效益第一，坚持为社会主义先进文化服务，为高等学校的教学科研服务，本着“立足本校，面向全国，服务社会”的办社方针，传播有益于科技、经济和社会发展的科学技术和文化知识，图书选题涉猎自然科学、应用技术、管理科学、人文社会科学等领域，理论与应用并重，普及与提高兼顾，以满足广大读者的求知需要。1994年，出版社荣获原国家教委颁发的“全国教材管理工作先进集体”称号；1997年，出版社顺利通过原国家教委的评估；1998年，出版社汽车图书编辑室被中国大学版协评为先进集体；2000年，荣获新闻出版署授予的“良好出版社”称号，同时还被全国图书营销单位推选为“讲信誉、重服务”出版社；1995年获准拥有电子出版物出版权，2005年获准拥有音像制品出版权，成为国内少数同时拥有纸介质图书、电子出版物、音像出版物三项出版权的出版社之一。</span><br style="font-family: ����; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"/> <span style="font-family: ����; font-size: 12px; background-color: rgb(255, 255, 255);">　　建社20多年来，依托学校丰富的学科资源，发挥学校的优势和特色，出版了一大批高质量的学术著作、教材、教学参考书和电子出版物，共计出版图书3000多种，在汽车与机械、信息技术、工业设计、科学普及等类图书领域形成了的特色和优势，先后有《基因组：人种自传23章》、《断裂动力学引论》、《宽束电子光学》等200多种图书分别获得国家级和部委级优秀图书奖，在国内图书市场上享有良好的声誉。近年来，出版社强化了改革意识、发展意识，明确了以改革促发展的工作思路，深入进行内部管理机制的改革，加强队伍建设和制度建设，积极调整产品结构并取得初步的成效，产品的影响力和销售逐年快速攀升，出版社逐步进入了良性发展的轨道。</span><br style="font-family: ����; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"/> <span style="font-family: ����; font-size: 12px; background-color: rgb(255, 255, 255);">　　我社的版权贸易活动日趋活跃，先后与新加坡、英国、美国、德国、日本等国家和我国的台湾、香港等地区开展了版权贸易合作，1995年以来共引进版权近200种。1999年10月，我社开通了“北京理工大学出版社网上购书，网址为：</span><a href="http://www.bitpress.com.cn/" style="color: rgb(85, 85, 85); text-decoration-line: none; font-family: ����; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="color:#000000">http://www.bitpress.com.cn</span></a><span style="font-family: ����; font-size: 12px; background-color: rgb(255, 255, 255);">，</span><a href="http://www.bitpress.net/" style="color: rgb(85, 85, 85); text-decoration-line: none; font-family: ����; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="color:#000000">www.bitpress.net</span></a><span style="font-family: ����; font-size: 12px; background-color: rgb(255, 255, 255);">，通过国际互联网向全世界宣传我社出版的图书，展示我社的风貌。</span><br style="font-family: ����; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"/> <span style="font-family: ����; font-size: 12px; background-color: rgb(255, 255, 255);">　　今后出版社将继续深化改革，着重进行企业文化的建设，进一步强化“全心全意为读者服务，为作者服务”的意识，为把我社建设成为国内一流的大学出版社，为繁荣我国的出版事业做出积极的贡献。</span></p>', 0, 0, 'org/2019/06/a08b87d6277f9e2fbf05793e1130e924b899f3d0_oIc2cqG.jpg', '北京理工大学国际教育交流中心五层（中关村南大街5号）', 0, 0, '2019-06-13 13:22:00', 'yes', 1, 4),
(8, '机械工业出版社', '<p>机械工业出版社<span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">是国内</span>知<span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">名</span>信息<span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">出版</span>内容<span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">提供商，经过62年的发展，特别是改革开放30年来的锐意</span>进取<span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">，开拓创新，机械工业出版社已逐步形成了完整的</span>信息<span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">采集、加工、传播和服务体系，产品涵盖</span>图书<span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">、</span>期刊<span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">、数据产品、音像制品、电子出版物，是集纸介</span>媒体<span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">、视听媒体、网络媒体为一体，研究、</span>出版<span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">、培训、</span>印刷<span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">、发行、分销纵向一体化的行业领先的多领域、多学科、多媒体的大型综合性</span>专业<span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">出版</span>集团<span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">。</span></p>', 0, 0, 'org/2019/06/a08b87d6277f9e2fbf05793e1130e924b899f3d0_GyQJ7sY.jpg', '北京市西城区百万庄大街22号', 0, 0, '2019-06-13 13:23:00', 'yes', 1, 4),
(9, '奔驰', '<p><span style="color: rgb(51, 51, 51); font-family: Helvetica, Arial, Tahoma, &quot;Microsoft Yahei&quot;, 宋体, sans-serif; font-size: 15px; background-color: rgb(242, 242, 242);">奔驰，德国百年汽车品牌，汽车文明的先驱者与引领者，被认为是最成功的高档汽车品牌之一，其登峰造极的技术水平、精湛过硬的质量标准、推陈出新的创新能力、以及一系列经典轿跑车款式令人称道。</span></p>', 0, 0, 'org/2019/06/a08b87d6277f9e2fbf05793e1130e924b899f3d0_VpmwEnY.jpg', '北京海淀区奔驰总部', 0, 0, '2019-06-13 13:26:00', 'no', 1, 3),
(10, '特斯拉', '<p>特斯拉(Tesla)，是一家美国电动车及能源公司，产销电动车、太阳能板、及储能设备。<span class="sup--normal" data-sup="1" data-ctrmap=":1," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">&nbsp;[1]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[1]_7885589"></a>&nbsp;&nbsp;总部位于美国加利福尼亚州硅谷的帕罗奥多（Palo Alto）<span class="sup--normal" data-sup="2" data-ctrmap=":2," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">&nbsp;[2]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[2]_7885589"></a>&nbsp;&nbsp;，2003年最早由马丁·艾伯哈德（Martin Eberhard）和马克·塔彭宁（Marc Tarpenning）共同创立，2004年埃隆·马斯克（Elon Musk）进入公司并领导了A轮融资。&nbsp;<span class="sup--normal" data-sup="3-5" data-ctrmap=":3,:4,:5," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">[3-5]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[3-5]_7885589"></a>&nbsp;&nbsp;创始人将公司命名为“特斯拉汽车（Tesla Motors）”，以纪念物理学家尼古拉·特斯拉（Nikola Tesla）。<span class="sup--normal" data-sup="6" data-ctrmap=":6," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">&nbsp;[6]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[6]_7885589"></a>&nbsp;</p><p>特斯拉第一款汽车产品Roadster发布于2008年，为一款两门运动型跑车。&nbsp;<span class="sup--normal" data-sup="7" data-ctrmap=":7," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">[7]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[7]_7885589"></a>&nbsp;&nbsp;2012年，特斯拉发布了其第二款汽车产品——Model S，一款四门纯电动豪华轿跑车<span class="sup--normal" data-sup="8" data-ctrmap=":8," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">&nbsp;[8]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[8]_7885589"></a>&nbsp;&nbsp;； 第三款汽车产品为Model X，豪华纯电动SUV&nbsp;<span class="sup--normal" data-sup="9" data-ctrmap=":9," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">[9]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[9]_7885589"></a>&nbsp;&nbsp;，于2015年9月开始交付。<span class="sup--normal" data-sup="10" data-ctrmap=":10," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">[10]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[10]_7885589"></a>&nbsp;&nbsp;特斯拉的下一款汽车为Model 3，首次公开于2016年3月&nbsp;<span class="sup--normal" data-sup="11" data-ctrmap=":11," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">[11]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[11]_7885589"></a>&nbsp;&nbsp;，并将于2017年末开始交付。</p><p>特斯拉首席执行官埃隆·马斯克表示<span class="sup--normal" data-sup="12" data-ctrmap=":12," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">&nbsp;[12]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[12]_7885589"></a>&nbsp;&nbsp;，特斯拉努力为每一个普通消费者提供其消费能力范围内的纯电动车辆；特斯拉的愿景，是『加速全球向可持续能源的转变』。</p><p><br/> </p>', 0, 0, 'org/2019/06/a08b87d6277f9e2fbf05793e1130e924b899f3d0_jIRcz5w.jpg', '上海市某某区中国总部', 0, 0, '2019-06-13 13:29:00', 'yes', 3, 3),
(11, '丰田', '<p>丰田汽车公司（Toyota&nbsp;Motor Corporation），简称丰田（TOYOTA），是一家总部设在日本爱知县丰田市和东京都文京区的日本汽车制造公司，属于<span style="font-weight: 700;"></span><span style="font-weight: 700;">三井</span>(Mitsui)财阀。<span class="sup--normal" data-sup="1" data-ctrmap=":1," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">&nbsp;[1]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[1]_13251014"></a>&nbsp;</p><p>2012年共售973万辆车，2013年度预计生产1010万辆汽车，是第一个达到年产量千万台以上的车厂。而丰田亦是雷克萨斯、斯巴鲁品牌的母公司及富士重工的最大股东。<span class="sup--normal" data-sup="2-3" data-ctrmap=":2,:3," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">&nbsp;[2-3]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[2-3]_13251014"></a>&nbsp;</p><p>2016年位居《财富》世界500强第8位。<span class="sup--normal" data-sup="4" data-ctrmap=":4," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">&nbsp;[4]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[4]_13251014"></a>&nbsp;&nbsp;10月，丰田汽车公司排2016年全球100大最有价值品牌第5名。<span class="sup--normal" data-sup="5" data-ctrmap=":5," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">&nbsp;[5]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[5]_13251014"></a>&nbsp;&nbsp;2017年6月，WPP和Kantar Millward Brown共同发布“2017年BrandZ全球最具价值品牌100强”榜单，丰田排名第30。<span class="sup--normal" data-sup="6" data-ctrmap=":6," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">&nbsp;[6]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[6]_13251014"></a>&nbsp;&nbsp;2018年12月18日，世界品牌实验室编制的《2018世界品牌500强》揭晓，丰田排名第9位。</p><p><br/> </p>', 2, 0, 'org/2019/06/a08b87d6277f9e2fbf05793e1130e924b899f3d0_oXa9IJ4.jpg', '广州天河区丰田有限公司', 0, 0, '2019-06-13 13:31:00', 'no', 4, 3),
(12, '本田', '<p>本田指的是本田株式会社（本田技研工业株式会社）是世界上最大的摩托车生产厂家，汽车产量和规模也名列世界十大汽车厂家之列。</p><p>1946年10月创立，1948年9月成立公司，创始人是传奇式人物本田宗一郎。公司总部在东京，雇员总数达18万人左右。现在，本田公司已是一个跨国汽车、摩托车生产销售集团。它的产品除汽车、摩托车外，还有发电机、农机等动力机械产品。<span class="sup--normal" data-sup="1" data-ctrmap=":1," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">&nbsp;[1]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[1]_12015520"></a>&nbsp;</p><p>2017年BrandZ全球最具价值品牌100强，本田(Honda) 汽车以121.63亿美元排名第91名。<span class="sup--normal" data-sup="2" data-ctrmap=":2," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">&nbsp;[2]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[2]_12015520"></a>&nbsp;&nbsp;2018年7月19日，《财富》世界500强排行榜发布，本田汽车位列30位。<span class="sup--normal" data-sup="3" data-ctrmap=":3," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">&nbsp;[3]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[3]_12015520"></a>&nbsp;&nbsp;2018年12月，本田入围2018世界品牌500强。<span class="sup--normal" data-sup="4" data-ctrmap=":4," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">&nbsp;[4]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[4]_12015520"></a>&nbsp;&nbsp;2019年2月19日，日本汽车厂商本田正准备宣布关闭其在英国斯文登(Swindon)的工厂。</p><p><br/> </p>', 0, 0, 'org/2019/06/a08b87d6277f9e2fbf05793e1130e924b899f3d0_yGkJWKd.jpg', '广州本田有限公司', 0, 0, '2019-06-13 13:33:00', 'yes', 4, 3),
(13, '起亚', '<p>东风悦达起亚，系由东风汽车公司、江苏悦达投资股份有限公司、韩国起亚自动车株式会社共同组建的中外合资轿车制造企业。</p><p>企业第三工厂已于2014年初在江苏盐城投产。其产能为30万台，通过主动调节，将联合一、二工厂初步形成百万产能规模，为公司跻身国内一流汽车品牌提供重要支撑。</p><p>2017年9月28日，全球权威的市场调研机构J.D. Power发布了2017年中国新车质量研究(IQS)报告，东风悦达起亚排名第二位。<span class="sup--normal" data-sup="1-2" data-ctrmap=":1,:2," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">&nbsp;</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[1-2]_192672"></a>&nbsp;</p><p>在盐城有三座工厂和一座伍佑商品车物流基地</p><p><br/> </p>', 0, 0, 'org/2019/06/a08b87d6277f9e2fbf05793e1130e924b899f3d0_h11CcJm.jpg', '北京起亚有限公司', 0, 0, '2019-06-13 13:28:00', 'no', 1, 3),
(14, '马自达', '<p>马自达（MAZDA），是一家日本汽车制造商，总部设在日本广岛，主要销售市场包括亚洲、欧洲和北美洲。MAZDA是日本最著名的汽车品牌之一，日本第四大汽车制造商，是世界著名汽车品牌，是世界上唯一研发和生产转子发动机的汽车公司。2008年《财富》全球500强企业排名中名列第二百五十五位。</p><p>马自达公司创立于1920年，1931年正式开始在广岛生产小型载货车，60年代初正式生产轿车，自1981年到2002年，马自达已累积生产了3,500多万辆各种汽车。在九十年代之前，马自达汽车公司在日本国内排名仅在丰田、本田、日产之后，也是世界知名的日本汽车品牌之一。</p><p>自2000年开始，马自达公司通过实施“新千年计划”，使公司的发展进入了一个新的阶段。2002年开始，马自达公司先后推出了马自达6(MAZDA6)、马自达3(MAZDA3)、马自达2(MAZDA2)、马自达8(MAZDA8)、RX-8、Roadstar和CX-7等一系列新车型，在世界各地都取得了不俗的销售业绩。</p><p>2018年12月，世界品牌实验室编制的《2018世界品牌500强》揭晓，排名第242。</p><p><br/> </p>', 0, 0, 'org/2019/06/a08b87d6277f9e2fbf05793e1130e924b899f3d0_lQGjN4V.jpg', '海口马自达有限公司', 0, 0, '2019-06-13 13:35:00', 'yes', 5, 3),
(15, '沃尔沃', '<p>沃尔沃（Volvo），瑞典著名豪华汽车品牌，曾译为富豪。该品牌于1927年在瑞典哥德堡创建，1999年，沃尔沃集团将旗下的沃尔沃轿车业务出售给美国福特汽车公司。</p><p>2010年，中国汽车企业浙江吉利控股集团从福特手中购得沃尔沃轿车业务，并获得沃尔沃轿车品牌的拥有权。2014年4月8日，沃尔沃宣布暂停与一家俄罗斯公司联合开发步兵装甲战车的协议，原因是乌克兰危机所引发的不确定性。</p><p>2017广州国际车展上，沃尔沃正式发布了旗下全新XC60的国产版车型，全系将推出T4、T5和T8三种动力配置，共8款车型。<span class="sup--normal" data-sup="1-2" data-ctrmap=":1,:2," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">&nbsp;[1-2]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[1-2]_4303"></a>&nbsp;&nbsp;2017年12月20日，沃尔沃全新XC60在成都正式上市。<span class="sup--normal" data-sup="3" data-ctrmap=":3," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">&nbsp;[3]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[3]_4303"></a>&nbsp;&nbsp;2018年7月19日，《财富》世界500强排行榜发布，沃尔沃集团位列286位。<span class="sup--normal" data-sup="4" data-ctrmap=":4," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">&nbsp;[4]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[4]_4303"></a>&nbsp;</p><p>2018年12月，世界品牌实验室编制的《2018世界品牌500强》揭晓，沃尔沃排名第228。</p><p><br/> </p>', 0, 0, 'org/2019/06/a08b87d6277f9e2fbf05793e1130e924b899f3d0_WXCTPPi.jpg', '杭州沃尔沃有限公司', 0, 0, '2019-06-13 13:39:00', 'yes', 6, 3);

-- --------------------------------------------------------

--
-- 表的结构 `organization_orgtype`
--

CREATE TABLE IF NOT EXISTS `organization_orgtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` longtext NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `organization_orgtype`
--

INSERT INTO `organization_orgtype` (`id`, `name`, `desc`, `add_time`) VALUES
(2, '高校', '高校介绍', '2019-06-13 08:36:00'),
(3, '厂商', '厂商介绍', '2019-06-13 08:36:00'),
(4, '出版社', '出版社介绍', '2019-06-13 08:37:00'),
(5, '培训机构', '培训机构介绍', '2019-06-13 08:37:00'),
(6, '个人', '个人介绍', '2019-06-13 08:37:00'),
(7, '官方', '博信官方', '2019-06-13 11:24:00');

-- --------------------------------------------------------

--
-- 表的结构 `organization_teacher`
--

CREATE TABLE IF NOT EXISTS `organization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `points` varchar(50) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `add_time` datetime NOT NULL,
  `verify` varchar(3) NOT NULL,
  `org_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` (`org_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `organization_teacher`
--

INSERT INTO `organization_teacher` (`id`, `name`, `work_years`, `work_company`, `work_position`, `points`, `click_nums`, `fav_nums`, `age`, `image`, `add_time`, `verify`, `org_id`) VALUES
(1, '李彦宏', 15, '北京大学', '教授', '幽默风趣，简单易懂幽默风趣，简单易懂，幽默风趣，简单易懂幽默风趣，简单易懂', 119, 1, 45, 'organization/teacher/2019/12/lyh.jpg', '2019-06-12 14:05:00', 'yes', 1),
(3, '张亚勤', 8, '北京大学', '教授', '通俗易懂', 1, 0, 18, 'teacher/2019/06/u15246384611039713376fm179app42fJPEG.jpg', '2019-06-13 13:42:00', 'yes', 1);

-- --------------------------------------------------------

--
-- 表的结构 `tags_tag`
--

CREATE TABLE IF NOT EXISTS `tags_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `tags_tag`
--

INSERT INTO `tags_tag` (`id`, `name`) VALUES
(1, '发动机'),
(2, '底盘');

-- --------------------------------------------------------

--
-- 表的结构 `users_banner`
--

CREATE TABLE IF NOT EXISTS `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `users_banner`
--

INSERT INTO `users_banner` (`id`, `title`, `image`, `url`, `index`, `add_time`) VALUES
(4, '1', 'banner/2019/11/b0.png', 'http://www.baidu.com', 100, '2019-11-28 14:25:00'),
(5, '2', 'banner/2019/11/b1.png', 'http://www.baidu.com', 100, '2019-11-28 14:26:00'),
(6, '3', 'banner/2019/11/b2.png', 'http://www.baidu.com', 100, '2019-11-28 14:26:00'),
(7, '4', 'banner/2019/11/b3.png', 'http://www.baidu.com', 100, '2019-11-28 14:26:00'),
(8, '5', 'banner/2019/11/b4.png', 'http://www.baidu.com', 100, '2019-11-28 14:27:00'),
(9, '6', 'banner/2019/11/b5.png', 'http://www.baidu.com', 100, '2019-11-28 14:27:00');

-- --------------------------------------------------------

--
-- 表的结构 `users_emailverifyrecord`
--

CREATE TABLE IF NOT EXISTS `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(30) NOT NULL,
  `send_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `users_emailverifyrecord`
--

INSERT INTO `users_emailverifyrecord` (`id`, `code`, `email`, `send_type`, `send_time`) VALUES
(1, 'I8eY', 'admin2@admin.com', 'update_email', '2019-12-20 10:43:39'),
(2, 'jhgd', '1065304110@qq.com', 'update_email', '2019-12-20 10:44:46'),
(3, 'mlHc', '1065304110@qq.com', 'update_email', '2019-12-20 11:08:33'),
(4, '1sfu', '1065304110@qq.com', 'update_email', '2019-12-20 11:14:03'),
(5, 'v2WW', '1065304110@qq.com', 'update_email', '2019-12-20 11:15:40'),
(6, '9zbH', 'admin@admin.com', 'update_email', '2019-12-20 11:18:06');

-- --------------------------------------------------------

--
-- 表的结构 `users_userprofile`
--

CREATE TABLE IF NOT EXISTS `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `nick_name` varchar(30) DEFAULT NULL,
  `gender` varchar(1) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `personal` varchar(80) DEFAULT NULL,
  `qq` varchar(15) DEFAULT NULL,
  `wechat` varchar(30) DEFAULT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `users_userprofile`
--

INSERT INTO `users_userprofile` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `nick_name`, `gender`, `address`, `mobile`, `image`, `personal`, `qq`, `wechat`, `birthday`) VALUES
(1, 'pbkdf2_sha256$24000$uuLP9nUjbqsm$Zt9RPXdJba30zttajZnsno1aJQBAA5Eqvm2ZvXIF0MQ=', '2020-01-03 18:46:16', 1, 'admin', '', '', 'admin@admin.com', 1, 1, '2019-12-13 16:03:00', 'Kris969', '1', '北京市海淀区颐和园路5号', '17777777777', 'image/users/2019/12/u23995472653069343316fm26gp0.jpg', '0000000000000000', '1065', '1065333', '1999-10-20'),
(2, 'pbkdf2_sha256$24000$ivMJI31yPqQV$e6rEu+TVNjGPISVrNPUTTyTlj41aXyrWOA6I97kFXes=', '2019-12-31 20:58:19', 0, 'test', '', '', 'test@test.com', 0, 1, '2019-12-17 14:00:00', '', '1', '', '13666666666', '', '', '', '', '2000-10-01'),
(3, 'pbkdf2_sha256$24000$wnaWvGJURpXP$Hdtju9vDZoFJzw/uSgAwg3A0xRwj38m8xMLAnL7Qfbo=', NULL, 0, '18979745069', '', '', '', 0, 1, '2019-12-19 17:52:18', '', '1', '', '18979745069', '', '', '', '', '2000-10-01'),
(5, 'pbkdf2_sha256$24000$HDQ9h2fhlLlR$53vnpJluRNIfi2sr820P8mx2elMXUEG1YaYRvN2v0pc=', '2019-12-19 18:40:32', 0, '13333333333', '', '', '', 0, 1, '2019-12-19 18:00:36', '', '1', '', '13333333333', '', '', '', '', '2000-10-01'),
(6, 'pbkdf2_sha256$24000$NMbKE81sQlzN$8mbOdHE91xJcv8B5zJx1MV+wS1ptRl1ScQo5yN+JfoA=', '2019-12-30 11:05:12', 0, '13333333335', '', '', '', 0, 1, '2019-12-20 09:11:56', '', '1', '', '13333333335', '', '', '', '', '2000-10-01'),
(8, 'pbkdf2_sha256$24000$CpLAzhqOSQ2Q$/eGhC7bgX67ZjaT4Z6Tvrz81eQKndGpndTxkesEGlbk=', '2019-12-30 10:11:59', 0, '18979705069', '', '', '', 0, 1, '2019-12-27 14:30:45', '', '1', '', '18979705061', '', '', '', '', '2000-10-01');

-- --------------------------------------------------------

--
-- 表的结构 `users_userprofile_groups`
--

CREATE TABLE IF NOT EXISTS `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `users_userprofile_user_permissions`
--

CREATE TABLE IF NOT EXISTS `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_permissions_userprofile_id_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xadmin_bookmark`
--

CREATE TABLE IF NOT EXISTS `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xadmin_log`
--

CREATE TABLE IF NOT EXISTS `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `xadmin_log`
--

INSERT INTO `xadmin_log` (`id`, `action_time`, `ip_addr`, `object_id`, `object_repr`, `action_flag`, `message`, `content_type_id`, `user_id`) VALUES
(1, '2019-12-15 14:24:00', '127.0.0.1', '1', 'admin', 'change', '已修改 last_login，nick_name，address 和 image 。', 6, 1),
(2, '2019-12-16 11:39:49', '127.0.0.1', '1', '李彦宏', 'change', '已修改 points 和 image 。', 19, 1),
(3, '2019-12-16 11:40:18', '127.0.0.1', NULL, '', 'delete', '批量删除 6 个 讲师', NULL, 1),
(4, '2019-12-17 14:00:49', '127.0.0.1', '2', 'test', 'create', '已添加', 6, 1),
(5, '2019-12-17 14:04:02', '127.0.0.1', '2', 'test', 'change', '没有字段被修改。', 6, 1),
(6, '2019-12-17 16:05:51', '127.0.0.1', '1', 'Resource object', 'create', '已添加', 13, 1),
(7, '2019-12-17 16:06:11', '127.0.0.1', '2', 'Resource object', 'create', '已添加', 13, 1),
(8, '2019-12-18 11:46:27', '127.0.0.1', '1', '李彦宏', 'change', '已修改 points 。', 19, 1),
(9, '2019-12-18 11:46:44', '127.0.0.1', '1', '李彦宏', 'change', '已修改 points 。', 19, 1),
(10, '2019-12-18 11:47:34', '127.0.0.1', '1', '李彦宏', 'change', '已修改 points 。', 19, 1),
(11, '2019-12-19 08:49:21', '127.0.0.1', '1', 'admin', 'change', '已修改 last_login 和 mobile 。', 6, 1),
(12, '2019-12-26 15:42:14', '127.0.0.1', NULL, '', 'delete', '批量删除 1 个 用户信息', NULL, 1),
(13, '2019-12-29 16:58:12', '127.0.0.1', '1', '李彦宏', 'change', '已修改 qq 。', 19, 1),
(14, '2019-12-29 17:07:03', '127.0.0.1', '7', '1.3 开店步骤（店铺装修）', 'create', '已添加', 12, 1),
(15, '2019-12-29 17:07:34', '127.0.0.1', '8', '1.4 开店步骤（身份认证）', 'create', '已添加', 12, 1),
(16, '2019-12-29 17:08:06', '127.0.0.1', '9', '5.2 神笔的来源', 'create', '已添加', 12, 1),
(17, '2019-12-29 17:08:24', '127.0.0.1', '10', '5.3 神笔的神奇', 'create', '已添加', 12, 1),
(18, '2019-12-29 17:08:40', '127.0.0.1', '11', '4.2 标题的优化', 'create', '已添加', 12, 1),
(19, '2019-12-29 17:08:51', '127.0.0.1', '12', '4.3 标题的整理', 'create', '已添加', 12, 1),
(20, '2019-12-29 17:09:16', '127.0.0.1', '9', '5.2 神笔的来源神笔的来源', 'change', '已修改 name 。', 12, 1),
(21, '2019-12-29 17:09:21', '127.0.0.1', '11', '4.2 标题的优化标题的优化', 'change', '已修改 name 。', 12, 1),
(22, '2019-12-29 17:09:25', '127.0.0.1', '10', '5.3 神笔的神奇神笔的神奇', 'change', '已修改 name 。', 12, 1),
(23, '2019-12-29 17:09:30', '127.0.0.1', '12', '4.3 标题的整理标题的整理标题的整理', 'change', '已修改 name 。', 12, 1),
(24, '2019-12-29 17:09:35', '127.0.0.1', '5', '5.1 神笔的应用神笔的应用神笔的应用', 'change', '已修改 name 。', 12, 1);

-- --------------------------------------------------------

--
-- 表的结构 `xadmin_usersettings`
--

CREATE TABLE IF NOT EXISTS `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `xadmin_usersettings`
--

INSERT INTO `xadmin_usersettings` (`id`, `key`, `value`, `user_id`) VALUES
(1, 'dashboard:home:pos', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `xadmin_userwidget`
--

CREATE TABLE IF NOT EXISTS `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 限制导出的表
--

--
-- 限制表 `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- 限制表 `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- 限制表 `courses_category`
--
ALTER TABLE `courses_category`
  ADD CONSTRAINT `courses_category_parent_id_5fb86d36_fk_courses_category_id` FOREIGN KEY (`parent_id`) REFERENCES `courses_category` (`id`);

--
-- 限制表 `courses_course`
--
ALTER TABLE `courses_course`
  ADD CONSTRAINT `courses_course_category_id_d64b93bf_fk_courses_category_id` FOREIGN KEY (`category_id`) REFERENCES `courses_category` (`id`),
  ADD CONSTRAINT `courses_course_teacher_id_846fa526_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`),
  ADD CONSTRAINT `courses_cour_course_org_id_4d2c4aab_fk_organization_courseorg_id` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`);

--
-- 限制表 `courses_course_tag`
--
ALTER TABLE `courses_course_tag`
  ADD CONSTRAINT `courses_course_tag_course_id_59e2fd01_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  ADD CONSTRAINT `courses_course_tag_tag_id_507e8dd6_fk_tags_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tags_tag` (`id`);

--
-- 限制表 `courses_lesson`
--
ALTER TABLE `courses_lesson`
  ADD CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`);

--
-- 限制表 `courses_resource`
--
ALTER TABLE `courses_resource`
  ADD CONSTRAINT `courses_resource_course_id_ce3f78d9_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`);

--
-- 限制表 `courses_video`
--
ALTER TABLE `courses_video`
  ADD CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`);

--
-- 限制表 `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  ADD CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- 限制表 `operation_commentreply`
--
ALTER TABLE `operation_commentreply`
  ADD CONSTRAINT `operation_commentreply_user_id_13d5d01d_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  ADD CONSTRAINT `operation_commen_comment_id_6945e538_fk_operation_usercomment_id` FOREIGN KEY (`comment_id`) REFERENCES `operation_usercomment` (`id`);

--
-- 限制表 `operation_teachercourse`
--
ALTER TABLE `operation_teachercourse`
  ADD CONSTRAINT `operation_teachercourse_course_id_982c7ef6_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  ADD CONSTRAINT `operation_teachercourse_user_id_1db7f13c_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`);

--
-- 限制表 `operation_usercomment`
--
ALTER TABLE `operation_usercomment`
  ADD CONSTRAINT `operation_usercomment_user_id_b9976ec4_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`);

--
-- 限制表 `operation_userfavorite`
--
ALTER TABLE `operation_userfavorite`
  ADD CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`);

--
-- 限制表 `operation_usermessage`
--
ALTER TABLE `operation_usermessage`
  ADD CONSTRAINT `operation_usermessage_user_id_716f8b9d_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`);

--
-- 限制表 `operation_userstudy`
--
ALTER TABLE `operation_userstudy`
  ADD CONSTRAINT `operation_userstudy_user_id_2ce25020_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`);

--
-- 限制表 `organization_courseorg`
--
ALTER TABLE `organization_courseorg`
  ADD CONSTRAINT `organization_courseo_type_id_4c402337_fk_organization_orgtype_id` FOREIGN KEY (`type_id`) REFERENCES `organization_orgtype` (`id`),
  ADD CONSTRAINT `organization_course_city_id_4a842f85_fk_organization_citydict_id` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`);

--
-- 限制表 `organization_teacher`
--
ALTER TABLE `organization_teacher`
  ADD CONSTRAINT `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`);

--
-- 限制表 `users_userprofile_groups`
--
ALTER TABLE `users_userprofile_groups`
  ADD CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `users_userprofil_userprofile_id_a4496a80_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`);

--
-- 限制表 `users_userprofile_user_permissions`
--
ALTER TABLE `users_userprofile_user_permissions`
  ADD CONSTRAINT `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `users_userprofil_userprofile_id_34544737_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`);

--
-- 限制表 `xadmin_bookmark`
--
ALTER TABLE `xadmin_bookmark`
  ADD CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  ADD CONSTRAINT `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- 限制表 `xadmin_log`
--
ALTER TABLE `xadmin_log`
  ADD CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`);

--
-- 限制表 `xadmin_usersettings`
--
ALTER TABLE `xadmin_usersettings`
  ADD CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`);

--
-- 限制表 `xadmin_userwidget`
--
ALTER TABLE `xadmin_userwidget`
  ADD CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
