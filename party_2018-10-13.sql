# ************************************************************
# Sequel Pro SQL dump
# Version 5224
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.23)
# Database: party
# Generation Time: 2018-10-13 14:13:56 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table par_auth_map
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_auth_map`;

CREATE TABLE `par_auth_map` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限map表',
  `method` varchar(255) NOT NULL DEFAULT '' COMMENT 'required.route类型:resource;get;post等',
  `namespace` varchar(255) NOT NULL DEFAULT '' COMMENT 'required.命名空间:api;web.',
  `entrance` varchar(255) NOT NULL DEFAULT '' COMMENT 'required.route中主要的参数，resource路由中的唯一参数。',
  `param_1` varchar(255) DEFAULT NULL COMMENT 'required.主参数后第一个参数，为变量时填写"?"',
  `param_2` varchar(255) DEFAULT NULL COMMENT 'not required.主参数后第一个参数，为变量时填写"?"',
  `param_3` varchar(255) DEFAULT NULL,
  `description_1` varchar(255) DEFAULT NULL COMMENT 'not required.描述',
  `description_2` varchar(255) DEFAULT NULL,
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_auth_map` WRITE;
/*!40000 ALTER TABLE `par_auth_map` DISABLE KEYS */;

INSERT INTO `par_auth_map` (`id`, `method`, `namespace`, `entrance`, `param_1`, `param_2`, `param_3`, `description_1`, `description_2`, `created_at`, `updated_at`)
VALUES
	(1,'get','api','token',NULL,NULL,NULL,NULL,NULL,0,0),
	(2,'post','api','upload',NULL,NULL,NULL,NULL,NULL,0,0),
	(3,'post','api','login',NULL,NULL,NULL,NULL,NULL,0,0),
	(4,'post','api','departments','?','department',NULL,'Department@departmentDepartmentList',NULL,0,0),
	(5,'get','api','departments',NULL,NULL,NULL,'resource index',NULL,0,0),
	(6,'get','api','departments','?',NULL,NULL,'resource show',NULL,0,0),
	(7,'post','api','departments','?',NULL,NULL,'resource store',NULL,0,0),
	(8,'put','api','departments','?',NULL,NULL,'resource update',NULL,0,0),
	(9,'delete','api','departments','?',NULL,NULL,'resource destroy',NULL,0,0),
	(11,'get','api','department_work_plans',NULL,NULL,NULL,'resource index',NULL,0,0),
	(12,'get','api','department_work_plans','?',NULL,NULL,'resource show',NULL,0,0),
	(13,'post','api','department_work_plans','?',NULL,NULL,'resource store',NULL,0,0),
	(14,'put','api','department_work_plans','?',NULL,NULL,'resource update',NULL,0,0),
	(15,'delete','api','department_work_plans','?',NULL,NULL,'resource destroy',NULL,0,0),
	(16,'get','api','department_activity_plans',NULL,NULL,NULL,'resource index',NULL,0,0),
	(17,'get','api','department_activity_plans','?',NULL,NULL,'resource show',NULL,0,0),
	(18,'post','api','department_activity_plans','?',NULL,NULL,'resource store',NULL,0,0),
	(19,'put','api','department_activity_plans','?',NULL,NULL,'resource update',NULL,0,0),
	(20,'delete','api','department_activity_plans','?',NULL,NULL,'resource destroy',NULL,0,0),
	(21,'get','api','user_payments',NULL,NULL,NULL,'resource index',NULL,0,0),
	(22,'get','api','user_payments','?',NULL,NULL,'resource show',NULL,0,0),
	(23,'post','api','user_payments','?',NULL,NULL,'resource store',NULL,0,0),
	(24,'put','api','user_payments','?',NULL,NULL,'resource update',NULL,0,0),
	(25,'delete','api','user_payments','?',NULL,NULL,'resource destroy',NULL,0,0),
	(26,'get','api','articles',NULL,NULL,NULL,'resource index',NULL,0,0),
	(27,'get','api','articles','?',NULL,NULL,'resource show',NULL,0,0),
	(28,'post','api','articles','?',NULL,NULL,'resource store',NULL,0,0),
	(29,'put','api','articles','?',NULL,NULL,'resource update',NULL,0,0),
	(30,'delete','api','articles','?',NULL,NULL,'resource destroy',NULL,0,0),
	(31,'get','api','categories',NULL,NULL,NULL,'resource index',NULL,0,0),
	(32,'get','api','categories','?',NULL,NULL,'resource show',NULL,0,0),
	(33,'post','api','categories','?',NULL,NULL,'resource store',NULL,0,0),
	(34,'put','api','categories','?',NULL,NULL,'resource update',NULL,0,0),
	(35,'delete','api','categories','?',NULL,NULL,'resource destroy',NULL,0,0),
	(36,'get','api','comments',NULL,NULL,NULL,'resource index',NULL,0,0),
	(37,'get','api','comments','?',NULL,NULL,'resource show',NULL,0,0),
	(38,'post','api','comments','?',NULL,NULL,'resource store',NULL,0,0),
	(39,'put','api','comments','?',NULL,NULL,'resource update',NULL,0,0),
	(40,'delete','api','comments','?',NULL,NULL,'resource destroy',NULL,0,0),
	(41,'get','api','meetings',NULL,NULL,NULL,'resource index',NULL,0,0),
	(42,'get','api','meetings','?',NULL,NULL,'resource show',NULL,0,0),
	(43,'post','api','meetings','?',NULL,NULL,'resource store',NULL,0,0),
	(44,'put','api','meetings','?',NULL,NULL,'resource update',NULL,0,0),
	(45,'delete','api','meetings','?',NULL,NULL,'resource destroy',NULL,0,0),
	(46,'get','api','elections',NULL,NULL,NULL,'resource index',NULL,0,0),
	(47,'get','api','elections','?',NULL,NULL,'resource show',NULL,0,0),
	(48,'post','api','elections','?',NULL,NULL,'resource store',NULL,0,0),
	(49,'put','api','elections','?',NULL,NULL,'resource update',NULL,0,0),
	(50,'delete','api','elections','?',NULL,NULL,'resource destroy',NULL,0,0),
	(51,'get','api','votes',NULL,NULL,NULL,'resource index',NULL,0,0),
	(52,'get','api','votes','?',NULL,NULL,'resource show',NULL,0,0),
	(53,'post','api','votes','?',NULL,NULL,'resource store',NULL,0,0),
	(54,'put','api','votes','?',NULL,NULL,'resource update',NULL,0,0),
	(55,'delete','api','votes','?',NULL,NULL,'resource destroy',NULL,0,0),
	(56,'get','api','exam_categorys',NULL,NULL,NULL,'resource index',NULL,0,0),
	(57,'get','api','exam_categorys','?',NULL,NULL,'resource show',NULL,0,0),
	(58,'post','api','exam_categorys','?',NULL,NULL,'resource store',NULL,0,0),
	(59,'put','api','exam_categorys','?',NULL,NULL,'resource update',NULL,0,0),
	(60,'delete','api','exam_categorys','?',NULL,NULL,'resource destroy',NULL,0,0),
	(61,'get','api','exam_excels',NULL,NULL,NULL,'resource index',NULL,0,0),
	(62,'get','api','exam_excels','?',NULL,NULL,'resource show',NULL,0,0),
	(63,'post','api','exam_excels','?',NULL,NULL,'resource store',NULL,0,0),
	(64,'put','api','exam_excels','?',NULL,NULL,'resource update',NULL,0,0),
	(65,'delete','api','exam_excels','?',NULL,NULL,'resource destroy',NULL,0,0),
	(66,'get','api','exam_papers',NULL,NULL,NULL,'resource index',NULL,0,0),
	(67,'get','api','exam_papers','?',NULL,NULL,'resource show',NULL,0,0),
	(68,'post','api','exam_papers','?',NULL,NULL,'resource store',NULL,0,0),
	(69,'put','api','exam_papers','?',NULL,NULL,'resource update',NULL,0,0),
	(70,'delete','api','exam_papers','?',NULL,NULL,'resource destroy',NULL,0,0),
	(71,'get','api','exam_results',NULL,NULL,NULL,'resource index',NULL,0,0),
	(72,'get','api','exam_results','?',NULL,NULL,'resource show',NULL,0,0),
	(73,'post','api','exam_results','?',NULL,NULL,'resource store',NULL,0,0),
	(74,'put','api','exam_results','?',NULL,NULL,'resource update',NULL,0,0),
	(75,'delete','api','exam_results','?',NULL,NULL,'resource destroy',NULL,0,0),
	(76,'get','api','auth_map',NULL,NULL,NULL,'resource index',NULL,0,0),
	(77,'get','api','auth_map','?',NULL,NULL,'resource show',NULL,0,0),
	(78,'post','api','auth_map','?',NULL,NULL,'resource store',NULL,0,0),
	(79,'put','api','auth_map','?',NULL,NULL,'resource update',NULL,0,0),
	(80,'delete','api','auth_map','?',NULL,NULL,'resource destroy',NULL,0,0),
	(81,'get','api','auth_role',NULL,NULL,NULL,'resource index',NULL,0,0),
	(82,'get','api','auth_role','?',NULL,NULL,'resource show',NULL,0,0),
	(83,'post','api','auth_role','?',NULL,NULL,'resource store',NULL,0,0),
	(84,'put','api','auth_role','?',NULL,NULL,'resource update',NULL,0,0),
	(85,'delete','api','auth_role','?',NULL,NULL,'resource destroy',NULL,0,0),
	(86,'get','api','users','?','party_info',NULL,'User@getUserWithPartyInfo',NULL,0,0),
	(87,'post','api','users','?','change_password',NULL,'User@changePassword',NULL,0,0),
	(88,'get','api','articles','published',NULL,NULL,'Article@publishedArticleList',NULL,0,0),
	(89,'get','api','articles','user',NULL,NULL,'Article@userArticleList',NULL,0,0),
	(90,'get','api','articles','audit_user',NULL,NULL,'Article@auditUserArticleList',NULL,0,0),
	(91,'get','api','articles','?','check',NULL,'Article@checkArticle',NULL,0,0),
	(92,'post','api','articles','?','audit',NULL,'Article@audit',NULL,0,0),
	(93,'get','api','comments','audit_user',NULL,NULL,'Comment@auditUserCommentList',NULL,0,0),
	(94,'get','api','meetings','department',NULL,NULL,'Meeting@departmentMeetingList',NULL,0,0),
	(95,'get','api','meetings','attend_user',NULL,NULL,'Meeting@attendUserMeetingList',NULL,0,0),
	(96,'get','api','meetings','audit_user',NULL,NULL,'Meeting@auditUserMeetingList',NULL,0,0),
	(97,'post','api','meetings','?','audit',NULL,'Meeting@audit',NULL,0,0),
	(98,'post','api','meetings','?','sign_in',NULL,'Meeting@signIn',NULL,0,0),
	(99,'get','api','elections','?','publicized',NULL,'Election@getPublicizedElection',NULL,0,0),
	(100,'get','api','elections','?','attend',NULL,'Election@getAttendElection',NULL,0,0),
	(101,'post','api','elections','?','attend_submit',NULL,'Election@AttendSubmit',NULL,0,0),
	(102,'get','api','votes','?','publicized',NULL,'Vote@getPublicizedVote',NULL,0,0),
	(103,'get','api','votes','?','attend',NULL,'Vote@getAttendVote',NULL,0,0),
	(104,'post','api','votes','?','attend_submit',NULL,'Vote@AttendSubmit',NULL,0,0),
	(105,'post','api','exam_results','?','start',NULL,'ExamResult@start',NULL,0,0),
	(106,'post','api','exam_results','?','submit',NULL,'ExamResult@submit',NULL,0,0),
	(107,'get','api','departments','?','coordinate',NULL,'Department@getDepartmentCoordinateList',NULL,0,0),
	(108,'get','api','categories','?','children_and_published_article',NULL,'Category@getCategoryChildrenAndPublishedArticleList',NULL,0,0),
	(109,'get','api','article_comments',NULL,NULL,NULL,'resource index',NULL,0,0),
	(110,'get','api','article_comments','?',NULL,NULL,'resource show',NULL,0,0),
	(111,'post','api','article_comments','?',NULL,NULL,'resource store',NULL,0,0),
	(112,'put','api','article_comments','?',NULL,NULL,'resource update',NULL,0,0),
	(113,'delete','api','article_comments','?',NULL,NULL,'resource destroy',NULL,0,0),
	(114,'post','api','users','?','update_one_field',NULL,'User@updateOneField',NULL,0,0),
	(115,'get','api','users',NULL,NULL,NULL,'resource index',NULL,0,0),
	(116,'get','api','users','?',NULL,NULL,'resource show',NULL,0,0),
	(117,'post','api','users','?',NULL,NULL,'resource store',NULL,0,0),
	(118,'put','api','users','?',NULL,NULL,'resource update',NULL,0,0),
	(119,'delete','api','users','?',NULL,NULL,'resource destroy',NULL,0,0),
	(120,'get','api','user_notifications',NULL,NULL,NULL,'resource index',NULL,0,0),
	(121,'get','api','user_notifications','?',NULL,NULL,'resource show',NULL,0,0),
	(122,'post','api','user_notifications','?',NULL,NULL,'resource store',NULL,0,0),
	(123,'put','api','user_notifications','?',NULL,NULL,'resource update',NULL,0,0),
	(124,'delete','api','user_notifications','?',NULL,NULL,'resource destroy',NULL,0,0),
	(125,'post','api','pusher','?','socket','?','Pusher@Socket',NULL,0,0),
	(126,'post','api','pusher','?','sms',NULL,'Pusher@Sms',NULL,0,0),
	(127,'post','api','comments','?','audit',NULL,'Comment@audit',NULL,0,0),
	(128,'post','api','elections','?','update_publicity_content',NULL,'Election@UpdatePublicityContent',NULL,0,0),
	(129,'post','api','votes','?','update_publicity_content',NULL,'Vote@UpdatePublicityContent',NULL,0,0),
	(130,'get','api','exam_results','?','user_submitted',NULL,'ExamResult@getSubmittedList',NULL,0,0),
	(131,'get','api','user_notifications','?','unread_badge_count',NULL,'UserNotification@getUserUnreadNotificationBadgeCount',NULL,0,0),
	(132,'get','api','user_info_party_relations',NULL,NULL,NULL,'resource index',NULL,0,0),
	(133,'get','api','user_info_party_relations','?',NULL,NULL,'resource show',NULL,0,0),
	(134,'post','api','user_info_party_relations','?',NULL,NULL,'resource store',NULL,0,0),
	(135,'put','api','user_info_party_relations','?',NULL,NULL,'resource update',NULL,0,0),
	(136,'delete','api','user_info_party_relations','?',NULL,NULL,'resource destroy',NULL,0,0),
	(137,'post','api','meetings','?','arrange_and_send_push',NULL,'Meeting@arrangeAndSendPush',NULL,0,0);

/*!40000 ALTER TABLE `par_auth_map` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_auth_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_auth_role`;

CREATE TABLE `par_auth_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限角色主表',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '角色名称',
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_auth_role` WRITE;
/*!40000 ALTER TABLE `par_auth_role` DISABLE KEYS */;

INSERT INTO `par_auth_role` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'超级权限',1,1538929504),
	(2,'党员权限',1,1539402593),
	(4,'领导权限',1538468578,1539402600);

/*!40000 ALTER TABLE `par_auth_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_auth_role_map
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_auth_role_map`;

CREATE TABLE `par_auth_role_map` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'auth_role和anth_map的中间表',
  `auth_role_id` int(11) unsigned NOT NULL,
  `auth_map_id` int(11) unsigned NOT NULL,
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_auth_role_map` WRITE;
/*!40000 ALTER TABLE `par_auth_role_map` DISABLE KEYS */;

INSERT INTO `par_auth_role_map` (`id`, `auth_role_id`, `auth_map_id`, `created_at`, `updated_at`)
VALUES
	(142,1,1,1539402351,1539402351),
	(143,1,2,1539402351,1539402351),
	(144,1,3,1539402351,1539402351),
	(145,1,4,1539402351,1539402351),
	(146,1,5,1539402351,1539402351),
	(147,1,6,1539402351,1539402351),
	(148,1,7,1539402351,1539402351),
	(149,1,8,1539402351,1539402351),
	(150,1,9,1539402351,1539402351),
	(151,1,11,1539402351,1539402351),
	(152,1,12,1539402351,1539402351),
	(153,1,13,1539402351,1539402351),
	(154,1,14,1539402351,1539402351),
	(155,1,15,1539402351,1539402351),
	(156,1,16,1539402351,1539402351),
	(157,1,17,1539402351,1539402351),
	(158,1,18,1539402351,1539402351),
	(159,1,19,1539402351,1539402351),
	(160,1,20,1539402351,1539402351),
	(161,1,21,1539402351,1539402351),
	(162,1,22,1539402351,1539402351),
	(163,1,23,1539402351,1539402351),
	(164,1,24,1539402351,1539402351),
	(165,1,25,1539402351,1539402351),
	(166,1,26,1539402351,1539402351),
	(167,1,27,1539402351,1539402351),
	(168,1,28,1539402351,1539402351),
	(169,1,29,1539402351,1539402351),
	(170,1,30,1539402351,1539402351),
	(171,1,31,1539402351,1539402351),
	(172,1,32,1539402351,1539402351),
	(173,1,33,1539402351,1539402351),
	(174,1,34,1539402351,1539402351),
	(175,1,35,1539402351,1539402351),
	(176,1,36,1539402351,1539402351),
	(177,1,37,1539402351,1539402351),
	(178,1,38,1539402351,1539402351),
	(179,1,39,1539402351,1539402351),
	(180,1,40,1539402351,1539402351),
	(181,1,41,1539402351,1539402351),
	(182,1,42,1539402351,1539402351),
	(183,1,43,1539402351,1539402351),
	(184,1,44,1539402351,1539402351),
	(185,1,45,1539402351,1539402351),
	(186,1,46,1539402351,1539402351),
	(187,1,47,1539402351,1539402351),
	(188,1,48,1539402351,1539402351),
	(189,1,49,1539402351,1539402351),
	(190,1,50,1539402351,1539402351),
	(191,1,51,1539402351,1539402351),
	(192,1,52,1539402351,1539402351),
	(193,1,53,1539402351,1539402351),
	(194,1,54,1539402351,1539402351),
	(195,1,55,1539402351,1539402351),
	(196,1,56,1539402351,1539402351),
	(197,1,57,1539402351,1539402351),
	(198,1,58,1539402351,1539402351),
	(199,1,59,1539402351,1539402351),
	(200,1,60,1539402351,1539402351),
	(201,1,61,1539402351,1539402351),
	(202,1,62,1539402351,1539402351),
	(203,1,63,1539402351,1539402351),
	(204,1,64,1539402351,1539402351),
	(205,1,65,1539402351,1539402351),
	(206,1,66,1539402351,1539402351),
	(207,1,67,1539402351,1539402351),
	(208,1,68,1539402351,1539402351),
	(209,1,69,1539402351,1539402351),
	(210,1,70,1539402351,1539402351),
	(211,1,71,1539402351,1539402351),
	(212,1,72,1539402351,1539402351),
	(213,1,73,1539402351,1539402351),
	(214,1,74,1539402351,1539402351),
	(215,1,75,1539402351,1539402351),
	(216,1,76,1539402351,1539402351),
	(217,1,77,1539402351,1539402351),
	(218,1,78,1539402351,1539402351),
	(219,1,79,1539402351,1539402351),
	(220,1,80,1539402351,1539402351),
	(221,1,81,1539402351,1539402351),
	(222,1,82,1539402351,1539402351),
	(223,1,83,1539402351,1539402351),
	(224,1,84,1539402351,1539402351),
	(225,1,85,1539402351,1539402351),
	(226,1,86,1539402351,1539402351),
	(227,1,87,1539402351,1539402351),
	(228,1,88,1539402351,1539402351),
	(229,1,89,1539402351,1539402351),
	(230,1,90,1539402351,1539402351),
	(231,1,91,1539402351,1539402351),
	(232,1,92,1539402351,1539402351),
	(233,1,93,1539402351,1539402351),
	(234,1,94,1539402351,1539402351),
	(235,1,95,1539402351,1539402351),
	(236,1,96,1539402351,1539402351),
	(237,1,97,1539402351,1539402351),
	(238,1,98,1539402351,1539402351),
	(239,1,99,1539402351,1539402351),
	(240,1,100,1539402351,1539402351),
	(241,1,101,1539402351,1539402351),
	(242,1,102,1539402351,1539402351),
	(243,1,103,1539402351,1539402351),
	(244,1,104,1539402351,1539402351),
	(245,1,105,1539402351,1539402351),
	(246,1,106,1539402351,1539402351),
	(247,1,107,1539402351,1539402351),
	(248,1,108,1539402351,1539402351),
	(249,1,109,1539402351,1539402351),
	(250,1,110,1539402351,1539402351),
	(251,1,111,1539402351,1539402351),
	(252,1,112,1539402351,1539402351),
	(253,1,113,1539402351,1539402351),
	(254,1,114,1539402351,1539402351),
	(255,1,115,1539402351,1539402351),
	(256,1,116,1539402351,1539402351),
	(257,1,117,1539402351,1539402351),
	(258,1,118,1539402351,1539402351),
	(259,1,119,1539402351,1539402351),
	(260,1,120,1539402351,1539402351),
	(261,1,121,1539402351,1539402351),
	(262,1,122,1539402351,1539402351),
	(263,1,123,1539402351,1539402351),
	(264,1,124,1539402351,1539402351),
	(265,1,125,1539402351,1539402351),
	(266,1,126,1539402351,1539402351),
	(267,1,127,1539402351,1539402351),
	(268,1,128,1539402351,1539402351),
	(269,1,129,1539402351,1539402351),
	(270,1,130,1539402351,1539402351),
	(271,1,131,1539402351,1539402351),
	(272,1,132,1539402351,1539402351),
	(273,1,133,1539402351,1539402351),
	(274,1,134,1539402351,1539402351),
	(275,1,135,1539402351,1539402351),
	(276,1,136,1539402351,1539402351),
	(277,1,137,1539402351,1539402351),
	(278,2,2,1539402593,1539402593),
	(279,2,56,1539402593,1539402593),
	(280,4,5,1539402600,1539402600);

/*!40000 ALTER TABLE `par_auth_role_map` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_auth_role_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_auth_role_user`;

CREATE TABLE `par_auth_role_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'auth_role和user的中间表',
  `auth_role_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_auth_role_user` WRITE;
/*!40000 ALTER TABLE `par_auth_role_user` DISABLE KEYS */;

INSERT INTO `par_auth_role_user` (`id`, `auth_role_id`, `user_id`, `created_at`, `updated_at`)
VALUES
	(3,1,14,1538469607,1538469607),
	(4,2,14,1538469607,1538469607),
	(5,4,14,1538469607,1538469607),
	(13,1,2,1539402567,1539402567),
	(14,1,1,1539402685,1539402685),
	(15,2,1,1539402685,1539402685),
	(16,4,1,1539402685,1539402685),
	(17,4,5,1539402760,1539402760),
	(18,1,5,1539402760,1539402760),
	(19,4,9,1539402776,1539402776),
	(20,4,10,1539402798,1539402798);

/*!40000 ALTER TABLE `par_auth_role_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_department
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_department`;

CREATE TABLE `par_department` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `introduce` text,
  `location` varchar(255) DEFAULT NULL COMMENT '位置',
  `coordinate_x` int(11) DEFAULT NULL COMMENT '百度地图接口坐标',
  `coordinate_y` int(11) DEFAULT NULL COMMENT '百度地图接口坐标',
  `telphone` varchar(20) DEFAULT '',
  `cellphone` varchar(255) DEFAULT NULL,
  `secretary` varchar(10) DEFAULT '' COMMENT '现任书记姓名',
  `path` varchar(255) DEFAULT NULL,
  `established_at` int(11) unsigned NOT NULL COMMENT '成立日期',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0',
  `more` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_department` WRITE;
/*!40000 ALTER TABLE `par_department` DISABLE KEYS */;

INSERT INTO `par_department` (`id`, `parent_id`, `name`, `introduce`, `location`, `coordinate_x`, `coordinate_y`, `telphone`, `cellphone`, `secretary`, `path`, `established_at`, `created_at`, `updated_at`, `more`)
VALUES
	(1,0,'新城区党支部','123','32321312',111694775,40838242,'123','321321','书记','0-',1538473145,0,1539103618,'{\"thumbnail\":\"\\/upload\\/20181002\\/IMG_20170907_170000.jpg\",\"monitor_map\":\"\\/upload\\/20181002\\/IMG_20160403_055750.jpg\"}'),
	(2,1,'西落凤社区党支部','22','33',111693115,40828792,'66','77','88','0-1-',1538477550,1538391155,1539103693,'{\"thumbnail\":\"\\/upload\\/20181001\\/IMG_20160403_131102.jpg\",\"monitor_map\":\"\\/upload\\/20181009\\/2018100903100977162.jpg\"}'),
	(3,1,'体校社区党支部','22','33',111677730,40859167,'66','77','88','0-1-',1538477550,1538391194,1539103732,'{\"thumbnail\":\"\\/upload\\/20181001\\/IMG_20170907_170000.jpg\",\"monitor_map\":\"\\/upload\\/20181009\\/2018100515030322214.jpg\"}'),
	(4,1,'光华街社区-党总支','2','3',111706935,40840221,'6','7','8','0-1-',1539181675,1539095298,1539103651,'{\"thumbnail\":\"\\/upload\\/20181009\\/IMG_1377.JPG\",\"monitor_map\":\"\\/upload\\/20181009\\/IMG_1380.JPG\"}');

/*!40000 ALTER TABLE `par_department` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_department_activity_plan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_department_activity_plan`;

CREATE TABLE `par_department_activity_plan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` int(11) unsigned NOT NULL DEFAULT '0',
  `initiate_user_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `content` int(11) unsigned DEFAULT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `more` longtext NOT NULL,
  `published_at` int(11) unsigned NOT NULL DEFAULT '0',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_department_activity_plan` WRITE;
/*!40000 ALTER TABLE `par_department_activity_plan` DISABLE KEYS */;

INSERT INTO `par_department_activity_plan` (`id`, `department_id`, `initiate_user_id`, `title`, `content`, `type`, `more`, `published_at`, `created_at`, `updated_at`)
VALUES
	(1,1,5,'活动规划测试标题',NULL,1,'[]',1,1,1),
	(2,1,2,'11',32321,2,'{\"files\":[{\"size\":5127998,\"type\":\"image\\/jpeg\",\"status\":\"done\"},{\"size\":5212585,\"type\":\"image\\/jpeg\",\"status\":\"done\"}]}',1536596843,1537720078,1537720078),
	(3,1,2,'11111',21321,2,'{\"files\":[{\"lastModified\":1523412574000,\"lastModifiedDate\":\"2018-04-11T02:09:34.000Z\",\"name\":\"IMG_1371.JPG\",\"size\":2446890,\"type\":\"image\\/jpeg\",\"uid\":\"vc-upload-1539095385092-3\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181009\\/IMG_1371.JPG\"},\"percent\":100,\"originFileObj\":{\"uid\":\"vc-upload-1539095385092-3\"},\"status\":\"done\",\"url\":\"\\/upload\\/20181009\\/IMG_1371.JPG\"}]}',1539181933,1539095553,1539095950);

/*!40000 ALTER TABLE `par_department_activity_plan` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_department_activity_plan_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_department_activity_plan_user`;

CREATE TABLE `par_department_activity_plan_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `created_at` int(11) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_department_activity_plan_user` WRITE;
/*!40000 ALTER TABLE `par_department_activity_plan_user` DISABLE KEYS */;

INSERT INTO `par_department_activity_plan_user` (`id`, `activity_id`, `user_id`, `created_at`, `updated_at`)
VALUES
	(1,1,2,1,2),
	(2,2,2,1537720078,1537720078),
	(3,2,10,1537720078,1537720078),
	(4,2,11,1537720078,1537720078),
	(5,2,12,1537720078,1537720078),
	(6,3,2,1539095553,1539095553),
	(7,3,10,1539095553,1539095553),
	(8,3,11,1539095553,1539095553),
	(9,3,12,1539095553,1539095553),
	(10,3,2,1539095950,1539095950),
	(11,3,10,1539095950,1539095950),
	(12,3,11,1539095950,1539095950),
	(13,3,12,1539095950,1539095950);

/*!40000 ALTER TABLE `par_department_activity_plan_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_department_work_plan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_department_work_plan`;

CREATE TABLE `par_department_work_plan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NOT NULL,
  `initiate_user_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext,
  `more` longtext NOT NULL,
  `published_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_department_work_plan` WRITE;
/*!40000 ALTER TABLE `par_department_work_plan` DISABLE KEYS */;

INSERT INTO `par_department_work_plan` (`id`, `department_id`, `initiate_user_id`, `title`, `content`, `more`, `published_at`, `created_at`, `updated_at`)
VALUES
	(1,1,5,'关于党支部内投票选举的计划','NULL321321312321322','[]',1,1,1),
	(2,1,2,'范德萨发生12','发大幅度','{\"files\":[{\"lastModified\":1523412588000,\"lastModifiedDate\":\"2018-04-11T02:09:48.000Z\",\"name\":\"IMG_0003.JPG\",\"size\":2616894,\"type\":\"image\\/jpeg\",\"uid\":\"vc-upload-1538917496345-4\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181007\\/IMG_0003.JPG\"},\"percent\":100,\"originFileObj\":{\"uid\":\"vc-upload-1538917496345-4\"},\"status\":\"done\",\"url\":\"\\/upload\\/20181007\\/IMG_0003.JPG\"}]}',1538917,1538917597,1539096023);

/*!40000 ALTER TABLE `par_department_work_plan` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_election
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_election`;

CREATE TABLE `par_election` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `initiate_user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发起人',
  `title` varchar(255) NOT NULL DEFAULT '',
  `option_select_count` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '允许选择几个option',
  `initiate_content` text COMMENT '发起时候的内容',
  `is_publicized` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否公示',
  `publicity_content` text COMMENT '公示发布时候的内容',
  `published_at` int(11) unsigned DEFAULT NULL,
  `started_at` int(11) unsigned NOT NULL DEFAULT '0',
  `ended_at` int(11) unsigned NOT NULL DEFAULT '0',
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  `more` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_election` WRITE;
/*!40000 ALTER TABLE `par_election` DISABLE KEYS */;

INSERT INTO `par_election` (`id`, `initiate_user_id`, `title`, `option_select_count`, `initiate_content`, `is_publicized`, `publicity_content`, `published_at`, `started_at`, `ended_at`, `created_at`, `updated_at`, `more`)
VALUES
	(1,2,'13321',1,'本次选举的议题是',0,NULL,NULL,1,1,1,2,'{\"files\":[{\"size\":5127998,\"type\":\"image\\/jpeg\",\"status\":\"done\"},{\"size\":5212585,\"type\":\"image\\/jpeg\",\"status\":\"done\"}]}'),
	(2,0,'1',2,'222',1,NULL,NULL,1537792400,1537892463,1537774354,1537774354,'{\"files\":[{\"size\":5127998,\"type\":\"image\\/jpeg\",\"status\":\"done\"},{\"size\":5212585,\"type\":\"image\\/jpeg\",\"status\":\"done\"}]}'),
	(3,0,'2',3,'222',1,NULL,NULL,1537860690,1538033493,1537774468,1537774468,'{\"files\":[{\"size\":5127998,\"type\":\"image\\/jpeg\",\"status\":\"done\"},{\"size\":5212585,\"type\":\"image\\/jpeg\",\"status\":\"done\"}]}'),
	(7,2,'测试选举',2,'12312',1,NULL,1,1537842343,1537842342,1537928761,1537928761,'{\"files\":[{\"size\":5127998,\"type\":\"image\\/jpeg\",\"status\":\"done\"},{\"size\":5212585,\"type\":\"image\\/jpeg\",\"status\":\"done\"}]}'),
	(8,2,'测试选举123',2,'3123312312',1,'发布的内容',1538894439,1538796644,1538796644,1538883062,1538894439,'{\"files\":[{\"lastModified\":1523412588000,\"lastModifiedDate\":\"2018-04-11T02:09:48.000Z\",\"name\":\"IMG_0003.JPG\",\"size\":2616894,\"type\":\"image\\/jpeg\",\"uid\":\"vc-upload-1538883033902-2\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181007\\/IMG_0003.JPG\"},\"percent\":100,\"originFileObj\":{\"uid\":\"vc-upload-1538883033902-2\"},\"status\":\"done\",\"url\":\"\\/upload\\/20181007\\/IMG_0003.JPG\"},{\"lastModified\":1523412584000,\"lastModifiedDate\":\"2018-04-11T02:09:44.000Z\",\"name\":\"IMG_0009.JPG\",\"size\":1950162,\"type\":\"image\\/jpeg\",\"uid\":\"vc-upload-1538883033902-3\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181007\\/IMG_0009.JPG\"},\"percent\":100,\"originFileObj\":{\"uid\":\"vc-upload-1538883033902-3\"},\"status\":\"done\",\"url\":\"\\/upload\\/20181007\\/IMG_0009.JPG\"}]}'),
	(15,2,'1',2,'1',0,NULL,NULL,1538899524,1538899524,1538898113,1538898113,'{\"files\":null}'),
	(16,2,'选举优秀党员',3,'选举优秀党员选举优秀党员选举优秀党员选举优秀党员选举优秀党员',1,'当前选举结果 当选的人是王五等三人',1539137785,1539137197,1539137197,1539137263,1539137785,'{\"files\":null}'),
	(17,1,'测试选举',2,'123',1,NULL,NULL,1539316564,1539489366,1539402976,1539402976,'{\"files\":null}'),
	(18,2,'2018年度优秀党员的选举',2,'优秀党员的选举',1,'本次选举结果是：张三当选！',1539410932,1539410773,1539410774,1539410799,1539410932,'{\"files\":null}');

/*!40000 ALTER TABLE `par_election` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_election_option
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_election_option`;

CREATE TABLE `par_election_option` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `election_id` int(11) unsigned NOT NULL,
  `election_content` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `content_user_id` int(11) unsigned NOT NULL,
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_election_option` WRITE;
/*!40000 ALTER TABLE `par_election_option` DISABLE KEYS */;

INSERT INTO `par_election_option` (`id`, `election_id`, `election_content`, `content_user_id`, `created_at`, `updated_at`)
VALUES
	(1,2,NULL,2,1537774354,1537774354),
	(2,2,NULL,10,1537774354,1537774354),
	(3,2,NULL,11,1537774354,1537774354),
	(4,2,NULL,12,1537774354,1537774354),
	(5,3,NULL,2,1537774468,1537774468),
	(6,3,NULL,10,1537774468,1537774468),
	(7,3,NULL,11,1537774468,1537774468),
	(8,3,NULL,12,1537774468,1537774468),
	(13,7,NULL,2,1537928761,1537928761),
	(14,7,NULL,10,1537928761,1537928761),
	(15,7,NULL,11,1537928761,1537928761),
	(16,7,NULL,12,1537928761,1537928761),
	(17,8,NULL,2,1538883062,1538883062),
	(18,8,NULL,10,1538883062,1538883062),
	(19,8,NULL,11,1538883062,1538883062),
	(20,8,NULL,12,1538883062,1538883062),
	(40,15,NULL,2,1538898113,1538898113),
	(41,15,NULL,10,1538898113,1538898113),
	(42,15,NULL,11,1538898113,1538898113),
	(43,15,NULL,12,1538898113,1538898113),
	(44,16,NULL,2,1539137263,1539137263),
	(45,16,NULL,10,1539137263,1539137263),
	(46,16,NULL,11,1539137263,1539137263),
	(47,16,NULL,12,1539137263,1539137263),
	(48,16,NULL,5,1539137263,1539137263),
	(49,16,NULL,9,1539137263,1539137263),
	(50,16,NULL,13,1539137263,1539137263),
	(51,16,NULL,14,1539137263,1539137263),
	(52,17,NULL,2,1539402976,1539402976),
	(53,17,NULL,10,1539402976,1539402976),
	(54,17,NULL,5,1539402976,1539402976),
	(55,17,NULL,9,1539402976,1539402976),
	(56,18,NULL,2,1539410799,1539410799),
	(57,18,NULL,10,1539410799,1539410799),
	(58,18,NULL,5,1539410799,1539410799),
	(59,18,NULL,9,1539410799,1539410799);

/*!40000 ALTER TABLE `par_election_option` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_election_result
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_election_result`;

CREATE TABLE `par_election_result` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `election_id` int(11) unsigned NOT NULL COMMENT 'vote主键',
  `user_id` int(11) unsigned NOT NULL COMMENT 'user主键',
  `option_id` int(11) unsigned NOT NULL COMMENT 'vote_option主键',
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_election_result` WRITE;
/*!40000 ALTER TABLE `par_election_result` DISABLE KEYS */;

INSERT INTO `par_election_result` (`id`, `election_id`, `user_id`, `option_id`, `created_at`, `updated_at`)
VALUES
	(6,7,2,15,1537928989,1537928989),
	(7,7,2,16,1537928989,1537928989),
	(8,8,2,17,1538883206,1538883206),
	(9,8,2,18,1538883206,1538883206),
	(10,16,2,45,1539137554,1539137554),
	(11,16,2,48,1539137554,1539137554),
	(12,16,2,49,1539137554,1539137554),
	(13,18,2,57,1539410831,1539410831),
	(14,18,2,58,1539410831,1539410831);

/*!40000 ALTER TABLE `par_election_result` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_election_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_election_user`;

CREATE TABLE `par_election_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `election_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_election_user` WRITE;
/*!40000 ALTER TABLE `par_election_user` DISABLE KEYS */;

INSERT INTO `par_election_user` (`id`, `election_id`, `user_id`, `created_at`, `updated_at`)
VALUES
	(1,2,2,1537774354,1537774354),
	(2,2,10,1537774354,1537774354),
	(3,2,11,1537774354,1537774354),
	(4,2,12,1537774354,1537774354),
	(5,3,2,1537774468,1537774468),
	(6,3,10,1537774468,1537774468),
	(7,3,11,1537774468,1537774468),
	(8,3,12,1537774468,1537774468),
	(11,7,2,1537928761,1537928761),
	(12,7,10,1537928761,1537928761),
	(13,7,11,1537928761,1537928761),
	(14,7,12,1537928761,1537928761),
	(15,7,5,1537928761,1537928761),
	(16,7,9,1537928761,1537928761),
	(17,8,2,1538883062,1538883062),
	(18,8,10,1538883062,1538883062),
	(19,8,11,1538883062,1538883062),
	(20,8,12,1538883062,1538883062),
	(21,8,5,1538883062,1538883062),
	(22,8,9,1538883062,1538883062),
	(23,8,13,1538883062,1538883062),
	(24,8,14,1538883062,1538883062),
	(36,15,2,1538898113,1538898113),
	(37,15,10,1538898113,1538898113),
	(38,15,11,1538898113,1538898113),
	(39,15,12,1538898113,1538898113),
	(40,16,2,1539137263,1539137263),
	(41,16,10,1539137263,1539137263),
	(42,16,11,1539137263,1539137263),
	(43,16,12,1539137263,1539137263),
	(44,16,5,1539137263,1539137263),
	(45,16,9,1539137263,1539137263),
	(46,16,13,1539137263,1539137263),
	(47,16,14,1539137263,1539137263),
	(48,17,2,1539402976,1539402976),
	(49,17,10,1539402976,1539402976),
	(50,17,5,1539402976,1539402976),
	(51,17,9,1539402976,1539402976),
	(52,18,2,1539410799,1539410799),
	(53,18,10,1539410799,1539410799),
	(54,18,5,1539410799,1539410799),
	(55,18,9,1539410799,1539410799);

/*!40000 ALTER TABLE `par_election_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_exam_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_exam_category`;

CREATE TABLE `par_exam_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_exam_category` WRITE;
/*!40000 ALTER TABLE `par_exam_category` DISABLE KEYS */;

INSERT INTO `par_exam_category` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'考题分类11',1538903207,1538903222),
	(2,'考题分类2',1538903210,1538903210),
	(3,'考题分类3',1538903211,1538903211),
	(4,'十九大',1539407066,1539407066);

/*!40000 ALTER TABLE `par_exam_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_exam_excel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_exam_excel`;

CREATE TABLE `par_exam_excel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `category_id` int(11) unsigned NOT NULL,
  `file_url` text NOT NULL,
  `question_count` int(11) unsigned NOT NULL DEFAULT '0',
  `more` text,
  `created_at` int(11) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_exam_excel` WRITE;
/*!40000 ALTER TABLE `par_exam_excel` DISABLE KEYS */;

INSERT INTO `par_exam_excel` (`id`, `user_id`, `category_id`, `file_url`, `question_count`, `more`, `created_at`, `updated_at`)
VALUES
	(1,2,1,'/upload/20181007/题.xlsx',23,'{\"file\":[{\"lastModified\":1538907395000,\"name\":\"\\u9898.xlsx\",\"size\":9564,\"type\":\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"uid\":\"vc-upload-1538906977772-5\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181007\\/\\u9898.xlsx\"},\"percent\":100,\"originFileObj\":{\"uid\":\"vc-upload-1538906977772-5\"},\"status\":\"done\",\"url\":\"\\/upload\\/20181007\\/\\u9898.xlsx\"}]}',1538906783,1538907406),
	(2,2,2,'/upload/20181007/题.xlsx',23,'{\"file\":[{\"lastModified\":1538907395000,\"name\":\"\\u9898.xlsx\",\"size\":9564,\"type\":\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"uid\":\"vc-upload-1538906977772-8\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181007\\/\\u9898.xlsx\"},\"percent\":100,\"originFileObj\":{\"uid\":\"vc-upload-1538906977772-8\"},\"status\":\"done\",\"url\":\"\\/upload\\/20181007\\/\\u9898.xlsx\"}]}',1538907601,1538907601),
	(3,2,4,'/upload/20181013/题.xlsx',30,'{\"file\":[{\"lastModified\":1539407047602,\"lastModifiedDate\":null,\"name\":\"\\u9898.xlsx\",\"size\":13049,\"type\":\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"uid\":\"vc-upload-1539405897687-2\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181013\\/\\u9898.xlsx\"},\"percent\":100,\"originFileObj\":null,\"status\":\"done\",\"url\":\"\\/upload\\/20181013\\/\\u9898.xlsx\"}]}',1539407090,1539407090);

/*!40000 ALTER TABLE `par_exam_excel` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_exam_paper
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_exam_paper`;

CREATE TABLE `par_exam_paper` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `initiate_user_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `duration` smallint(4) unsigned NOT NULL COMMENT '考试时间',
  `is_restrict_user` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否限定人员;0:所有人可以考;1:只有关联人员可以考',
  `max_score` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '满分',
  `pass_score` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '通过分数',
  `questions_count` int(11) unsigned NOT NULL DEFAULT '0',
  `published_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `finished_at` int(11) unsigned NOT NULL DEFAULT '0',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0',
  `more` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_exam_paper` WRITE;
/*!40000 ALTER TABLE `par_exam_paper` DISABLE KEYS */;

INSERT INTO `par_exam_paper` (`id`, `initiate_user_id`, `name`, `duration`, `is_restrict_user`, `max_score`, `pass_score`, `questions_count`, `published_at`, `finished_at`, `created_at`, `updated_at`, `more`)
VALUES
	(1,1,'lijingbo',20,1,20,12,20,1538908507,1539167616,1538908451,1538908451,'{\"thumbnail\":\"\\/upload\\/20181007\\/IMG_0069.JPG\"}'),
	(2,1,'在线演示的试卷',15,1,20,12,10,1539137771,1539410866,1539138175,1539138175,'{\"thumbnail\":\"\\/upload\\/20181010\\/1539063805001_296.jpg\"}'),
	(4,1,'十九大知识问答',20,1,20,12,20,1539410773,1539583940,1539411157,1539411157,'{\"thumbnail\":\"\\/upload\\/20181013\\/u=2180767727,3252951452&fm=26&gp=0.jpg\"}');

/*!40000 ALTER TABLE `par_exam_paper` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_exam_paper_question
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_exam_paper_question`;

CREATE TABLE `par_exam_paper_question` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `paper_id` int(11) unsigned NOT NULL,
  `question_id` int(11) unsigned NOT NULL,
  `question_score` int(11) unsigned NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `options` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `answers` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_exam_paper_question` WRITE;
/*!40000 ALTER TABLE `par_exam_paper_question` DISABLE KEYS */;

INSERT INTO `par_exam_paper_question` (`id`, `paper_id`, `question_id`, `question_score`, `title`, `options`, `answers`, `created_at`, `updated_at`)
VALUES
	(1,1,28,1,X'E997AEE9A298323131313134',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2244225D',1538908451,1538908451),
	(2,1,41,1,X'E997AEE9A298323131313237',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1538908451,1538908451),
	(3,1,32,1,X'E997AEE9A298323131313138',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242222C2244225D',1538908451,1538908451),
	(4,1,31,1,X'E997AEE9A298323131313137',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2243225D',1538908451,1538908451),
	(5,1,36,1,X'E997AEE9A298323131313232',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1538908451,1538908451),
	(6,1,40,1,X'E997AEE9A298323131313236',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1538908451,1538908451),
	(7,1,30,1,X'E997AEE9A298323131313136',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1538908451,1538908451),
	(8,1,43,1,X'E997AEE9A298323131313239',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1538908451,1538908451),
	(9,1,46,1,X'E997AEE9A298323131313332',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1538908451,1538908451),
	(10,1,34,1,X'E997AEE9A298323131313230',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1538908451,1538908451),
	(11,1,26,1,X'E997AEE9A298323131313132',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1538908451,1538908451),
	(12,1,25,1,X'E4BFAEE694B9E79A84E9A298E79BAE',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2241222C2243225D',1538908451,1538908451),
	(13,1,39,1,X'E997AEE9A298323131313235',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1538908451,1538908451),
	(14,1,29,1,X'E997AEE9A298323131313135',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2241225D',1538908451,1538908451),
	(15,1,45,1,X'E997AEE9A298323131313331',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1538908451,1538908451),
	(16,1,24,1,X'E997AEE9A2983120202020203132333132333132',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863227D',X'5B2241222C2242225D',1538908451,1538908451),
	(17,1,42,1,X'E997AEE9A298323131313238',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1538908451,1538908451),
	(18,1,33,1,X'E997AEE9A298323131313139',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1538908451,1538908451),
	(19,1,44,1,X'E997AEE9A298323131313330',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1538908451,1538908451),
	(20,1,37,1,X'E997AEE9A298323131313233',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1538908451,1538908451),
	(21,2,24,2,X'E997AEE9A2983120202020203132333132333132',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863227D',X'5B2241222C2242225D',1539138175,1539138175),
	(22,2,27,2,X'E997AEE9A298323131313133',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2243225D',1539138175,1539138175),
	(23,2,46,2,X'E997AEE9A298323131313332',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1539138175,1539138175),
	(24,2,40,2,X'E997AEE9A298323131313236',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1539138175,1539138175),
	(25,2,32,2,X'E997AEE9A298323131313138',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242222C2244225D',1539138175,1539138175),
	(26,2,30,2,X'E997AEE9A298323131313136',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1539138175,1539138175),
	(27,2,41,2,X'E997AEE9A298323131313237',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1539138175,1539138175),
	(28,2,44,2,X'E997AEE9A298323131313330',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1539138175,1539138175),
	(29,2,39,2,X'E997AEE9A298323131313235',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1539138175,1539138175),
	(30,2,26,2,X'E997AEE9A298323131313132',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1539138175,1539138175),
	(51,4,91,1,X'E5859AE79A84EFBC8820EFBC89E698AFE5859AE79A84E6A0B9E69CACE680A7E5BBBAE8AEBEEFBC8CE586B3E5AE9AE5859AE79A84E5BBBAE8AEBEE696B9E59091E5928CE69588E69E9CE38082',X'7B2241223A225C75363031645C75363066335C75356566615C7538626265222C2242223A225C75363533665C75366362625C75356566615C7538626265222C2243223A225C75376563345C75376563375C75356566615C7538626265222C2244223A225C75353233365C75356561365C75356566615C7538626265227D',X'5B2242225D',1539411157,1539411157),
	(52,4,77,1,X'E5BBBAE8AEBEEFBC8820EFBC89E698AFE4B8ADE58D8EE6B091E6978FE4BC9FE5A4A7E5A48DE585B4E79A84E59FBAE7A180E5B7A5E7A88BE38082',X'7B2241223A225C75376563665C75366434655C75356633615C7535366664222C2242223A225C75363533665C75366362625C75356633615C7535366664222C2243223A225C75363535395C75383062325C75356633615C7535366664222C2244223A225C75363538375C75353331365C75356633615C7535366664227D',X'5B2243225D',1539411157,1539411157),
	(53,4,87,1,X'E8A7A3E586B3E58FB0E6B9BEE997AEE9A298E38081E5AE9EE78EB0E7A596E59BBDE5AE8CE585A8E7BB9FE4B880EFBC8CE698AFE585A8E4BD93E4B8ADE58D8EE584BFE5A5B3EFBC8820EFBC89EFBC8CE698AFE4B8ADE58D8EE6B091E6978FEFBC8820EFBC89E68980E59CA8E38082',X'7B2241223A225C75346530305C75383166345C75363133665C7536373162205C75363833395C75363732635C75353232395C7537366361222C2242223A225C75353137315C75353430635C75363133665C7536373162205C75363732635C75386432385C75353232395C7537366361222C2243223A225C75346530305C75383166345C75363133665C7536373162205C75363732635C75386432385C75353232395C7537366361222C2244223A225C75353137315C75353430635C75363133665C7536373162205C75363833395C75363732635C75353232395C7537366361227D',X'5B2244225D',1539411157,1539411157),
	(54,4,73,1,X'E58F91E68CA5E7A4BEE4BC9AE4B8BBE4B989E58D8FE59586E6B091E4B8BBE9878DE8A681E4BD9CE794A8E38082EFBC8820EFBC89E698AFE585B7E69C89E4B8ADE59BBDE789B9E889B2E79A84E588B6E5BAA6E5AE89E68E92EFBC8CE698AFE7A4BEE4BC9AE4B8BBE4B989E58D8FE59586E6B091E4B8BBE79A84E9878DE8A681E6B8A0E98193E5928CE4B893E997A8E58D8FE59586E69CBAE69E84E38082',X'7B2241223A225C75363533665C75353135615C75353334665C7535353436222C2242223A225C75346562615C75353932375C75353334665C7535353436222C2243223A225C75353766615C75356334325C75353334665C7535353436222C2244223A225C75346562615C75366331315C75363533665C7535333466227D',X'5B2244225D',1539411157,1539411157),
	(55,4,98,1,X'E5A29EE5BCBAE5859AE887AAE68891E58780E58C96E883BDE58A9BEFBC8CE6A0B9E69CACE99DA0E5BCBAE58C96EFBC8820EFBC89E5928CEFBC8820EFBC89E38082',X'7B2241223A225C75353135615C75373638345C75383165615C75363231315C75373664315C75373736335C75333030315C75383230365C75386262615C75373664315C7537373633222C2242223A225C75353135615C75373638345C75383165615C75363231315C75373664315C75373736335C75333030315C75376661345C75346631375C75373664315C7537373633222C2243223A225C75353135615C75373638345C75383165615C75363231315C75373664315C75373736335C75333030315C75353366385C75366364355C75373664315C7537373633222C2244223A225C75353135615C75373638345C75383165615C75363231315C75373664315C75373736335C75333030315C75366331315C75346533625C75373664315C7537373633227D',X'5B2242225D',1539411157,1539411157),
	(56,4,97,1,X'E8A681E59D9AE68C81E697A0E7A681E58CBAE38081E585A8E8A686E79B96E38081E99BB6E5AEB9E5BF8DEFBC8CE59D9AE68C81EFBC8820EFBC89EFBC8CE59D9AE68C81E58F97E8B4BFE8A18CE8B4BFE4B880E8B5B7E69FA5EFBC8CE59D9AE586B3E998B2E6ADA2E5859AE58685E5BDA2E68890E588A9E79B8AE99B86E59BA2E38082',X'7B2241223A225C75393163645C75393838345C75393633325C75333030315C75356633615C75396164385C75353338625C75333030315C75393537665C75393730375C7536313531222C2242223A225C75393163645C75393034665C75353233365C75333030315C75356633615C75396164385C75353338625C75333030315C75393537665C75393730375C7536313531222C2243223A225C75393163645C75393034665C75353233365C75333030315C75346530645C75353163665C75353338625C75333030315C75393537665C75393730375C7536313531222C2244223A225C75393163645C75393034665C75353233365C75333030315C75356633615C75396164385C75353338625C75333030315C75393537665C75356130315C7536313531227D',X'5B2242225D',1539411157,1539411157),
	(57,4,82,1,X'E68891E4BBACE8A681E789A2E59BBAE6A091E7AB8BE7A4BEE4BC9AE4B8BBE4B989E7949FE68081E69687E6988EE8A782EFBC8CE68EA8E58AA8E5BDA2E68890EFBC8820EFBC89E78EB0E4BBA3E58C96E5BBBAE8AEBEE696B0E6A0BCE5B180EFBC8CE4B8BAE4BF9DE68AA4E7949FE68081E78EAFE5A283E4BD9CE587BAE68891E4BBACE8BF99E4BBA3E4BABAE79A84E58AAAE58A9BEFBC81',X'7B2241223A225C75346562615C75346530655C75383165615C75373133365C75353438635C75386331305C75353137315C7537353166222C2242223A225C75346562615C75346530655C75373361665C75353838335C75353438635C75386331305C75353364315C7535633535222C2243223A225C75346562615C75346530655C75383165615C75373133365C75353438635C75386331305C75353364315C7535633535222C2244223A225C75346562615C75346530655C75373361665C75353838335C75353438635C75386331305C75353137315C7537353166227D',X'5B2243225D',1539411157,1539411157),
	(58,4,96,1,X'E8A681E4BBA5E68F90E58D87EFBC8820EFBC89E4B8BAE9878DE782B9EFBC8CE7AA81E587BAE694BFE6B2BBE58A9FE883BDEFBC8CE68A8AE4BC81E4B89AE38081E5869CE69D91E38081E69CBAE585B3E38081E5ADA6E6A0A1E38081E7A791E7A094E999A2E68980E38081E8A197E98193E7A4BEE58CBAE38081E7A4BEE4BC9AE7BB84E7BB87E7AD89E59FBAE5B182E5859AE7BB84E7BB87E5BBBAE8AEBEE68890E4B8BAE5AEA3E4BCA0E5859AE79A84E4B8BBE5BCA0E38081E8B4AFE5BDBBE5859AE79A84E586B3E5AE9AE38081E9A286E5AFBCE59FBAE5B182E6B2BBE79086E38081E59BA2E7BB93E58AA8E59198E7BEA4E4BC97E38081E68EA8E58AA8E694B9E99DA9E58F91E5B195E79A84E59D9AE5BCBAE68898E69697E5A0A1E59E92E38082',X'7B2241223A225C75353164645C75383035615C7535323962222C2242223A225C75393838365C75356266635C7535323962222C2243223A225C75376563345C75376563375C7535323962222C2244223A225C75363231385C75363539375C7535323962227D',X'5B2243225D',1539411157,1539411157),
	(59,4,74,1,X'E6B7B1E58C96E4BE9DE6B395E6B2BBE59BBDE5AE9EE8B7B5E38082E68890E7AB8BE4B8ADE5A4AEE585A8E99DA2EFBC8820EFBC89E9A286E5AFBCE5B08FE7BB84EFBC8CE58AA0E5BCBAE5AFB9E6B395E6B2BBE4B8ADE59BBDE5BBBAE8AEBEE79A84E7BB9FE4B880E9A286E5AFBCE38082',X'7B2241223A225C75366466315C75353331365C75363533395C7539373639222C2242223A225C75346639645C75366364355C75366362625C7535366664222C2243223A225C75346563655C75346532355C75366362625C7535313561222C2244223A225C75353366385C75366364355C75363533395C7539373639227D',X'5B2242225D',1539411157,1539411157),
	(60,4,92,1,X'E8A681E5B08AE5B487E5859AE7ABA0EFBC8CE4B8A5E6A0BCE689A7E8A18CE696B0E5BDA2E58ABFE4B88BE5859AE58685E694BFE6B2BBE7949FE6B4BBE88BA5E5B9B2E58786E58899EFBC8CE5A29EE5BCBAE5859AE58685E694BFE6B2BBE7949FE6B4BBE79A84EFBC8820EFBC89E38082',X'7B2241223A225C75363533665C75366362625C75363032375C75333030315C75363566365C75346565335C75363032375C75333030315C75353339665C75353231395C75363032375C75333030315C75363231385C75363539375C7536303237222C2242223A225C75363066335C75363032375C75333030315C75363533665C75366362625C75363032375C75333030315C75363566365C75346565335C75363032375C75333030315C75353339665C75353231395C7536303237222C2243223A225C75363533665C75366362625C75363032375C75333030315C75363031645C75363066335C75363032375C75333030315C75363566365C75346565335C75363032375C75333030315C75353339665C75353231395C7536303237222C2244223A225C75363533665C75366362625C75363032375C75333030315C75363031645C75363066335C75363032375C75333030315C75363566365C75346565335C75363032375C75333030315C75363231385C75363539375C7536303237227D',X'5B2241225D',1539411157,1539411157),
	(61,4,79,1,X'E68891E4BBACE8A681E59D9AE68C81E4BABAE4B88EE887AAE784B6EFBC8820EFBC89E38082',X'7B2241223A225C75353438635C75386331305C75373666385C7535393034222C2242223A225C75353438635C75373736365C75373666385C7535393034222C2243223A225C75353438635C75386331305C75353137315C7537353166222C2244223A225C75353438635C75373736365C75353137315C7537353166227D',X'5B2243225D',1539411157,1539411157),
	(62,4,84,1,X'E58A9BE4BA89E588B0E4BA8CE38087E4B889E4BA94E5B9B4EFBC8820EFBC89E59BBDE998B2E5928CE5869BE9989FE78EB0E4BBA3E58C96EFBC8CE588B0E69CACE4B896E7BAAAE4B8ADE58FB6E68A8AE4BABAE6B091E5869BE9989FEFBC8820EFBC89E4B896E7958CE4B880E6B581E5869BE9989FE38082',X'7B2241223A225C75353136385C75393736325C75356239655C7537336230205C75353766615C75363732635C75356566615C7536323130222C2242223A225C75353136385C75393736325C75356239655C7537336230205C75353136385C75393736325C75356566615C7536323130222C2243223A225C75353766615C75363732635C75356239655C7537336230205C75353766615C75363732635C75356566615C7536323130222C2244223A225C75353766615C75363732635C75356239655C7537336230205C75353136385C75393736325C75356566615C7536323130227D',X'5B2244225D',1539411157,1539411157),
	(63,4,85,1,X'E6A091E7AB8BEFBC8820EFBC89E698AFE6A0B8E5BF83E68898E69697E58A9BE79A84E6809DE683B3EFBC8CE68EA8E8BF9BE9878DE5A4A7E68A80E69CAFE5889BE696B0E38081E887AAE4B8BBE5889BE696B0EFBC8CE58AA0E5BCBAE5869BE4BA8BE4BABAE6898DE59FB9E585BBE4BD93E7B3BBE5BBBAE8AEBEEFBC8CE5BBBAE8AEBEE5889BE696B0E59E8BE4BABAE6B091E5869BE9989FE38082',X'7B2241223A225C75373964315C7536323830222C2242223A225C75373964315C7536323830222C2243223A225C75346562615C7536323464222C2244223A225C75363238305C7536373266227D',X'5B2242225D',1539411157,1539411157),
	(64,4,95,1,X'E8A681E59D9AE68C81E5859AE7AEA1E5B9B2E983A8E58E9FE58899EFBC8CEFBC8820EFBC89EFBC8CE68A8AE5A5BDE5B9B2E983A8E6A087E58786E890BDE588B0E5AE9EE5A484E38082',X'7B2241223A225C75353735615C75363330315C75376163625C75353733615C75353735615C75356239615C75333030315C75376432305C75386432385C75386663375C75373836635C75666630635C75353735615C75363330315C75346539345C75366535365C75353664625C75366437375C75333030315C75346566625C75346562615C75353532665C75386432345C75666630635C75353735615C75363330315C75346538625C75346531615C75346533615C75346530615C75333030315C75353136635C75393035335C75366236335C753664336520222C2242223A225C75353735615C75363330315C75356662375C75363234645C75353137635C75353930375C75333030315C75346565355C75356662375C75346533615C75353134385C75666630635C75353735615C75363330315C75376163625C75353733615C75353735615C75356239615C75333030315C75376432305C75386432385C75386663375C75373836635C75666630635C75353735615C75363330315C75346538625C75346531615C75346533615C75346530615C75333030315C75353136635C75393035335C75366236335C7536643365222C2243223A225C75353735615C75363330315C75356662375C75363234645C75353137635C75353930375C75333030315C75346565355C75356662375C75346533615C75353134385C75666630635C75353735615C75363330315C75346539345C75366535365C75353664625C75366437375C75333030315C75346566625C75346562615C75353532665C75386432345C75666630635C75353735615C75363330315C75376163625C75353733615C75353735615C75356239615C75333030315C75376432305C75386432385C75386663375C7537383663222C2244223A225C75353735615C75363330315C75356662375C75363234645C75353137635C75353930375C75333030315C75346565355C75356662375C75346533615C75353134385C75666630635C75353735615C75363330315C75346539345C75366535365C75353664625C75366437375C75333030315C75346566625C75346562615C75353532665C75386432345C75666630635C75353735615C75363330315C75346538625C75346531615C75346533615C75346530615C75333030315C75353136635C75393035335C75366236335C7536643365227D',X'5B2244225D',1539411157,1539411157),
	(65,4,78,1,X'E59BBDE5AEB6E5AE89E585A8E698AFE5AE89E982A6E5AE9AE59BBDE79A84E9878DE8A681E59FBAE79FB3EFBC8CEFBC8820EFBC89E698AFE585A8E59BBDE59084E6978FE4BABAE6B091E6A0B9E69CACE588A9E79B8AE68980E59CA8E38082',X'7B2241223A225C75353261305C75356665625C75376563665C75366434655C75353364315C7535633535222C2242223A225C75376566345C75363261345C75353666645C75356262365C75376564665C7534653030222C2243223A225C75346663335C75386664625C75353666645C75393634355C75353430385C7534663563222C2244223A225C75376566345C75363261345C75353666645C75356262365C75356238395C7535313638227D',X'5B2244225D',1539411157,1539411157),
	(66,4,71,1,X'E59D9AE68C81E5859AE79A84E9A286E5AFBCE38081E4BABAE6B091E5BD93E5AEB6E4BD9CE4B8BBE38081E4BE9DE6B395E6B2BBE59BBDE69C89E69CBAE7BB9FE4B880E38082EFBC8820EFBC89E698AFE7A4BEE4BC9AE4B8BBE4B989E6B091E4B8BBE694BFE6B2BBE79A84E69CACE8B4A8E789B9E5BE81E38082',X'7B2241223A225C75353135615C75373638345C75393838365C7535626663222C2242223A225C75346562615C75366331315C75356635335C75356262365C75346635635C7534653362222C2243223A225C75346639645C75366364355C75366362625C7535366664222C2244223A225C75363533665C75366362625C75346635335C75353233365C75363533395C7539373639227D',X'5B2242225D',1539411157,1539411157),
	(67,4,86,1,X'E5869BE9989FE698AFE8A681E58786E5A487E68993E4BB97E79A84EFBC8CE4B880E58887E5B7A5E4BD9CE983BDE5BF85E9A1BBE59D9AE68C81EFBC8820EFBC89E6A087E58786EFBC8CE59091E883BDE68993E4BB97E38081E68993E8839CE4BB97E8819AE784A6E38082',X'7B2241223A225C75363231385C75363539375C7535323962222C2242223A225C75363539375C75346538395C7535323962222C2243223A225C75363231385C75346538395C7535323962222C2244223A225C75373836635C75356239655C7535323962227D',X'5B2241225D',1539411157,1539411157),
	(68,4,75,1,X'E6B7B1E58C96E69CBAE69E84E5928CE8A18CE694BFE4BD93E588B6E694B9E99DA9E38082E8BDACE58F98E694BFE5BA9CE8818CE883BDEFBC8CE6B7B1E58C96E7AE80E694BFE694BEE69D83EFBC8CE5889BE696B0E79B91E7AEA1E696B9E5BC8FEFBC8CE5A29EE5BCBAE694BFE5BA9CE585ACE4BFA1E58A9BE5928CE689A7E8A18CE58A9BEFBC8CE5BBBAE8AEBEE4BABAE6B091E6BBA1E6848FE79A84EFBC8820EFBC89E694BFE5BA9CE38082',X'7B2241223A225C75366364355C7536636262222C2242223A225C75353231625C75363562305C7535373862222C2243223A225C75356563395C7536643031222C2244223A225C75363730645C75353261315C7535373862227D',X'5B2244225D',1539411157,1539411157),
	(69,4,99,1,X'E68EA8E8BF9BEFBC8820EFBC89EFBC8CE5BBBAE8AEBEE8A686E79B96E7BAAAE6A380E79B91E5AF9FE7B3BBE7BB9FE79A84E6A380E4B8BEE4B8BEE68AA5E5B9B3E58FB0E38082E5BCBAE58C96E4B88DE695A2E88590E79A84E99C87E68591EFBC8CE6898EE789A2E4B88DE883BDE88590E79A84E7ACBCE5AD90EFBC8CE5A29EE5BCBAE4B88DE683B3E88590E79A84E887AAE8A789EFBC8CE9809AE8BF87E4B88DE68788E58AAAE58A9BE68DA2E69DA5E6B5B7E6998FE6B2B3E6B885E38081E69C97E69C97E4B9BEE59DA4E38082',X'7B2241223A225C75353137315C75356566615C75353137315C75383738645C75353137315C7534656162222C2242223A225C75346539325C75393031615C75346539325C75363065305C75346539325C7535323239222C2243223A225C75353137315C75353534365C75353137315C75356566615C75353137315C7534656162222C2244223A225C75353438635C75356537335C75353430385C75346635635C75353137315C7538643632227D',X'5B2243225D',1539411157,1539411157),
	(70,4,94,1,X'EFBC8820EFBC89E5928CEFBC8820EFBC89EFBC8CE698AFE4B8ADE59BBDE585B1E4BAA7E5859AE4BABAE79A84E7B2BEE7A59EE694AFE69FB1E5928CE694BFE6B2BBE781B5E9AD82EFBC8CE4B99FE698AFE4BF9DE68C81E5859AE79A84E59BA2E7BB93E7BB9FE4B880E79A84E6809DE683B3E59FBAE7A180E38082',X'7B2241223A225C75353137315C75346561375C75346533625C75346534395C75386664635C75353932375C75373430365C7536306633205C75363562305C75363566365C75346565335C75346532645C75353666645C75373237395C75383237325C75373933655C75346631615C75346533625C75346534395C75353137315C75353430635C75373430365C7536306633222C2242223A225C75353137315C75346561375C75346533625C75346534395C75386664635C75353932375C75373430365C7536306633205C75346532645C75353666645C75373237395C75383237325C75373933655C75346631615C75346533625C75346534395C75353137315C75353430635C75373430365C7536306633222C2243223A225C75353137315C75346561375C75346533625C75346534395C75356430375C75396164385C75373430365C7536306633205C75363562305C75363566365C75346565335C75346532645C75353666645C75373237395C75383237325C75373933655C75346631615C75346533625C75346534395C75353137315C75353430635C75373430365C7536306633222C2244223A225C75353137315C75346561375C75346533625C75346534395C75356430375C75396164385C75373430365C7536306633205C75346532645C75353666645C75373237395C75383237325C75373933655C75346631615C75346533625C75346534395C75353137315C75353430635C75373430365C7536306633227D',X'5B2242225D',1539411157,1539411157);

/*!40000 ALTER TABLE `par_exam_paper_question` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_exam_paper_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_exam_paper_user`;

CREATE TABLE `par_exam_paper_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `paper_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_exam_paper_user` WRITE;
/*!40000 ALTER TABLE `par_exam_paper_user` DISABLE KEYS */;

INSERT INTO `par_exam_paper_user` (`id`, `paper_id`, `user_id`, `created_at`, `updated_at`)
VALUES
	(1,1,2,1538908451,1538908451),
	(2,1,10,1538908451,1538908451),
	(3,1,11,1538908451,1538908451),
	(4,1,12,1538908451,1538908451),
	(5,2,2,1539138175,1539138175),
	(6,3,2,1539407142,1539407142),
	(7,3,10,1539407142,1539407142),
	(8,3,5,1539407142,1539407142),
	(9,3,9,1539407142,1539407142),
	(10,4,2,1539411157,1539411157),
	(11,4,10,1539411157,1539411157),
	(12,4,5,1539411157,1539411157),
	(13,4,9,1539411157,1539411157);

/*!40000 ALTER TABLE `par_exam_paper_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_exam_question
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_exam_question`;

CREATE TABLE `par_exam_question` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `excel_id` int(11) unsigned NOT NULL,
  `excel_index` int(11) unsigned NOT NULL,
  `disabled` tinyint(1) unsigned NOT NULL COMMENT '是否禁用;0:false;1:true',
  `title` varchar(255) NOT NULL DEFAULT '',
  `options` text NOT NULL,
  `answers` text NOT NULL,
  `created_at` int(11) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_exam_question` WRITE;
/*!40000 ALTER TABLE `par_exam_question` DISABLE KEYS */;

INSERT INTO `par_exam_question` (`id`, `excel_id`, `excel_index`, `disabled`, `title`, `options`, `answers`, `created_at`, `updated_at`)
VALUES
	(24,1,1,1,'问题1     12312312','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\"}','[\"A\",\"B\"]',1538907406,1538907406),
	(25,1,2,0,'修改的题目','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"A\",\"C\"]',1538907406,1538907406),
	(26,1,3,0,'问题211112','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907406,1538907406),
	(27,1,4,0,'问题211113','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"C\"]',1538907406,1538907406),
	(28,1,5,0,'问题211114','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"D\"]',1538907406,1538907406),
	(29,1,6,0,'问题211115','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"A\"]',1538907406,1538907406),
	(30,1,7,0,'问题211116','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907406,1538907406),
	(31,1,8,0,'问题211117','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"C\"]',1538907406,1538907406),
	(32,1,9,0,'问题211118','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\",\"D\"]',1538907406,1538907406),
	(33,1,10,0,'问题211119','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907406,1538907406),
	(34,1,11,0,'问题211120','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907406,1538907406),
	(35,1,12,0,'问题211121','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907406,1538907406),
	(36,1,13,0,'问题211122','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907406,1538907406),
	(37,1,14,0,'问题211123','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907406,1538907406),
	(38,1,15,0,'问题211124','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907406,1538907406),
	(39,1,16,0,'问题211125','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907406,1538907406),
	(40,1,17,0,'问题211126','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907406,1538907406),
	(41,1,18,0,'问题211127','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907406,1538907406),
	(42,1,19,0,'问题211128','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907406,1538907406),
	(43,1,20,0,'问题211129','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907406,1538907406),
	(44,1,21,0,'问题211130','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907406,1538907406),
	(45,1,22,0,'问题211131','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907406,1538907406),
	(46,1,23,0,'问题211132','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907406,1538907406),
	(47,2,1,1,'问题1     12312312','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\"}','[\"A\",\"B\"]',1538907601,1538907601),
	(48,2,2,0,'修改的题目','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"A\",\"C\"]',1538907601,1538907601),
	(49,2,3,0,'问题211112','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907601,1538907601),
	(50,2,4,0,'问题211113','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"C\"]',1538907601,1538907601),
	(51,2,5,0,'问题211114','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"D\"]',1538907601,1538907601),
	(52,2,6,0,'问题211115','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"A\"]',1538907601,1538907601),
	(53,2,7,0,'问题211116','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907601,1538907601),
	(54,2,8,0,'问题211117','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"C\"]',1538907601,1538907601),
	(55,2,9,0,'问题211118','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\",\"D\"]',1538907601,1538907601),
	(56,2,10,0,'问题211119','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907601,1538907601),
	(57,2,11,0,'问题211120','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907601,1538907601),
	(58,2,12,0,'问题211121','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907601,1538907601),
	(59,2,13,0,'问题211122','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907601,1538907601),
	(60,2,14,0,'问题211123','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907601,1538907601),
	(61,2,15,0,'问题211124','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907601,1538907601),
	(62,2,16,0,'问题211125','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907601,1538907601),
	(63,2,17,0,'问题211126','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907601,1538907601),
	(64,2,18,0,'问题211127','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907601,1538907601),
	(65,2,19,0,'问题211128','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907601,1538907601),
	(66,2,20,0,'问题211129','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907601,1538907601),
	(67,2,21,0,'问题211130','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907601,1538907601),
	(68,2,22,0,'问题211131','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907601,1538907601),
	(69,2,23,0,'问题211132','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1538907601,1538907601),
	(70,3,1,0,'确保到（ ）我国现行标准下农村贫困人口实现脱贫，贫困县全部摘帽，解决区域性整体贫困，做到脱真贫、真脱贫。','{\"A\":\"2030\\u5e74\",\"B\":\"2020\\u5e74\",\"C\":\"2025\\u5e74\",\"D\":\"2035\\u5e74\"}','[\"B\"]',1539407090,1539407090),
	(71,3,2,0,'坚持党的领导、人民当家作主、依法治国有机统一。（ ）是社会主义民主政治的本质特征。','{\"A\":\"\\u515a\\u7684\\u9886\\u5bfc\",\"B\":\"\\u4eba\\u6c11\\u5f53\\u5bb6\\u4f5c\\u4e3b\",\"C\":\"\\u4f9d\\u6cd5\\u6cbb\\u56fd\",\"D\":\"\\u653f\\u6cbb\\u4f53\\u5236\\u6539\\u9769\"}','[\"B\"]',1539407090,1539407090),
	(72,3,3,0,'加强人民当家作主制度保障。（ ）是坚持党的领导、人民当家作主、依法治国有机统一的根本政治制度安排。','{\"A\":\"\\u4eba\\u6c11\\u4ee3\\u8868\\u5927\\u4f1a\\u5236\\u5ea6\",\"B\":\"\\u591a\\u515a\\u5408\\u4f5c\\u548c\\u653f\\u6cbb\\u534f\\u5546\\u5236\\u5ea6\",\"C\":\"\\u6c11\\u65cf\\u533a\\u57df\\u81ea\\u6cbb\\u5236\\u5ea6\",\"D\":\"\\u57fa\\u5c42\\u7fa4\\u4f17\\u81ea\\u6cbb\\u5236\\u5ea6\"}','[\"A\"]',1539407090,1539407090),
	(73,3,4,0,'发挥社会主义协商民主重要作用。（ ）是具有中国特色的制度安排，是社会主义协商民主的重要渠道和专门协商机构。','{\"A\":\"\\u653f\\u515a\\u534f\\u5546\",\"B\":\"\\u4eba\\u5927\\u534f\\u5546\",\"C\":\"\\u57fa\\u5c42\\u534f\\u5546\",\"D\":\"\\u4eba\\u6c11\\u653f\\u534f\"}','[\"D\"]',1539407090,1539407090),
	(74,3,5,0,'深化依法治国实践。成立中央全面（ ）领导小组，加强对法治中国建设的统一领导。','{\"A\":\"\\u6df1\\u5316\\u6539\\u9769\",\"B\":\"\\u4f9d\\u6cd5\\u6cbb\\u56fd\",\"C\":\"\\u4ece\\u4e25\\u6cbb\\u515a\",\"D\":\"\\u53f8\\u6cd5\\u6539\\u9769\"}','[\"B\"]',1539407090,1539407090),
	(75,3,6,0,'深化机构和行政体制改革。转变政府职能，深化简政放权，创新监管方式，增强政府公信力和执行力，建设人民满意的（ ）政府。','{\"A\":\"\\u6cd5\\u6cbb\",\"B\":\"\\u521b\\u65b0\\u578b\",\"C\":\"\\u5ec9\\u6d01\",\"D\":\"\\u670d\\u52a1\\u578b\"}','[\"D\"]',1539407090,1539407090),
	(76,3,7,0,'全党必须牢记，（ ）的问题，是检验一个政党、一个政权性质的试金石。','{\"A\":\"\\u4e3a\\u4ec0\\u4e48\\u4eba\",\"B\":\"\\u6267\\u653f\\u5b97\\u65e8\",\"C\":\"\\u5efa\\u515a\\u5b97\\u65e8\",\"D\":\"\\u6743\\u529b\\u6765\\u6e90\"}','[\"A\"]',1539407090,1539407090),
	(77,3,8,0,'建设（ ）是中华民族伟大复兴的基础工程。','{\"A\":\"\\u7ecf\\u6d4e\\u5f3a\\u56fd\",\"B\":\"\\u653f\\u6cbb\\u5f3a\\u56fd\",\"C\":\"\\u6559\\u80b2\\u5f3a\\u56fd\",\"D\":\"\\u6587\\u5316\\u5f3a\\u56fd\"}','[\"C\"]',1539407090,1539407090),
	(78,3,9,0,'国家安全是安邦定国的重要基石，（ ）是全国各族人民根本利益所在。','{\"A\":\"\\u52a0\\u5feb\\u7ecf\\u6d4e\\u53d1\\u5c55\",\"B\":\"\\u7ef4\\u62a4\\u56fd\\u5bb6\\u7edf\\u4e00\",\"C\":\"\\u4fc3\\u8fdb\\u56fd\\u9645\\u5408\\u4f5c\",\"D\":\"\\u7ef4\\u62a4\\u56fd\\u5bb6\\u5b89\\u5168\"}','[\"D\"]',1539407090,1539407090),
	(79,3,10,0,'我们要坚持人与自然（ ）。','{\"A\":\"\\u548c\\u8c10\\u76f8\\u5904\",\"B\":\"\\u548c\\u7766\\u76f8\\u5904\",\"C\":\"\\u548c\\u8c10\\u5171\\u751f\",\"D\":\"\\u548c\\u7766\\u5171\\u751f\"}','[\"C\"]',1539407090,1539407090),
	(80,3,11,0,'加快建立绿色生产和消费的法律制度和政策导向，建立健全（ ）的经济体系。','{\"A\":\"\\u7eff\\u8272\\u4f4e\\u78b3\\u5faa\\u73af\\u53d1\\u5c55\",\"B\":\"\\u7eff\\u8272\\u8282\\u7ea6\\u5faa\\u73af\\u53d1\\u5c55\",\"C\":\"\\u7eff\\u8272\\u4f4e\\u78b3\\u8282\\u7ea6\\u53d1\\u5c55\",\"D\":\"\\u8282\\u7ea6\\u4f4e\\u78b3\\u5faa\\u73af\\u53d1\\u5c55\"}','[\"A\"]',1539407090,1539407090),
	(81,3,12,0,'加强对生态文明建设的总体设计和组织领导，设立（ ）机构。','{\"A\":\"\\u56fd\\u6709\\u81ea\\u7136\\u8d44\\u6e90\\u8d44\\u4ea7\\u7ba1\\u7406\\u548c\\u81ea\\u7136\\u73af\\u5883\\u76d1\\u7ba1\",\"B\":\"\\u56fd\\u6709\\u81ea\\u7136\\u8d44\\u6e90\\u8d44\\u4ea7\\u7ba1\\u7406\\u548c\\u81ea\\u7136\\u751f\\u6001\\u76d1\\u7ba1\",\"C\":\"\\u56fd\\u6709\\u81ea\\u7136\\u8d44\\u6e90\\u8d44\\u4ea7\\u76d1\\u7ba1\\u548c\\u81ea\\u7136\\u751f\\u6001\\u7ba1\\u7406\",\"D\":\"\\u56fd\\u6709\\u81ea\\u7136\\u73af\\u5883\\u8d44\\u4ea7\\u76d1\\u7ba1\\u548c\\u81ea\\u7136\\u751f\\u6001\\u7ba1\\u7406\"}','[\"B\"]',1539407090,1539407090),
	(82,3,13,0,'我们要牢固树立社会主义生态文明观，推动形成（ ）现代化建设新格局，为保护生态环境作出我们这代人的努力！','{\"A\":\"\\u4eba\\u4e0e\\u81ea\\u7136\\u548c\\u8c10\\u5171\\u751f\",\"B\":\"\\u4eba\\u4e0e\\u73af\\u5883\\u548c\\u8c10\\u53d1\\u5c55\",\"C\":\"\\u4eba\\u4e0e\\u81ea\\u7136\\u548c\\u8c10\\u53d1\\u5c55\",\"D\":\"\\u4eba\\u4e0e\\u73af\\u5883\\u548c\\u8c10\\u5171\\u751f\"}','[\"C\"]',1539407090,1539407090),
	(83,3,14,0,'适应世界新军事革命发展趋势和国家安全需求，提高建设质量和效益，确保到二〇二〇年基本实现（ ），（ ）建设取得重大进展，（ ）有大的提升。','{\"A\":\"\\u73b0\\u4ee3\\u5316 \\u4fe1\\u606f\\u5316 \\u6218\\u6597\\u80fd\\u529b\",\"B\":\"\\u673a\\u68b0\\u5316 \\u4fe1\\u606f\\u5316 \\u6218\\u6597\\u80fd\\u529b\",\"C\":\"\\u673a\\u68b0\\u5316 \\u4fe1\\u606f\\u5316 \\u6218\\u7565\\u80fd\\u529b\",\"D\":\"\\u73b0\\u4ee3\\u5316 \\u4fe1\\u606f\\u5316 \\u6218\\u7565\\u80fd\\u529b\"}','[\"C\"]',1539407090,1539407090),
	(84,3,15,0,'力争到二〇三五年（ ）国防和军队现代化，到本世纪中叶把人民军队（ ）世界一流军队。','{\"A\":\"\\u5168\\u9762\\u5b9e\\u73b0 \\u57fa\\u672c\\u5efa\\u6210\",\"B\":\"\\u5168\\u9762\\u5b9e\\u73b0 \\u5168\\u9762\\u5efa\\u6210\",\"C\":\"\\u57fa\\u672c\\u5b9e\\u73b0 \\u57fa\\u672c\\u5efa\\u6210\",\"D\":\"\\u57fa\\u672c\\u5b9e\\u73b0 \\u5168\\u9762\\u5efa\\u6210\"}','[\"D\"]',1539407090,1539407090),
	(85,3,16,0,'树立（ ）是核心战斗力的思想，推进重大技术创新、自主创新，加强军事人才培养体系建设，建设创新型人民军队。','{\"A\":\"\\u79d1\\u6280\",\"B\":\"\\u79d1\\u6280\",\"C\":\"\\u4eba\\u624d\",\"D\":\"\\u6280\\u672f\"}','[\"B\"]',1539407090,1539407090),
	(86,3,17,0,'军队是要准备打仗的，一切工作都必须坚持（ ）标准，向能打仗、打胜仗聚焦。','{\"A\":\"\\u6218\\u6597\\u529b\",\"B\":\"\\u6597\\u4e89\\u529b\",\"C\":\"\\u6218\\u4e89\\u529b\",\"D\":\"\\u786c\\u5b9e\\u529b\"}','[\"A\"]',1539407090,1539407090),
	(87,3,18,0,'解决台湾问题、实现祖国完全统一，是全体中华儿女（ ），是中华民族（ ）所在。','{\"A\":\"\\u4e00\\u81f4\\u613f\\u671b \\u6839\\u672c\\u5229\\u76ca\",\"B\":\"\\u5171\\u540c\\u613f\\u671b \\u672c\\u8d28\\u5229\\u76ca\",\"C\":\"\\u4e00\\u81f4\\u613f\\u671b \\u672c\\u8d28\\u5229\\u76ca\",\"D\":\"\\u5171\\u540c\\u613f\\u671b \\u6839\\u672c\\u5229\\u76ca\"}','[\"D\"]',1539407090,1539407090),
	(88,3,19,0,'（ ）是两岸关系的政治基础。','{\"A\":\"\\u201c\\u4e5d\\u4e8c\\u5171\\u8bc6\\u201d \",\"B\":\"\\u53cd\\u5bf9\\u201c\\u53f0\\u72ec\\u201d\",\"C\":\"\\u4e00\\u4e2a\\u4e2d\\u56fd\\u539f\\u5219\",\"D\":\"\\u548c\\u5e73\\u7edf\\u4e00\"}','[\"C\"]',1539407090,1539407090),
	(89,3,20,0,'我们呼吁，各国人民同心协力，构建人类命运共同体，建设（ ）的世界。','{\"A\":\"\\u6301\\u4e45\\u548c\\u5e73\\u3001\\u666e\\u904d\\u5b89\\u5168\\u3001\\u5171\\u540c\\u7e41\\u8363\\u3001\\u5f00\\u653e\\u5305\\u5bb9\\u3001\\u516c\\u5e73\\u6b63\\u4e49\",\"B\":\"\\u6301\\u4e45\\u548c\\u5e73\\u3001\\u666e\\u904d\\u5b89\\u5168\\u3001\\u5171\\u540c\\u7e41\\u8363\\u3001\\u516c\\u5e73\\u6b63\\u4e49\\u3001\\u6e05\\u6d01\\u7f8e\\u4e3d\",\"C\":\"\\u6301\\u4e45\\u548c\\u5e73\\u3001\\u666e\\u904d\\u5b89\\u5168\\u3001\\u5171\\u540c\\u7e41\\u8363\\u3001\\u5f00\\u653e\\u5305\\u5bb9\\u3001\\u6e05\\u6d01\\u7f8e\\u4e3d\",\"D\":\"\\u6301\\u4e45\\u548c\\u5e73\\u3001\\u666e\\u904d\\u5b89\\u5168\\u3001\\u516c\\u5e73\\u6b63\\u4e49\\u3001\\u5f00\\u653e\\u5305\\u5bb9\\u3001\\u6e05\\u6d01\\u7f8e\\u4e3d\"}','[\"C\"]',1539407090,1539407090),
	(90,3,21,0,'深刻认识党面临的（ ）的尖锐性和严峻性，坚持问题导向，保持战略定力，推动全面从严治党向纵深发展。','{\"A\":\"\\u7cbe\\u795e\\u61c8\\u6020\\u5371\\u9669\\u3001\\u80fd\\u529b\\u4e0d\\u8db3\\u5371\\u9669\\u3001\\u8131\\u79bb\\u7fa4\\u4f17\\u5371\\u9669\\u3001\\u6d88\\u6781\\u8150\\u8d25\\u5371\\u9669\",\"B\":\"\\u7cbe\\u795e\\u61c8\\u6020\\u5371\\u9669\\u3001\\u5c01\\u95ed\\u50f5\\u5316\\u5371\\u9669\\u3001\\u8131\\u79bb\\u7fa4\\u4f17\\u5371\\u9669\\u3001\\u6d88\\u6781\\u8150\\u8d25\\u5371\\u9669\",\"C\":\"\\u7cbe\\u795e\\u61c8\\u6020\\u5371\\u9669\\u3001\\u80fd\\u529b\\u4e0d\\u8db3\\u5371\\u9669\\u3001\\u5b98\\u50da\\u4e3b\\u4e49\\u5371\\u9669\\u3001\\u6d88\\u6781\\u8150\\u8d25\\u5371\\u9669\",\"D\":\"\\u7cbe\\u795e\\u61c8\\u6020\\u5371\\u9669\\u3001\\u80fd\\u529b\\u4e0d\\u8db3\\u5371\\u9669\\u3001\\u8131\\u79bb\\u7fa4\\u4f17\\u5371\\u9669\\u3001\\u8150\\u5316\\u5815\\u843d\\u5371\\u9669\"}','[\"A\"]',1539407090,1539407090),
	(91,3,22,0,'党的（ ）是党的根本性建设，决定党的建设方向和效果。','{\"A\":\"\\u601d\\u60f3\\u5efa\\u8bbe\",\"B\":\"\\u653f\\u6cbb\\u5efa\\u8bbe\",\"C\":\"\\u7ec4\\u7ec7\\u5efa\\u8bbe\",\"D\":\"\\u5236\\u5ea6\\u5efa\\u8bbe\"}','[\"B\"]',1539407090,1539407090),
	(92,3,23,0,'要尊崇党章，严格执行新形势下党内政治生活若干准则，增强党内政治生活的（ ）。','{\"A\":\"\\u653f\\u6cbb\\u6027\\u3001\\u65f6\\u4ee3\\u6027\\u3001\\u539f\\u5219\\u6027\\u3001\\u6218\\u6597\\u6027\",\"B\":\"\\u60f3\\u6027\\u3001\\u653f\\u6cbb\\u6027\\u3001\\u65f6\\u4ee3\\u6027\\u3001\\u539f\\u5219\\u6027\",\"C\":\"\\u653f\\u6cbb\\u6027\\u3001\\u601d\\u60f3\\u6027\\u3001\\u65f6\\u4ee3\\u6027\\u3001\\u539f\\u5219\\u6027\",\"D\":\"\\u653f\\u6cbb\\u6027\\u3001\\u601d\\u60f3\\u6027\\u3001\\u65f6\\u4ee3\\u6027\\u3001\\u6218\\u6597\\u6027\"}','[\"A\"]',1539407090,1539407090),
	(93,3,24,0,'坚决防止和反对（ ），坚决防止和反对宗派主义、圈子文化、码头文化，坚决反对搞两面派、做两面人。','{\"A\":\"\\u4e2a\\u4eba\\u4e3b\\u4e49\\u3001\\u4eab\\u4e50\\u4e3b\\u4e49\\u3001\\u81ea\\u7531\\u4e3b\\u4e49\\u3001\\u672c\\u4f4d\\u4e3b\\u4e49\\u3001\\u597d\\u4eba\\u4e3b\\u4e49\",\"B\":\"\\u4e2a\\u4eba\\u4e3b\\u4e49\\u3001\\u5206\\u6563\\u4e3b\\u4e49\\u3001\\u5c71\\u5934\\u4e3b\\u4e49\\u3001\\u672c\\u4f4d\\u4e3b\\u4e49\\u3001\\u597d\\u4eba\\u4e3b\\u4e49\",\"C\":\"\\u4e2a\\u4eba\\u4e3b\\u4e49\\u3001\\u5206\\u6563\\u4e3b\\u4e49\\u3001\\u81ea\\u7531\\u4e3b\\u4e49\\u3001\\u672c\\u4f4d\\u4e3b\\u4e49\\u3001\\u597d\\u4eba\\u4e3b\\u4e49\",\"D\":\"\\u4e2a\\u4eba\\u4e3b\\u4e49\\u3001\\u5206\\u6563\\u4e3b\\u4e49\\u3001\\u81ea\\u7531\\u4e3b\\u4e49\\u3001\\u672c\\u4f4d\\u4e3b\\u4e49\\u3001\\u4eab\\u4e50\\u4e3b\\u4e49\"}','[\"C\"]',1539407090,1539407090),
	(94,3,25,0,'（ ）和（ ），是中国共产党人的精神支柱和政治灵魂，也是保持党的团结统一的思想基础。','{\"A\":\"\\u5171\\u4ea7\\u4e3b\\u4e49\\u8fdc\\u5927\\u7406\\u60f3 \\u65b0\\u65f6\\u4ee3\\u4e2d\\u56fd\\u7279\\u8272\\u793e\\u4f1a\\u4e3b\\u4e49\\u5171\\u540c\\u7406\\u60f3\",\"B\":\"\\u5171\\u4ea7\\u4e3b\\u4e49\\u8fdc\\u5927\\u7406\\u60f3 \\u4e2d\\u56fd\\u7279\\u8272\\u793e\\u4f1a\\u4e3b\\u4e49\\u5171\\u540c\\u7406\\u60f3\",\"C\":\"\\u5171\\u4ea7\\u4e3b\\u4e49\\u5d07\\u9ad8\\u7406\\u60f3 \\u65b0\\u65f6\\u4ee3\\u4e2d\\u56fd\\u7279\\u8272\\u793e\\u4f1a\\u4e3b\\u4e49\\u5171\\u540c\\u7406\\u60f3\",\"D\":\"\\u5171\\u4ea7\\u4e3b\\u4e49\\u5d07\\u9ad8\\u7406\\u60f3 \\u4e2d\\u56fd\\u7279\\u8272\\u793e\\u4f1a\\u4e3b\\u4e49\\u5171\\u540c\\u7406\\u60f3\"}','[\"B\"]',1539407090,1539407090),
	(95,3,26,0,'要坚持党管干部原则，（ ），把好干部标准落到实处。','{\"A\":\"\\u575a\\u6301\\u7acb\\u573a\\u575a\\u5b9a\\u3001\\u7d20\\u8d28\\u8fc7\\u786c\\uff0c\\u575a\\u6301\\u4e94\\u6e56\\u56db\\u6d77\\u3001\\u4efb\\u4eba\\u552f\\u8d24\\uff0c\\u575a\\u6301\\u4e8b\\u4e1a\\u4e3a\\u4e0a\\u3001\\u516c\\u9053\\u6b63\\u6d3e \",\"B\":\"\\u575a\\u6301\\u5fb7\\u624d\\u517c\\u5907\\u3001\\u4ee5\\u5fb7\\u4e3a\\u5148\\uff0c\\u575a\\u6301\\u7acb\\u573a\\u575a\\u5b9a\\u3001\\u7d20\\u8d28\\u8fc7\\u786c\\uff0c\\u575a\\u6301\\u4e8b\\u4e1a\\u4e3a\\u4e0a\\u3001\\u516c\\u9053\\u6b63\\u6d3e\",\"C\":\"\\u575a\\u6301\\u5fb7\\u624d\\u517c\\u5907\\u3001\\u4ee5\\u5fb7\\u4e3a\\u5148\\uff0c\\u575a\\u6301\\u4e94\\u6e56\\u56db\\u6d77\\u3001\\u4efb\\u4eba\\u552f\\u8d24\\uff0c\\u575a\\u6301\\u7acb\\u573a\\u575a\\u5b9a\\u3001\\u7d20\\u8d28\\u8fc7\\u786c\",\"D\":\"\\u575a\\u6301\\u5fb7\\u624d\\u517c\\u5907\\u3001\\u4ee5\\u5fb7\\u4e3a\\u5148\\uff0c\\u575a\\u6301\\u4e94\\u6e56\\u56db\\u6d77\\u3001\\u4efb\\u4eba\\u552f\\u8d24\\uff0c\\u575a\\u6301\\u4e8b\\u4e1a\\u4e3a\\u4e0a\\u3001\\u516c\\u9053\\u6b63\\u6d3e\"}','[\"D\"]',1539407090,1539407090),
	(96,3,27,0,'要以提升（ ）为重点，突出政治功能，把企业、农村、机关、学校、科研院所、街道社区、社会组织等基层党组织建设成为宣传党的主张、贯彻党的决定、领导基层治理、团结动员群众、推动改革发展的坚强战斗堡垒。','{\"A\":\"\\u51dd\\u805a\\u529b\",\"B\":\"\\u9886\\u5bfc\\u529b\",\"C\":\"\\u7ec4\\u7ec7\\u529b\",\"D\":\"\\u6218\\u6597\\u529b\"}','[\"C\"]',1539407090,1539407090),
	(97,3,28,0,'要坚持无禁区、全覆盖、零容忍，坚持（ ），坚持受贿行贿一起查，坚决防止党内形成利益集团。','{\"A\":\"\\u91cd\\u9884\\u9632\\u3001\\u5f3a\\u9ad8\\u538b\\u3001\\u957f\\u9707\\u6151\",\"B\":\"\\u91cd\\u904f\\u5236\\u3001\\u5f3a\\u9ad8\\u538b\\u3001\\u957f\\u9707\\u6151\",\"C\":\"\\u91cd\\u904f\\u5236\\u3001\\u4e0d\\u51cf\\u538b\\u3001\\u957f\\u9707\\u6151\",\"D\":\"\\u91cd\\u904f\\u5236\\u3001\\u5f3a\\u9ad8\\u538b\\u3001\\u957f\\u5a01\\u6151\"}','[\"B\"]',1539407090,1539407090),
	(98,3,29,0,'增强党自我净化能力，根本靠强化（ ）和（ ）。','{\"A\":\"\\u515a\\u7684\\u81ea\\u6211\\u76d1\\u7763\\u3001\\u8206\\u8bba\\u76d1\\u7763\",\"B\":\"\\u515a\\u7684\\u81ea\\u6211\\u76d1\\u7763\\u3001\\u7fa4\\u4f17\\u76d1\\u7763\",\"C\":\"\\u515a\\u7684\\u81ea\\u6211\\u76d1\\u7763\\u3001\\u53f8\\u6cd5\\u76d1\\u7763\",\"D\":\"\\u515a\\u7684\\u81ea\\u6211\\u76d1\\u7763\\u3001\\u6c11\\u4e3b\\u76d1\\u7763\"}','[\"B\"]',1539407090,1539407090),
	(99,3,30,0,'推进（ ），建设覆盖纪检监察系统的检举举报平台。强化不敢腐的震慑，扎牢不能腐的笼子，增强不想腐的自觉，通过不懈努力换来海晏河清、朗朗乾坤。','{\"A\":\"\\u5171\\u5efa\\u5171\\u878d\\u5171\\u4eab\",\"B\":\"\\u4e92\\u901a\\u4e92\\u60e0\\u4e92\\u5229\",\"C\":\"\\u5171\\u5546\\u5171\\u5efa\\u5171\\u4eab\",\"D\":\"\\u548c\\u5e73\\u5408\\u4f5c\\u5171\\u8d62\"}','[\"C\"]',1539407090,1539407090);

/*!40000 ALTER TABLE `par_exam_question` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_exam_user_result
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_exam_user_result`;

CREATE TABLE `par_exam_user_result` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `paper_id` int(11) unsigned NOT NULL,
  `is_submitted` tinyint(1) DEFAULT '0' COMMENT '是否交卷',
  `paper_snapshot` longtext NOT NULL,
  `answers_snapshot` longtext,
  `score` int(11) unsigned DEFAULT NULL,
  `is_passed` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0:未通过;1:通过',
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_exam_user_result` WRITE;
/*!40000 ALTER TABLE `par_exam_user_result` DISABLE KEYS */;

INSERT INTO `par_exam_user_result` (`id`, `user_id`, `paper_id`, `is_submitted`, `paper_snapshot`, `answers_snapshot`, `score`, `is_passed`, `created_at`, `updated_at`)
VALUES
	(10,2,2,0,'{\"id\":2,\"initiate_user_id\":1,\"name\":\"\\u5728\\u7ebf\\u6f14\\u793a\\u7684\\u8bd5\\u5377\",\"duration\":15,\"is_restrict_user\":1,\"max_score\":20,\"pass_score\":12,\"questions_count\":10,\"published_at\":1539137771,\"finished_at\":1539410866,\"created_at\":\"1539138175\",\"updated_at\":\"1539138175\",\"more\":{\"thumbnail\":\"\\/upload\\/20181010\\/1539063805001_296.jpg\"},\"time_status\":1,\"time_status_format\":\"\\u8fdb\\u884c\\u4e2d\",\"published_at_format\":\"2018-10-10 02:16:11\",\"finished_at_format\":\"2018-10-13 06:07:46\",\"created_at_format\":\"2018-10-10 02:22:55\",\"updated_at_format\":\"2018-10-10 02:22:55\",\"questions\":[{\"id\":21,\"paper_id\":2,\"question_id\":24,\"question_score\":2,\"title\":\"\\u95ee\\u98981     12312312\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\"},\"answers\":[\"A\",\"B\"],\"created_at\":\"1539138175\",\"updated_at\":\"1539138175\",\"created_at_format\":\"2018-10-10 02:22:55\"},{\"id\":22,\"paper_id\":2,\"question_id\":27,\"question_score\":2,\"title\":\"\\u95ee\\u9898211113\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"C\"],\"created_at\":\"1539138175\",\"updated_at\":\"1539138175\",\"created_at_format\":\"2018-10-10 02:22:55\"},{\"id\":23,\"paper_id\":2,\"question_id\":46,\"question_score\":2,\"title\":\"\\u95ee\\u9898211132\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"B\"],\"created_at\":\"1539138175\",\"updated_at\":\"1539138175\",\"created_at_format\":\"2018-10-10 02:22:55\"},{\"id\":24,\"paper_id\":2,\"question_id\":40,\"question_score\":2,\"title\":\"\\u95ee\\u9898211126\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"B\"],\"created_at\":\"1539138175\",\"updated_at\":\"1539138175\",\"created_at_format\":\"2018-10-10 02:22:55\"},{\"id\":25,\"paper_id\":2,\"question_id\":32,\"question_score\":2,\"title\":\"\\u95ee\\u9898211118\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"B\",\"D\"],\"created_at\":\"1539138175\",\"updated_at\":\"1539138175\",\"created_at_format\":\"2018-10-10 02:22:55\"},{\"id\":26,\"paper_id\":2,\"question_id\":30,\"question_score\":2,\"title\":\"\\u95ee\\u9898211116\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"B\"],\"created_at\":\"1539138175\",\"updated_at\":\"1539138175\",\"created_at_format\":\"2018-10-10 02:22:55\"},{\"id\":27,\"paper_id\":2,\"question_id\":41,\"question_score\":2,\"title\":\"\\u95ee\\u9898211127\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"B\"],\"created_at\":\"1539138175\",\"updated_at\":\"1539138175\",\"created_at_format\":\"2018-10-10 02:22:55\"},{\"id\":28,\"paper_id\":2,\"question_id\":44,\"question_score\":2,\"title\":\"\\u95ee\\u9898211130\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"B\"],\"created_at\":\"1539138175\",\"updated_at\":\"1539138175\",\"created_at_format\":\"2018-10-10 02:22:55\"},{\"id\":29,\"paper_id\":2,\"question_id\":39,\"question_score\":2,\"title\":\"\\u95ee\\u9898211125\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"B\"],\"created_at\":\"1539138175\",\"updated_at\":\"1539138175\",\"created_at_format\":\"2018-10-10 02:22:55\"},{\"id\":30,\"paper_id\":2,\"question_id\":26,\"question_score\":2,\"title\":\"\\u95ee\\u9898211112\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"B\"],\"created_at\":\"1539138175\",\"updated_at\":\"1539138175\",\"created_at_format\":\"2018-10-10 02:22:55\"}],\"attend_users\":[{\"id\":2,\"type\":2,\"department_id\":1,\"name\":\"\\u674e\\u9759\\u6ce2\",\"sex\":\"\\u7537\",\"cellphone\":\"15598259922\",\"duty\":\"\\u5de5\\u7a0b\\u5e08\",\"user_excerpt\":\"\\u662f\\u4e00\\u540d\\u7a0b\\u5e8f\\u5458\\u3002\",\"user_login\":\"leader\",\"user_password\":\"bd417e904f9c00d3\",\"access_token\":\"eyJpdiI6IkVjTFBzMTNHWFVhdHBObGN4ZHlkTGc9PSIsInZhbHVlIjoiVXl3ZWRUTE95QjlpMzUzZkY1YmtZdkJ4UTc4eTJ1S29XZ1ZudEFSdlVtUlowbzhMaFFJS3BYdU9rNkx3ZlFKd3dQY3htZmdnYldJNlpGUXFCOWxsMmhoWmErS3Z2WXQyanZxYkNvTVI3VENsY2NtWWk4MkNoTXNVVWJnWERBSVprdUk3bytxNExnMVFrbnRScVZmanVtcFBpeWtJN1QzY3FRMVdXYnRPUXhlcnBiMWFMZjZVQkQzT3dnTWw3bVlEOEI0SENkeCswakJybW8yVGJ3Y1dGbFRFNU8yckJHMkpuK0UwN2xDUTB4SEt4dndGMllcL3JsdlwvZ2xUMXNEeVwvVFFnaGNcL3NrN1dDNUdMeTZaV1BPdEo0TXptN0NGalY1R001N3BNM055eW5pdm40QWtvSnZYY3dhSUxvSWNJUis0a3VnU2YrNzErZjg4Nm85M3RLMGhqN0R4U3RCakVxODUwbUhSVTh1WlYxWWxQTXJjekVpUlZoMUk4RG9zaVpmbG1vNVNLRVUxOFJjWDR5K2hZTjFkdkhON0hUbDl3eHRaNjJSZGxtMzJQaEk9IiwibWFjIjoiZDQyNDFhYjYyMjdiNGJmMzA5MjcxNzc3NWRlOTg0ZjY2YWM5ODE0YWI4OWI4MDRhYjJmM2ZjZjI0YWIwMzc3NCJ9\",\"borned_at\":null,\"created_at\":\"0\",\"updated_at\":\"1539403089\",\"more\":{\"thumbnail\":\"\\/upload\\/20181013\\/xjpic.do.jpeg\"},\"paper_id\":2,\"type_format\":\"\\u515a\\u5458\",\"borned_at_format\":\"\",\"thumbnail_format\":\"\\/upload\\/20181013\\/xjpic.do.jpeg\",\"role_ids\":[1],\"roles_format\":\"\\u8d85\\u7ea7\\u6743\\u9650\",\"roles\":[{\"id\":1,\"name\":\"\\u8d85\\u7ea7\\u6743\\u9650\",\"created_at\":\"1\",\"updated_at\":\"1538929504\",\"user_id\":2,\"auth_count\":136,\"auth_map_ids\":[1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137],\"auth_middle\":[{\"id\":142,\"auth_role_id\":1,\"auth_map_id\":1,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":143,\"auth_role_id\":1,\"auth_map_id\":2,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":144,\"auth_role_id\":1,\"auth_map_id\":3,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":145,\"auth_role_id\":1,\"auth_map_id\":4,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":146,\"auth_role_id\":1,\"auth_map_id\":5,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":147,\"auth_role_id\":1,\"auth_map_id\":6,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":148,\"auth_role_id\":1,\"auth_map_id\":7,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":149,\"auth_role_id\":1,\"auth_map_id\":8,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":150,\"auth_role_id\":1,\"auth_map_id\":9,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":151,\"auth_role_id\":1,\"auth_map_id\":11,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":152,\"auth_role_id\":1,\"auth_map_id\":12,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":153,\"auth_role_id\":1,\"auth_map_id\":13,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":154,\"auth_role_id\":1,\"auth_map_id\":14,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":155,\"auth_role_id\":1,\"auth_map_id\":15,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":156,\"auth_role_id\":1,\"auth_map_id\":16,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":157,\"auth_role_id\":1,\"auth_map_id\":17,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":158,\"auth_role_id\":1,\"auth_map_id\":18,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":159,\"auth_role_id\":1,\"auth_map_id\":19,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":160,\"auth_role_id\":1,\"auth_map_id\":20,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":161,\"auth_role_id\":1,\"auth_map_id\":21,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":162,\"auth_role_id\":1,\"auth_map_id\":22,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":163,\"auth_role_id\":1,\"auth_map_id\":23,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":164,\"auth_role_id\":1,\"auth_map_id\":24,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":165,\"auth_role_id\":1,\"auth_map_id\":25,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":166,\"auth_role_id\":1,\"auth_map_id\":26,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":167,\"auth_role_id\":1,\"auth_map_id\":27,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":168,\"auth_role_id\":1,\"auth_map_id\":28,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":169,\"auth_role_id\":1,\"auth_map_id\":29,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":170,\"auth_role_id\":1,\"auth_map_id\":30,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":171,\"auth_role_id\":1,\"auth_map_id\":31,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":172,\"auth_role_id\":1,\"auth_map_id\":32,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":173,\"auth_role_id\":1,\"auth_map_id\":33,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":174,\"auth_role_id\":1,\"auth_map_id\":34,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":175,\"auth_role_id\":1,\"auth_map_id\":35,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":176,\"auth_role_id\":1,\"auth_map_id\":36,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":177,\"auth_role_id\":1,\"auth_map_id\":37,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":178,\"auth_role_id\":1,\"auth_map_id\":38,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":179,\"auth_role_id\":1,\"auth_map_id\":39,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":180,\"auth_role_id\":1,\"auth_map_id\":40,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":181,\"auth_role_id\":1,\"auth_map_id\":41,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":182,\"auth_role_id\":1,\"auth_map_id\":42,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":183,\"auth_role_id\":1,\"auth_map_id\":43,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":184,\"auth_role_id\":1,\"auth_map_id\":44,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":185,\"auth_role_id\":1,\"auth_map_id\":45,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":186,\"auth_role_id\":1,\"auth_map_id\":46,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":187,\"auth_role_id\":1,\"auth_map_id\":47,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":188,\"auth_role_id\":1,\"auth_map_id\":48,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":189,\"auth_role_id\":1,\"auth_map_id\":49,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":190,\"auth_role_id\":1,\"auth_map_id\":50,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":191,\"auth_role_id\":1,\"auth_map_id\":51,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":192,\"auth_role_id\":1,\"auth_map_id\":52,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":193,\"auth_role_id\":1,\"auth_map_id\":53,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":194,\"auth_role_id\":1,\"auth_map_id\":54,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":195,\"auth_role_id\":1,\"auth_map_id\":55,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":196,\"auth_role_id\":1,\"auth_map_id\":56,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":197,\"auth_role_id\":1,\"auth_map_id\":57,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":198,\"auth_role_id\":1,\"auth_map_id\":58,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":199,\"auth_role_id\":1,\"auth_map_id\":59,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":200,\"auth_role_id\":1,\"auth_map_id\":60,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":201,\"auth_role_id\":1,\"auth_map_id\":61,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":202,\"auth_role_id\":1,\"auth_map_id\":62,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":203,\"auth_role_id\":1,\"auth_map_id\":63,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":204,\"auth_role_id\":1,\"auth_map_id\":64,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":205,\"auth_role_id\":1,\"auth_map_id\":65,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":206,\"auth_role_id\":1,\"auth_map_id\":66,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":207,\"auth_role_id\":1,\"auth_map_id\":67,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":208,\"auth_role_id\":1,\"auth_map_id\":68,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":209,\"auth_role_id\":1,\"auth_map_id\":69,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":210,\"auth_role_id\":1,\"auth_map_id\":70,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":211,\"auth_role_id\":1,\"auth_map_id\":71,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":212,\"auth_role_id\":1,\"auth_map_id\":72,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":213,\"auth_role_id\":1,\"auth_map_id\":73,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":214,\"auth_role_id\":1,\"auth_map_id\":74,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":215,\"auth_role_id\":1,\"auth_map_id\":75,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":216,\"auth_role_id\":1,\"auth_map_id\":76,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":217,\"auth_role_id\":1,\"auth_map_id\":77,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":218,\"auth_role_id\":1,\"auth_map_id\":78,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":219,\"auth_role_id\":1,\"auth_map_id\":79,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":220,\"auth_role_id\":1,\"auth_map_id\":80,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":221,\"auth_role_id\":1,\"auth_map_id\":81,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":222,\"auth_role_id\":1,\"auth_map_id\":82,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":223,\"auth_role_id\":1,\"auth_map_id\":83,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":224,\"auth_role_id\":1,\"auth_map_id\":84,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":225,\"auth_role_id\":1,\"auth_map_id\":85,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":226,\"auth_role_id\":1,\"auth_map_id\":86,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":227,\"auth_role_id\":1,\"auth_map_id\":87,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":228,\"auth_role_id\":1,\"auth_map_id\":88,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":229,\"auth_role_id\":1,\"auth_map_id\":89,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":230,\"auth_role_id\":1,\"auth_map_id\":90,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":231,\"auth_role_id\":1,\"auth_map_id\":91,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":232,\"auth_role_id\":1,\"auth_map_id\":92,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":233,\"auth_role_id\":1,\"auth_map_id\":93,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":234,\"auth_role_id\":1,\"auth_map_id\":94,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":235,\"auth_role_id\":1,\"auth_map_id\":95,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":236,\"auth_role_id\":1,\"auth_map_id\":96,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":237,\"auth_role_id\":1,\"auth_map_id\":97,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":238,\"auth_role_id\":1,\"auth_map_id\":98,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":239,\"auth_role_id\":1,\"auth_map_id\":99,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":240,\"auth_role_id\":1,\"auth_map_id\":100,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":241,\"auth_role_id\":1,\"auth_map_id\":101,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":242,\"auth_role_id\":1,\"auth_map_id\":102,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":243,\"auth_role_id\":1,\"auth_map_id\":103,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":244,\"auth_role_id\":1,\"auth_map_id\":104,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":245,\"auth_role_id\":1,\"auth_map_id\":105,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":246,\"auth_role_id\":1,\"auth_map_id\":106,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":247,\"auth_role_id\":1,\"auth_map_id\":107,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":248,\"auth_role_id\":1,\"auth_map_id\":108,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":249,\"auth_role_id\":1,\"auth_map_id\":109,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":250,\"auth_role_id\":1,\"auth_map_id\":110,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":251,\"auth_role_id\":1,\"auth_map_id\":111,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":252,\"auth_role_id\":1,\"auth_map_id\":112,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":253,\"auth_role_id\":1,\"auth_map_id\":113,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":254,\"auth_role_id\":1,\"auth_map_id\":114,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":255,\"auth_role_id\":1,\"auth_map_id\":115,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":256,\"auth_role_id\":1,\"auth_map_id\":116,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":257,\"auth_role_id\":1,\"auth_map_id\":117,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":258,\"auth_role_id\":1,\"auth_map_id\":118,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":259,\"auth_role_id\":1,\"auth_map_id\":119,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":260,\"auth_role_id\":1,\"auth_map_id\":120,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":261,\"auth_role_id\":1,\"auth_map_id\":121,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":262,\"auth_role_id\":1,\"auth_map_id\":122,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":263,\"auth_role_id\":1,\"auth_map_id\":123,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":264,\"auth_role_id\":1,\"auth_map_id\":124,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":265,\"auth_role_id\":1,\"auth_map_id\":125,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":266,\"auth_role_id\":1,\"auth_map_id\":126,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":267,\"auth_role_id\":1,\"auth_map_id\":127,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":268,\"auth_role_id\":1,\"auth_map_id\":128,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":269,\"auth_role_id\":1,\"auth_map_id\":129,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":270,\"auth_role_id\":1,\"auth_map_id\":130,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":271,\"auth_role_id\":1,\"auth_map_id\":131,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":272,\"auth_role_id\":1,\"auth_map_id\":132,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":273,\"auth_role_id\":1,\"auth_map_id\":133,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":274,\"auth_role_id\":1,\"auth_map_id\":134,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":275,\"auth_role_id\":1,\"auth_map_id\":135,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":276,\"auth_role_id\":1,\"auth_map_id\":136,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":277,\"auth_role_id\":1,\"auth_map_id\":137,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"}]}]}]}',NULL,NULL,0,1539403640,1539403640),
	(11,2,4,1,'{\"id\":4,\"initiate_user_id\":1,\"name\":\"\\u5341\\u4e5d\\u5927\\u77e5\\u8bc6\\u95ee\\u7b54\",\"duration\":20,\"is_restrict_user\":1,\"max_score\":20,\"pass_score\":12,\"questions_count\":20,\"published_at\":1539410773,\"finished_at\":1539583940,\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"more\":{\"thumbnail\":\"\\/upload\\/20181013\\/u=2180767727,3252951452&fm=26&gp=0.jpg\"},\"time_status\":1,\"time_status_format\":\"\\u8fdb\\u884c\\u4e2d\",\"published_at_format\":\"2018-10-13 06:06:13\",\"finished_at_format\":\"2018-10-15 06:12:20\",\"created_at_format\":\"2018-10-13 06:12:37\",\"updated_at_format\":\"2018-10-13 06:12:37\",\"questions\":[{\"id\":51,\"paper_id\":4,\"question_id\":91,\"question_score\":1,\"title\":\"\\u515a\\u7684\\uff08 \\uff09\\u662f\\u515a\\u7684\\u6839\\u672c\\u6027\\u5efa\\u8bbe\\uff0c\\u51b3\\u5b9a\\u515a\\u7684\\u5efa\\u8bbe\\u65b9\\u5411\\u548c\\u6548\\u679c\\u3002\",\"options\":{\"A\":\"\\u601d\\u60f3\\u5efa\\u8bbe\",\"B\":\"\\u653f\\u6cbb\\u5efa\\u8bbe\",\"C\":\"\\u7ec4\\u7ec7\\u5efa\\u8bbe\",\"D\":\"\\u5236\\u5ea6\\u5efa\\u8bbe\"},\"answers\":[\"B\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\"},{\"id\":52,\"paper_id\":4,\"question_id\":77,\"question_score\":1,\"title\":\"\\u5efa\\u8bbe\\uff08 \\uff09\\u662f\\u4e2d\\u534e\\u6c11\\u65cf\\u4f1f\\u5927\\u590d\\u5174\\u7684\\u57fa\\u7840\\u5de5\\u7a0b\\u3002\",\"options\":{\"A\":\"\\u7ecf\\u6d4e\\u5f3a\\u56fd\",\"B\":\"\\u653f\\u6cbb\\u5f3a\\u56fd\",\"C\":\"\\u6559\\u80b2\\u5f3a\\u56fd\",\"D\":\"\\u6587\\u5316\\u5f3a\\u56fd\"},\"answers\":[\"C\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\"},{\"id\":53,\"paper_id\":4,\"question_id\":87,\"question_score\":1,\"title\":\"\\u89e3\\u51b3\\u53f0\\u6e7e\\u95ee\\u9898\\u3001\\u5b9e\\u73b0\\u7956\\u56fd\\u5b8c\\u5168\\u7edf\\u4e00\\uff0c\\u662f\\u5168\\u4f53\\u4e2d\\u534e\\u513f\\u5973\\uff08 \\uff09\\uff0c\\u662f\\u4e2d\\u534e\\u6c11\\u65cf\\uff08 \\uff09\\u6240\\u5728\\u3002\",\"options\":{\"A\":\"\\u4e00\\u81f4\\u613f\\u671b \\u6839\\u672c\\u5229\\u76ca\",\"B\":\"\\u5171\\u540c\\u613f\\u671b \\u672c\\u8d28\\u5229\\u76ca\",\"C\":\"\\u4e00\\u81f4\\u613f\\u671b \\u672c\\u8d28\\u5229\\u76ca\",\"D\":\"\\u5171\\u540c\\u613f\\u671b \\u6839\\u672c\\u5229\\u76ca\"},\"answers\":[\"D\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\"},{\"id\":54,\"paper_id\":4,\"question_id\":73,\"question_score\":1,\"title\":\"\\u53d1\\u6325\\u793e\\u4f1a\\u4e3b\\u4e49\\u534f\\u5546\\u6c11\\u4e3b\\u91cd\\u8981\\u4f5c\\u7528\\u3002\\uff08 \\uff09\\u662f\\u5177\\u6709\\u4e2d\\u56fd\\u7279\\u8272\\u7684\\u5236\\u5ea6\\u5b89\\u6392\\uff0c\\u662f\\u793e\\u4f1a\\u4e3b\\u4e49\\u534f\\u5546\\u6c11\\u4e3b\\u7684\\u91cd\\u8981\\u6e20\\u9053\\u548c\\u4e13\\u95e8\\u534f\\u5546\\u673a\\u6784\\u3002\",\"options\":{\"A\":\"\\u653f\\u515a\\u534f\\u5546\",\"B\":\"\\u4eba\\u5927\\u534f\\u5546\",\"C\":\"\\u57fa\\u5c42\\u534f\\u5546\",\"D\":\"\\u4eba\\u6c11\\u653f\\u534f\"},\"answers\":[\"D\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\"},{\"id\":55,\"paper_id\":4,\"question_id\":98,\"question_score\":1,\"title\":\"\\u589e\\u5f3a\\u515a\\u81ea\\u6211\\u51c0\\u5316\\u80fd\\u529b\\uff0c\\u6839\\u672c\\u9760\\u5f3a\\u5316\\uff08 \\uff09\\u548c\\uff08 \\uff09\\u3002\",\"options\":{\"A\":\"\\u515a\\u7684\\u81ea\\u6211\\u76d1\\u7763\\u3001\\u8206\\u8bba\\u76d1\\u7763\",\"B\":\"\\u515a\\u7684\\u81ea\\u6211\\u76d1\\u7763\\u3001\\u7fa4\\u4f17\\u76d1\\u7763\",\"C\":\"\\u515a\\u7684\\u81ea\\u6211\\u76d1\\u7763\\u3001\\u53f8\\u6cd5\\u76d1\\u7763\",\"D\":\"\\u515a\\u7684\\u81ea\\u6211\\u76d1\\u7763\\u3001\\u6c11\\u4e3b\\u76d1\\u7763\"},\"answers\":[\"B\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\"},{\"id\":56,\"paper_id\":4,\"question_id\":97,\"question_score\":1,\"title\":\"\\u8981\\u575a\\u6301\\u65e0\\u7981\\u533a\\u3001\\u5168\\u8986\\u76d6\\u3001\\u96f6\\u5bb9\\u5fcd\\uff0c\\u575a\\u6301\\uff08 \\uff09\\uff0c\\u575a\\u6301\\u53d7\\u8d3f\\u884c\\u8d3f\\u4e00\\u8d77\\u67e5\\uff0c\\u575a\\u51b3\\u9632\\u6b62\\u515a\\u5185\\u5f62\\u6210\\u5229\\u76ca\\u96c6\\u56e2\\u3002\",\"options\":{\"A\":\"\\u91cd\\u9884\\u9632\\u3001\\u5f3a\\u9ad8\\u538b\\u3001\\u957f\\u9707\\u6151\",\"B\":\"\\u91cd\\u904f\\u5236\\u3001\\u5f3a\\u9ad8\\u538b\\u3001\\u957f\\u9707\\u6151\",\"C\":\"\\u91cd\\u904f\\u5236\\u3001\\u4e0d\\u51cf\\u538b\\u3001\\u957f\\u9707\\u6151\",\"D\":\"\\u91cd\\u904f\\u5236\\u3001\\u5f3a\\u9ad8\\u538b\\u3001\\u957f\\u5a01\\u6151\"},\"answers\":[\"B\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\"},{\"id\":57,\"paper_id\":4,\"question_id\":82,\"question_score\":1,\"title\":\"\\u6211\\u4eec\\u8981\\u7262\\u56fa\\u6811\\u7acb\\u793e\\u4f1a\\u4e3b\\u4e49\\u751f\\u6001\\u6587\\u660e\\u89c2\\uff0c\\u63a8\\u52a8\\u5f62\\u6210\\uff08 \\uff09\\u73b0\\u4ee3\\u5316\\u5efa\\u8bbe\\u65b0\\u683c\\u5c40\\uff0c\\u4e3a\\u4fdd\\u62a4\\u751f\\u6001\\u73af\\u5883\\u4f5c\\u51fa\\u6211\\u4eec\\u8fd9\\u4ee3\\u4eba\\u7684\\u52aa\\u529b\\uff01\",\"options\":{\"A\":\"\\u4eba\\u4e0e\\u81ea\\u7136\\u548c\\u8c10\\u5171\\u751f\",\"B\":\"\\u4eba\\u4e0e\\u73af\\u5883\\u548c\\u8c10\\u53d1\\u5c55\",\"C\":\"\\u4eba\\u4e0e\\u81ea\\u7136\\u548c\\u8c10\\u53d1\\u5c55\",\"D\":\"\\u4eba\\u4e0e\\u73af\\u5883\\u548c\\u8c10\\u5171\\u751f\"},\"answers\":[\"C\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\"},{\"id\":58,\"paper_id\":4,\"question_id\":96,\"question_score\":1,\"title\":\"\\u8981\\u4ee5\\u63d0\\u5347\\uff08 \\uff09\\u4e3a\\u91cd\\u70b9\\uff0c\\u7a81\\u51fa\\u653f\\u6cbb\\u529f\\u80fd\\uff0c\\u628a\\u4f01\\u4e1a\\u3001\\u519c\\u6751\\u3001\\u673a\\u5173\\u3001\\u5b66\\u6821\\u3001\\u79d1\\u7814\\u9662\\u6240\\u3001\\u8857\\u9053\\u793e\\u533a\\u3001\\u793e\\u4f1a\\u7ec4\\u7ec7\\u7b49\\u57fa\\u5c42\\u515a\\u7ec4\\u7ec7\\u5efa\\u8bbe\\u6210\\u4e3a\\u5ba3\\u4f20\\u515a\\u7684\\u4e3b\\u5f20\\u3001\\u8d2f\\u5f7b\\u515a\\u7684\\u51b3\\u5b9a\\u3001\\u9886\\u5bfc\\u57fa\\u5c42\\u6cbb\\u7406\\u3001\\u56e2\\u7ed3\\u52a8\\u5458\\u7fa4\\u4f17\\u3001\\u63a8\\u52a8\\u6539\\u9769\\u53d1\\u5c55\\u7684\\u575a\\u5f3a\\u6218\\u6597\\u5821\\u5792\\u3002\",\"options\":{\"A\":\"\\u51dd\\u805a\\u529b\",\"B\":\"\\u9886\\u5bfc\\u529b\",\"C\":\"\\u7ec4\\u7ec7\\u529b\",\"D\":\"\\u6218\\u6597\\u529b\"},\"answers\":[\"C\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\"},{\"id\":59,\"paper_id\":4,\"question_id\":74,\"question_score\":1,\"title\":\"\\u6df1\\u5316\\u4f9d\\u6cd5\\u6cbb\\u56fd\\u5b9e\\u8df5\\u3002\\u6210\\u7acb\\u4e2d\\u592e\\u5168\\u9762\\uff08 \\uff09\\u9886\\u5bfc\\u5c0f\\u7ec4\\uff0c\\u52a0\\u5f3a\\u5bf9\\u6cd5\\u6cbb\\u4e2d\\u56fd\\u5efa\\u8bbe\\u7684\\u7edf\\u4e00\\u9886\\u5bfc\\u3002\",\"options\":{\"A\":\"\\u6df1\\u5316\\u6539\\u9769\",\"B\":\"\\u4f9d\\u6cd5\\u6cbb\\u56fd\",\"C\":\"\\u4ece\\u4e25\\u6cbb\\u515a\",\"D\":\"\\u53f8\\u6cd5\\u6539\\u9769\"},\"answers\":[\"B\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\"},{\"id\":60,\"paper_id\":4,\"question_id\":92,\"question_score\":1,\"title\":\"\\u8981\\u5c0a\\u5d07\\u515a\\u7ae0\\uff0c\\u4e25\\u683c\\u6267\\u884c\\u65b0\\u5f62\\u52bf\\u4e0b\\u515a\\u5185\\u653f\\u6cbb\\u751f\\u6d3b\\u82e5\\u5e72\\u51c6\\u5219\\uff0c\\u589e\\u5f3a\\u515a\\u5185\\u653f\\u6cbb\\u751f\\u6d3b\\u7684\\uff08 \\uff09\\u3002\",\"options\":{\"A\":\"\\u653f\\u6cbb\\u6027\\u3001\\u65f6\\u4ee3\\u6027\\u3001\\u539f\\u5219\\u6027\\u3001\\u6218\\u6597\\u6027\",\"B\":\"\\u60f3\\u6027\\u3001\\u653f\\u6cbb\\u6027\\u3001\\u65f6\\u4ee3\\u6027\\u3001\\u539f\\u5219\\u6027\",\"C\":\"\\u653f\\u6cbb\\u6027\\u3001\\u601d\\u60f3\\u6027\\u3001\\u65f6\\u4ee3\\u6027\\u3001\\u539f\\u5219\\u6027\",\"D\":\"\\u653f\\u6cbb\\u6027\\u3001\\u601d\\u60f3\\u6027\\u3001\\u65f6\\u4ee3\\u6027\\u3001\\u6218\\u6597\\u6027\"},\"answers\":[\"A\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\"},{\"id\":61,\"paper_id\":4,\"question_id\":79,\"question_score\":1,\"title\":\"\\u6211\\u4eec\\u8981\\u575a\\u6301\\u4eba\\u4e0e\\u81ea\\u7136\\uff08 \\uff09\\u3002\",\"options\":{\"A\":\"\\u548c\\u8c10\\u76f8\\u5904\",\"B\":\"\\u548c\\u7766\\u76f8\\u5904\",\"C\":\"\\u548c\\u8c10\\u5171\\u751f\",\"D\":\"\\u548c\\u7766\\u5171\\u751f\"},\"answers\":[\"C\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\"},{\"id\":62,\"paper_id\":4,\"question_id\":84,\"question_score\":1,\"title\":\"\\u529b\\u4e89\\u5230\\u4e8c\\u3007\\u4e09\\u4e94\\u5e74\\uff08 \\uff09\\u56fd\\u9632\\u548c\\u519b\\u961f\\u73b0\\u4ee3\\u5316\\uff0c\\u5230\\u672c\\u4e16\\u7eaa\\u4e2d\\u53f6\\u628a\\u4eba\\u6c11\\u519b\\u961f\\uff08 \\uff09\\u4e16\\u754c\\u4e00\\u6d41\\u519b\\u961f\\u3002\",\"options\":{\"A\":\"\\u5168\\u9762\\u5b9e\\u73b0 \\u57fa\\u672c\\u5efa\\u6210\",\"B\":\"\\u5168\\u9762\\u5b9e\\u73b0 \\u5168\\u9762\\u5efa\\u6210\",\"C\":\"\\u57fa\\u672c\\u5b9e\\u73b0 \\u57fa\\u672c\\u5efa\\u6210\",\"D\":\"\\u57fa\\u672c\\u5b9e\\u73b0 \\u5168\\u9762\\u5efa\\u6210\"},\"answers\":[\"D\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\"},{\"id\":63,\"paper_id\":4,\"question_id\":85,\"question_score\":1,\"title\":\"\\u6811\\u7acb\\uff08 \\uff09\\u662f\\u6838\\u5fc3\\u6218\\u6597\\u529b\\u7684\\u601d\\u60f3\\uff0c\\u63a8\\u8fdb\\u91cd\\u5927\\u6280\\u672f\\u521b\\u65b0\\u3001\\u81ea\\u4e3b\\u521b\\u65b0\\uff0c\\u52a0\\u5f3a\\u519b\\u4e8b\\u4eba\\u624d\\u57f9\\u517b\\u4f53\\u7cfb\\u5efa\\u8bbe\\uff0c\\u5efa\\u8bbe\\u521b\\u65b0\\u578b\\u4eba\\u6c11\\u519b\\u961f\\u3002\",\"options\":{\"A\":\"\\u79d1\\u6280\",\"B\":\"\\u79d1\\u6280\",\"C\":\"\\u4eba\\u624d\",\"D\":\"\\u6280\\u672f\"},\"answers\":[\"B\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\"},{\"id\":64,\"paper_id\":4,\"question_id\":95,\"question_score\":1,\"title\":\"\\u8981\\u575a\\u6301\\u515a\\u7ba1\\u5e72\\u90e8\\u539f\\u5219\\uff0c\\uff08 \\uff09\\uff0c\\u628a\\u597d\\u5e72\\u90e8\\u6807\\u51c6\\u843d\\u5230\\u5b9e\\u5904\\u3002\",\"options\":{\"A\":\"\\u575a\\u6301\\u7acb\\u573a\\u575a\\u5b9a\\u3001\\u7d20\\u8d28\\u8fc7\\u786c\\uff0c\\u575a\\u6301\\u4e94\\u6e56\\u56db\\u6d77\\u3001\\u4efb\\u4eba\\u552f\\u8d24\\uff0c\\u575a\\u6301\\u4e8b\\u4e1a\\u4e3a\\u4e0a\\u3001\\u516c\\u9053\\u6b63\\u6d3e \",\"B\":\"\\u575a\\u6301\\u5fb7\\u624d\\u517c\\u5907\\u3001\\u4ee5\\u5fb7\\u4e3a\\u5148\\uff0c\\u575a\\u6301\\u7acb\\u573a\\u575a\\u5b9a\\u3001\\u7d20\\u8d28\\u8fc7\\u786c\\uff0c\\u575a\\u6301\\u4e8b\\u4e1a\\u4e3a\\u4e0a\\u3001\\u516c\\u9053\\u6b63\\u6d3e\",\"C\":\"\\u575a\\u6301\\u5fb7\\u624d\\u517c\\u5907\\u3001\\u4ee5\\u5fb7\\u4e3a\\u5148\\uff0c\\u575a\\u6301\\u4e94\\u6e56\\u56db\\u6d77\\u3001\\u4efb\\u4eba\\u552f\\u8d24\\uff0c\\u575a\\u6301\\u7acb\\u573a\\u575a\\u5b9a\\u3001\\u7d20\\u8d28\\u8fc7\\u786c\",\"D\":\"\\u575a\\u6301\\u5fb7\\u624d\\u517c\\u5907\\u3001\\u4ee5\\u5fb7\\u4e3a\\u5148\\uff0c\\u575a\\u6301\\u4e94\\u6e56\\u56db\\u6d77\\u3001\\u4efb\\u4eba\\u552f\\u8d24\\uff0c\\u575a\\u6301\\u4e8b\\u4e1a\\u4e3a\\u4e0a\\u3001\\u516c\\u9053\\u6b63\\u6d3e\"},\"answers\":[\"D\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\"},{\"id\":65,\"paper_id\":4,\"question_id\":78,\"question_score\":1,\"title\":\"\\u56fd\\u5bb6\\u5b89\\u5168\\u662f\\u5b89\\u90a6\\u5b9a\\u56fd\\u7684\\u91cd\\u8981\\u57fa\\u77f3\\uff0c\\uff08 \\uff09\\u662f\\u5168\\u56fd\\u5404\\u65cf\\u4eba\\u6c11\\u6839\\u672c\\u5229\\u76ca\\u6240\\u5728\\u3002\",\"options\":{\"A\":\"\\u52a0\\u5feb\\u7ecf\\u6d4e\\u53d1\\u5c55\",\"B\":\"\\u7ef4\\u62a4\\u56fd\\u5bb6\\u7edf\\u4e00\",\"C\":\"\\u4fc3\\u8fdb\\u56fd\\u9645\\u5408\\u4f5c\",\"D\":\"\\u7ef4\\u62a4\\u56fd\\u5bb6\\u5b89\\u5168\"},\"answers\":[\"D\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\"},{\"id\":66,\"paper_id\":4,\"question_id\":71,\"question_score\":1,\"title\":\"\\u575a\\u6301\\u515a\\u7684\\u9886\\u5bfc\\u3001\\u4eba\\u6c11\\u5f53\\u5bb6\\u4f5c\\u4e3b\\u3001\\u4f9d\\u6cd5\\u6cbb\\u56fd\\u6709\\u673a\\u7edf\\u4e00\\u3002\\uff08 \\uff09\\u662f\\u793e\\u4f1a\\u4e3b\\u4e49\\u6c11\\u4e3b\\u653f\\u6cbb\\u7684\\u672c\\u8d28\\u7279\\u5f81\\u3002\",\"options\":{\"A\":\"\\u515a\\u7684\\u9886\\u5bfc\",\"B\":\"\\u4eba\\u6c11\\u5f53\\u5bb6\\u4f5c\\u4e3b\",\"C\":\"\\u4f9d\\u6cd5\\u6cbb\\u56fd\",\"D\":\"\\u653f\\u6cbb\\u4f53\\u5236\\u6539\\u9769\"},\"answers\":[\"B\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\"},{\"id\":67,\"paper_id\":4,\"question_id\":86,\"question_score\":1,\"title\":\"\\u519b\\u961f\\u662f\\u8981\\u51c6\\u5907\\u6253\\u4ed7\\u7684\\uff0c\\u4e00\\u5207\\u5de5\\u4f5c\\u90fd\\u5fc5\\u987b\\u575a\\u6301\\uff08 \\uff09\\u6807\\u51c6\\uff0c\\u5411\\u80fd\\u6253\\u4ed7\\u3001\\u6253\\u80dc\\u4ed7\\u805a\\u7126\\u3002\",\"options\":{\"A\":\"\\u6218\\u6597\\u529b\",\"B\":\"\\u6597\\u4e89\\u529b\",\"C\":\"\\u6218\\u4e89\\u529b\",\"D\":\"\\u786c\\u5b9e\\u529b\"},\"answers\":[\"A\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\"},{\"id\":68,\"paper_id\":4,\"question_id\":75,\"question_score\":1,\"title\":\"\\u6df1\\u5316\\u673a\\u6784\\u548c\\u884c\\u653f\\u4f53\\u5236\\u6539\\u9769\\u3002\\u8f6c\\u53d8\\u653f\\u5e9c\\u804c\\u80fd\\uff0c\\u6df1\\u5316\\u7b80\\u653f\\u653e\\u6743\\uff0c\\u521b\\u65b0\\u76d1\\u7ba1\\u65b9\\u5f0f\\uff0c\\u589e\\u5f3a\\u653f\\u5e9c\\u516c\\u4fe1\\u529b\\u548c\\u6267\\u884c\\u529b\\uff0c\\u5efa\\u8bbe\\u4eba\\u6c11\\u6ee1\\u610f\\u7684\\uff08 \\uff09\\u653f\\u5e9c\\u3002\",\"options\":{\"A\":\"\\u6cd5\\u6cbb\",\"B\":\"\\u521b\\u65b0\\u578b\",\"C\":\"\\u5ec9\\u6d01\",\"D\":\"\\u670d\\u52a1\\u578b\"},\"answers\":[\"D\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\"},{\"id\":69,\"paper_id\":4,\"question_id\":99,\"question_score\":1,\"title\":\"\\u63a8\\u8fdb\\uff08 \\uff09\\uff0c\\u5efa\\u8bbe\\u8986\\u76d6\\u7eaa\\u68c0\\u76d1\\u5bdf\\u7cfb\\u7edf\\u7684\\u68c0\\u4e3e\\u4e3e\\u62a5\\u5e73\\u53f0\\u3002\\u5f3a\\u5316\\u4e0d\\u6562\\u8150\\u7684\\u9707\\u6151\\uff0c\\u624e\\u7262\\u4e0d\\u80fd\\u8150\\u7684\\u7b3c\\u5b50\\uff0c\\u589e\\u5f3a\\u4e0d\\u60f3\\u8150\\u7684\\u81ea\\u89c9\\uff0c\\u901a\\u8fc7\\u4e0d\\u61c8\\u52aa\\u529b\\u6362\\u6765\\u6d77\\u664f\\u6cb3\\u6e05\\u3001\\u6717\\u6717\\u4e7e\\u5764\\u3002\",\"options\":{\"A\":\"\\u5171\\u5efa\\u5171\\u878d\\u5171\\u4eab\",\"B\":\"\\u4e92\\u901a\\u4e92\\u60e0\\u4e92\\u5229\",\"C\":\"\\u5171\\u5546\\u5171\\u5efa\\u5171\\u4eab\",\"D\":\"\\u548c\\u5e73\\u5408\\u4f5c\\u5171\\u8d62\"},\"answers\":[\"C\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\"},{\"id\":70,\"paper_id\":4,\"question_id\":94,\"question_score\":1,\"title\":\"\\uff08 \\uff09\\u548c\\uff08 \\uff09\\uff0c\\u662f\\u4e2d\\u56fd\\u5171\\u4ea7\\u515a\\u4eba\\u7684\\u7cbe\\u795e\\u652f\\u67f1\\u548c\\u653f\\u6cbb\\u7075\\u9b42\\uff0c\\u4e5f\\u662f\\u4fdd\\u6301\\u515a\\u7684\\u56e2\\u7ed3\\u7edf\\u4e00\\u7684\\u601d\\u60f3\\u57fa\\u7840\\u3002\",\"options\":{\"A\":\"\\u5171\\u4ea7\\u4e3b\\u4e49\\u8fdc\\u5927\\u7406\\u60f3 \\u65b0\\u65f6\\u4ee3\\u4e2d\\u56fd\\u7279\\u8272\\u793e\\u4f1a\\u4e3b\\u4e49\\u5171\\u540c\\u7406\\u60f3\",\"B\":\"\\u5171\\u4ea7\\u4e3b\\u4e49\\u8fdc\\u5927\\u7406\\u60f3 \\u4e2d\\u56fd\\u7279\\u8272\\u793e\\u4f1a\\u4e3b\\u4e49\\u5171\\u540c\\u7406\\u60f3\",\"C\":\"\\u5171\\u4ea7\\u4e3b\\u4e49\\u5d07\\u9ad8\\u7406\\u60f3 \\u65b0\\u65f6\\u4ee3\\u4e2d\\u56fd\\u7279\\u8272\\u793e\\u4f1a\\u4e3b\\u4e49\\u5171\\u540c\\u7406\\u60f3\",\"D\":\"\\u5171\\u4ea7\\u4e3b\\u4e49\\u5d07\\u9ad8\\u7406\\u60f3 \\u4e2d\\u56fd\\u7279\\u8272\\u793e\\u4f1a\\u4e3b\\u4e49\\u5171\\u540c\\u7406\\u60f3\"},\"answers\":[\"B\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\"}],\"attend_users\":[{\"id\":2,\"type\":2,\"department_id\":1,\"name\":\"\\u674e\\u9759\\u6ce2\",\"sex\":\"\\u7537\",\"cellphone\":\"15598259922\",\"duty\":\"\\u5de5\\u7a0b\\u5e08\",\"user_excerpt\":\"\\u662f\\u4e00\\u540d\\u7a0b\\u5e8f\\u5458\\u3002\",\"user_login\":\"leader\",\"user_password\":\"bd417e904f9c00d3\",\"access_token\":\"eyJpdiI6IlVJYjFmWXR5a1hXdVdrSzJ3UnZ5MUE9PSIsInZhbHVlIjoiQURUeHdMRWdlSDk1b29YS09wdDV3MThFaGJOR29MSzBqekZ4NWRRSXdNUDY5SUo1MXA0ZkMrcGQ4cHdVdmpyWDZZS3Q4ZmJzUU5taXFHWTdjVloxblpqZDNySnJUUWduWFdzalh4R1dkU3hvcEJzbXIybDFwY3lWb21abnR6YjVcL2Y5VktNVHBnRzJHR0NzSlI5cjl0MnlDZnBaSFNINnF6ZHZjXC9rVW5wcndnRjhFbVwveDFUOUhZd0s1akpTR21FQmJHS3hnZW10cnpaOVlwMUMyTlBuQWMwK3JHM2VKalpCSTJPRkFtdXBReHhEMjFNTUZHU3ZTVVwvQWJcL0lsbU1uaEJLY1JPVWNKUGo2N0laZ3QzdE1uajZQWlNhQXkwNThEV0VtVHZsSmtFQ3VyQm5ybnI4TjBLblwvemwyK3dMQjlROGNjMkh3eis3ZytXM2w0N2ZCSzhJcTN2bEhiZ3NqbDgyWGdpdUxwUmZVOGkzdmNxVVlHenByK0VwdWMramJWYURHaUNnWVdvSkhoT0graHhrMW04c0RKMzlZK0o1bFlhTDYrNjdOU0FDWT0iLCJtYWMiOiI5ZjE0OWNhZWM2ZGQzMzY5ODFjMDFkZTc0Nzk1MDRmMDc1NjdjZThhODk3MzJiOGM3OGM5ZTFhOWFhOTMzOTI3In0=\",\"borned_at\":null,\"created_at\":\"0\",\"updated_at\":\"1539411172\",\"more\":{\"thumbnail\":\"\\/upload\\/20181013\\/xjpic.do.jpeg\"},\"paper_id\":4,\"type_format\":\"\\u515a\\u5458\",\"borned_at_format\":\"\",\"thumbnail_format\":\"\\/upload\\/20181013\\/xjpic.do.jpeg\",\"role_ids\":[1],\"roles_format\":\"\\u8d85\\u7ea7\\u6743\\u9650\",\"roles\":[{\"id\":1,\"name\":\"\\u8d85\\u7ea7\\u6743\\u9650\",\"created_at\":\"1\",\"updated_at\":\"1538929504\",\"user_id\":2,\"auth_count\":136,\"auth_map_ids\":[1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137],\"auth_middle\":[{\"id\":142,\"auth_role_id\":1,\"auth_map_id\":1,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":143,\"auth_role_id\":1,\"auth_map_id\":2,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":144,\"auth_role_id\":1,\"auth_map_id\":3,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":145,\"auth_role_id\":1,\"auth_map_id\":4,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":146,\"auth_role_id\":1,\"auth_map_id\":5,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":147,\"auth_role_id\":1,\"auth_map_id\":6,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":148,\"auth_role_id\":1,\"auth_map_id\":7,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":149,\"auth_role_id\":1,\"auth_map_id\":8,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":150,\"auth_role_id\":1,\"auth_map_id\":9,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":151,\"auth_role_id\":1,\"auth_map_id\":11,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":152,\"auth_role_id\":1,\"auth_map_id\":12,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":153,\"auth_role_id\":1,\"auth_map_id\":13,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":154,\"auth_role_id\":1,\"auth_map_id\":14,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":155,\"auth_role_id\":1,\"auth_map_id\":15,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":156,\"auth_role_id\":1,\"auth_map_id\":16,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":157,\"auth_role_id\":1,\"auth_map_id\":17,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":158,\"auth_role_id\":1,\"auth_map_id\":18,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":159,\"auth_role_id\":1,\"auth_map_id\":19,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":160,\"auth_role_id\":1,\"auth_map_id\":20,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":161,\"auth_role_id\":1,\"auth_map_id\":21,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":162,\"auth_role_id\":1,\"auth_map_id\":22,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":163,\"auth_role_id\":1,\"auth_map_id\":23,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":164,\"auth_role_id\":1,\"auth_map_id\":24,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":165,\"auth_role_id\":1,\"auth_map_id\":25,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":166,\"auth_role_id\":1,\"auth_map_id\":26,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":167,\"auth_role_id\":1,\"auth_map_id\":27,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":168,\"auth_role_id\":1,\"auth_map_id\":28,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":169,\"auth_role_id\":1,\"auth_map_id\":29,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":170,\"auth_role_id\":1,\"auth_map_id\":30,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":171,\"auth_role_id\":1,\"auth_map_id\":31,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":172,\"auth_role_id\":1,\"auth_map_id\":32,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":173,\"auth_role_id\":1,\"auth_map_id\":33,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":174,\"auth_role_id\":1,\"auth_map_id\":34,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":175,\"auth_role_id\":1,\"auth_map_id\":35,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":176,\"auth_role_id\":1,\"auth_map_id\":36,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":177,\"auth_role_id\":1,\"auth_map_id\":37,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":178,\"auth_role_id\":1,\"auth_map_id\":38,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":179,\"auth_role_id\":1,\"auth_map_id\":39,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":180,\"auth_role_id\":1,\"auth_map_id\":40,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":181,\"auth_role_id\":1,\"auth_map_id\":41,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":182,\"auth_role_id\":1,\"auth_map_id\":42,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":183,\"auth_role_id\":1,\"auth_map_id\":43,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":184,\"auth_role_id\":1,\"auth_map_id\":44,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":185,\"auth_role_id\":1,\"auth_map_id\":45,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":186,\"auth_role_id\":1,\"auth_map_id\":46,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":187,\"auth_role_id\":1,\"auth_map_id\":47,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":188,\"auth_role_id\":1,\"auth_map_id\":48,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":189,\"auth_role_id\":1,\"auth_map_id\":49,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":190,\"auth_role_id\":1,\"auth_map_id\":50,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":191,\"auth_role_id\":1,\"auth_map_id\":51,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":192,\"auth_role_id\":1,\"auth_map_id\":52,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":193,\"auth_role_id\":1,\"auth_map_id\":53,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":194,\"auth_role_id\":1,\"auth_map_id\":54,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":195,\"auth_role_id\":1,\"auth_map_id\":55,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":196,\"auth_role_id\":1,\"auth_map_id\":56,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":197,\"auth_role_id\":1,\"auth_map_id\":57,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":198,\"auth_role_id\":1,\"auth_map_id\":58,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":199,\"auth_role_id\":1,\"auth_map_id\":59,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":200,\"auth_role_id\":1,\"auth_map_id\":60,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":201,\"auth_role_id\":1,\"auth_map_id\":61,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":202,\"auth_role_id\":1,\"auth_map_id\":62,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":203,\"auth_role_id\":1,\"auth_map_id\":63,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":204,\"auth_role_id\":1,\"auth_map_id\":64,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":205,\"auth_role_id\":1,\"auth_map_id\":65,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":206,\"auth_role_id\":1,\"auth_map_id\":66,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":207,\"auth_role_id\":1,\"auth_map_id\":67,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":208,\"auth_role_id\":1,\"auth_map_id\":68,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":209,\"auth_role_id\":1,\"auth_map_id\":69,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":210,\"auth_role_id\":1,\"auth_map_id\":70,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":211,\"auth_role_id\":1,\"auth_map_id\":71,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":212,\"auth_role_id\":1,\"auth_map_id\":72,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":213,\"auth_role_id\":1,\"auth_map_id\":73,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":214,\"auth_role_id\":1,\"auth_map_id\":74,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":215,\"auth_role_id\":1,\"auth_map_id\":75,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":216,\"auth_role_id\":1,\"auth_map_id\":76,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":217,\"auth_role_id\":1,\"auth_map_id\":77,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":218,\"auth_role_id\":1,\"auth_map_id\":78,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":219,\"auth_role_id\":1,\"auth_map_id\":79,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":220,\"auth_role_id\":1,\"auth_map_id\":80,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":221,\"auth_role_id\":1,\"auth_map_id\":81,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":222,\"auth_role_id\":1,\"auth_map_id\":82,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":223,\"auth_role_id\":1,\"auth_map_id\":83,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":224,\"auth_role_id\":1,\"auth_map_id\":84,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":225,\"auth_role_id\":1,\"auth_map_id\":85,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":226,\"auth_role_id\":1,\"auth_map_id\":86,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":227,\"auth_role_id\":1,\"auth_map_id\":87,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":228,\"auth_role_id\":1,\"auth_map_id\":88,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":229,\"auth_role_id\":1,\"auth_map_id\":89,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":230,\"auth_role_id\":1,\"auth_map_id\":90,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":231,\"auth_role_id\":1,\"auth_map_id\":91,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":232,\"auth_role_id\":1,\"auth_map_id\":92,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":233,\"auth_role_id\":1,\"auth_map_id\":93,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":234,\"auth_role_id\":1,\"auth_map_id\":94,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":235,\"auth_role_id\":1,\"auth_map_id\":95,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":236,\"auth_role_id\":1,\"auth_map_id\":96,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":237,\"auth_role_id\":1,\"auth_map_id\":97,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":238,\"auth_role_id\":1,\"auth_map_id\":98,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":239,\"auth_role_id\":1,\"auth_map_id\":99,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":240,\"auth_role_id\":1,\"auth_map_id\":100,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":241,\"auth_role_id\":1,\"auth_map_id\":101,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":242,\"auth_role_id\":1,\"auth_map_id\":102,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":243,\"auth_role_id\":1,\"auth_map_id\":103,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":244,\"auth_role_id\":1,\"auth_map_id\":104,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":245,\"auth_role_id\":1,\"auth_map_id\":105,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":246,\"auth_role_id\":1,\"auth_map_id\":106,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":247,\"auth_role_id\":1,\"auth_map_id\":107,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":248,\"auth_role_id\":1,\"auth_map_id\":108,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":249,\"auth_role_id\":1,\"auth_map_id\":109,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":250,\"auth_role_id\":1,\"auth_map_id\":110,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":251,\"auth_role_id\":1,\"auth_map_id\":111,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":252,\"auth_role_id\":1,\"auth_map_id\":112,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":253,\"auth_role_id\":1,\"auth_map_id\":113,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":254,\"auth_role_id\":1,\"auth_map_id\":114,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":255,\"auth_role_id\":1,\"auth_map_id\":115,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":256,\"auth_role_id\":1,\"auth_map_id\":116,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":257,\"auth_role_id\":1,\"auth_map_id\":117,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":258,\"auth_role_id\":1,\"auth_map_id\":118,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":259,\"auth_role_id\":1,\"auth_map_id\":119,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":260,\"auth_role_id\":1,\"auth_map_id\":120,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":261,\"auth_role_id\":1,\"auth_map_id\":121,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":262,\"auth_role_id\":1,\"auth_map_id\":122,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":263,\"auth_role_id\":1,\"auth_map_id\":123,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":264,\"auth_role_id\":1,\"auth_map_id\":124,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":265,\"auth_role_id\":1,\"auth_map_id\":125,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":266,\"auth_role_id\":1,\"auth_map_id\":126,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":267,\"auth_role_id\":1,\"auth_map_id\":127,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":268,\"auth_role_id\":1,\"auth_map_id\":128,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":269,\"auth_role_id\":1,\"auth_map_id\":129,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":270,\"auth_role_id\":1,\"auth_map_id\":130,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":271,\"auth_role_id\":1,\"auth_map_id\":131,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":272,\"auth_role_id\":1,\"auth_map_id\":132,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":273,\"auth_role_id\":1,\"auth_map_id\":133,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":274,\"auth_role_id\":1,\"auth_map_id\":134,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":275,\"auth_role_id\":1,\"auth_map_id\":135,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":276,\"auth_role_id\":1,\"auth_map_id\":136,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":277,\"auth_role_id\":1,\"auth_map_id\":137,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"}]}]},{\"id\":10,\"type\":2,\"department_id\":1,\"name\":\"\\u738b\\u4e94\",\"sex\":\"\",\"cellphone\":null,\"duty\":\"\\u7ecf\\u7406\",\"user_excerpt\":\"\\u6d4b\\u8bd5\\u9886\\u5bfc\",\"user_login\":\"4\",\"user_password\":\"bd417e904f9c00d3\",\"access_token\":null,\"borned_at\":null,\"created_at\":\"1537169358\",\"updated_at\":\"1539402798\",\"more\":{\"thumbnail\":\"\\/upload\\/20181013\\/u=3176748584,2150927073&fm=26&gp=0.jpg\"},\"paper_id\":4,\"type_format\":\"\\u515a\\u5458\",\"borned_at_format\":\"\",\"thumbnail_format\":\"\\/upload\\/20181013\\/u=3176748584,2150927073&fm=26&gp=0.jpg\",\"role_ids\":[4],\"roles_format\":\"\\u9886\\u5bfc\\u6743\\u9650\",\"roles\":[{\"id\":4,\"name\":\"\\u9886\\u5bfc\\u6743\\u9650\",\"created_at\":\"1538468578\",\"updated_at\":\"1539402600\",\"user_id\":10,\"auth_count\":1,\"auth_map_ids\":[5],\"auth_middle\":[{\"id\":280,\"auth_role_id\":4,\"auth_map_id\":5,\"created_at\":\"1539402600\",\"updated_at\":\"1539402600\",\"created_at_format\":\"2018-10-13 03:50:00\"}]}]},{\"id\":5,\"type\":2,\"department_id\":2,\"name\":\"\\u5f20\\u4e09\",\"sex\":\"\\u7537\",\"cellphone\":\"15598259922\",\"duty\":\"\\u529e\\u516c\\u5ba4\\u4e3b\\u4efb\",\"user_excerpt\":\"\\u6d4b\\u8bd5\\u9886\\u5bfc\",\"user_login\":\"party\",\"user_password\":\"bd417e904f9c00d3\",\"access_token\":\"eyJpdiI6Ilp3bytDS3A0dmFCMjBCOStwY1h6RHc9PSIsInZhbHVlIjoidStjaTN4dFBSRWVYT3lZS1pmVm13eWVSQmZKMW9rSGVsVTVTMWVtRGtpdmJsMW5id1poclwva2tCSVVkcEhmaE1wXC9UcXZlVURkNlZocDZlbzBUU1pKZDhjRTAraCs3elRNdkZKMTRuTFRlUGpzc0dVR2xlaU1qQ2l5bmduWFRyQmxhb1VJVTVcL3NNdVJOYVB2VlwvUHFQVXV6a29mTlo2SHFWcENockVWMDQwXC8yVEFxXC9rcjBJUEhFb0UxTk9aZ2dFaDNSc2M1aDAzSzNzMk03YkRiYWhlRmV5dEpMcUNpNFdmOXdMNlk0VzlWMTc5QlZZV0lCR1RCbGRlRDV2aUF3UGZTQVFRSm5TOWVxUTk4bTJoZ2w3bEN5eElyZUhcL3c1UmtVcVhmVXlxTGNPdlwvcVhQUHlodzl1MnhQYmZcL1g3Qk5cL2RiXC9zbHBaVHg0VnZ4Rk9DNnUwR3hLS3pvVGl5aTc0YkVvSkphNTFUbmk0U1wvcWVaZU4xY0lobXZ5QkJpc3hEa1ozVHlZXC9hclhLejZJRmtOeVRZN090MjYrbGZodk04MHlkVVhiY3RzZGs9IiwibWFjIjoiMjQ5YWZhNzhkMDE3NGY5Yjg4Y2ZjYmVjM2U4ZjUzZGMwZGUzN2M1ODg0NzkyYWVkYWZhZjI2YmNiNWEzYWY5NSJ9\",\"borned_at\":null,\"created_at\":\"0\",\"updated_at\":\"1539402760\",\"more\":{\"thumbnail\":\"\\/upload\\/20181013\\/u=3866671695,547053355&fm=11&gp=0.jpg\"},\"paper_id\":4,\"type_format\":\"\\u515a\\u5458\",\"borned_at_format\":\"\",\"thumbnail_format\":\"\\/upload\\/20181013\\/u=3866671695,547053355&fm=11&gp=0.jpg\",\"role_ids\":[4,1],\"roles_format\":\"\\u9886\\u5bfc\\u6743\\u9650\\uff0c\\u8d85\\u7ea7\\u6743\\u9650\",\"roles\":[{\"id\":4,\"name\":\"\\u9886\\u5bfc\\u6743\\u9650\",\"created_at\":\"1538468578\",\"updated_at\":\"1539402600\",\"user_id\":5,\"auth_count\":1,\"auth_map_ids\":[5],\"auth_middle\":[{\"id\":280,\"auth_role_id\":4,\"auth_map_id\":5,\"created_at\":\"1539402600\",\"updated_at\":\"1539402600\",\"created_at_format\":\"2018-10-13 03:50:00\"}]},{\"id\":1,\"name\":\"\\u8d85\\u7ea7\\u6743\\u9650\",\"created_at\":\"1\",\"updated_at\":\"1538929504\",\"user_id\":5,\"auth_count\":136,\"auth_map_ids\":[1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137],\"auth_middle\":[{\"id\":142,\"auth_role_id\":1,\"auth_map_id\":1,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":143,\"auth_role_id\":1,\"auth_map_id\":2,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":144,\"auth_role_id\":1,\"auth_map_id\":3,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":145,\"auth_role_id\":1,\"auth_map_id\":4,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":146,\"auth_role_id\":1,\"auth_map_id\":5,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":147,\"auth_role_id\":1,\"auth_map_id\":6,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":148,\"auth_role_id\":1,\"auth_map_id\":7,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":149,\"auth_role_id\":1,\"auth_map_id\":8,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":150,\"auth_role_id\":1,\"auth_map_id\":9,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":151,\"auth_role_id\":1,\"auth_map_id\":11,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":152,\"auth_role_id\":1,\"auth_map_id\":12,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":153,\"auth_role_id\":1,\"auth_map_id\":13,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":154,\"auth_role_id\":1,\"auth_map_id\":14,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":155,\"auth_role_id\":1,\"auth_map_id\":15,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":156,\"auth_role_id\":1,\"auth_map_id\":16,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":157,\"auth_role_id\":1,\"auth_map_id\":17,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":158,\"auth_role_id\":1,\"auth_map_id\":18,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":159,\"auth_role_id\":1,\"auth_map_id\":19,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":160,\"auth_role_id\":1,\"auth_map_id\":20,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":161,\"auth_role_id\":1,\"auth_map_id\":21,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":162,\"auth_role_id\":1,\"auth_map_id\":22,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":163,\"auth_role_id\":1,\"auth_map_id\":23,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":164,\"auth_role_id\":1,\"auth_map_id\":24,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":165,\"auth_role_id\":1,\"auth_map_id\":25,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":166,\"auth_role_id\":1,\"auth_map_id\":26,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":167,\"auth_role_id\":1,\"auth_map_id\":27,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":168,\"auth_role_id\":1,\"auth_map_id\":28,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":169,\"auth_role_id\":1,\"auth_map_id\":29,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":170,\"auth_role_id\":1,\"auth_map_id\":30,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":171,\"auth_role_id\":1,\"auth_map_id\":31,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":172,\"auth_role_id\":1,\"auth_map_id\":32,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":173,\"auth_role_id\":1,\"auth_map_id\":33,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":174,\"auth_role_id\":1,\"auth_map_id\":34,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":175,\"auth_role_id\":1,\"auth_map_id\":35,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":176,\"auth_role_id\":1,\"auth_map_id\":36,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":177,\"auth_role_id\":1,\"auth_map_id\":37,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":178,\"auth_role_id\":1,\"auth_map_id\":38,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":179,\"auth_role_id\":1,\"auth_map_id\":39,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":180,\"auth_role_id\":1,\"auth_map_id\":40,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":181,\"auth_role_id\":1,\"auth_map_id\":41,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":182,\"auth_role_id\":1,\"auth_map_id\":42,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":183,\"auth_role_id\":1,\"auth_map_id\":43,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":184,\"auth_role_id\":1,\"auth_map_id\":44,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":185,\"auth_role_id\":1,\"auth_map_id\":45,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":186,\"auth_role_id\":1,\"auth_map_id\":46,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":187,\"auth_role_id\":1,\"auth_map_id\":47,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":188,\"auth_role_id\":1,\"auth_map_id\":48,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":189,\"auth_role_id\":1,\"auth_map_id\":49,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":190,\"auth_role_id\":1,\"auth_map_id\":50,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":191,\"auth_role_id\":1,\"auth_map_id\":51,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":192,\"auth_role_id\":1,\"auth_map_id\":52,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":193,\"auth_role_id\":1,\"auth_map_id\":53,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":194,\"auth_role_id\":1,\"auth_map_id\":54,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":195,\"auth_role_id\":1,\"auth_map_id\":55,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":196,\"auth_role_id\":1,\"auth_map_id\":56,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":197,\"auth_role_id\":1,\"auth_map_id\":57,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":198,\"auth_role_id\":1,\"auth_map_id\":58,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":199,\"auth_role_id\":1,\"auth_map_id\":59,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":200,\"auth_role_id\":1,\"auth_map_id\":60,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":201,\"auth_role_id\":1,\"auth_map_id\":61,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":202,\"auth_role_id\":1,\"auth_map_id\":62,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":203,\"auth_role_id\":1,\"auth_map_id\":63,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":204,\"auth_role_id\":1,\"auth_map_id\":64,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":205,\"auth_role_id\":1,\"auth_map_id\":65,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":206,\"auth_role_id\":1,\"auth_map_id\":66,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":207,\"auth_role_id\":1,\"auth_map_id\":67,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":208,\"auth_role_id\":1,\"auth_map_id\":68,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":209,\"auth_role_id\":1,\"auth_map_id\":69,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":210,\"auth_role_id\":1,\"auth_map_id\":70,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":211,\"auth_role_id\":1,\"auth_map_id\":71,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":212,\"auth_role_id\":1,\"auth_map_id\":72,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":213,\"auth_role_id\":1,\"auth_map_id\":73,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":214,\"auth_role_id\":1,\"auth_map_id\":74,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":215,\"auth_role_id\":1,\"auth_map_id\":75,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":216,\"auth_role_id\":1,\"auth_map_id\":76,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":217,\"auth_role_id\":1,\"auth_map_id\":77,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":218,\"auth_role_id\":1,\"auth_map_id\":78,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":219,\"auth_role_id\":1,\"auth_map_id\":79,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":220,\"auth_role_id\":1,\"auth_map_id\":80,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":221,\"auth_role_id\":1,\"auth_map_id\":81,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":222,\"auth_role_id\":1,\"auth_map_id\":82,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":223,\"auth_role_id\":1,\"auth_map_id\":83,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":224,\"auth_role_id\":1,\"auth_map_id\":84,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":225,\"auth_role_id\":1,\"auth_map_id\":85,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":226,\"auth_role_id\":1,\"auth_map_id\":86,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":227,\"auth_role_id\":1,\"auth_map_id\":87,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":228,\"auth_role_id\":1,\"auth_map_id\":88,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":229,\"auth_role_id\":1,\"auth_map_id\":89,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":230,\"auth_role_id\":1,\"auth_map_id\":90,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":231,\"auth_role_id\":1,\"auth_map_id\":91,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":232,\"auth_role_id\":1,\"auth_map_id\":92,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":233,\"auth_role_id\":1,\"auth_map_id\":93,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":234,\"auth_role_id\":1,\"auth_map_id\":94,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":235,\"auth_role_id\":1,\"auth_map_id\":95,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":236,\"auth_role_id\":1,\"auth_map_id\":96,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":237,\"auth_role_id\":1,\"auth_map_id\":97,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":238,\"auth_role_id\":1,\"auth_map_id\":98,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":239,\"auth_role_id\":1,\"auth_map_id\":99,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":240,\"auth_role_id\":1,\"auth_map_id\":100,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":241,\"auth_role_id\":1,\"auth_map_id\":101,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":242,\"auth_role_id\":1,\"auth_map_id\":102,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":243,\"auth_role_id\":1,\"auth_map_id\":103,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":244,\"auth_role_id\":1,\"auth_map_id\":104,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":245,\"auth_role_id\":1,\"auth_map_id\":105,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":246,\"auth_role_id\":1,\"auth_map_id\":106,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":247,\"auth_role_id\":1,\"auth_map_id\":107,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":248,\"auth_role_id\":1,\"auth_map_id\":108,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":249,\"auth_role_id\":1,\"auth_map_id\":109,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":250,\"auth_role_id\":1,\"auth_map_id\":110,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":251,\"auth_role_id\":1,\"auth_map_id\":111,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":252,\"auth_role_id\":1,\"auth_map_id\":112,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":253,\"auth_role_id\":1,\"auth_map_id\":113,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":254,\"auth_role_id\":1,\"auth_map_id\":114,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":255,\"auth_role_id\":1,\"auth_map_id\":115,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":256,\"auth_role_id\":1,\"auth_map_id\":116,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":257,\"auth_role_id\":1,\"auth_map_id\":117,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":258,\"auth_role_id\":1,\"auth_map_id\":118,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":259,\"auth_role_id\":1,\"auth_map_id\":119,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":260,\"auth_role_id\":1,\"auth_map_id\":120,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":261,\"auth_role_id\":1,\"auth_map_id\":121,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":262,\"auth_role_id\":1,\"auth_map_id\":122,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":263,\"auth_role_id\":1,\"auth_map_id\":123,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":264,\"auth_role_id\":1,\"auth_map_id\":124,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":265,\"auth_role_id\":1,\"auth_map_id\":125,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":266,\"auth_role_id\":1,\"auth_map_id\":126,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":267,\"auth_role_id\":1,\"auth_map_id\":127,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":268,\"auth_role_id\":1,\"auth_map_id\":128,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":269,\"auth_role_id\":1,\"auth_map_id\":129,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":270,\"auth_role_id\":1,\"auth_map_id\":130,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":271,\"auth_role_id\":1,\"auth_map_id\":131,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":272,\"auth_role_id\":1,\"auth_map_id\":132,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":273,\"auth_role_id\":1,\"auth_map_id\":133,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":274,\"auth_role_id\":1,\"auth_map_id\":134,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":275,\"auth_role_id\":1,\"auth_map_id\":135,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":276,\"auth_role_id\":1,\"auth_map_id\":136,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"},{\"id\":277,\"auth_role_id\":1,\"auth_map_id\":137,\"created_at\":\"1539402351\",\"updated_at\":\"1539402351\",\"created_at_format\":\"2018-10-13 03:45:51\"}]}]},{\"id\":9,\"type\":2,\"department_id\":2,\"name\":\"\\u674e\\u56db\",\"sex\":\"\\u5973\",\"cellphone\":\"12312\",\"duty\":\"\\u529e\\u516c\\u5ba4\\u59d4\\u5458\",\"user_excerpt\":\"\\u6d4b\\u8bd5\\u9886\\u5bfc\",\"user_login\":\"lisi\",\"user_password\":\"bd417e904f9c00d3\",\"access_token\":null,\"borned_at\":321,\"created_at\":\"0\",\"updated_at\":\"1539402776\",\"more\":{\"thumbnail\":\"\\/upload\\/20181013\\/u=2200999615,1784198098&fm=26&gp=0.jpg\"},\"paper_id\":4,\"type_format\":\"\\u515a\\u5458\",\"borned_at_format\":\"1970-01-01\",\"thumbnail_format\":\"\\/upload\\/20181013\\/u=2200999615,1784198098&fm=26&gp=0.jpg\",\"role_ids\":[4],\"roles_format\":\"\\u9886\\u5bfc\\u6743\\u9650\",\"roles\":[{\"id\":4,\"name\":\"\\u9886\\u5bfc\\u6743\\u9650\",\"created_at\":\"1538468578\",\"updated_at\":\"1539402600\",\"user_id\":9,\"auth_count\":1,\"auth_map_ids\":[5],\"auth_middle\":[{\"id\":280,\"auth_role_id\":4,\"auth_map_id\":5,\"created_at\":\"1539402600\",\"updated_at\":\"1539402600\",\"created_at_format\":\"2018-10-13 03:50:00\"}]}]}]}','[{\"id\":51,\"paper_id\":4,\"question_id\":91,\"question_score\":1,\"title\":\"\\u515a\\u7684\\uff08 \\uff09\\u662f\\u515a\\u7684\\u6839\\u672c\\u6027\\u5efa\\u8bbe\\uff0c\\u51b3\\u5b9a\\u515a\\u7684\\u5efa\\u8bbe\\u65b9\\u5411\\u548c\\u6548\\u679c\\u3002\",\"options\":{\"A\":\"\\u601d\\u60f3\\u5efa\\u8bbe\",\"B\":\"\\u653f\\u6cbb\\u5efa\\u8bbe\",\"C\":\"\\u7ec4\\u7ec7\\u5efa\\u8bbe\",\"D\":\"\\u5236\\u5ea6\\u5efa\\u8bbe\"},\"answers\":[\"B\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\",\"user_answers\":[\"A\"],\"user_answers_format\":\"A\",\"is_correct\":0},{\"id\":52,\"paper_id\":4,\"question_id\":77,\"question_score\":1,\"title\":\"\\u5efa\\u8bbe\\uff08 \\uff09\\u662f\\u4e2d\\u534e\\u6c11\\u65cf\\u4f1f\\u5927\\u590d\\u5174\\u7684\\u57fa\\u7840\\u5de5\\u7a0b\\u3002\",\"options\":{\"A\":\"\\u7ecf\\u6d4e\\u5f3a\\u56fd\",\"B\":\"\\u653f\\u6cbb\\u5f3a\\u56fd\",\"C\":\"\\u6559\\u80b2\\u5f3a\\u56fd\",\"D\":\"\\u6587\\u5316\\u5f3a\\u56fd\"},\"answers\":[\"C\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\",\"user_answers\":[\"B\"],\"user_answers_format\":\"B\",\"is_correct\":0},{\"id\":53,\"paper_id\":4,\"question_id\":87,\"question_score\":1,\"title\":\"\\u89e3\\u51b3\\u53f0\\u6e7e\\u95ee\\u9898\\u3001\\u5b9e\\u73b0\\u7956\\u56fd\\u5b8c\\u5168\\u7edf\\u4e00\\uff0c\\u662f\\u5168\\u4f53\\u4e2d\\u534e\\u513f\\u5973\\uff08 \\uff09\\uff0c\\u662f\\u4e2d\\u534e\\u6c11\\u65cf\\uff08 \\uff09\\u6240\\u5728\\u3002\",\"options\":{\"A\":\"\\u4e00\\u81f4\\u613f\\u671b \\u6839\\u672c\\u5229\\u76ca\",\"B\":\"\\u5171\\u540c\\u613f\\u671b \\u672c\\u8d28\\u5229\\u76ca\",\"C\":\"\\u4e00\\u81f4\\u613f\\u671b \\u672c\\u8d28\\u5229\\u76ca\",\"D\":\"\\u5171\\u540c\\u613f\\u671b \\u6839\\u672c\\u5229\\u76ca\"},\"answers\":[\"D\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\",\"user_answers\":[\"B\"],\"user_answers_format\":\"B\",\"is_correct\":0},{\"id\":54,\"paper_id\":4,\"question_id\":73,\"question_score\":1,\"title\":\"\\u53d1\\u6325\\u793e\\u4f1a\\u4e3b\\u4e49\\u534f\\u5546\\u6c11\\u4e3b\\u91cd\\u8981\\u4f5c\\u7528\\u3002\\uff08 \\uff09\\u662f\\u5177\\u6709\\u4e2d\\u56fd\\u7279\\u8272\\u7684\\u5236\\u5ea6\\u5b89\\u6392\\uff0c\\u662f\\u793e\\u4f1a\\u4e3b\\u4e49\\u534f\\u5546\\u6c11\\u4e3b\\u7684\\u91cd\\u8981\\u6e20\\u9053\\u548c\\u4e13\\u95e8\\u534f\\u5546\\u673a\\u6784\\u3002\",\"options\":{\"A\":\"\\u653f\\u515a\\u534f\\u5546\",\"B\":\"\\u4eba\\u5927\\u534f\\u5546\",\"C\":\"\\u57fa\\u5c42\\u534f\\u5546\",\"D\":\"\\u4eba\\u6c11\\u653f\\u534f\"},\"answers\":[\"D\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\",\"user_answers\":[\"B\"],\"user_answers_format\":\"B\",\"is_correct\":0},{\"id\":55,\"paper_id\":4,\"question_id\":98,\"question_score\":1,\"title\":\"\\u589e\\u5f3a\\u515a\\u81ea\\u6211\\u51c0\\u5316\\u80fd\\u529b\\uff0c\\u6839\\u672c\\u9760\\u5f3a\\u5316\\uff08 \\uff09\\u548c\\uff08 \\uff09\\u3002\",\"options\":{\"A\":\"\\u515a\\u7684\\u81ea\\u6211\\u76d1\\u7763\\u3001\\u8206\\u8bba\\u76d1\\u7763\",\"B\":\"\\u515a\\u7684\\u81ea\\u6211\\u76d1\\u7763\\u3001\\u7fa4\\u4f17\\u76d1\\u7763\",\"C\":\"\\u515a\\u7684\\u81ea\\u6211\\u76d1\\u7763\\u3001\\u53f8\\u6cd5\\u76d1\\u7763\",\"D\":\"\\u515a\\u7684\\u81ea\\u6211\\u76d1\\u7763\\u3001\\u6c11\\u4e3b\\u76d1\\u7763\"},\"answers\":[\"B\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\",\"user_answers\":[\"B\"],\"user_answers_format\":\"B\",\"is_correct\":1},{\"id\":56,\"paper_id\":4,\"question_id\":97,\"question_score\":1,\"title\":\"\\u8981\\u575a\\u6301\\u65e0\\u7981\\u533a\\u3001\\u5168\\u8986\\u76d6\\u3001\\u96f6\\u5bb9\\u5fcd\\uff0c\\u575a\\u6301\\uff08 \\uff09\\uff0c\\u575a\\u6301\\u53d7\\u8d3f\\u884c\\u8d3f\\u4e00\\u8d77\\u67e5\\uff0c\\u575a\\u51b3\\u9632\\u6b62\\u515a\\u5185\\u5f62\\u6210\\u5229\\u76ca\\u96c6\\u56e2\\u3002\",\"options\":{\"A\":\"\\u91cd\\u9884\\u9632\\u3001\\u5f3a\\u9ad8\\u538b\\u3001\\u957f\\u9707\\u6151\",\"B\":\"\\u91cd\\u904f\\u5236\\u3001\\u5f3a\\u9ad8\\u538b\\u3001\\u957f\\u9707\\u6151\",\"C\":\"\\u91cd\\u904f\\u5236\\u3001\\u4e0d\\u51cf\\u538b\\u3001\\u957f\\u9707\\u6151\",\"D\":\"\\u91cd\\u904f\\u5236\\u3001\\u5f3a\\u9ad8\\u538b\\u3001\\u957f\\u5a01\\u6151\"},\"answers\":[\"B\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\",\"user_answers\":[\"B\"],\"user_answers_format\":\"B\",\"is_correct\":1},{\"id\":57,\"paper_id\":4,\"question_id\":82,\"question_score\":1,\"title\":\"\\u6211\\u4eec\\u8981\\u7262\\u56fa\\u6811\\u7acb\\u793e\\u4f1a\\u4e3b\\u4e49\\u751f\\u6001\\u6587\\u660e\\u89c2\\uff0c\\u63a8\\u52a8\\u5f62\\u6210\\uff08 \\uff09\\u73b0\\u4ee3\\u5316\\u5efa\\u8bbe\\u65b0\\u683c\\u5c40\\uff0c\\u4e3a\\u4fdd\\u62a4\\u751f\\u6001\\u73af\\u5883\\u4f5c\\u51fa\\u6211\\u4eec\\u8fd9\\u4ee3\\u4eba\\u7684\\u52aa\\u529b\\uff01\",\"options\":{\"A\":\"\\u4eba\\u4e0e\\u81ea\\u7136\\u548c\\u8c10\\u5171\\u751f\",\"B\":\"\\u4eba\\u4e0e\\u73af\\u5883\\u548c\\u8c10\\u53d1\\u5c55\",\"C\":\"\\u4eba\\u4e0e\\u81ea\\u7136\\u548c\\u8c10\\u53d1\\u5c55\",\"D\":\"\\u4eba\\u4e0e\\u73af\\u5883\\u548c\\u8c10\\u5171\\u751f\"},\"answers\":[\"C\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\",\"user_answers\":[\"C\"],\"user_answers_format\":\"C\",\"is_correct\":1},{\"id\":58,\"paper_id\":4,\"question_id\":96,\"question_score\":1,\"title\":\"\\u8981\\u4ee5\\u63d0\\u5347\\uff08 \\uff09\\u4e3a\\u91cd\\u70b9\\uff0c\\u7a81\\u51fa\\u653f\\u6cbb\\u529f\\u80fd\\uff0c\\u628a\\u4f01\\u4e1a\\u3001\\u519c\\u6751\\u3001\\u673a\\u5173\\u3001\\u5b66\\u6821\\u3001\\u79d1\\u7814\\u9662\\u6240\\u3001\\u8857\\u9053\\u793e\\u533a\\u3001\\u793e\\u4f1a\\u7ec4\\u7ec7\\u7b49\\u57fa\\u5c42\\u515a\\u7ec4\\u7ec7\\u5efa\\u8bbe\\u6210\\u4e3a\\u5ba3\\u4f20\\u515a\\u7684\\u4e3b\\u5f20\\u3001\\u8d2f\\u5f7b\\u515a\\u7684\\u51b3\\u5b9a\\u3001\\u9886\\u5bfc\\u57fa\\u5c42\\u6cbb\\u7406\\u3001\\u56e2\\u7ed3\\u52a8\\u5458\\u7fa4\\u4f17\\u3001\\u63a8\\u52a8\\u6539\\u9769\\u53d1\\u5c55\\u7684\\u575a\\u5f3a\\u6218\\u6597\\u5821\\u5792\\u3002\",\"options\":{\"A\":\"\\u51dd\\u805a\\u529b\",\"B\":\"\\u9886\\u5bfc\\u529b\",\"C\":\"\\u7ec4\\u7ec7\\u529b\",\"D\":\"\\u6218\\u6597\\u529b\"},\"answers\":[\"C\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\",\"user_answers\":[\"C\"],\"user_answers_format\":\"C\",\"is_correct\":1},{\"id\":59,\"paper_id\":4,\"question_id\":74,\"question_score\":1,\"title\":\"\\u6df1\\u5316\\u4f9d\\u6cd5\\u6cbb\\u56fd\\u5b9e\\u8df5\\u3002\\u6210\\u7acb\\u4e2d\\u592e\\u5168\\u9762\\uff08 \\uff09\\u9886\\u5bfc\\u5c0f\\u7ec4\\uff0c\\u52a0\\u5f3a\\u5bf9\\u6cd5\\u6cbb\\u4e2d\\u56fd\\u5efa\\u8bbe\\u7684\\u7edf\\u4e00\\u9886\\u5bfc\\u3002\",\"options\":{\"A\":\"\\u6df1\\u5316\\u6539\\u9769\",\"B\":\"\\u4f9d\\u6cd5\\u6cbb\\u56fd\",\"C\":\"\\u4ece\\u4e25\\u6cbb\\u515a\",\"D\":\"\\u53f8\\u6cd5\\u6539\\u9769\"},\"answers\":[\"B\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\",\"user_answers\":[\"C\"],\"user_answers_format\":\"C\",\"is_correct\":0},{\"id\":60,\"paper_id\":4,\"question_id\":92,\"question_score\":1,\"title\":\"\\u8981\\u5c0a\\u5d07\\u515a\\u7ae0\\uff0c\\u4e25\\u683c\\u6267\\u884c\\u65b0\\u5f62\\u52bf\\u4e0b\\u515a\\u5185\\u653f\\u6cbb\\u751f\\u6d3b\\u82e5\\u5e72\\u51c6\\u5219\\uff0c\\u589e\\u5f3a\\u515a\\u5185\\u653f\\u6cbb\\u751f\\u6d3b\\u7684\\uff08 \\uff09\\u3002\",\"options\":{\"A\":\"\\u653f\\u6cbb\\u6027\\u3001\\u65f6\\u4ee3\\u6027\\u3001\\u539f\\u5219\\u6027\\u3001\\u6218\\u6597\\u6027\",\"B\":\"\\u60f3\\u6027\\u3001\\u653f\\u6cbb\\u6027\\u3001\\u65f6\\u4ee3\\u6027\\u3001\\u539f\\u5219\\u6027\",\"C\":\"\\u653f\\u6cbb\\u6027\\u3001\\u601d\\u60f3\\u6027\\u3001\\u65f6\\u4ee3\\u6027\\u3001\\u539f\\u5219\\u6027\",\"D\":\"\\u653f\\u6cbb\\u6027\\u3001\\u601d\\u60f3\\u6027\\u3001\\u65f6\\u4ee3\\u6027\\u3001\\u6218\\u6597\\u6027\"},\"answers\":[\"A\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\",\"user_answers\":[\"B\"],\"user_answers_format\":\"B\",\"is_correct\":0},{\"id\":61,\"paper_id\":4,\"question_id\":79,\"question_score\":1,\"title\":\"\\u6211\\u4eec\\u8981\\u575a\\u6301\\u4eba\\u4e0e\\u81ea\\u7136\\uff08 \\uff09\\u3002\",\"options\":{\"A\":\"\\u548c\\u8c10\\u76f8\\u5904\",\"B\":\"\\u548c\\u7766\\u76f8\\u5904\",\"C\":\"\\u548c\\u8c10\\u5171\\u751f\",\"D\":\"\\u548c\\u7766\\u5171\\u751f\"},\"answers\":[\"C\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\",\"user_answers\":[\"C\"],\"user_answers_format\":\"C\",\"is_correct\":1},{\"id\":62,\"paper_id\":4,\"question_id\":84,\"question_score\":1,\"title\":\"\\u529b\\u4e89\\u5230\\u4e8c\\u3007\\u4e09\\u4e94\\u5e74\\uff08 \\uff09\\u56fd\\u9632\\u548c\\u519b\\u961f\\u73b0\\u4ee3\\u5316\\uff0c\\u5230\\u672c\\u4e16\\u7eaa\\u4e2d\\u53f6\\u628a\\u4eba\\u6c11\\u519b\\u961f\\uff08 \\uff09\\u4e16\\u754c\\u4e00\\u6d41\\u519b\\u961f\\u3002\",\"options\":{\"A\":\"\\u5168\\u9762\\u5b9e\\u73b0 \\u57fa\\u672c\\u5efa\\u6210\",\"B\":\"\\u5168\\u9762\\u5b9e\\u73b0 \\u5168\\u9762\\u5efa\\u6210\",\"C\":\"\\u57fa\\u672c\\u5b9e\\u73b0 \\u57fa\\u672c\\u5efa\\u6210\",\"D\":\"\\u57fa\\u672c\\u5b9e\\u73b0 \\u5168\\u9762\\u5efa\\u6210\"},\"answers\":[\"D\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\",\"user_answers\":[\"C\"],\"user_answers_format\":\"C\",\"is_correct\":0},{\"id\":63,\"paper_id\":4,\"question_id\":85,\"question_score\":1,\"title\":\"\\u6811\\u7acb\\uff08 \\uff09\\u662f\\u6838\\u5fc3\\u6218\\u6597\\u529b\\u7684\\u601d\\u60f3\\uff0c\\u63a8\\u8fdb\\u91cd\\u5927\\u6280\\u672f\\u521b\\u65b0\\u3001\\u81ea\\u4e3b\\u521b\\u65b0\\uff0c\\u52a0\\u5f3a\\u519b\\u4e8b\\u4eba\\u624d\\u57f9\\u517b\\u4f53\\u7cfb\\u5efa\\u8bbe\\uff0c\\u5efa\\u8bbe\\u521b\\u65b0\\u578b\\u4eba\\u6c11\\u519b\\u961f\\u3002\",\"options\":{\"A\":\"\\u79d1\\u6280\",\"B\":\"\\u79d1\\u6280\",\"C\":\"\\u4eba\\u624d\",\"D\":\"\\u6280\\u672f\"},\"answers\":[\"B\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\",\"user_answers\":[\"C\"],\"user_answers_format\":\"C\",\"is_correct\":0},{\"id\":64,\"paper_id\":4,\"question_id\":95,\"question_score\":1,\"title\":\"\\u8981\\u575a\\u6301\\u515a\\u7ba1\\u5e72\\u90e8\\u539f\\u5219\\uff0c\\uff08 \\uff09\\uff0c\\u628a\\u597d\\u5e72\\u90e8\\u6807\\u51c6\\u843d\\u5230\\u5b9e\\u5904\\u3002\",\"options\":{\"A\":\"\\u575a\\u6301\\u7acb\\u573a\\u575a\\u5b9a\\u3001\\u7d20\\u8d28\\u8fc7\\u786c\\uff0c\\u575a\\u6301\\u4e94\\u6e56\\u56db\\u6d77\\u3001\\u4efb\\u4eba\\u552f\\u8d24\\uff0c\\u575a\\u6301\\u4e8b\\u4e1a\\u4e3a\\u4e0a\\u3001\\u516c\\u9053\\u6b63\\u6d3e\",\"B\":\"\\u575a\\u6301\\u5fb7\\u624d\\u517c\\u5907\\u3001\\u4ee5\\u5fb7\\u4e3a\\u5148\\uff0c\\u575a\\u6301\\u7acb\\u573a\\u575a\\u5b9a\\u3001\\u7d20\\u8d28\\u8fc7\\u786c\\uff0c\\u575a\\u6301\\u4e8b\\u4e1a\\u4e3a\\u4e0a\\u3001\\u516c\\u9053\\u6b63\\u6d3e\",\"C\":\"\\u575a\\u6301\\u5fb7\\u624d\\u517c\\u5907\\u3001\\u4ee5\\u5fb7\\u4e3a\\u5148\\uff0c\\u575a\\u6301\\u4e94\\u6e56\\u56db\\u6d77\\u3001\\u4efb\\u4eba\\u552f\\u8d24\\uff0c\\u575a\\u6301\\u7acb\\u573a\\u575a\\u5b9a\\u3001\\u7d20\\u8d28\\u8fc7\\u786c\",\"D\":\"\\u575a\\u6301\\u5fb7\\u624d\\u517c\\u5907\\u3001\\u4ee5\\u5fb7\\u4e3a\\u5148\\uff0c\\u575a\\u6301\\u4e94\\u6e56\\u56db\\u6d77\\u3001\\u4efb\\u4eba\\u552f\\u8d24\\uff0c\\u575a\\u6301\\u4e8b\\u4e1a\\u4e3a\\u4e0a\\u3001\\u516c\\u9053\\u6b63\\u6d3e\"},\"answers\":[\"D\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\",\"user_answers\":[\"A\"],\"user_answers_format\":\"A\",\"is_correct\":0},{\"id\":65,\"paper_id\":4,\"question_id\":78,\"question_score\":1,\"title\":\"\\u56fd\\u5bb6\\u5b89\\u5168\\u662f\\u5b89\\u90a6\\u5b9a\\u56fd\\u7684\\u91cd\\u8981\\u57fa\\u77f3\\uff0c\\uff08 \\uff09\\u662f\\u5168\\u56fd\\u5404\\u65cf\\u4eba\\u6c11\\u6839\\u672c\\u5229\\u76ca\\u6240\\u5728\\u3002\",\"options\":{\"A\":\"\\u52a0\\u5feb\\u7ecf\\u6d4e\\u53d1\\u5c55\",\"B\":\"\\u7ef4\\u62a4\\u56fd\\u5bb6\\u7edf\\u4e00\",\"C\":\"\\u4fc3\\u8fdb\\u56fd\\u9645\\u5408\\u4f5c\",\"D\":\"\\u7ef4\\u62a4\\u56fd\\u5bb6\\u5b89\\u5168\"},\"answers\":[\"D\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\",\"user_answers\":[\"B\"],\"user_answers_format\":\"B\",\"is_correct\":0},{\"id\":66,\"paper_id\":4,\"question_id\":71,\"question_score\":1,\"title\":\"\\u575a\\u6301\\u515a\\u7684\\u9886\\u5bfc\\u3001\\u4eba\\u6c11\\u5f53\\u5bb6\\u4f5c\\u4e3b\\u3001\\u4f9d\\u6cd5\\u6cbb\\u56fd\\u6709\\u673a\\u7edf\\u4e00\\u3002\\uff08 \\uff09\\u662f\\u793e\\u4f1a\\u4e3b\\u4e49\\u6c11\\u4e3b\\u653f\\u6cbb\\u7684\\u672c\\u8d28\\u7279\\u5f81\\u3002\",\"options\":{\"A\":\"\\u515a\\u7684\\u9886\\u5bfc\",\"B\":\"\\u4eba\\u6c11\\u5f53\\u5bb6\\u4f5c\\u4e3b\",\"C\":\"\\u4f9d\\u6cd5\\u6cbb\\u56fd\",\"D\":\"\\u653f\\u6cbb\\u4f53\\u5236\\u6539\\u9769\"},\"answers\":[\"B\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\",\"user_answers\":[\"C\"],\"user_answers_format\":\"C\",\"is_correct\":0},{\"id\":67,\"paper_id\":4,\"question_id\":86,\"question_score\":1,\"title\":\"\\u519b\\u961f\\u662f\\u8981\\u51c6\\u5907\\u6253\\u4ed7\\u7684\\uff0c\\u4e00\\u5207\\u5de5\\u4f5c\\u90fd\\u5fc5\\u987b\\u575a\\u6301\\uff08 \\uff09\\u6807\\u51c6\\uff0c\\u5411\\u80fd\\u6253\\u4ed7\\u3001\\u6253\\u80dc\\u4ed7\\u805a\\u7126\\u3002\",\"options\":{\"A\":\"\\u6218\\u6597\\u529b\",\"B\":\"\\u6597\\u4e89\\u529b\",\"C\":\"\\u6218\\u4e89\\u529b\",\"D\":\"\\u786c\\u5b9e\\u529b\"},\"answers\":[\"A\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\",\"user_answers\":[\"C\"],\"user_answers_format\":\"C\",\"is_correct\":0},{\"id\":68,\"paper_id\":4,\"question_id\":75,\"question_score\":1,\"title\":\"\\u6df1\\u5316\\u673a\\u6784\\u548c\\u884c\\u653f\\u4f53\\u5236\\u6539\\u9769\\u3002\\u8f6c\\u53d8\\u653f\\u5e9c\\u804c\\u80fd\\uff0c\\u6df1\\u5316\\u7b80\\u653f\\u653e\\u6743\\uff0c\\u521b\\u65b0\\u76d1\\u7ba1\\u65b9\\u5f0f\\uff0c\\u589e\\u5f3a\\u653f\\u5e9c\\u516c\\u4fe1\\u529b\\u548c\\u6267\\u884c\\u529b\\uff0c\\u5efa\\u8bbe\\u4eba\\u6c11\\u6ee1\\u610f\\u7684\\uff08 \\uff09\\u653f\\u5e9c\\u3002\",\"options\":{\"A\":\"\\u6cd5\\u6cbb\",\"B\":\"\\u521b\\u65b0\\u578b\",\"C\":\"\\u5ec9\\u6d01\",\"D\":\"\\u670d\\u52a1\\u578b\"},\"answers\":[\"D\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\",\"user_answers\":[\"C\"],\"user_answers_format\":\"C\",\"is_correct\":0},{\"id\":69,\"paper_id\":4,\"question_id\":99,\"question_score\":1,\"title\":\"\\u63a8\\u8fdb\\uff08 \\uff09\\uff0c\\u5efa\\u8bbe\\u8986\\u76d6\\u7eaa\\u68c0\\u76d1\\u5bdf\\u7cfb\\u7edf\\u7684\\u68c0\\u4e3e\\u4e3e\\u62a5\\u5e73\\u53f0\\u3002\\u5f3a\\u5316\\u4e0d\\u6562\\u8150\\u7684\\u9707\\u6151\\uff0c\\u624e\\u7262\\u4e0d\\u80fd\\u8150\\u7684\\u7b3c\\u5b50\\uff0c\\u589e\\u5f3a\\u4e0d\\u60f3\\u8150\\u7684\\u81ea\\u89c9\\uff0c\\u901a\\u8fc7\\u4e0d\\u61c8\\u52aa\\u529b\\u6362\\u6765\\u6d77\\u664f\\u6cb3\\u6e05\\u3001\\u6717\\u6717\\u4e7e\\u5764\\u3002\",\"options\":{\"A\":\"\\u5171\\u5efa\\u5171\\u878d\\u5171\\u4eab\",\"B\":\"\\u4e92\\u901a\\u4e92\\u60e0\\u4e92\\u5229\",\"C\":\"\\u5171\\u5546\\u5171\\u5efa\\u5171\\u4eab\",\"D\":\"\\u548c\\u5e73\\u5408\\u4f5c\\u5171\\u8d62\"},\"answers\":[\"C\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\",\"user_answers\":[\"B\"],\"user_answers_format\":\"B\",\"is_correct\":0},{\"id\":70,\"paper_id\":4,\"question_id\":94,\"question_score\":1,\"title\":\"\\uff08 \\uff09\\u548c\\uff08 \\uff09\\uff0c\\u662f\\u4e2d\\u56fd\\u5171\\u4ea7\\u515a\\u4eba\\u7684\\u7cbe\\u795e\\u652f\\u67f1\\u548c\\u653f\\u6cbb\\u7075\\u9b42\\uff0c\\u4e5f\\u662f\\u4fdd\\u6301\\u515a\\u7684\\u56e2\\u7ed3\\u7edf\\u4e00\\u7684\\u601d\\u60f3\\u57fa\\u7840\\u3002\",\"options\":{\"A\":\"\\u5171\\u4ea7\\u4e3b\\u4e49\\u8fdc\\u5927\\u7406\\u60f3 \\u65b0\\u65f6\\u4ee3\\u4e2d\\u56fd\\u7279\\u8272\\u793e\\u4f1a\\u4e3b\\u4e49\\u5171\\u540c\\u7406\\u60f3\",\"B\":\"\\u5171\\u4ea7\\u4e3b\\u4e49\\u8fdc\\u5927\\u7406\\u60f3 \\u4e2d\\u56fd\\u7279\\u8272\\u793e\\u4f1a\\u4e3b\\u4e49\\u5171\\u540c\\u7406\\u60f3\",\"C\":\"\\u5171\\u4ea7\\u4e3b\\u4e49\\u5d07\\u9ad8\\u7406\\u60f3 \\u65b0\\u65f6\\u4ee3\\u4e2d\\u56fd\\u7279\\u8272\\u793e\\u4f1a\\u4e3b\\u4e49\\u5171\\u540c\\u7406\\u60f3\",\"D\":\"\\u5171\\u4ea7\\u4e3b\\u4e49\\u5d07\\u9ad8\\u7406\\u60f3 \\u4e2d\\u56fd\\u7279\\u8272\\u793e\\u4f1a\\u4e3b\\u4e49\\u5171\\u540c\\u7406\\u60f3\"},\"answers\":[\"B\"],\"created_at\":\"1539411157\",\"updated_at\":\"1539411157\",\"created_at_format\":\"2018-10-13 06:12:37\",\"user_answers\":[\"A\"],\"user_answers_format\":\"A\",\"is_correct\":0}]',5,0,1539411211,1539411270);

/*!40000 ALTER TABLE `par_exam_user_result` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_meeting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_meeting`;

CREATE TABLE `par_meeting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` int(11) unsigned NOT NULL,
  `initiate_user_id` int(11) unsigned NOT NULL COMMENT '发起人，预约人',
  `need_audit` tinyint(1) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `type` int(11) unsigned NOT NULL COMMENT '会议类型:1:线下;2:线上',
  `location` varchar(255) NOT NULL DEFAULT '' COMMENT '会议地点',
  `opened_at` int(11) unsigned NOT NULL,
  `ended_at` int(11) unsigned DEFAULT NULL,
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_meeting` WRITE;
/*!40000 ALTER TABLE `par_meeting` DISABLE KEYS */;

INSERT INTO `par_meeting` (`id`, `department_id`, `initiate_user_id`, `need_audit`, `title`, `type`, `location`, `opened_at`, `ended_at`, `created_at`, `updated_at`)
VALUES
	(3,1,2,1,'测试title123',2,'测试location2',1535096224,1535096324,1535096124,1535096124),
	(4,1,2,1,'测试title1',1,'测试location2',1535096355,1535096455,1535096255,1535096255),
	(5,1,2,1,'11测试的会议',2,'测试地点1',1539172448,NULL,1539086052,1539094836),
	(6,1,2,1,'现场演示的会议',2,'1807室会议室',1539225913,NULL,1539139548,1539139548),
	(7,1,2,1,'现场测试软件的会议',1,'1708号',1539418594,NULL,1539411405,1539411405);

/*!40000 ALTER TABLE `par_meeting` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_meeting_audit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_meeting_audit`;

CREATE TABLE `par_meeting_audit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) unsigned NOT NULL,
  `audit_user_id` int(11) unsigned NOT NULL,
  `status` smallint(2) NOT NULL COMMENT '审核状态',
  `reason` varchar(255) DEFAULT '',
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_meeting_audit` WRITE;
/*!40000 ALTER TABLE `par_meeting_audit` DISABLE KEYS */;

INSERT INTO `par_meeting_audit` (`id`, `meeting_id`, `audit_user_id`, `status`, `reason`, `created_at`, `updated_at`)
VALUES
	(1,3,9,-2,'',1535096124,1535096124),
	(2,4,5,0,'测试reason',1535096255,1535096954),
	(3,5,2,3,NULL,1539086052,1539094897),
	(4,6,2,3,NULL,1539139548,1539139664),
	(5,7,2,3,NULL,1539411405,1539411476);

/*!40000 ALTER TABLE `par_meeting_audit` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_meeting_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_meeting_user`;

CREATE TABLE `par_meeting_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `type` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '参会人员类型:1:会议领导;2:普通参会人员',
  `is_signed_in` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已签到',
  `need_appointment` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要预约',
  `appointmented_at` int(11) DEFAULT NULL,
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_meeting_user` WRITE;
/*!40000 ALTER TABLE `par_meeting_user` DISABLE KEYS */;

INSERT INTO `par_meeting_user` (`id`, `meeting_id`, `user_id`, `type`, `is_signed_in`, `need_appointment`, `appointmented_at`, `created_at`, `updated_at`)
VALUES
	(1,3,9,1,0,0,3,1,2),
	(2,3,5,2,0,0,NULL,0,0),
	(5,5,2,1,0,0,NULL,1539094837,1539094837),
	(6,5,2,2,0,0,NULL,1539094837,1539094837),
	(7,6,2,1,0,0,NULL,1539139549,1539139549),
	(8,6,10,1,0,0,NULL,1539139549,1539139549),
	(9,6,11,1,0,0,NULL,1539139549,1539139549),
	(10,6,12,1,0,0,NULL,1539139549,1539139549),
	(11,6,2,2,0,0,NULL,1539139549,1539139549),
	(12,6,10,2,0,0,NULL,1539139549,1539139549),
	(13,6,11,2,0,0,NULL,1539139549,1539139549),
	(14,6,12,2,0,0,NULL,1539139549,1539139549),
	(15,6,5,2,0,0,NULL,1539139549,1539139549),
	(16,6,9,2,0,0,NULL,1539139549,1539139549),
	(17,6,13,2,0,0,NULL,1539139549,1539139549),
	(18,6,14,2,0,0,NULL,1539139549,1539139549),
	(19,7,2,1,0,1,NULL,1539411405,1539411405),
	(20,7,5,1,0,1,NULL,1539411405,1539411405),
	(21,7,10,2,0,1,NULL,1539411405,1539411405),
	(22,7,9,2,0,1,NULL,1539411405,1539411405);

/*!40000 ALTER TABLE `par_meeting_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_menu`;

CREATE TABLE `par_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table par_portal_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_portal_category`;

CREATE TABLE `par_portal_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned NOT NULL,
  `sort_order` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `list_template` varchar(50) NOT NULL DEFAULT '',
  `article_template` varchar(50) NOT NULL DEFAULT '',
  `path` varchar(255) DEFAULT NULL,
  `more` text NOT NULL,
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_portal_category` WRITE;
/*!40000 ALTER TABLE `par_portal_category` DISABLE KEYS */;

INSERT INTO `par_portal_category` (`id`, `parent_id`, `sort_order`, `name`, `description`, `list_template`, `article_template`, `path`, `more`, `created_at`, `updated_at`)
VALUES
	(1,0,10000,'新闻版块','','list','article','0-','{\"thumbnail\":\"\"}',1536289512,1536289512),
	(2,1,10000,'市委新闻','','list_news','','0-1-','{\"thumbnail\":\"\"}',1536289545,1537244681),
	(3,1,10000,'区委新闻','','list_news','','0-1-','{\"thumbnail\":\"\"}',1536289555,1537244687),
	(4,1,10000,'本组织新闻','','list_news','','0-1-','{\"thumbnail\":\"\"}',1536289563,1537244696),
	(5,0,10000,'党建展览','','','','0-','{\"thumbnail\":\"\"}',1536584583,1536584583),
	(6,5,10000,'党历回顾','','','','0-5-','{\"thumbnail\":\"\"}',1536584600,1536584600),
	(7,5,10000,'红色展览','','','','0-5-','{\"thumbnail\":\"\"}',1536584609,1536584609),
	(8,5,10000,'先锋时代','','','','0-5-','{\"thumbnail\":\"\"}',1536584616,1536584616),
	(9,5,10000,'党的先锋','','','','0-5-','{\"thumbnail\":\"\"}',1536584623,1536584623),
	(10,0,10000,'在线学习','','list_online_learning','','0-','{\"thumbnail\":\"\"}',1537234265,1537234469),
	(11,10,10000,'三会一课','','list_online_learning','','0-10-','{\"thumbnail\":\"\"}',1537234289,1537235598),
	(12,10,10000,'两学一做','','list_online_learning','','0-10-','{\"thumbnail\":\"\"}',1537234296,1537235604),
	(13,10,10000,'习总书记总要讲话','','list_online_learning','','0-10-','{\"thumbnail\":\"\"}',1537234306,1537235608),
	(14,10,10000,'党章党规','','list_online_learning','','0-10-','{\"thumbnail\":\"\"}',1537234316,1537235612),
	(15,1,10000,'热门新闻','','list_news','','0-1-','{\"thumbnail\":\"\"}',1537253726,1537253726),
	(16,0,10000,'群众首页','','list','article','0-','{\"thumbnail\":\"\"}',1538140374,1538140374),
	(17,16,10000,'头条','','','','0-16-','{\"thumbnail\":\"\"}',1538140385,1538140385),
	(18,16,10000,'时政要闻','','','','0-16-','{\"thumbnail\":\"\"}',1538140403,1538140403),
	(19,16,10000,'三会一课','','','','0-16-','{\"thumbnail\":\"\"}',1538140412,1538140412),
	(20,16,10000,'两学一做','','','','0-16-','{\"thumbnail\":\"\"}',1538140429,1538140429),
	(21,16,10000,'党众活动','','list','','0-16-','{\"thumbnail\":\"\"}',1538140455,1538140463),
	(22,16,10000,'扶贫摘要','','list','article','0-16-','{\"thumbnail\":\"\"}',1538140481,1538140481),
	(23,16,10000,'党建展览','','list','article','0-16-','{\"thumbnail\":\"\"}',1538140511,1538140511),
	(24,16,10000,'红色展览','','list','article','0-16-','{\"thumbnail\":\"\"}',1538140534,1538140534),
	(25,16,10000,'党的先锋','','list','article','0-16-','{\"thumbnail\":\"\"}',1538140570,1538140570),
	(26,25,10000,'党的领导先锋','','list','article','0-16-25-','{\"thumbnail\":\"\"}',1538140590,1538140590),
	(27,25,10000,'党的企业先锋','','list','article','0-16-25-','{\"thumbnail\":\"\"}',1538140612,1538140612),
	(28,25,10000,'党的基层先锋','','list','article','0-16-25-','{\"thumbnail\":\"\"}',1538140629,1538140629),
	(29,25,10000,'新党员先锋','','','','0-16-25-','{\"thumbnail\":\"\"}',1538140647,1538140647),
	(30,6,10000,'1921','','list','','0-5-6-','{\"thumbnail\":\"\"}',1538395760,1538395767),
	(31,6,10000,'1949','','list','article','0-5-6-','{\"thumbnail\":\"\"}',1538395779,1538395779),
	(32,6,10000,'1999','','','','0-5-6-','{\"thumbnail\":\"\"}',1538395794,1538395794),
	(33,6,10000,'2018','','','','0-5-6-','{\"thumbnail\":\"\"}',1539407835,1539407835);

/*!40000 ALTER TABLE `par_portal_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_portal_category_post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_portal_category_post`;

CREATE TABLE `par_portal_category_post` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned NOT NULL COMMENT '分类id',
  `post_id` int(11) unsigned NOT NULL COMMENT '文章id',
  `list_order` int(11) unsigned NOT NULL DEFAULT '10000' COMMENT '排序',
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_portal_category_post` WRITE;
/*!40000 ALTER TABLE `par_portal_category_post` DISABLE KEYS */;

INSERT INTO `par_portal_category_post` (`id`, `category_id`, `post_id`, `list_order`, `created_at`, `updated_at`)
VALUES
	(15,2,1,10000,1539099015,1539099015),
	(16,2,2,10000,1539099521,1539099521),
	(17,2,3,10000,1539100286,1539100286),
	(18,2,4,10000,1539100613,1539100613),
	(19,2,5,10000,1539100682,1539100682),
	(20,2,6,10000,1539100754,1539100754),
	(21,2,7,10000,1539100822,1539100822),
	(22,2,8,10000,1539100902,1539100902),
	(23,2,9,10000,1539100953,1539100953),
	(24,2,10,10000,1539101061,1539101061),
	(25,2,11,10000,1539101064,1539101064),
	(26,2,12,10000,1539101070,1539101070),
	(27,2,13,10000,1539101379,1539101379),
	(28,2,14,10000,1539101380,1539101380),
	(29,3,15,10000,1539102451,1539102451),
	(30,3,16,10000,1539102840,1539102840),
	(31,3,17,10000,1539102896,1539102896),
	(32,30,18,10000,1539104219,1539104219),
	(33,11,19,10000,1539138020,1539138020),
	(34,30,20,10000,1539407430,1539407430),
	(35,30,21,10000,1539407449,1539407449),
	(36,30,22,10000,1539407466,1539407466),
	(37,31,23,10000,1539407484,1539407484),
	(38,31,24,10000,1539407488,1539407488),
	(39,31,25,10000,1539407494,1539407494),
	(40,32,26,10000,1539407575,1539407575),
	(41,32,27,10000,1539407579,1539407579),
	(42,32,28,10000,1539407583,1539407583),
	(43,33,29,10000,1539407978,1539407978),
	(44,33,30,10000,1539407988,1539407988),
	(45,33,31,10000,1539407993,1539407993),
	(46,33,32,10000,1539407997,1539407997);

/*!40000 ALTER TABLE `par_portal_category_post` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_portal_post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_portal_post`;

CREATE TABLE `par_portal_post` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL COMMENT '发表者用户id',
  `need_audit` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要审核;1:true;0:false;',
  `post_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `post_hits` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `post_comments` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `post_like` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `post_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_excerpt` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'post摘要',
  `post_source` text COMMENT '转载文章的来源',
  `post_content` longtext COMMENT '文章内容',
  `template` varchar(255) NOT NULL DEFAULT '',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0',
  `published_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `more` text COMMENT '扩展属性,如缩略图;格式为json',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_portal_post` WRITE;
/*!40000 ALTER TABLE `par_portal_post` DISABLE KEYS */;

INSERT INTO `par_portal_post` (`id`, `user_id`, `need_audit`, `post_status`, `comment_status`, `is_top`, `post_hits`, `post_comments`, `post_like`, `post_title`, `post_excerpt`, `post_source`, `post_content`, `template`, `created_at`, `updated_at`, `published_at`, `more`)
VALUES
	(1,2,0,1,0,0,4,0,0,'烈士纪念日向人民英雄敬献花篮仪式在京隆重举行',X'E4B9A0E8BF91E5B9B3E69D8EE5858BE5BCBAE6A097E68898E4B9A6E6B1AAE6B48BE78E8BE6B2AAE5AE81E8B5B5E4B990E99985E99FA9E6ADA3E78E8BE5B290E5B1B1E587BAE5B8AD','人民网－人民日报','<table width=\"400\"><tbody><tr><td><p>上的缎带。<br>　　新华社记者 谢环驰摄1</p></td></tr></tbody></table><table width=\"400\"><tbody><tr><td align=\"center\"><img src=\"http://paper.people.com.cn/rmrb/res/1/20181001/1538337460583_1.jpg\"></td></tr><tr><td><p>　　9月30日上午，党和国家领导人习近平、李克强、栗战书、汪洋、王沪宁、赵乐际、韩正、王岐山等来到北京天安门广场，出席烈士纪念日向人民英雄敬献花篮仪式。<br>　　新华社记者 黄敬文摄</p></td></tr></tbody></table><p>　　人民网北京9月30日电&nbsp;&nbsp;（记者张洋）天地英雄气，浩然壮国魂。烈士纪念日向人民英雄敬献花篮仪式30日上午在北京天安门广场隆重举行。党和国家领导人习近平、李克强、栗战书、汪洋、王沪宁、赵乐际、韩正、王岐山等，同各界代表一起出席仪式。</p><p>　　庄严的天安门广场上，鲜艳的五星红旗迎风招展。广场中央，“祝福祖国”巨型花篮表达着对国家繁荣富强的美好祝福。人民英雄纪念碑巍然耸立，北侧花坛上，红白两色花朵组成的花环，寄托着人们对人民英雄的深情追思。</p><p>　　临近10时，习近平、李克强、栗战书、汪洋、王沪宁、赵乐际、韩正、王岐山等党和国家领导人来到天安门广场，出席向人民英雄敬献花篮仪式。</p><p>　　中国人民解放军军乐团小号手吹响《烈士纪念日号角》，深沉悠远的旋律将人们的记忆带回风起云涌的历史岁月。</p><p>　　“礼兵就位！”随着号令，三军仪仗兵迈着铿锵有力的步伐，正步行进到纪念碑前持枪伫立。</p><p>　　10时整，向人民英雄敬献花篮仪式正式开始。军乐团奏响《义勇军进行曲》，全场高唱中华人民共和国国歌。</p><p>　　国歌唱毕，全场肃立，向为中国人民解放事业和共和国建设事业英勇献身的烈士默哀。</p><p>　　默哀毕，手持鲜花的少年儿童面向人民英雄纪念碑高唱《我们是共产主义接班人》，并致少年先锋队队礼。</p><p>　　群众方阵前，以中共中央，全国人大常委会，国务院，全国政协，中央军委，各民主党派、全国工商联和无党派爱国人士，各人民团体和各界群众，老战士、老同志和烈士亲属，中国少年先锋队名义敬献的9个大型花篮一字排开。花篮红色缎带上“人民英雄永垂不朽”的金色大字熠熠生辉。</p><p>　　军乐团奏响深情的献花曲，18名礼兵稳稳抬起花篮，缓步走向人民英雄纪念碑，摆放在纪念碑基座上。</p><p>　　习近平等党和国家领导人随后登上纪念碑基座，在花篮前驻足凝视。鲜艳挺拔的红掌、芬芳吐蕊的百合、轻盈绽放的文心兰，寄托着对人民英雄的深切缅怀和崇高敬意。</p><p>　　习近平迈步上前，仔细整理花篮缎带。接着，习近平等党和国家领导人缓步绕行，瞻仰人民英雄纪念碑。</p><p>　　党的十九大站在新的历史起点上，顺应浩浩荡荡的时代潮流，擘画了决胜全面建成小康社会、夺取新时代中国特色社会主义伟大胜利的宏伟蓝图，在以习近平同志为核心的党中央坚强领导下，中华民族正以崭新的姿态向着伟大复兴的光明前景昂首前行。</p><p>　　少年儿童和各界群众代表也依次走到纪念碑前，献上手中鲜花并瞻仰纪念碑。</p><p>　　敬献花篮仪式由中共中央政治局委员、北京市委书记蔡奇主持。</p><p>　　在京中共中央政治局委员、中央书记处书记，部分全国人大常委会副委员长，国务委员，最高人民法院院长，最高人民检察院检察长，部分全国政协副主席和中央军委委员出席仪式。</p><p>　　中央党政军群有关部门和北京市主要负责同志，各民主党派中央、全国工商联负责人和无党派人士代表，在京老战士、老同志和烈士亲属代表，全国少数民族参观团成员，中央党校第16期县委书记研修班学员，首都各界群众代表等参加了敬献花篮仪式。</p><p><br></p><p><span id=\"paper_num\">　　《 人民日报 》（ 2018年10月01日 01 版）</span></p>','article',1539099015,1539099930,1539012609,'{\"thumbnail\":\"\\/upload\\/20181009\\/MAIN201810010944344180774496118.jpg\",\"photos\":null,\"videos\":null,\"files\":null}'),
	(2,2,0,1,0,0,1,0,0,'习近平：学习英雄事迹 弘扬英雄精神 将非凡英雄精神体现在平凡工作岗位上',X'E59CA8E4BC9AE8A781E59B9BE5B79DE888AAE7A9BAE2809CE4B8ADE59BBDE6B091E888AAE88BB1E99B84E69CBAE7BB84E2809DE585A8E4BD93E68890E59198E697B6E5BCBAE8B083','人民网－人民日报','<table width=\"400\" style=\"text-align: center; \"><tbody><tr><td><p>上的缎带。<br>　　新华社记者 谢环驰摄</p></td></tr></tbody></table><table width=\"400\" style=\"text-align: center; \"><tbody><tr><td align=\"center\"><img src=\"http://paper.people.com.cn/rmrb/res/1/20181001/1538337460583_1.jpg\"></td></tr><tr><td><p>　　9月30日上午，党和国家领导人习近平、李克强、栗战书、汪洋、王沪宁、赵乐际、韩正、王岐山等来到北京天安门广场，出席烈士纪念日向人民英雄敬献花篮仪式。<br>　　新华社记者 黄敬文摄</p></td></tr></tbody></table><p style=\"text-align: center; \">　　人民网北京9月30日电&nbsp;&nbsp;（记者张洋）天地英雄气，浩然壮国魂。烈士纪念日向人民英雄敬献花篮仪式30日上午在北京天安门广场隆重举行。党和国家领导人习近平、李克强、栗战书、汪洋、王沪宁、赵乐际、韩正、王岐山等，同各界代表一起出席仪式。</p><p>　　庄严的天安门广场上，鲜艳的五星红旗迎风招展。广场中央，“祝福祖国”巨型花篮表达着对国家繁荣富强的美好祝福。人民英雄纪念碑巍然耸立，北侧花坛上，红白两色花朵组成的花环，寄托着人们对人民英雄的深情追思。</p><p>　　临近10时，习近平、李克强、栗战书、汪洋、王沪宁、赵乐际、韩正、王岐山等党和国家领导人来到天安门广场，出席向人民英雄敬献花篮仪式。</p><p>　　中国人民解放军军乐团小号手吹响《烈士纪念日号角》，深沉悠远的旋律将人们的记忆带回风起云涌的历史岁月。</p><p>　　“礼兵就位！”随着号令，三军仪仗兵迈着铿锵有力的步伐，正步行进到纪念碑前持枪伫立。</p><p>　　10时整，向人民英雄敬献花篮仪式正式开始。军乐团奏响《义勇军进行曲》，全场高唱中华人民共和国国歌。</p><p>　　国歌唱毕，全场肃立，向为中国人民解放事业和共和国建设事业英勇献身的烈士默哀。</p><p>　　默哀毕，手持鲜花的少年儿童面向人民英雄纪念碑高唱《我们是共产主义接班人》，并致少年先锋队队礼。</p><p>　　群众方阵前，以中共中央，全国人大常委会，国务院，全国政协，中央军委，各民主党派、全国工商联和无党派爱国人士，各人民团体和各界群众，老战士、老同志和烈士亲属，中国少年先锋队名义敬献的9个大型花篮一字排开。花篮红色缎带上“人民英雄永垂不朽”的金色大字熠熠生辉。</p><p>　　军乐团奏响深情的献花曲，18名礼兵稳稳抬起花篮，缓步走向人民英雄纪念碑，摆放在纪念碑基座上。</p><p>　　习近平等党和国家领导人随后登上纪念碑基座，在花篮前驻足凝视。鲜艳挺拔的红掌、芬芳吐蕊的百合、轻盈绽放的文心兰，寄托着对人民英雄的深切缅怀和崇高敬意。</p><p>　　习近平迈步上前，仔细整理花篮缎带。接着，习近平等党和国家领导人缓步绕行，瞻仰人民英雄纪念碑。</p><p>　　党的十九大站在新的历史起点上，顺应浩浩荡荡的时代潮流，擘画了决胜全面建成小康社会、夺取新时代中国特色社会主义伟大胜利的宏伟蓝图，在以习近平同志为核心的党中央坚强领导下，中华民族正以崭新的姿态向着伟大复兴的光明前景昂首前行。</p><p>　　少年儿童和各界群众代表也依次走到纪念碑前，献上手中鲜花并瞻仰纪念碑。</p><p>　　敬献花篮仪式由中共中央政治局委员、北京市委书记蔡奇主持。</p><p>　　在京中共中央政治局委员、中央书记处书记，部分全国人大常委会副委员长，国务委员，最高人民法院院长，最高人民检察院检察长，部分全国政协副主席和中央军委委员出席仪式。</p><p>　　中央党政军群有关部门和北京市主要负责同志，各民主党派中央、全国工商联负责人和无党派人士代表，在京老战士、老同志和烈士亲属代表，全国少数民族参观团成员，中央党校第16期县委书记研修班学员，首都各界群众代表等参加了敬献花篮仪式。</p><p><br></p><p><span id=\"paper_num\">　　《 人民日报 》（ 2018年10月01日 01 版）</span></p>','article',1539099521,1539100196,1539013117,'{\"thumbnail\":\"\\/upload\\/20181009\\/MAIN201809301444271318855562880.jpg\",\"photos\":null,\"videos\":null,\"files\":null}'),
	(3,2,0,1,0,0,0,0,0,'“数读”习近平关于宣传思想工作最新指示',X'E4B9A0E8BF91E5B9B3E5908CE5AE89E593A5E68B89E680BBE7BB9FE6B49BE4BCA6E7B4A2E4B8BEE8A18CE4BC9AE8B0882CE4B8A4E59BBDE58583E9A696E4B880E887B4E5908CE6848FE7BBA7E7BBADE68EA8E58AA8E4B8A4E59BBDE585B3E7B3BBE7A7AFE69E81E5BFABE9809FE59091E5898DE58F91E5B195','人民网-中国共产党新闻网','<div><p>国家主席习近平9日在人民大会堂同安哥拉总统洛伦索举行会谈。</p><p>习近平欢迎洛伦索对中国进行国事访问，表示很高兴在中非合作论坛北京峰会结束一个月后再次同洛伦索会面。习近平指出，北京峰会成功召开为中非、中安关系发展注入了新动力，带来了新机遇。双方要一道努力，继续推动中安关系积极、快速向前发展。中方对中安两国合作未来充满信心。</p><p>习近平强调，双方要增进政治互信，密切高层交往，加强战略沟通，相互理解和支持彼此核心利益和重大关切。中方对非洲国家的历史遭遇感同身受，坚定支持非洲国家人民反对外来干涉、自主选择发展道路。要落实中非合作论坛北京峰会成果，推动“八大行动”有关举措早日落地，推进共建“一带一路”，加强彼此发展战略对接，做强传统领域合作，拓展新增长点，为两国互利合作打造新亮点，促进安方工业化和经济多元化进程。要扩大人员和地方省市交往，促进中安文明互鉴、民心相通。要开展国际合作，密切多边协调配合，共同维护多边主义，建设开放型世界经济，推动国际秩序更加公平合理。</p><p>洛伦索表示，安中保持高层密切交往，体现出双方对两国关系的高度重视。长期以来，安中合作对安哥拉经济社会发展发挥了积极作用。安方期待进一步加强两国在基础设施建设及民生领域的合作，更好地助力安哥拉国家发展。中非合作论坛推动了中国同整个非洲之间的合作。非洲国家高度赞赏中国根据非洲大陆的实际需求开展对非合作，采取实实在在的举措，且不附加任何政治条件、不干涉非洲国家内政。中方在中非合作论坛框架内提出的合作计划对非洲国家发展具有非常积极的影响。希望安中合作能成为非中合作的典范。安哥拉重视中国在国际事务中的重要影响，高度评价中方为妥善解决非洲热点问题发挥的建设性作用。安哥拉支持多边主义，主张世界的未来应由各国共同决定，愿密切同中国在多边事务中合作。</p><p>会谈后，两国元首共同见证了双边合作文件的签署。</p><p>会谈前，习近平在人民大会堂东门外广场为洛伦索举行欢迎仪式。彭丽媛、杨洁篪、沈跃跃、王毅、何立峰、何维等参加。</p><p>（新华社北京10月9日电 记者孙奕）</p></div><div>(责编：王珂园、程宏毅)</div>','article',1539100286,1539100286,1539013874,'{\"thumbnail\":\"\\/upload\\/20181009\\/MAIN201810010944445141036720515.jpg\",\"photos\":null,\"videos\":null,\"files\":null}'),
	(4,2,0,1,0,0,2,0,0,'中国成功发射遥感三十二号01组卫星',X'E4B8ADE696B0E7BD91E98592E6B3893130E69C8839E697A5E794B52028E69D8EE6BD87E5B88629E58C97E4BAACE697B6E997B43130E69C8839E697A53130E697B63433E58886EFBC8CE4B8ADE59BBDE59CA8E98592E6B389E58DABE6989FE58F91E5B084E4B8ADE5BF83E794A8E995BFE5BE81E4BA8CE58FB7E4B899E8BF90E8BDBDE781ABE7AEAD28E58F8AE8BF9CE5BE81E4B880E58FB753E4B88AE99DA2E7BAA729EFBC8CE68890E58A9FE5B086E981A5E6849FE4B889E58D81E4BA8CE58FB73031E7BB84E58DABE6989FE58F91E5B084E58D87E7A9BAEFBC8CE58DABE6989FE8BF9BE585A5E9A284E5AE9AE8BDA8E98193E38082','中国新闻网','<p><strong>原标题：</strong>中国成功发射遥感三十二号01组卫星</p><p>　　中新网酒泉10月9日电 (李潇帆)北京时间10月9日10时43分，中国在酒泉卫星发射中心用长征二号丙运载火箭(及远征一号S上面级)，成功将遥感三十二号01组卫星发射升空，卫星进入预定轨道。</p><p align=\"center\"><img src=\"http://p1.img.cctvpic.com/photoworkspace/contentimg/2018/10/09/2018100912064452735.jpg\" alt=\"\"></p><p align=\"center\">　　遥感三十二号01组卫星主要用于开展电磁环境探测及相关技术试验。</p><p>　　这次卫星发射，是中国长征系列运载火箭第286次航天飞行。</p>','',1539100613,1539101478,1539014167,'{\"thumbnail\":\"\\/upload\\/20181009\\/1539065797982_960.png\",\"photos\":null,\"videos\":null,\"files\":null}'),
	(5,2,0,1,0,0,0,0,0,'习近平这样践行“蓝色信念”',X'E5A4AEE8A786E7BD91E6B688E681AFEFBC9AE4BB8EE5AE9AE4BD8DE6B5B7E6B48BE5A4A7E59BBDE588B0E5BBBAE8AEBEE6B5B7E6B48BE5BCBAE59BBDEFBC8CE694B9E99DA9E5BC80E694BE3430E5B9B4E69DA5EFBC8CE789B9E588ABE698AFE5859AE79A84E58D81E585ABE5A4A7E4BBA5E69DA5EFBC8CE4B8ADE59BBDE6B5B7E6B48BE4BA8BE4B89AE893ACE58B83E58F91E5B195E38082','中国新闻网','<div><div><p><strong>央视网消息</strong>：从定位海洋大国到建设海洋强国，改革开放40年来，特别是党的十八大以来，中国海洋事业蓬勃发展。</p><p>　　据统计，2017年全国海洋生产总值77611亿元，比上年增长6.9%。2012年——2017年，我国优良海水水质面积从287.73万平方公里增加到292.07万平方公里，四类和劣四类水质海水面积从9.25万平方公里减少到5.11万平方公里。</p><p>　　“建设海洋强国，我一直有这样一个信念。”</p><p>　　就如何建设海洋强国，习近平总书记提出四点要求，央视网特别梳理以飨读者。</p><p>提高海洋资源开发能力</p><p><strong>　　综合开发沿海 形成大产业优势</strong></p><p>　　沿海是我们辽阔的地域，是扩大对外开放的优势所在，我们切不可忽略了这一优势，也不能搞成单一的开发，而是通过综合开发，形成大产业优势。</p><p>　　——1994年5月26日，习近平在“海上福州”研讨会上的讲话</p><p><strong>　　提高海洋经济增长质量</strong></p><p>　　要加强海洋产业规划和指导，优化海洋产业结构，提高海洋经济增长质量，培育壮大海洋战略性新兴产业，提高海洋产业对经济增长的贡献率，努力使海洋产业成为国民经济的支柱产业。</p><p>　　——2013年7月30日，习近平在中共中央政治局第八次集体学习时的讲话</p><p><strong>　　扩大海洋开发领域</strong></p><p>　　发达的海洋经济是建设海洋强国的重要支撑。要提高海洋开发能力，扩大海洋开发领域，让海洋经济成为新的增长点。</p><p>　　——2013年7月30日，习近平在中共中央政治局第八次集体学习时的讲话</p><p><strong>　　走人海和谐、合作共赢的发展道路</strong></p><p>　　要坚定走人海和谐、合作共赢的发展道路，提高海洋资源开发能力，支持海南建设现代化海洋牧场，加强深海科学技术研究。</p><p>　　——2018年4月13日，习近平在庆祝海南建省办经济特区30周年大会上的讲话</p><p>保护海洋生态环境</p><p><strong>　　全力遏制海洋生态环境不断恶化趋势</strong></p><p>　　要下决心采取措施，全力遏制海洋生态环境不断恶化趋势，让我国海洋生态环境有一个明显改观，让人民群众吃上绿色、安全、放心的海产品，享受到碧海蓝天、洁净沙滩。</p><p>　　——2013年7月30日，习近平在中共中央政治局第八次集体学习时的讲话</p><p><strong>　　要从源头上有效控制陆源污染物入海排放</strong></p><p>　　要从源头上有效控制陆源污染物入海排放，加快建立海洋生态补偿和生态损害赔偿制度，开展海洋修复工程，推进海洋自然保护区建设。</p><p>　　——2013年7月30日，习近平在中共中央政治局第八次集体学习时的讲话</p><p><strong>　　绝不能再沿袭高投入、高消耗、高污染、低效益的传统工业化模式</strong></p><p>　　发展海洋经济，必须坚持高起点谋划，走出一条特色鲜明的发展路子。要更加注重增长质量的提高，更加注重资源的集约利用，更加注重生态环境的保护，更加注重发展的可持续性，绝不能再沿袭高投入、高消耗、高污染、低效益的传统工业化模式，走粗放型的发展路子。</p><p>　　——2005年12月26日，习近平在舟山调研时的讲话</p><p><strong>　　维护海洋自然再生产能力</strong></p><p>　　要把海洋生态文明建设纳入海洋开发总布局之中，坚持开发和保护并重、污染防治和生态修复并举，科学合理开发利用海洋资源，维护海洋自然再生产能力。</p><p>　　——2013年7月30日，习近平在中共中央政治局第八次集体学习时的讲话</p><p><strong>　　加快建设绿色可持续的海洋生态环境</strong></p><p>　　海洋是高质量发展战略要地。要加快建设世界一流的海洋港口、完善的现代海洋产业体系、绿色可持续的海洋生态环境，为海洋强国建设作出贡献。</p><p>　　——2018年3月8日，习近平参加山东代表团审议时的讲话</p><p>发展海洋科学技术</p><p><strong>　　建设海洋强国必须大力发展海洋高新技术</strong></p><p>　　建设海洋强国必须大力发展海洋高新技术。要依靠科技进步和创新，努力突破制约海洋经济发展和海洋生态保护的科技瓶颈。</p><p>　　——2013年7月30日，习近平在中共中央政治局第八次集体学习时的讲话</p><p><strong>　　重点在深水、绿色、安全的海洋高技术领域取得突破</strong></p><p>　　要搞好海洋科技创新总体规划，坚持有所为有所不为，重点在深水、绿色、安全的海洋高技术领域取得突破。尤其要推进海洋经济转型过程中急需的核心技术和关键共性技术的研究开发。</p><p>　　——2013年7月30日，习近平在中共中央政治局第八次集体学习时的讲话</p><p><strong>　　关键技术自主研发</strong></p><p>　　发展海洋经济、海洋科研是推动我们强国战略很重要的一个方面，一定要抓好。关键的技术要靠我们自主来研发，海洋经济的发展前途无量。</p><p>　　——2018年6月12日，习近平在山东考察时的讲话</p><p><strong>　　重视技术进步和人才培养</strong></p><p>　　海洋经济是高技术经济、开放型经济、综合性经济，要十分重视技术进步和人才培养，加强区域海洋科技创新平台建设，着力提高自主创新能力。</p><p>　　——2005年12月26日，习近平在舟山调研时的讲话</p><p>维护国家海洋权益</p><p><strong>　　坚决捍卫国家领土主权和海洋权益</strong></p><p>　　我们坚持战斗力这个唯一的根本的标准，深入推进练兵备战，坚决捍卫国家领土主权和海洋权益。</p><p>　　——2017年8月1日，习近平在庆祝中国人民解放军建军90周年大会上的讲话</p><p><strong>　　统筹维稳和维权两个大局</strong></p><p>　　要统筹维稳和维权两个大局，坚持维护国家主权、安全、发展利益相统一，维护海洋权益和提升综合国力相匹配。</p><p>　　——2013年7月30日，习近平在中共中央政治局第八次集体学习时的讲话</p><p><strong>　　做好应对各种复杂局面的准备</strong></p><p>　　要做好应对各种复杂局面的准备，提高海洋维权能力，坚决维护我国海洋权益。</p><p>　　——2013年7月30日，习近平在中共中央政治局第八次集体学习时的讲话</p><p><strong>　　坚持“主权属我、搁置争议、共同开发”</strong></p><p>　　要坚持“主权属我、搁置争议、共同开发”的方针，推进互利友好合作，寻求和扩大共同利益的汇合点。</p><p>　　——2013年7月30日，习近平在中共中央政治局第八次集体学习时的讲话</p><p><strong>　　建设一支强大的人民海军</strong></p><p>　　建设一支强大的人民海军，寄托着中华民族向海图强的世代夙愿，是实现中华民族伟大复兴的重要保障。</p><p>　　——2018年4月12日，习近平在出席南海海域海上阅兵时的讲话</p><p>　　（整理/余晓玲）</p></div></div><div><div><div><div>编辑：钱景童&nbsp;<span id=\"zb\">责任编辑：王敬东</span></div></div></div></div>','article',1539100682,1539100682,1539014268,'{\"thumbnail\":\"\\/upload\\/20181009\\/1539063805001_296.jpg\",\"photos\":null,\"videos\":null,\"files\":null}'),
	(6,2,0,1,0,0,0,0,0,'中央广播电视总台与上海市人民政府签署深化战略合作框架协议',X'E4B8ADE5A4AEE5B9BFE692ADE794B5E8A786E680BBE58FB0E4B88EE4B88AE6B5B7E5B882E4BABAE6B091E694BFE5BA9CE4BA8E32303138E5B9B43130E69C8838E697A5E4B8BEE8A18CE6B7B1E58C96E68898E795A5E59088E4BD9CE6A186E69EB6E58D8FE8AEAEE7ADBEE7BAA6E4BBAAE5BC8FE38082E4B8ADE5A4AEE5B9BFE692ADE794B5E8A786E680BBE58FB0E7ACACE4B880E4B8AAE58CBAE59F9FE680BBE983A8E5928CE59CB0E696B9E680BBE7AB99E28094E28094E995BFE4B889E8A792E680BBE983A8E5928CE4B88AE6B5B7E680BBE7AB99E5908CE697B6E59CA8E6B2AAE68FADE7898CE38082E4B8ADE585B1E4B8ADE5A4AEE694BFE6B2BBE5B180E5A794E59198E38081E4B88AE6B5B7E5B882E5A794E4B9A6E8AEB0E69D8EE5BCBAE587BAE5B8ADE6B4BBE58AA8E38082E4B8ADE5AEA3E983A8E589AFE983A8E995BFE38081E4B8ADE5A4AEE5B9BFE692ADE794B5E8A786E680BBE58FB0E58FB0E995BFE6858EE6B5B7E99B84EFBC8CE4B88AE6B5B7E5B882E5A794E589AFE4B9A6E8AEB0E38081E5B882E995BFE5BA94E58B87E4BBA5E58F8AE4B88AE6B5B7E5B882E9A286E5AFBCE591A8E685A7E790B3E38081E8AFB8E8919BE5AE87E69DB0E7AD89E587BAE5B8ADE38082','中央广播电视总台央视新闻','<p>中央广播电视总台与上海市人民政府于2018年10月8日举行深化战略合作框架协议签约仪式。中央广播电视总台第一个区域总部和地方总站——长三角总部和上海总站同时在沪揭牌。中共中央政治局委员、上海市委书记李强出席活动。中宣部副部长、中央广播电视总台台长慎海雄，上海市委副书记、市长应勇以及上海市领导周慧琳、诸葛宇杰等出席。</p><p align=\"center\"><img src=\"http://p1.img.cctvpic.com/photoworkspace/contentimg/2018/10/08/2018100820584862363.jpg\" alt=\"\" width=\"550\"></p><p>　　中央广播电视总台副台长阎晓明和上海市副市长翁铁慧分别代表双方签订战略合作框架协议。中国国际电视总公司负责人与上海市徐汇区政府负责人签署了项目合作协议。</p><p align=\"center\"><img src=\"http://p1.img.cctvpic.com/photoworkspace/contentimg/2018/10/08/2018100820584851552.jpg\" alt=\"\" width=\"550\"></p><p>　　签约仪式上，李强、慎海雄、应勇为中央广播电视总台长三角总部和上海总站揭牌。</p><p>　　李强代表上海市委、市政府对中央广播电视总台一直以来关注上海、宣传上海表示感谢。他说，按照习近平总书记对上海工作的指示要求，我们正在加快建设“五个中心”、卓越的全球城市和具有世界影响力的社会主义现代化国际大都市。文化是城市能级和核心竞争力的重要体现，我们要按照建设国际文化大都市的要求，加快发展文化事业、文化产业，全力打响“上海文化”品牌，充分激发文化创新创造活力。中央广播电视总台是党中央重要宣传舆论阵地，是国家广播电视台。上海与总台合作前景十分广阔，要进一步发挥各自优势，拓展合作空间，实现共同发展。希望总台一如既往为上海改革发展提供有力舆论支持，助力上海提升经济创新力、产业竞争力和文化软实力。上海将为总台在沪发展创造更好环境、提供更优服务，支持总台打造国际一流新型主流媒体。</p><p align=\"center\"><img src=\"http://p1.img.cctvpic.com/photoworkspace/contentimg/2018/10/08/2018100820584858197.jpg\" alt=\"\" width=\"550\"></p><p>　　慎海雄表示，9月26日，习近平总书记就中央电视台建台暨新中国电视事业诞生60周年发来贺信，高度肯定中央广播电视总台组建以来取得的成绩，对中央广播电视总台未来工作提出殷切希望。总台正以总书记的贺信精神为动力，奋力打造具有强大引领力、传播力、影响力的国际一流新型主流媒体。上海是改革开放的排头兵和创新发展的先行者，总台与上海市的战略合作，有助于充分利用上海得天独厚的优势，不断提升引领力传播力影响力。总台将以长三角总部和上海总站为前沿阵地，为新时代上海的改革发展、加快建设“五个中心”、卓越的全球城市和具有影响力的社会主义现代化国际大都市做出贡献。</p><p align=\"center\"><img src=\"http://p1.img.cctvpic.com/photoworkspace/contentimg/2018/10/08/2018100820584864371.jpg\" alt=\"\" width=\"550\"></p><p>　　根据协议，双方将围绕重大文化项目、服务长三角、版权运营、超高清产业、体育产业、影视剧译制、影视技术等方面开展全方位深度合作。中央广播电视总台有关部门、派驻长三角各省市机构，上海市发改委、文广影视局、体育局、版权局、徐汇区等相关负责同志以及中央主要媒体驻沪机构代表参加活动。</p>','article',1539100754,1539100754,1539014294,'{\"thumbnail\":\"\\/upload\\/20181009\\/2018100820584862363.jpg\",\"photos\":null,\"videos\":null,\"files\":null}'),
	(7,2,0,1,0,0,1,0,0,'两名美国学者获2018年诺贝尔经济学奖',X'E58E9FE6A087E9A298EFBC9AE4B8A4E5908DE7BE8EE59BBDE7BB8FE6B58EE5ADA6E5AEB6E88EB732303138E5B9B4E8AFBAE8B49DE5B094E7BB8FE6B58EE5ADA6E5A596','新华网','<p><strong>原标题：</strong>两名美国经济学家获2018年诺贝尔经济学奖</p><p align=\"center\"><img src=\"http://p1.img.cctvpic.com/photoworkspace/contentimg/2018/10/09/2018100903100977162.jpg\" alt=\"\" width=\"550\"></p><p>　　新华社斯德哥尔摩10月8日电（记者和苗　付一鸣）瑞典皇家科学院8日宣布，将2018年诺贝尔经济学奖授予美国经济学家威廉·诺德豪斯和保罗·罗默，以表彰他们在可持续经济增长研究领域作出的突出贡献。</p><p>　　瑞典皇家科学院常任秘书戈兰·汉松当天在新闻发布会上揭晓上述奖项归属。他说，今年经济学奖两名得主设计出一些方法来解决当前最基本和紧迫的问题，即如何实现长期可持续的经济增长。</p><p>　　评审委员会的声明说，经济学的核心是处理稀缺资源，自然决定了经济增长的主要制约因素，而人类的知识决定了如何应对这些制约。今年的经济学奖得主通过构建解释市场经济与自然和知识相互作用的模型，扩展了经济分析的范围，“使我们更接近于回答如何实现长期可持续的全球经济增长”。</p><p>　　声明还说，罗默的贡献在于“技术变革”，他的研究展示了知识如何成为推动经济长期增长的动力，并奠定了现被称为“内生增长理论”的基础，解释了创意与其他商品不同，需要特定条件才能在市场中充分发挥作用。诺德豪斯的研究与“气候变化”密不可分，涉及社会与自然之间的相互作用，他创建了描述全球经济与气候相互作用的定量模型，整合了物理学、化学和经济学的理论与实践结果。</p><p>　　诺德豪斯1941年生于美国阿尔伯克基，目前在耶鲁大学任经济学教授。罗默1955年生于美国丹佛，现任纽约大学斯特恩商学院教授。</p><p>　　今年的诺贝尔经济学奖奖金为900万瑞典克朗（约合100万美元）。</p><p>　　在诺贝尔系列奖项中，经济学奖并非依照已故瑞典工业家阿尔弗雷德·诺贝尔的遗嘱设立，而是由瑞典国家银行1968年创立，奖金由瑞典国家银行支出。今年是该奖颁发50周年。</p>','article',1539100822,1539136450,1539014416,'{\"thumbnail\":\"\\/upload\\/20181009\\/2018100903100977162.jpg\",\"photos\":null,\"videos\":null,\"files\":null}'),
	(8,2,0,1,0,0,1,0,0,'西沙守岛官兵：青春热血守海疆',X'E5A4AEE8A786E7BD91E6B688E681AFEFBC9AE8A5BFE6B299E7BEA4E5B29BE698AFE68891E59BBDE58D97E6B5B7E8AFB8E5B29BE59B9BE5A4A7E7BEA4E5B29BE4B98BE4B880EFBC8CE587A0E58D81E5B9B4E69DA5EFBC8CE4B880E4BBA3E58F88E4B880E4BBA3E8A5BFE6B299E7BEA4E5B29BE79A84E5AE88E5B29BE5AE98E585B5EFBC8CE5A682E5908CE992A2E99289E4B880E6A0B7E79F97E7AB8BE59CA8E7A596E59BBDE58D97E6B5B7EFBC8CE794A8E99D92E698A5E5928CE783ADE8A180E5AE88E68AA4E79D80E8BF99E78987E8939DE889B2E6B5B7E79686E38082','央视网','<p>　<strong>央视网消息：</strong>西沙群岛是我国南海诸岛四大群岛之一，几十年来，一代又一代西沙群岛的守岛官兵，如同钢钉一样矗立在祖国南海，用青春和热血守护着这片蓝色海疆。</p><p>　　远离祖国大陆，每一次升国旗仪式，对于琛航岛官兵来讲，都意义非凡。</p><p align=\"center\"><img src=\"http://p1.img.cctvpic.com/photoworkspace/contentimg/2018/10/06/2018100610543399154.jpg\" alt=\" \"></p><p>　　1974年，我国西沙海域岛屿不断被侵占，为保卫国家领土主权，反击入侵之敌，1月19日我国发起西沙群岛自卫反击战。</p><p>　　海战中牺牲的18位烈士长眠琛航岛，这个祖国最南端的烈士陵园，如同一座捍卫主权的丰碑矗立南海深处，激励着一代代守岛官兵负重前行。</p><p align=\"center\"><img src=\"http://p1.img.cctvpic.com/photoworkspace/contentimg/2018/10/06/2018100610543385215.jpg\" alt=\" \"></p><p>　　与琛航岛官兵分别后，我们也启程前往中建岛。中建岛，位于西沙群岛最南部，守岛官兵曾被中央军委授予“爱国爱岛天涯哨兵”荣誉称号，这里，最初没水没电没植被，被当地称为南海戈壁滩。1975年，第一支7人小分队毅然历经千辛万苦来到了中建岛。</p><p>　　随着他们的到来，中建岛也迎来了驻军的历史，从此也掀开了种树建岛的新篇章，1982年，中建岛种活了第一棵椰子树，20年后的2002年，这里收获了第一颗椰子，今天，这里迎来了一片绿洲。</p><p align=\"center\"><img src=\"http://p1.img.cctvpic.com/photoworkspace/contentimg/2018/10/06/2018100610543328288.jpg\" alt=\" \"></p><p>　　远离祖国大陆，这里的国旗，是他们对家乡，对亲人相思最好的寄托。2011年，范期宏突然接到父亲病危的消息，当时由于寒潮，海面上刮起6、7级大风，让范期宏根本没有办法下岛。</p><p>　　对于父亲的离世，范期宏无能为力，只能面朝北方，隔海相望，敬一个军礼，向父亲寄托哀思。</p>','article',1539100901,1539410393,1539014487,'{\"thumbnail\":\"\\/upload\\/20181009\\/2018100610561166573.jpg\",\"photos\":null,\"videos\":null,\"files\":null}'),
	(9,2,0,1,0,0,4,0,0,'【强国先锋】陶雄强：创新是企业发展的基石',X'E5A4AEE8A786E7BD91E6B688E681AFEFBC9AE4BB8E31393935E5B9B4E5BC80E5A78BE7AE97E8B5B7EFBC8CE887B3E4BB8AE999B6E99B84E5BCBAE5B7B2E4B8BAE4B8ADE59BBDE699AEE5A4A9E69C8DE58AA13233E4B8AAE5B9B4E5A4B4E38082','央视网','<p>　　<strong>央视网消息：</strong>从1995年开始算起，至今陶雄强已为中国普天服务23个年头。</p><p>　　作为带领中国普天通信产业做强、做实的领军人物，陶雄强亲历了中国通信产业从3G到4G再到5G的发展历程，他不遗余力地推动通信产业的技术创新、标准创新、产品创新和业态创新，为中国普天的高质量发展注入新动能。</p><p align=\"center\"><img src=\"http://p1.img.cctvpic.com/photoworkspace/contentimg/2018/10/05/2018100514580210604.jpg\" alt=\"1\" width=\"520\" height=\"300\"></p><p>　　拥有百年发展历史的中国普天作为信息通信领域的骨干企业，一直承担着国家信息通信建设的重大使命，也是最早进入充分竞争市场的央企之一。在竞争中，中国普天实现了从单一的通信设备商向信息化整体解决方案提供商和综合运营服务商的转型。</p><p>　　“通信行业目前跟国外应该是平起平坐，在这个领域，我们有足够的自信。未来，我们在全球还会有更多的话语权，我们的目标是要领跑这个领域！”（联合出品/央视网 中国国防邮电工会全国委员会 鸣谢：中国普天信息产业集团有限公司）</p><p>　　为深入宣传中国改革开放40周年伟大成就，宣传改革开放以来国防邮电产业的发展变化，进一步贯彻落实十九大精神，集中展示中国特色社会主义新时代国防邮电产业的新风新貌。央视网推出5集“强国先锋”微故事，展现5位国防邮电产业内爱岗敬业、踏实肯干、有所建树的优秀科研工作者和工匠人才，用视频微纪录片形式将他们的故事影像化，全面展示新时代国防邮电产业职工的情怀和风采。</p>','article',1539100953,1539136431,1539014508,'{\"thumbnail\":\"\\/upload\\/20181009\\/2018100514592797646.jpg\",\"photos\":null,\"videos\":null,\"files\":null}'),
	(10,2,0,1,0,0,1,0,0,'“古城守望者”阮仪三：保住古建筑才能有乡愁',X'E58E9FE6A087E9A298EFBC9AE4BF9DE4BD8FE58FA4E5BBBAE7AD91E6898DE883BDE69C89E4B9A1E68481','广州日报','<p><strong>原标题：</strong>保住古建筑才能有乡愁</p><p align=\"center\"><img src=\"http://p1.img.cctvpic.com/photoworkspace/contentimg/2018/10/08/2018100809343027603.jpg\" alt=\"\"></p><p align=\"center\"><img src=\"http://p1.img.cctvpic.com/photoworkspace/contentimg/2018/10/08/2018100809343030221.jpg\" alt=\"\"></p><p align=\"center\">　　2002年5月与联合国教科文组织专家阿兰、兰德一起在南浔考察。</p><p>　　建筑，是有生命的载体，有味道的记忆，有故事的乡愁。在中西方文化的交融中，建筑变得更有个性与色彩。同济大学建筑与城市规划学院教授、博士生导师阮仪三教授说：“我个人观点反对在中国建欧式城堡以及仿古建筑。”</p><p>　　文、图/广州日报全媒体记者陈庆辉 实习生 李昂</p><p>　　阮仪三，国家历史文化名城研究中心主任，被誉为“都市文脉的守护者”“历史文化名城的‘卫士’”“古城的守望者”。</p><p>　　这位年过八旬的老人，为了保护文化遗产，四处奔波、大声疾呼，抢救保护了世界遗产平遥、丽江及江南水乡古镇周庄、同里、西塘等数十个城镇。</p><p>　　当谈到保护古建筑这条路上的成就，老人却为那些更多失败的保护扼腕叹息。</p><p>　　84岁的阮老坚持每天早上9点上班，在他不大的办公室里摆满了各种奖杯、奖牌和牌匾。当记者敲开办公室的门，这位精神矍铄的老人正在翻阅文档，忙碌地处理工作。这位平和、幽默的老人说起对历史文化遗产的破坏行为时，显得气愤又无奈。</p><p>　　<strong>从军舰到建筑</strong></p><p>　　阮老的高祖是清朝时期九省封疆大员阮元，自小闻书香长大，涉猎广泛。大学期间他师从古建筑园林艺术专家陈从周，“他常常叮嘱我要把保护古建筑的事业做好。”</p><p>　　阮老说，他原本是军舰上的“网红”军人，既掌握电码、旗号，还知晓雷达、轮机、航海，还是军舰上的文化教员，舰队里的战友都很喜欢他。</p><p>　　如果没有之后的故事，或许阮老就是一个戴满勋章的老军人了。</p><p>　　告别部队去读书，命运在这里来了个大转折。部队的老首长告诉他，回家好好读书，并建议他不要考文科或者高精科技专业。“所以就报考了同济大学的建筑专业。”</p><p>　　这一学就用了一生，他从骨子里爱上了古建筑。5年的军人经历对他的学习功不可没。“在部队里我拼命动脑子，什么都学，这也是部队教给我最大的东西——任何事情只要钻进去，就一定会有收获。”</p><p>　　从此阮老和古建筑、城市规划结下了几十年的缘分。</p><p>　　<strong>救平遥保周庄</strong></p><p>　　阮老在大学毕业的前一年，成为董鉴泓教授的助手，参与编写《中国城市建设史》。他跟着老师在全国各地调查，并阅读各地县志。“我那时看了全中国各地的城市，才深深感到祖国有那么多漂亮的古城镇。”那时候，他就想着把这份美丽好好留给子孙后代，保护这些古城不被轰鸣的挖掘机毁灭。却不想，这个决定要让他付出何等的代价。</p><p>　　尽管阮老“刀下救平遥”“死保周庄”的故事不断被媒体曝光，但阮老说，他保住的古城还是很少的，还有更多的古城因各种原因湮灭在城镇化发展的进程中。</p><p>　　说起“刀下救平遥”，阮老历历在目。1980年，平遥附近有很多古城，尤其是太谷这个古城，其古历史建筑面积甚至超过了平遥。阮老考察的时候，他还能看到完整的城墙、钟鼓楼和孔庙，还有很多保存很好的民居。</p><p>　　当知道平遥准备大拆大建，三四百处清代建筑已被拆除，阮老着急了。阮老说，当时平遥的文管队长很真诚，想尽办法保住平遥，“那么多古城，我的指头不够按，我就按住一个是一个，希望大家跟我一块来按，就这样保住了平遥。”</p><p>　　有了保护平遥的前车之鉴，阮老对保护其他古城有了经验也有了方向，于是周庄、乌镇等一个个富有特色的小镇在阮老的努力下，留存了下来。</p><p>　　阮老努力保护古城的同时，还在发掘古城。新绛古城中的隋朝花园就是其中一个。“这次发现是天意也是偶然。”阮老说，20世纪60年代，他走访山西省，一场大雨，他被困在新绛。他只好在城里东逛西看，没想到他在一所中学看到了一个很好的花园，一看这里写着“绛守居园”，他就想到了在中学时读过《绛守居园池记》，“这篇古文对这座花园有精彩深奥的描写，中学语文老师说，读懂了这篇文章，你们的古文就过关了，所以我留下很深的印象。”随后，阮老赶紧查看各种文献，最终证实了这就是全国唯一的隋朝的花园。</p><p>　　阮老说，幸运的是，在过去的三十年里，新绛古城的花园依然没有被破坏。1996年在确定第三批国家级历史文化名城时，阮老想着古城只有被列入名单，才能保住。于是，他拿出了新绛大堂和绛守居园的资料，告诉评审专家们，“我说这是中国仅存的隋唐名园之城，一定要珍惜。”</p><p>　　<strong>千城一面何来乡愁？</strong></p><p>　　尽管84岁的高龄，阮老依然走在保护古建筑的路上。“我现在不能出远门，就让学生去考察。对不被人发现的历史村镇展开调查，我在《中国城市规划杂志》上有一个专版《遗珠拾粹》，收集被遗忘村，第一期里面有100个历史村镇，我现在还在收集第二个100个，现在已经收集60多个了。每个月一期，一直做下去。如果缺钱，我就出钱，让学生的学生去做。</p><p>　　阮老指着墙上的牌匾说，他现在成立了“城市遗产保护基金会”，从教育出发，让下一代人爱上古建筑，一代代传下去。</p><p>　　阮老的基金会，每年暑假都会在平遥和新绛以及贵州、金华等地举办“历史文化遗产保护夏令营”，旨在宣传对古建筑的义务保护工作。</p><p>　　如今，他的两个孙子也加入夏令营，成为了保护古建筑的一员。阮老希望他的后代以及学生的学生，一代代这样传下去。“只有这样，我们才会有乡愁，只有这样，我们才不会忘记故乡的味道。”</p><p>　　他一直强调的乡愁，首先就是建筑，“否则千城一面，哪里来的乡愁？”</p><p>　　阮老表示，现在的住宅没有历史性、文化性，尽管居民生活得到改善，但把文化丢掉了。</p><p>　　“以前北京四合院，四幢房子组成一个院落，上有天下有地，要敬天畏地，要遵纪爱国，孝敬双亲，尊重老师，学习知识文化，四合院围起来阖家团聚；福建的土楼、安徽民居、广州的西关大屋、上海的石库门等，大家的感情都是通过住宅联络起来。”</p><p><strong>　　对话</strong></p><p><strong>　　保护古城，</strong></p><p><strong>　　广东省潮州做得很好</strong></p><p>　　广州日报：广东在保护古建筑方面做得怎么样？</p><p>　　阮仪三：我曾在广州开讲座，就是要呼唤岭南建筑。比如广州的白天鹅宾馆、流花宾馆以及中国大酒店等都设计得非常好，具有很丰富的岭南特色。所以广东的建筑首先要把握住岭南元素。</p><p>　　保护古城方面，广东做得最好的是潮州。潮州古城里没建高楼，而且义、兴、甲三条历史街区也保留下来了，经过整修，让居民也在里面居住，这就是一个历史文化的延续，这里也没有变成历史商业街区，现在很舒服，很安静，很有岭南风格。</p><p>　　<strong>古代民居也需要保护</strong></p><p>　　广州日报：你觉得保护古建筑的同时，应该更好地保护民居吗？</p><p>　　阮仪三：在民居保护方面，我们国家做得不够，我们保护的都是名人故居等历史传统建筑。</p><p>　　对于民居的保护不是拿来做旅游陈列参观的，而是留存中华民族的精粹。为什么北京就是北京，福州是福州，西安是西安，广州是广州呢？因为以前每个城市都有各自的特点。中国的民居，蕴含着中华伦理道德的精髓，我们要留存历史，保护历史风貌才是重要的，然而现在各地新建的住宅都一样，并没有中国特色，更没有地方特色。</p><p>　　广州日报：如果古城不发展旅游，建成居住为主的社区，古城还能发展吗？</p><p>　　阮仪三：保护古城的重要意义是留存优秀文化遗产，并把这个文化传下去。我们故宫难道光是给你看皇帝怎么过日子的吗？不，更重要的是要知道封建社会的体制和统一大中国的形成。</p><p>　　广州日报：大家都说现在的古镇千篇一律，太商业化，就连街上卖的东西也差不多。你怎么看这个现象？</p><p>　　阮仪三：现在有些旅游景点都有这个问题。有的地方旅游业在发展过程中过分强调经济，同时低端的旅游产品充斥市场，相互抄袭模仿，同质化严重。还有更严重的是，有些地方把真东西都拆掉，建假古董。现在很多仿古建筑张冠李戴，这不仅是笑话，而且还错误地引导了人们对文化的理解，歪曲了历史。</p><p>　　所以教育是很重要的，我现在每两周都有一次课，讲古建筑的保护，我希望人人都要有保护古建筑的意识。</p><p>　　<strong>扬州的做法值得肯定</strong></p><p>　　广州日报：现在仿古、仿欧的建筑越来越多，你觉得这样好吗？</p><p>　　阮仪三：我反对建设欧式建筑，也反对建设假古董。现在有些地方在建设中国传统建筑的做法值得肯定和学习，比如苏州和扬州。在扬州老城里有些居民拆了新房子建旧房子，他们认为新中国成立后建设的那种房子不好，于是拆了再建造古式的新房子。他们建了小花园，有假山，有池塘，有亭子，诗情画意就来了，变得更有文化气息。</p><p>　　有人做过统计，在扬州像这样的私家小花园在古城里就有100多家。这说明老百姓在用自己的力量保护着历史文化，他们是真的留住了乡愁。这是新形势下的城市更新，保护古城也出现了新的方式。我现在正带领研究生做一个高层次的调查。</p><p>　　广州日报：应该如何修复古建筑，保护古城？</p><p>　　阮仪三：为了商业的仿古，肯定不行。修复古建筑，要“修旧如故，以存其真”。要有四性五原则。古建筑每个朝代都很有特点，所以历史信息都要保存，历史痕迹也要留着。什么朝代的东西，都能从建筑中看到。也要有“四性五原则”标准。四性就是原真性、整体性、可读性、可持续性。五原则就是原材料、原工艺、原样式、原结构、原环境，要以这五个法则去修复或重建一栋古建筑。</p><p>　　现在只有文物保护法，没有建筑保护法。要让现代化的设施投入进去，不妨碍古建筑的保护发展，这就要想办法。平遥现在的状态来之不易。新旧共生，新城的要继续发展，老城要以老的方式留存历史文化，并且人民的生活得到改善。平遥古城的保护建设就是一个很好的例子，扬州的做法也值得学习。</p>','article',1539101061,1539136427,1539014649,'{\"thumbnail\":\"\\/upload\\/20181009\\/2018100809390289039.jpg\",\"photos\":null,\"videos\":null,\"files\":null}'),
	(13,2,0,1,0,0,3,0,0,'田耀宇：当好祖国铁骑兵',X'E38080E5A4AEE8A786E7BD91E6B688E681AFEFBC9AE59CA8E59BBDE5AEBEE68AA4E58DABE9989FE4B8ADE69C89E4B880E99DA2E789B9E6AE8AE79A84E5A299E5A381EFBC8CE4B88AE99DA2E68C82E6BBA1E4BA86E88081E9989FE59198E4BBACE7A0B4E697A7E79A84E6898BE5A597EFBC8CE8808CE8BF99E6A0B7E7A0B4E697A7E7A88BE5BAA6E79A84E6898BE5A597E9989FE59198E4BBACE4BB85E4BB85E4BDBFE794A8E4BA86E4B880E4B8AAE69C88E38082E794B0E88080E5AE87E59CA8E6898BE5A597E5A299E4B88AE58699E4B88BE4BA86E8BF99E6A0B7E4B880E58FA5E8AF9DEFBC9AE78EB0E59CA8EFBC8CE99D92E698A5E698AFE794A8E69DA5E5A58BE69697E79A84EFBC9BE5B086E69DA5EFBC8CE99D92E698A5E698AFE794A8E69DA5E59B9EE5BF86E79A84E38082E59BA0E4B8BAE59CA8E794B0E88080E5AE87E79A84E5BF83E9878CEFBC8CE58FAAE69C89E68080E68FA3E69E81E5BAA6E79A84E8B4A3E4BBBBE5BF83E5928CE5BCBAE78388E79A84E4BDBFE591BDE6849FEFBC8CE794A8E887AAE5B7B1E79A84E99D92E698A5E5928CE6B197E6B0B4EFBC8CE6898DE883BDE7BBB4E68AA4E59BBDE5AEBEE68AA4E58DABE9989FE79A84E88DA3E8AA89EFBC8CE6898DE883BDE68D8DE58DABE59BBDE5AEB6E79A84E5BDA2E8B1A1E4B88EE5B08AE4B8A5E38082','央视网','<p>　<strong>央视网消息</strong>：在国宾护卫队中有一面特殊的墙壁，上面挂满了老队员们破旧的手套，而这样破旧程度的手套队员们仅仅使用了一个月。田耀宇在手套墙上写下了这样一句话：现在，青春是用来奋斗的；将来，青春是用来回忆的。因为在田耀宇的心里，只有怀揣极度的责任心和强烈的使命感，用自己的青春和汗水，才能维护国宾护卫队的荣誉，才能捍卫国家的形象与尊严。<br></p>','article',1539101379,1539410389,1539014968,'{\"thumbnail\":\"\\/upload\\/20181009\\/2018100515030322214.jpg\",\"photos\":null,\"videos\":null,\"files\":null}'),
	(15,2,0,1,0,0,3,0,0,'画廊测试',X'E794BBE5BB8AE6B58BE8AF95E794BBE5BB8AE6B58BE8AF95E794BBE5BB8AE6B58BE8AF95E794BBE5BB8AE6B58BE8AF95E794BBE5BB8AE6B58BE8AF95','画廊测试画廊测试画廊测试','<br>','article',1539102451,1539410419,0,'{\"thumbnail\":\"\\/upload\\/20181009\\/newspic01.png\",\"photos\":[{\"lastModified\":1539101017440,\"lastModifiedDate\":null,\"name\":\"2018100216474371255.jpg\",\"size\":163497,\"type\":\"image\\/jpeg\",\"uid\":\"vc-upload-1539102373488-13\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181009\\/2018100216474371255.jpg\"},\"percent\":100,\"originFileObj\":null,\"status\":\"done\",\"thumbUrl\":\"http:\\/\\/party.test\\/\\/upload\\/20181009\\/2018100216474371255.jpg\",\"url\":\"\\/upload\\/20181009\\/2018100216474371255.jpg\"},{\"lastModified\":1539100856481,\"lastModifiedDate\":null,\"name\":\"2018100514592797646.jpg\",\"size\":120059,\"type\":\"image\\/jpeg\",\"uid\":\"vc-upload-1539102373488-15\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181009\\/2018100514592797646.jpg\"},\"percent\":100,\"originFileObj\":null,\"status\":\"done\",\"thumbUrl\":\"http:\\/\\/party.test\\/\\/upload\\/20181009\\/2018100514592797646.jpg\",\"url\":\"\\/upload\\/20181009\\/2018100514592797646.jpg\"},{\"lastModified\":1539101014334,\"lastModifiedDate\":null,\"name\":\"2018100515030322214.jpg\",\"size\":58224,\"type\":\"image\\/jpeg\",\"uid\":\"vc-upload-1539102373488-21\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181009\\/2018100515030322214.jpg\"},\"percent\":100,\"originFileObj\":null,\"status\":\"done\",\"thumbUrl\":\"http:\\/\\/party.test\\/\\/upload\\/20181009\\/2018100515030322214.jpg\",\"url\":\"\\/upload\\/20181009\\/2018100515030322214.jpg\"},{\"lastModified\":1539100851761,\"lastModifiedDate\":null,\"name\":\"2018100610561166573.jpg\",\"size\":144667,\"type\":\"image\\/jpeg\",\"uid\":\"vc-upload-1539102373488-23\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181009\\/2018100610561166573.jpg\"},\"percent\":100,\"originFileObj\":null,\"status\":\"done\",\"thumbUrl\":\"http:\\/\\/party.test\\/\\/upload\\/20181009\\/2018100610561166573.jpg\",\"url\":\"\\/upload\\/20181009\\/2018100610561166573.jpg\"},{\"lastModified\":1539101011542,\"lastModifiedDate\":null,\"name\":\"2018100809390289039.jpg\",\"size\":78397,\"type\":\"image\\/jpeg\",\"uid\":\"vc-upload-1539102373488-27\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181009\\/2018100809390289039.jpg\"},\"percent\":100,\"originFileObj\":null,\"status\":\"done\",\"thumbUrl\":\"http:\\/\\/party.test\\/\\/upload\\/20181009\\/2018100809390289039.jpg\",\"url\":\"\\/upload\\/20181009\\/2018100809390289039.jpg\"}],\"videos\":null,\"files\":null}'),
	(16,2,0,1,1,0,5,0,0,'视频测试',X'E8A786E9A291E6B58BE8AF95E8A786E9A291E6B58BE8AF95E8A786E9A291E6B58BE8AF95E8A786E9A291E6B58BE8AF95E8A786E9A291E6B58BE8AF95','视频测试视频测试视频测试','<br>','article_video_comment',1539102840,1539410433,1539102771,'{\"thumbnail\":\"\\/upload\\/20181009\\/IMG_20160403_131102.jpg\",\"photos\":null,\"videos\":[{\"lastModified\":1538397877000,\"lastModifiedDate\":null,\"name\":\"VID_20160404_141542.mp4\",\"size\":17726586,\"type\":\"video\\/mp4\",\"uid\":\"vc-upload-1539102373488-39\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181009\\/VID_20160404_141542.mp4\"},\"percent\":100,\"originFileObj\":null,\"status\":\"done\",\"url\":\"\\/upload\\/20181009\\/VID_20160404_141542.mp4\"}],\"files\":null}'),
	(17,2,0,1,0,0,2,0,0,'附件测试',X'E99984E4BBB6E6B58BE8AF95E99984E4BBB6E6B58BE8AF95E99984E4BBB6E6B58BE8AF95E99984E4BBB6E6B58BE8AF95E99984E4BBB6E6B58BE8AF95','附件测试附件测试附件测试附件测试','<br>','article',1539102896,1539136508,1539016475,'{\"thumbnail\":\"\\/upload\\/20181009\\/IMG_20170907_170000.jpg\",\"photos\":null,\"videos\":null,\"files\":[{\"lastModified\":1537947704000,\"lastModifiedDate\":null,\"name\":\"\\u9898.xlsx\",\"size\":9500,\"type\":\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"uid\":\"vc-upload-1539102373488-53\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181009\\/\\u9898.xlsx\"},\"percent\":100,\"originFileObj\":null,\"status\":\"done\",\"url\":\"\\/upload\\/20181009\\/\\u9898.xlsx\"},{\"lastModified\":1537947040000,\"lastModifiedDate\":null,\"name\":\"2.xlsx\",\"size\":8958,\"type\":\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"uid\":\"vc-upload-1539102373488-54\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181009\\/2.xlsx\"},\"percent\":100,\"originFileObj\":null,\"status\":\"done\",\"url\":\"\\/upload\\/20181009\\/2.xlsx\"}]}'),
	(19,2,0,1,0,0,1,0,0,'学习的标题',X'313233313233313233313233313233313233313233313233313233313233313233313233313233313233313233','人民网－人民日报','<ul><li>范德萨发达<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr></tbody></table><p><br></p></li><li>发大幅度<br></li></ul><p><br></p>','article',1539138020,1539138031,1539051593,'{\"thumbnail\":\"\\/upload\\/20181010\\/2018100809390289039.jpg\",\"photos\":[{\"lastModified\":1539102467073,\"lastModifiedDate\":null,\"name\":\"2018100610561166573.jpg\",\"size\":144667,\"type\":\"image\\/jpeg\",\"uid\":\"vc-upload-1539137771557-8\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181010\\/2018100610561166573.jpg\"},\"percent\":100,\"originFileObj\":null,\"status\":\"done\",\"thumbUrl\":\"http:\\/\\/party.test\\/\\/upload\\/20181010\\/2018100610561166573.jpg\",\"url\":\"\\/upload\\/20181010\\/2018100610561166573.jpg\"},{\"lastModified\":1539102474772,\"lastModifiedDate\":null,\"name\":\"2018100809390289039.jpg\",\"size\":78397,\"type\":\"image\\/jpeg\",\"uid\":\"vc-upload-1539137771557-10\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181010\\/2018100809390289039.jpg\"},\"percent\":100,\"originFileObj\":null,\"status\":\"done\",\"thumbUrl\":\"http:\\/\\/party.test\\/\\/upload\\/20181010\\/2018100809390289039.jpg\",\"url\":\"\\/upload\\/20181010\\/2018100809390289039.jpg\"},{\"lastModified\":1539102862323,\"lastModifiedDate\":null,\"name\":\"IMG_20160403_131102.jpg\",\"size\":7207507,\"type\":\"image\\/jpeg\",\"uid\":\"vc-upload-1539137771557-12\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181010\\/IMG_20160403_131102.jpg\"},\"percent\":100,\"originFileObj\":null,\"status\":\"done\",\"thumbUrl\":\"http:\\/\\/party.test\\/\\/upload\\/20181010\\/IMG_20160403_131102.jpg\",\"url\":\"\\/upload\\/20181010\\/IMG_20160403_131102.jpg\"}],\"videos\":null,\"files\":null}'),
	(20,1,0,1,1,0,1,0,0,'测试视频','','','<br>','article_video_comment',1539407430,1539408039,1539321023,'{\"thumbnail\":\"\\/upload\\/20181013\\/u=1999530468,344492342&fm=26&gp=0.jpg\",\"photos\":null,\"videos\":[{\"lastModified\":1539104203798,\"lastModifiedDate\":null,\"name\":\"VID_20160404_141542.mp4\",\"size\":17726586,\"type\":\"video\\/mp4\",\"uid\":\"vc-upload-1539407364100-5\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181013\\/VID_20160404_141542.mp4\"},\"percent\":100,\"originFileObj\":null,\"status\":\"done\",\"url\":\"\\/upload\\/20181013\\/VID_20160404_141542.mp4\"}],\"files\":null}'),
	(21,1,0,1,1,0,1,0,0,'测试视频','','','','article_video_comment',1539407449,1539407453,1539321023,'{\"thumbnail\":\"\\/upload\\/20181013\\/2018100903100977162.jpg\",\"photos\":null,\"videos\":[{\"lastModified\":1539104203798,\"lastModifiedDate\":null,\"name\":\"VID_20160404_141542.mp4\",\"size\":17726586,\"type\":\"video\\/mp4\",\"uid\":\"vc-upload-1539407364100-5\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181013\\/VID_20160404_141542.mp4\"},\"percent\":100,\"originFileObj\":null,\"status\":\"done\",\"url\":\"\\/upload\\/20181013\\/VID_20160404_141542.mp4\"}],\"files\":null}'),
	(23,1,0,1,1,0,1,0,0,'测试视频','','','','article_video_comment',1539407484,1539412192,1539321023,'{\"thumbnail\":\"\\/upload\\/20181013\\/1539063805001_296.jpg\",\"photos\":null,\"videos\":[{\"lastModified\":1539104203798,\"lastModifiedDate\":null,\"name\":\"VID_20160404_141542.mp4\",\"size\":17726586,\"type\":\"video\\/mp4\",\"uid\":\"vc-upload-1539407364100-5\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181013\\/VID_20160404_141542.mp4\"},\"percent\":100,\"originFileObj\":null,\"status\":\"done\",\"url\":\"\\/upload\\/20181013\\/VID_20160404_141542.mp4\"}],\"files\":null}'),
	(24,1,0,1,1,0,0,0,0,'测试视频','','','','article_video_comment',1539407488,1539407488,1539321023,'{\"thumbnail\":\"\\/upload\\/20181013\\/1539065797982_960.png\",\"photos\":null,\"videos\":[{\"lastModified\":1539104203798,\"lastModifiedDate\":null,\"name\":\"VID_20160404_141542.mp4\",\"size\":17726586,\"type\":\"video\\/mp4\",\"uid\":\"vc-upload-1539407364100-5\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181013\\/VID_20160404_141542.mp4\"},\"percent\":100,\"originFileObj\":null,\"status\":\"done\",\"url\":\"\\/upload\\/20181013\\/VID_20160404_141542.mp4\"}],\"files\":null}'),
	(25,1,0,1,1,0,0,0,0,'测试视频','','','','article_video_comment',1539407494,1539407494,1539321023,'{\"thumbnail\":\"\\/upload\\/20181013\\/MAIN201810010944344180774496118.jpg\",\"photos\":null,\"videos\":[{\"lastModified\":1539104203798,\"lastModifiedDate\":null,\"name\":\"VID_20160404_141542.mp4\",\"size\":17726586,\"type\":\"video\\/mp4\",\"uid\":\"vc-upload-1539407364100-5\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181013\\/VID_20160404_141542.mp4\"},\"percent\":100,\"originFileObj\":null,\"status\":\"done\",\"url\":\"\\/upload\\/20181013\\/VID_20160404_141542.mp4\"}],\"files\":null}'),
	(26,1,0,1,1,0,0,0,0,'测试视频','','','','article_video_comment',1539407575,1539407575,1539321023,'{\"thumbnail\":\"\\/upload\\/20181013\\/u=2902698354,1708369686&fm=26&gp=0.jpg\",\"photos\":null,\"videos\":[{\"lastModified\":1539104203798,\"lastModifiedDate\":null,\"name\":\"VID_20160404_141542.mp4\",\"size\":17726586,\"type\":\"video\\/mp4\",\"uid\":\"vc-upload-1539407364100-5\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181013\\/VID_20160404_141542.mp4\"},\"percent\":100,\"originFileObj\":null,\"status\":\"done\",\"url\":\"\\/upload\\/20181013\\/VID_20160404_141542.mp4\"}],\"files\":null}'),
	(27,1,0,1,1,0,0,0,0,'测试视频','','','','article_video_comment',1539407579,1539407579,1539321023,'{\"thumbnail\":\"\\/upload\\/20181013\\/u=2180767727,3252951452&fm=26&gp=0.jpg\",\"photos\":null,\"videos\":[{\"lastModified\":1539104203798,\"lastModifiedDate\":null,\"name\":\"VID_20160404_141542.mp4\",\"size\":17726586,\"type\":\"video\\/mp4\",\"uid\":\"vc-upload-1539407364100-5\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181013\\/VID_20160404_141542.mp4\"},\"percent\":100,\"originFileObj\":null,\"status\":\"done\",\"url\":\"\\/upload\\/20181013\\/VID_20160404_141542.mp4\"}],\"files\":null}'),
	(28,1,0,1,1,0,0,0,0,'测试视频','','','','article_video_comment',1539407583,1539407583,1539321023,'{\"thumbnail\":\"\\/upload\\/20181013\\/u=1999530468,344492342&fm=26&gp=0.jpg\",\"photos\":null,\"videos\":[{\"lastModified\":1539104203798,\"lastModifiedDate\":null,\"name\":\"VID_20160404_141542.mp4\",\"size\":17726586,\"type\":\"video\\/mp4\",\"uid\":\"vc-upload-1539407364100-5\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181013\\/VID_20160404_141542.mp4\"},\"percent\":100,\"originFileObj\":null,\"status\":\"done\",\"url\":\"\\/upload\\/20181013\\/VID_20160404_141542.mp4\"}],\"files\":null}'),
	(29,1,0,1,1,0,0,0,0,'测试','','','<br>','article_video_comment',1539407978,1539407978,1539321551,'{\"thumbnail\":\"\\/upload\\/20181013\\/u=1839349567,176626637&fm=26&gp=0.jpg\",\"photos\":null,\"videos\":[{\"lastModified\":1539407421242,\"lastModifiedDate\":null,\"name\":\"VID_20160404_141542.mp4\",\"size\":17726586,\"type\":\"video\\/mp4\",\"uid\":\"vc-upload-1539407841799-9\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181013\\/VID_20160404_141542.mp4\"},\"percent\":100,\"originFileObj\":null,\"status\":\"done\",\"url\":\"\\/upload\\/20181013\\/VID_20160404_141542.mp4\"}],\"files\":null}'),
	(30,1,0,1,1,0,0,0,0,'测试','','','<br>','article_video_comment',1539407988,1539407988,1539321551,'{\"thumbnail\":\"\\/upload\\/20181013\\/u=3107699137,3844047245&fm=26&gp=0.jpg\",\"photos\":null,\"videos\":[{\"lastModified\":1539407421242,\"lastModifiedDate\":null,\"name\":\"VID_20160404_141542.mp4\",\"size\":17726586,\"type\":\"video\\/mp4\",\"uid\":\"vc-upload-1539407841799-9\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181013\\/VID_20160404_141542.mp4\"},\"percent\":100,\"originFileObj\":null,\"status\":\"done\",\"url\":\"\\/upload\\/20181013\\/VID_20160404_141542.mp4\"}],\"files\":null}'),
	(31,1,0,1,1,0,0,0,0,'测试','','','<br>','article_video_comment',1539407993,1539407993,1539321551,'{\"thumbnail\":\"\\/upload\\/20181013\\/u=2524418101,2566313549&fm=26&gp=0.jpg\",\"photos\":null,\"videos\":[{\"lastModified\":1539407421242,\"lastModifiedDate\":null,\"name\":\"VID_20160404_141542.mp4\",\"size\":17726586,\"type\":\"video\\/mp4\",\"uid\":\"vc-upload-1539407841799-9\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181013\\/VID_20160404_141542.mp4\"},\"percent\":100,\"originFileObj\":null,\"status\":\"done\",\"url\":\"\\/upload\\/20181013\\/VID_20160404_141542.mp4\"}],\"files\":null}'),
	(32,1,0,1,1,0,0,0,0,'测试','','','<br>','article_video_comment',1539407997,1539407997,1539321551,'{\"thumbnail\":\"\\/upload\\/20181013\\/u=751419223,3036553214&fm=26&gp=0.jpg\",\"photos\":null,\"videos\":[{\"lastModified\":1539407421242,\"lastModifiedDate\":null,\"name\":\"VID_20160404_141542.mp4\",\"size\":17726586,\"type\":\"video\\/mp4\",\"uid\":\"vc-upload-1539407841799-9\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181013\\/VID_20160404_141542.mp4\"},\"percent\":100,\"originFileObj\":null,\"status\":\"done\",\"url\":\"\\/upload\\/20181013\\/VID_20160404_141542.mp4\"}],\"files\":null}');

/*!40000 ALTER TABLE `par_portal_post` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_portal_post_audit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_portal_post_audit`;

CREATE TABLE `par_portal_post_audit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) unsigned NOT NULL,
  `audit_user_id` int(11) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态;1:通过;2:不通过',
  `reason` varchar(255) DEFAULT '',
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_portal_post_audit` WRITE;
/*!40000 ALTER TABLE `par_portal_post_audit` DISABLE KEYS */;

INSERT INTO `par_portal_post_audit` (`id`, `post_id`, `audit_user_id`, `status`, `reason`, `created_at`, `updated_at`)
VALUES
	(1,5,12312,0,'',1536311556,1536311556),
	(6,7,11111111,0,'',1536314234,1536314234),
	(10,3,0,1,'',1536595466,1536595466),
	(12,11,2,2,'12332132',1538900899,1538901380);

/*!40000 ALTER TABLE `par_portal_post_audit` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_portal_post_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_portal_post_comment`;

CREATE TABLE `par_portal_post_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `comment_content` varchar(255) DEFAULT NULL,
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_portal_post_comment` WRITE;
/*!40000 ALTER TABLE `par_portal_post_comment` DISABLE KEYS */;

INSERT INTO `par_portal_post_comment` (`id`, `post_id`, `user_id`, `comment_content`, `created_at`, `updated_at`)
VALUES
	(1,15,1,'312321',0,0),
	(2,15,1,'3213',0,0),
	(3,15,2,'1321',1538403843,1538403843),
	(4,15,2,'12',1538403894,1538403894),
	(5,15,2,'1',1538403896,1538403896),
	(6,15,2,'123',1538403944,1538403944),
	(7,15,2,'312211',1538404040,1538404040),
	(8,15,2,'312312',1538404045,1538404045),
	(9,15,2,'aaa',1538404054,1538404054),
	(10,15,2,'12321',1538404215,1538404215),
	(11,15,2,'qewqewq',1538404542,1538404542),
	(12,15,2,'1',1538917645,1538917645),
	(13,18,2,'1',1539104260,1539104260),
	(14,16,2,'1312123',1539136580,1539136580),
	(15,16,2,'留下足迹',1539410453,1539410453);

/*!40000 ALTER TABLE `par_portal_post_comment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_upload_file_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_upload_file_log`;

CREATE TABLE `par_upload_file_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `url` longtext,
  `created_at` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_upload_file_log` WRITE;
/*!40000 ALTER TABLE `par_upload_file_log` DISABLE KEYS */;

INSERT INTO `par_upload_file_log` (`id`, `user_id`, `url`, `created_at`)
VALUES
	(1,123,'upload/20180821/IMG_20170907_170000.jpg',1534875131),
	(2,0,'upload/20180821/IMG_20160403_055750.jpg',1534875151),
	(3,0,'/upload/20180821/IMG_20170907_170000.jpg',1534875287),
	(4,0,'/upload/20180903/tab02.jpg',1535982818),
	(5,0,'/upload/20180903/tab02.jpg',1535982848),
	(6,0,'/upload/20180903/tab03.jpg',1535982979),
	(7,0,'/upload/20180903/tab02.jpg',1535983047),
	(8,0,'/upload/20180903/tab04.jpg',1535983079),
	(9,0,'/upload/20180903/tab03.jpg',1535983192),
	(10,0,'/upload/20180903/focusBox05.jpg',1535983306),
	(11,0,'/upload/20180903/tab02.jpg',1535983453),
	(12,0,'/upload/20180903/yzysqlc_pic.png',1535983599),
	(13,0,'/upload/20180903/tab02.jpg',1535983682),
	(14,0,'/upload/20180903/yzysqlc_pic.png',1535984074),
	(15,0,'/upload/20180904/yzysqlc_pic.png',1536029030),
	(16,0,'/upload/20180904/yzysqlc_pic.png',1536029064),
	(17,0,'/upload/20180904/yzysqlc_pic.png',1536029089),
	(18,0,'/upload/20180904/yzysqlc_pic.png',1536029152),
	(19,0,'/upload/20180904/tab02.jpg',1536029355),
	(20,0,'/upload/20180904/tab02.jpg',1536029508),
	(21,0,'/upload/20180904/yzysqlc_pic.png',1536029554),
	(22,0,'/upload/20180904/tab03.jpg',1536029587),
	(23,0,'/upload/20180904/yzysqlc_pic.png',1536030024),
	(24,0,'/upload/20180904/关键字清除记录.xlsx',1536031009),
	(25,0,'/upload/20180904/IMG_20170907_170000.jpg',1536031022),
	(26,0,'/upload/20180904/IMG_20160403_055750.jpg',1536031048),
	(27,0,'/upload/20180904/IMG_20160403_135828.jpg',1536031052),
	(28,0,'/upload/20180904/IMG_20160403_151850.jpg',1536031070),
	(29,0,'/upload/20180904/IMG_20170907_170000.jpg',1536031117),
	(30,0,'/upload/20180904/IMG_20170907_170000.jpg',1536031146),
	(31,0,'/upload/20180904/IMG_20170907_170000.jpg',1536031176),
	(32,0,'/upload/20180904/IMG_20170907_170000.jpg',1536031220),
	(33,0,'/upload/20180904/IMG_20171013_111047.jpg',1536031235),
	(34,0,'/upload/20180904/IMG_20170907_170000.jpg',1536031975),
	(35,0,'/upload/20180904/IMG_20170907_170000.jpg',1536031987),
	(36,0,'/upload/20180904/IMG_20160403_145410.jpg',1536032589),
	(37,0,'/upload/20180904/IMG_20170907_170000.jpg',1536034658),
	(38,0,'/upload/20180904/IMG_20171013_111047.jpg',1536034662),
	(39,0,'/upload/20180904/IMG_20170907_170000.jpg',1536052716),
	(40,0,'/upload/20180904/IMG_20170907_170000.jpg',1536055001),
	(41,0,'/upload/20180905/IMG_20170907_170000.jpg',1536140994),
	(42,0,'/upload/20180905/IMG_20170907_170000.jpg',1536141042),
	(43,0,'/upload/20180905/IMG_20171013_111047.jpg',1536141068),
	(44,0,'/upload/20180905/IMG_20160403_055750.jpg',1536142239),
	(45,0,'/upload/20180906/IMG_20170907_170000.jpg',1536248636),
	(46,0,'/upload/20180907/平台首页5.jpg',1536292696),
	(47,0,'/upload/20180907/平台首页5.jpg',1536305123),
	(48,0,'/upload/20180907/桌面图标.png',1536305125),
	(49,0,'/upload/20180907/平台首页5.jpg',1536305132),
	(50,0,'/upload/20180907/桌面图标.png',1536305134),
	(51,0,'/upload/20180907/平台首页5.jpg',1536305196),
	(52,0,'/upload/20180907/桌面图标.png',1536305201),
	(53,0,'/upload/20180907/平台首页5-8.jpg',1536305205),
	(54,0,'/upload/20180907/平台首页5.jpg',1536306203),
	(55,0,'/upload/20180907/表单人树形.jpg',1536306297),
	(56,0,'/upload/20180907/平台首页5.jpg',1536306493),
	(57,0,'/upload/20180907/平台首页5.jpg',1536306548),
	(58,0,'/upload/20180907/表单人树形.jpg',1536306579),
	(59,0,'/upload/20180907/群众登录首页.jpg',1536306614),
	(60,0,'/upload/20180907/登录.jpg',1536306635),
	(61,0,'/upload/20180907/平台首页5.jpg',1536306962),
	(62,0,'/upload/20180907/平台首页5-8.jpg',1536307252),
	(63,0,'/upload/20180907/平台首页5.jpg',1536307293),
	(64,0,'/upload/20180907/桌面图标.png',1536307344),
	(65,0,'/upload/20180907/平台首页5.jpg',1536307362),
	(66,0,'/upload/20180909/平台首页5.jpg',1536506833),
	(67,0,'/upload/20180909/桌面图标.png',1536506843),
	(68,0,'/upload/20180909/桌面图标.png',1536506900),
	(69,0,'/upload/20180909/平台首页5.jpg',1536506919),
	(70,0,'/upload/20180909/平台首页5-8.jpg',1536506925),
	(71,0,'/upload/20180909/平台首页5.jpg',1536506953),
	(72,0,'/upload/20180909/桌面图标.png',1536507032),
	(73,0,'/upload/20180909/平台首页5.jpg',1536507066),
	(74,0,'/upload/20180909/平台首页5.jpg',1536507096),
	(75,0,'/upload/20180909/平台首页5.jpg',1536507389),
	(76,0,'/upload/20180910/平台首页5.jpg',1536593855),
	(77,0,'/upload/20180910/平台首页5.jpg',1536594072),
	(78,0,'/upload/20180910/平台首页5.jpg',1536594172),
	(79,0,'/upload/20180910/桌面图标.png',1536594202),
	(80,0,'/upload/20180910/平台首页5-8.jpg',1536594203),
	(81,0,'/upload/20180910/平台首页5.jpg',1536594203),
	(82,0,'/upload/20180910/群众登录首页.jpg',1536594203),
	(83,0,'/upload/20180910/表单人树形.jpg',1536594203),
	(84,0,'/upload/20180910/平台首页5.jpg',1536594367),
	(85,0,'/upload/20180910/桌面图标.png',1536594373),
	(86,0,'/upload/20180910/平台首页5.jpg',1536594382),
	(87,0,'/upload/20180910/桌面图标.png',1536594576),
	(88,0,'/upload/20180910/平台首页5.jpg',1536594577),
	(89,0,'/upload/20180910/桌面图标.png',1536594588),
	(90,0,'/upload/20180910/群众登录首页.jpg',1536594701),
	(91,0,'/upload/20180910/表单人树形.jpg',1536594701),
	(92,0,'/upload/20180910/桌面图标.png',1536595133),
	(93,0,'/upload/20180910/平台首页5.jpg',1536595134),
	(94,0,'/upload/20180910/桌面图标.png',1536595246),
	(95,0,'/upload/20180910/平台首页5.jpg',1536595246),
	(96,0,'/upload/20180910/桌面图标.png',1536595344),
	(97,0,'/upload/20180910/平台首页5.jpg',1536595344),
	(98,0,'/upload/20180910/桌面图标.png',1536595463),
	(99,0,'/upload/20180910/平台首页5.jpg',1536595464),
	(100,0,'/upload/20180910/平台首页5.jpg',1536596209),
	(101,0,'/upload/20180910/题.xlsx',1536596368),
	(102,0,'/upload/20180910/题.xlsx',1536596498),
	(103,0,'/upload/20180912/IMG_20160403_055750.jpg',1536733157),
	(104,0,'/upload/20180912/IMG_20170907_170000.jpg',1536733157),
	(105,0,'/upload/20180912/IMG_20170907_170000.jpg',1536757975),
	(106,0,'/upload/20180912/IMG_20171013_111047.jpg',1536758038),
	(107,0,'/upload/20180912/IMG_20170907_170000.jpg',1536758038),
	(108,0,'/upload/20180912/IMG_20171013_111047.jpg',1536758823),
	(109,0,'/upload/20180912/IMG_20170907_170000.jpg',1536758823),
	(110,0,'/upload/20180912/题.xlsx',1536762692),
	(111,0,'/upload/20180912/题.xlsx',1536762835),
	(112,0,'/upload/20180912/题.xlsx',1536762898),
	(113,0,'/upload/20180912/题.xlsx',1536762905),
	(114,0,'/upload/20180918/IMG_20170907_170000.jpg',1537239839),
	(115,0,'/upload/20180918/IMG_20170907_170000.jpg',1537239874),
	(116,0,'/upload/20180918/IMG_20170907_170000.jpg',1537239954),
	(117,0,'/upload/20180918/IMG_20170907_170000.jpg',1537239971),
	(118,0,'/upload/20180918/IMG_20170907_170000.jpg',1537239980),
	(119,0,'/upload/20180918/IMG_20170907_170000.jpg',1537240013),
	(120,0,'/upload/20180918/IMG_20170907_170000.jpg',1537240123),
	(121,0,'/upload/20180918/IMG_20170907_170000.jpg',1537240132),
	(122,0,'/upload/20180918/IMG_20170907_170000.jpg',1537240155),
	(123,0,'/upload/20180918/IMG_20160403_135828.jpg',1537240580),
	(124,0,'/upload/20180919/IMG_20160403_145358.jpg',1537328720),
	(125,0,'/upload/20180919/IMG_20160403_151850.jpg',1537328726),
	(126,0,'/upload/20180919/IMG_20160403_135826.jpg',1537328731),
	(127,0,'/upload/20180919/IMG_20160403_135828.jpg',1537328734),
	(128,0,'/upload/20180919/VID_20160404_141542.mp4',1537328740),
	(129,0,'/upload/20180919/IMG_20160403_130841.jpg',1537328746),
	(130,0,'/upload/20180919/IMG_20171013_111047.jpg',1537328756),
	(131,0,'/upload/20180919/IMG_20160403_055750.jpg',1537328756),
	(132,0,'/upload/20180919/IMG_20170907_170000.jpg',1537328756),
	(133,0,'/upload/20180919/IMG_20170907_170000.jpg',1537328787),
	(134,0,'/upload/20180919/IMG_20160404_175519.jpg',1537328800),
	(135,0,'/upload/20180919/IMG_20160404_180226.jpg',1537328806),
	(136,0,'/upload/20180919/IMG_20160403_145358.jpg',1537328810),
	(137,0,'/upload/20180919/IMG_20171013_111047.jpg',1537328814),
	(138,0,'/upload/20180919/IMG_20160404_180226.jpg',1537328825),
	(139,0,'/upload/20180919/IMG_20160404_180229.jpg',1537328825),
	(140,0,'/upload/20180919/IMG_20160404_180222.jpg',1537328825),
	(141,0,'/upload/20180919/IMG_20160404_180224.jpg',1537328825),
	(142,0,'/upload/20180926/题.xlsx',1537946927),
	(143,0,'/upload/20180926/题.xlsx',1537946939),
	(144,0,'/upload/20180926/题.xlsx',1537946957),
	(145,0,'/upload/20180926/题.xlsx',1537947007),
	(146,0,'/upload/20180926/2.xlsx',1537947040),
	(147,0,'/upload/20180926/题.xlsx',1537947688),
	(148,0,'/upload/20180926/题.xlsx',1537947704),
	(149,0,'/upload/20180927/IMG_20170907_170000.jpg',1538013601),
	(150,0,'/upload/20180927/IMG_20160403_151850.jpg',1538018906),
	(151,0,'/upload/20180927/IMG_20171013_111047.jpg',1538019050),
	(152,0,'/upload/20180927/IMG_20170907_170000.jpg',1538019050),
	(153,0,'/upload/20180927/IMG_20171013_111047.jpg',1538019073),
	(154,0,'/upload/20180927/IMG_20170907_170000.jpg',1538019073),
	(155,0,'/upload/20180927/IMG_20170907_170000.jpg',1538019119),
	(156,0,'/upload/20180927/IMG_20171013_111047.jpg',1538019119),
	(157,0,'/upload/20180927/IMG_20171013_111047.jpg',1538019264),
	(158,0,'/upload/20180927/IMG_20170907_170000.jpg',1538019264),
	(159,0,'/upload/20180927/IMG_20170907_170000.jpg',1538019321),
	(160,0,'/upload/20180927/IMG_20171013_111047.jpg',1538019412),
	(161,0,'/upload/20180927/IMG_20170907_170000.jpg',1538019412),
	(162,0,'/upload/20180927/IMG_20170907_170000.jpg',1538019440),
	(163,0,'/upload/20180927/IMG_20171013_111047.jpg',1538019440),
	(164,0,'/upload/20180927/IMG_20170907_170000.jpg',1538019590),
	(165,0,'/upload/20180927/IMG_20171013_111047.jpg',1538019590),
	(166,0,'/upload/20180927/IMG_20170907_170000.jpg',1538019680),
	(167,0,'/upload/20180927/IMG_20171013_111047.jpg',1538019680),
	(168,0,'/upload/20180927/IMG_20170907_170000.jpg',1538019943),
	(169,0,'/upload/20180927/IMG_20171013_111047.jpg',1538019943),
	(170,0,'/upload/20180927/IMG_20160403_055750.jpg',1538020176),
	(171,0,'/upload/20180927/IMG_20170907_170000.jpg',1538020346),
	(172,0,'/upload/20180927/IMG_20170907_170000.jpg',1538020558),
	(173,0,'/upload/20180927/IMG_20171013_111047.jpg',1538020558),
	(174,0,'/upload/20180927/IMG_20160403_055750.jpg',1538020563),
	(175,0,'/upload/20180927/IMG_20160403_145358.jpg',1538030017),
	(176,0,'/upload/20180927/IMG_20170907_170000.jpg',1538032180),
	(177,0,'/upload/20180927/IMG_20160403_145358.jpg',1538032184),
	(178,0,'/upload/20180927/IMG_20170907_170000.jpg',1538032491),
	(179,0,'/upload/20180927/IMG_20170907_170000.jpg',1538032557),
	(180,0,'/upload/20180927/IMG_20170907_170000.jpg',1538032818),
	(181,0,'/upload/20180927/IMG_20160403_151850.jpg',1538032823),
	(182,0,'/upload/20180927/IMG_20170907_170000.jpg',1538032857),
	(183,0,'/upload/20180927/IMG_20160403_151850.jpg',1538032902),
	(184,0,'/upload/20180927/IMG_20160403_055750.jpg',1538032949),
	(185,0,'/upload/20180927/IMG_20160403_151850.jpg',1538032984),
	(186,0,'/upload/20180927/IMG_20160403_135829.jpg',1538034044),
	(187,0,'/upload/20181001/IMG_20170907_170000.jpg',1538378775),
	(188,0,'/upload/20181001/IMG_20170907_170000.jpg',1538378794),
	(189,0,'/upload/20181001/IMG_20170907_170000.jpg',1538378872),
	(190,0,'/upload/20181001/IMG_20170907_170000.jpg',1538391149),
	(191,0,'/upload/20181001/IMG_20160403_131102.jpg',1538391217),
	(192,0,'/upload/20181001/IMG_20170907_170000.jpg',1538393159),
	(193,0,'/upload/20181001/IMG_20170907_170000.jpg',1538393182),
	(194,0,'/upload/20181001/IMG_20170907_170000.jpg',1538395758),
	(195,0,'/upload/20181001/IMG_20170907_170000.jpg',1538397865),
	(196,0,'/upload/20181001/VID_20160404_141542.mp4',1538397877),
	(197,0,'/upload/20181001/IMG_20171013_111047.jpg',1538399040),
	(198,0,'/upload/20181001/IMG_20170907_170000.jpg',1538399040),
	(199,0,'/upload/20181002/IMG_20170907_170000.jpg',1538469494),
	(200,0,'/upload/20181002/IMG_20170907_170000.jpg',1538472883),
	(201,0,'/upload/20181002/IMG_20171013_111047.jpg',1538472885),
	(202,0,'/upload/20181002/IMG_20170907_170000.jpg',1538472946),
	(203,0,'/upload/20181002/IMG_20160403_055750.jpg',1538472950),
	(204,0,'/upload/20181007/IMG_0009.JPG',1538874939),
	(205,0,'/upload/20181007/IMG_0003.JPG',1538874965),
	(206,0,'/upload/20181007/IMG_0013.JPG',1538874975),
	(207,0,'/upload/20181007/IMG_0009.JPG',1538875075),
	(208,0,'/upload/20181007/IMG_0013.JPG',1538875075),
	(209,0,'/upload/20181007/IMG_0003.JPG',1538875075),
	(210,0,'/upload/20181007/IMG_0003.JPG',1538876079),
	(211,0,'/upload/20181007/IMG_0003.JPG',1538876267),
	(212,0,'/upload/20181007/IMG_0066.JPG',1538876537),
	(213,0,'/upload/20181007/IMG_0003.JPG',1538883057),
	(214,0,'/upload/20181007/IMG_0009.JPG',1538883057),
	(215,0,'/upload/20181007/IMG_0060.JPG',1538884307),
	(216,0,'/upload/20181007/IMG_0061.JPG',1538884307),
	(217,0,'/upload/20181007/IMG_0062.JPG',1538884307),
	(218,0,'/upload/20181007/IMG_0009.JPG',1538897511),
	(219,0,'/upload/20181007/IMG_0003.JPG',1538897511),
	(220,0,'/upload/20181007/IMG_0003.JPG',1538899240),
	(221,0,'/upload/20181007/IMG_0003.JPG',1538899247),
	(222,0,'/upload/20181007/IMG_0003.JPG',1538899288),
	(223,0,'/upload/20181007/IMG_0003.JPG',1538899391),
	(224,0,'/upload/20181007/IMG_0003.JPG',1538899556),
	(225,0,'/upload/20181007/IMG_0003.JPG',1538899585),
	(226,0,'/upload/20181007/IMG_0003.JPG',1538899592),
	(227,0,'/upload/20181007/题.xlsx',1538906780),
	(228,0,'/upload/20181007/题.xlsx',1538907136),
	(229,0,'/upload/20181007/题.xlsx',1538907404),
	(230,0,'/upload/20181007/题.xlsx',1538907597),
	(231,0,'/upload/20181007/IMG_0069.JPG',1538908423),
	(232,0,'/upload/20181007/IMG_0003.JPG',1538917596),
	(233,0,'/upload/20181008/发票.pdf',1539017906),
	(234,0,'/upload/20181009/IMG_1377.JPG',1539095272),
	(235,0,'/upload/20181009/IMG_1380.JPG',1539095275),
	(236,0,'/upload/20181009/IMG_1371.JPG',1539095545),
	(237,0,'/upload/20181009/MAIN201810010944344180774496118.jpg',1539099005),
	(238,0,'/upload/20181009/MAIN201809301444271318855562880.jpg',1539099532),
	(239,0,'/upload/20181009/MAIN201810010944445141036720515.jpg',1539100285),
	(240,0,'/upload/20181009/1539065797982_960.png',1539100611),
	(241,0,'/upload/20181009/1539063805001_296.jpg',1539100681),
	(242,0,'/upload/20181009/2018100820584862363.jpg',1539100753),
	(243,0,'/upload/20181009/2018100903100977162.jpg',1539100814),
	(244,0,'/upload/20181009/2018100514592797646.jpg',1539100896),
	(245,0,'/upload/20181009/2018100610561166573.jpg',1539100900),
	(246,0,'/upload/20181009/2018100514592797646.jpg',1539100952),
	(247,0,'/upload/20181009/2018100809390289039.jpg',1539101059),
	(248,0,'/upload/20181009/2018100515030322214.jpg',1539101378),
	(249,0,'/upload/20181009/2018100216474371255.jpg',1539101552),
	(250,0,'/upload/20181009/2018100514592797646.jpg',1539101555),
	(251,0,'/upload/20181009/2018100515030322214.jpg',1539101557),
	(252,0,'/upload/20181009/2018100610561166573.jpg',1539101560),
	(253,0,'/upload/20181009/2018100809390289039.jpg',1539101562),
	(254,0,'/upload/20181009/2018100514592797646.jpg',1539101606),
	(255,0,'/upload/20181009/2018100514592797646.jpg',1539101738),
	(256,0,'/upload/20181009/2018100216474371255.jpg',1539101812),
	(257,0,'/upload/20181009/2018100216474371255.jpg',1539101845),
	(258,0,'/upload/20181009/2018100216474371255.jpg',1539101874),
	(259,0,'/upload/20181009/2018100216474371255.jpg',1539102045),
	(260,0,'/upload/20181009/2018100514592797646.jpg',1539102052),
	(261,0,'/upload/20181009/2018100610561166573.jpg',1539102056),
	(262,0,'/upload/20181009/2018100216474371255.jpg',1539102104),
	(263,0,'/upload/20181009/2018100216474371255.jpg',1539102109),
	(264,0,'/upload/20181009/2018100514592797646.jpg',1539102112),
	(265,0,'/upload/20181009/2018100515030322214.jpg',1539102114),
	(266,0,'/upload/20181009/2018100610561166573.jpg',1539102117),
	(267,0,'/upload/20181009/2018100610561166573.jpg',1539102119),
	(268,0,'/upload/20181009/2018100216474371255.jpg',1539102229),
	(269,0,'/upload/20181009/2018100514592797646.jpg',1539102231),
	(270,0,'/upload/20181009/2018100216474371255.jpg',1539102385),
	(271,0,'/upload/20181009/2018100216474371255.jpg',1539102447),
	(272,0,'/upload/20181009/2018100514592797646.jpg',1539102450),
	(273,0,'/upload/20181009/2018100515030322214.jpg',1539102464),
	(274,0,'/upload/20181009/2018100610561166573.jpg',1539102467),
	(275,0,'/upload/20181009/2018100809390289039.jpg',1539102469),
	(276,0,'/upload/20181009/2018100809390289039.jpg',1539102474),
	(277,0,'/upload/20181009/newspic01.png',1539102500),
	(278,0,'/upload/20181009/VID_20160404_141542.mp4',1539102835),
	(279,0,'/upload/20181009/IMG_20160403_131102.jpg',1539102862),
	(280,0,'/upload/20181009/IMG_20170907_170000.jpg',1539102887),
	(281,0,'/upload/20181009/2.xlsx',1539102895),
	(282,0,'/upload/20181009/题.xlsx',1539102895),
	(283,0,'/upload/20181009/2018100903100977162.jpg',1539103692),
	(284,0,'/upload/20181009/2018100515030322214.jpg',1539103731),
	(285,0,'/upload/20181009/VID_20160404_141542.mp4',1539104203),
	(286,0,'/upload/20181009/newspic01.png',1539104242),
	(287,0,'/upload/20181010/2018100903100977162.jpg',1539136754),
	(288,0,'/upload/20181010/2018100809390289039.jpg',1539137971),
	(289,0,'/upload/20181010/2018100610561166573.jpg',1539137976),
	(290,0,'/upload/20181010/2018100809390289039.jpg',1539137979),
	(291,0,'/upload/20181010/IMG_20160403_131102.jpg',1539137981),
	(292,0,'/upload/20181010/1539063805001_296.jpg',1539138174),
	(293,0,'/upload/20181013/wxzflc_img.png',1539401463),
	(294,0,'/upload/20181013/wxzflc_img.png',1539401592),
	(295,0,'/upload/20181013/wxzflc_img.png',1539401607),
	(296,0,'/upload/20181013/tz_ico08.png',1539401755),
	(297,0,'/upload/20181013/wdxx_ico03.png',1539402194),
	(298,0,'/upload/20181013/tz_ico07.png',1539402284),
	(299,0,'/upload/20181013/tz_ico01.png',1539402295),
	(300,0,'/upload/20181013/wdxx_ico01.png',1539402313),
	(301,0,'/upload/20181013/xjpic.do.jpeg',1539402514),
	(302,0,'/upload/20181013/timg.jpeg',1539402683),
	(303,0,'/upload/20181013/u=3866671695,547053355&fm=11&gp=0.jpg',1539402748),
	(304,0,'/upload/20181013/u=2200999615,1784198098&fm=26&gp=0.jpg',1539402767),
	(305,0,'/upload/20181013/u=3176748584,2150927073&fm=26&gp=0.jpg',1539402790),
	(306,0,'/upload/20181013/题.xlsx',1539407089),
	(307,0,'/upload/20181013/menu_dj.png_128x128.png',1539407132),
	(308,0,'/upload/20181013/VID_20160404_141542.mp4',1539407421),
	(309,0,'/upload/20181013/2018100903100977162.jpg',1539407447),
	(310,0,'/upload/20181013/2018100610561166573.jpg',1539407464),
	(311,0,'/upload/20181013/1539063805001_296.jpg',1539407483),
	(312,0,'/upload/20181013/1539065797982_960.png',1539407487),
	(313,0,'/upload/20181013/MAIN201810010944344180774496118.jpg',1539407493),
	(314,0,'/upload/20181013/u=2902698354,1708369686&fm=26&gp=0.jpg',1539407574),
	(315,0,'/upload/20181013/u=2180767727,3252951452&fm=26&gp=0.jpg',1539407578),
	(316,0,'/upload/20181013/u=1999530468,344492342&fm=26&gp=0.jpg',1539407582),
	(317,0,'/upload/20181013/u=1839349567,176626637&fm=26&gp=0.jpg',1539407963),
	(318,0,'/upload/20181013/VID_20160404_141542.mp4',1539407977),
	(319,0,'/upload/20181013/u=3107699137,3844047245&fm=26&gp=0.jpg',1539407988),
	(320,0,'/upload/20181013/u=2524418101,2566313549&fm=26&gp=0.jpg',1539407992),
	(321,0,'/upload/20181013/u=751419223,3036553214&fm=26&gp=0.jpg',1539407996),
	(322,0,'/upload/20181013/u=1999530468,344492342&fm=26&gp=0.jpg',1539408038),
	(323,0,'/upload/20181013/u=2180767727,3252951452&fm=26&gp=0.jpg',1539411145),
	(324,0,'/upload/20181013/timg.jpeg',1539411731);

/*!40000 ALTER TABLE `par_upload_file_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_user`;

CREATE TABLE `par_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '0:超级管理员;1:单位超级管理员;2:领导;3:党员;4:群众',
  `department_id` int(11) unsigned NOT NULL,
  `name` varchar(11) NOT NULL DEFAULT '',
  `sex` varchar(11) DEFAULT '',
  `cellphone` varchar(20) DEFAULT NULL,
  `duty` varchar(255) DEFAULT NULL COMMENT '职务',
  `user_excerpt` longtext COMMENT '人员简介',
  `user_login` varchar(20) NOT NULL DEFAULT '',
  `user_password` varchar(20) NOT NULL DEFAULT '',
  `access_token` longtext COMMENT '每次登陆更新',
  `borned_at` int(11) DEFAULT NULL COMMENT '生日',
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  `more` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_user` WRITE;
/*!40000 ALTER TABLE `par_user` DISABLE KEYS */;

INSERT INTO `par_user` (`id`, `type`, `department_id`, `name`, `sex`, `cellphone`, `duty`, `user_excerpt`, `user_login`, `user_password`, `access_token`, `borned_at`, `created_at`, `updated_at`, `more`)
VALUES
	(1,0,0,'超级管理员','男',NULL,'管理员','系统超级管理员','admin','bd417e904f9c00d3','eyJpdiI6IjFLVTBwZ2RVOHM0MWNMWVZpTzJYWHc9PSIsInZhbHVlIjoiK1VpanNXRGZGaStzZkd4bVdnQ0hBUDBDa1JMSjlHQTA4aVwvT0g1aVZndElkcnVMS0JZM09xNFd5cDZRbmVTRytCQlJVTlFBVEs4OUdFcG5IbGZ6ZmRhME9rRktHZkZGaWJsRlBKK2VBM1U3NUhDNzRWM2daZkRpdTJBZkplQnBESmJMYmlyRzNFeHhScDQ2aWRsU2hWdGYwb3ZZQzErOTEzTGt6RGVGWURCcTkrXC8wYnRuRU9zQUU2bThLeFI1cGpwbCtMeE9yS2pUbVVHdFdJM0dQb1Q1S3k0bll4dlVkWFVWWVVHdmNGMWthVjVzWlFsaHIrTWQwa3lcL2ZiQW5FTThUYXBMb3E1emZVdjJoSlFtaloyb1ArOGJsVzkzRlpwanpsRHVNb3hZam9IZHpDR0oyTkh0ZkR6aUtLNUNXSDhRazFPTENiTUdFR1hENnl1RDc2OENsWEt3MVdwNUV4aDllRFdwUzFrOEM5NktNcWxld1dDbDk3a1NUYlZoUCtLSmp5QnN0Mk5GMENDZUNSTjg3N2JvNkgyQTBLV2pOQng0K1NjYTNoVUdodz0iLCJtYWMiOiI2NDliMmRlZDUyNDU2ZTRmYzMyOGI5MmNkZTk5OGJkNjJmOTM3MjcwNjE5MWVkMDc4NmUyMjA3M2Y4MTI2N2Y5In0=',NULL,0,1539412355,'{\"thumbnail\":\"\\/upload\\/20181013\\/timg.jpeg\"}'),
	(2,2,1,'李静波','女','15598259922','工程师','是一名程序员。','leader','bd417e904f9c00d3','eyJpdiI6IkluZFJpU0M2VlhqRnhhYlVWT3RvUlE9PSIsInZhbHVlIjoiUkw4VnI5blgrOElJWWlKZHhjSHVTTk5FWld0NzR6dXVaajhWWnpJd3BCazRuUFBvOSs5dzhFc1NmQUZhMkl3aksrSTN5QlIzRkNJTVdxR1wvc1BHYUIyVVE3dWZ3YitzTGJOU3dua3g3YkpGTkt6ZnlNQWdaMEpNbWw0MWRrS3FcLzZ1RXdaQ2NOK3FDTlN1SVlGK3FKQXVmYXgrY2ZIMkJMeEdObEh0WHRxelN0dFl5MW1Gb2VRUXZKekR3WmNzZ2FHVUdMN2g0ckpCb3IwWXpDRU5oUnNVSW11N05tZm9FcFI5dEVTOE5nT1NENTJhdXJTcEtwdHF6QzlwUDNuMWpEdnhJUkxZRm9QKzhFQTkwZU1YVVRoQ2hwSHdSRlppYlBwWkxDUjRiVWthZTJtcmpOa21qUHBBeWVvSzY4WHpKNTdmbDNvUUZrMUJaK2VKazdDclpWZUtNRGNxM3A4M1JhS1hZZ0VkVWJ3WFBqTHFuZmd6NTJia1lnWVlWQ0hFbnVXOVI3dFY5Uk95YlhQanNUb3F3YVdpOFhhZUFyanBCZHNHWDMzalROUVAwPSIsIm1hYyI6ImMzMTg2ODBmMTYxMjUxNzg3N2RkYTk1NTgwZTI3OGM0YWJmYmM2MTA1YWRlNjQwNDdhZDQ0YTI1MGZjYTgzNTkifQ==',NULL,0,1539412721,'{\"thumbnail\":\"\\/upload\\/20181013\\/timg.jpeg\"}'),
	(5,2,2,'张三','男','15598259922','办公室主任','测试领导','party','bd417e904f9c00d3','eyJpdiI6Ilp3bytDS3A0dmFCMjBCOStwY1h6RHc9PSIsInZhbHVlIjoidStjaTN4dFBSRWVYT3lZS1pmVm13eWVSQmZKMW9rSGVsVTVTMWVtRGtpdmJsMW5id1poclwva2tCSVVkcEhmaE1wXC9UcXZlVURkNlZocDZlbzBUU1pKZDhjRTAraCs3elRNdkZKMTRuTFRlUGpzc0dVR2xlaU1qQ2l5bmduWFRyQmxhb1VJVTVcL3NNdVJOYVB2VlwvUHFQVXV6a29mTlo2SHFWcENockVWMDQwXC8yVEFxXC9rcjBJUEhFb0UxTk9aZ2dFaDNSc2M1aDAzSzNzMk03YkRiYWhlRmV5dEpMcUNpNFdmOXdMNlk0VzlWMTc5QlZZV0lCR1RCbGRlRDV2aUF3UGZTQVFRSm5TOWVxUTk4bTJoZ2w3bEN5eElyZUhcL3c1UmtVcVhmVXlxTGNPdlwvcVhQUHlodzl1MnhQYmZcL1g3Qk5cL2RiXC9zbHBaVHg0VnZ4Rk9DNnUwR3hLS3pvVGl5aTc0YkVvSkphNTFUbmk0U1wvcWVaZU4xY0lobXZ5QkJpc3hEa1ozVHlZXC9hclhLejZJRmtOeVRZN090MjYrbGZodk04MHlkVVhiY3RzZGs9IiwibWFjIjoiMjQ5YWZhNzhkMDE3NGY5Yjg4Y2ZjYmVjM2U4ZjUzZGMwZGUzN2M1ODg0NzkyYWVkYWZhZjI2YmNiNWEzYWY5NSJ9',NULL,0,1539402760,'{\"thumbnail\":\"\\/upload\\/20181013\\/u=3866671695,547053355&fm=11&gp=0.jpg\"}'),
	(9,2,2,'李四','女','12312','办公室委员','测试领导','lisi','bd417e904f9c00d3',NULL,321,0,1539402776,'{\"thumbnail\":\"\\/upload\\/20181013\\/u=2200999615,1784198098&fm=26&gp=0.jpg\"}'),
	(10,2,1,'王五','',NULL,'经理','测试领导','4','bd417e904f9c00d3',NULL,NULL,1537169358,1539402798,'{\"thumbnail\":\"\\/upload\\/20181013\\/u=3176748584,2150927073&fm=26&gp=0.jpg\"}');

/*!40000 ALTER TABLE `par_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_user_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_user_comment`;

CREATE TABLE `par_user_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发起人id',
  `need_audit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `comment_title` varchar(255) DEFAULT NULL,
  `comment_content` text,
  `more` text,
  `leave_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_user_comment` WRITE;
/*!40000 ALTER TABLE `par_user_comment` DISABLE KEYS */;

INSERT INTO `par_user_comment` (`id`, `user_id`, `need_audit`, `comment_title`, `comment_content`, `more`, `leave_at`, `created_at`, `updated_at`)
VALUES
	(1,1,0,'11','22',NULL,NULL,1,2),
	(8,0,0,'0','0','{\"thumbnail\":null,\"photos\":null,\"videos\":null,\"files\":null}',NULL,1536758591,1536758591),
	(9,9,0,'31222','<h1>32131122</h1>','{\"files\":[{\"uid\":\"\\/upload\\/20180912\\/IMG_20170907_170000.jpg\",\"name\":\"IMG_20170907_170000.jpg\",\"size\":5127998,\"type\":\"image\\/jpeg\",\"status\":\"done\",\"url\":\"\\/upload\\/20180912\\/IMG_20170907_170000.jpg\"},{\"uid\":\"\\/upload\\/20180912\\/IMG_20171013_111047.jpg\",\"name\":\"IMG_20171013_111047.jpg\",\"size\":4245915,\"type\":\"image\\/jpeg\",\"status\":\"done\",\"url\":\"\\/upload\\/20180912\\/IMG_20171013_111047.jpg\"}]}',NULL,1536758805,1536758805),
	(10,9,0,'0','0','{\"files\":[{\"uid\":\"\\/upload\\/20180912\\/IMG_20170907_170000.jpg\",\"name\":\"IMG_20170907_170000.jpg\",\"size\":5127998,\"type\":\"image\\/jpeg\",\"status\":\"done\",\"url\":\"\\/upload\\/20180912\\/IMG_20170907_170000.jpg\"},{\"uid\":\"\\/upload\\/20180912\\/IMG_20171013_111047.jpg\",\"name\":\"IMG_20171013_111047.jpg\",\"size\":4245915,\"type\":\"image\\/jpeg\",\"status\":\"done\",\"url\":\"\\/upload\\/20180912\\/IMG_20171013_111047.jpg\"}]}',NULL,1536758826,1536758826),
	(11,0,0,'0','0','{\"files\":[{\"uid\":\"\\/upload\\/20180912\\/IMG_20170907_170000.jpg\",\"name\":\"IMG_20170907_170000.jpg\",\"size\":5127998,\"type\":\"image\\/jpeg\",\"status\":\"done\",\"url\":\"\\/upload\\/20180912\\/IMG_20170907_170000.jpg\"},{\"uid\":\"\\/upload\\/20180912\\/IMG_20171013_111047.jpg\",\"name\":\"IMG_20171013_111047.jpg\",\"size\":4245915,\"type\":\"image\\/jpeg\",\"status\":\"done\",\"url\":\"\\/upload\\/20180912\\/IMG_20171013_111047.jpg\"}]}',NULL,1536758844,1536758844),
	(12,0,1,'0','0','{\"files\":[{\"uid\":\"\\/upload\\/20180912\\/IMG_20170907_170000.jpg\",\"name\":\"IMG_20170907_170000.jpg\",\"size\":5127998,\"type\":\"image\\/jpeg\",\"status\":\"done\",\"url\":\"\\/upload\\/20180912\\/IMG_20170907_170000.jpg\"},{\"uid\":\"\\/upload\\/20180912\\/IMG_20171013_111047.jpg\",\"name\":\"IMG_20171013_111047.jpg\",\"size\":4245915,\"type\":\"image\\/jpeg\",\"status\":\"done\",\"url\":\"\\/upload\\/20180912\\/IMG_20171013_111047.jpg\"}]}',1536845224,1536758864,1536758864),
	(14,9,1,'321','321','{\"files\":null}',1536760316,1536760317,1536760317),
	(18,2,1,'测试留言11','11111\nfdfdsfdas\nfdafdafdaf\nfdsafdsaf\nfasdfadsf\nfasdfdsaf\nfafdsafdas\nfdasfdsa','{\"files\":[{\"lastModified\":1523412588000,\"lastModifiedDate\":\"2018-04-11T02:09:48.000Z\",\"name\":\"IMG_0003.JPG\",\"size\":2616894,\"type\":\"image\\/jpeg\",\"uid\":\"vc-upload-1538875033444-3\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181007\\/IMG_0003.JPG\"},\"percent\":100,\"originFileObj\":{\"uid\":\"vc-upload-1538875033444-3\"},\"status\":\"done\",\"url\":\"\\/upload\\/20181007\\/IMG_0003.JPG\"},{\"lastModified\":1523412584000,\"lastModifiedDate\":\"2018-04-11T02:09:44.000Z\",\"name\":\"IMG_0009.JPG\",\"size\":1950162,\"type\":\"image\\/jpeg\",\"uid\":\"vc-upload-1538875033444-4\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181007\\/IMG_0009.JPG\"},\"percent\":100,\"originFileObj\":{\"uid\":\"vc-upload-1538875033444-4\"},\"status\":\"done\",\"url\":\"\\/upload\\/20181007\\/IMG_0009.JPG\"},{\"lastModified\":1523412351000,\"lastModifiedDate\":\"2018-04-11T02:05:51.000Z\",\"name\":\"IMG_0066.JPG\",\"size\":1493920,\"type\":\"image\\/jpeg\",\"uid\":\"vc-upload-1538876484756-5\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181007\\/IMG_0066.JPG\"},\"percent\":100,\"originFileObj\":{\"uid\":\"vc-upload-1538876484756-5\"},\"status\":\"done\",\"url\":\"\\/upload\\/20181007\\/IMG_0066.JPG\"}]}',1538876702,1538875079,1538876703),
	(21,2,1,'测试推送','111','{\"files\":[{\"lastModified\":1538961520631,\"lastModifiedDate\":\"2018-10-08T01:18:40.631Z\",\"name\":\"\\u53d1\\u7968.pdf\",\"size\":24548,\"type\":\"application\\/pdf\",\"uid\":\"vc-upload-1539015606051-7\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181008\\/\\u53d1\\u7968.pdf\"},\"percent\":100,\"originFileObj\":{\"uid\":\"vc-upload-1539015606051-7\"},\"status\":\"done\",\"url\":\"\\/upload\\/20181008\\/\\u53d1\\u7968.pdf\"}]}',1539017481,1539018029,1539018029),
	(24,2,1,'测试推送','111','{\"files\":[{\"lastModified\":1538961520631,\"lastModifiedDate\":\"2018-10-08T01:18:40.631Z\",\"name\":\"\\u53d1\\u7968.pdf\",\"size\":24548,\"type\":\"application\\/pdf\",\"uid\":\"vc-upload-1539015606051-7\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181008\\/\\u53d1\\u7968.pdf\"},\"percent\":100,\"originFileObj\":{\"uid\":\"vc-upload-1539015606051-7\"},\"status\":\"done\",\"url\":\"\\/upload\\/20181008\\/\\u53d1\\u7968.pdf\"}]}',1539017481,1539018084,1539018084),
	(25,2,1,'测试新的短信','111','{\"files\":null}',1539142024,1539055631,1539055631),
	(26,2,1,'再次测试的留言','法师打发多少','{\"files\":null}',1539148160,1539061763,1539061763),
	(27,2,1,'测试的留言123123123','今天来现场测试了','{\"files\":[{\"lastModified\":1539103692440,\"lastModifiedDate\":null,\"name\":\"2018100903100977162.jpg\",\"size\":121503,\"type\":\"image\\/jpeg\",\"uid\":\"vc-upload-1539136410817-6\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181010\\/2018100903100977162.jpg\"},\"percent\":100,\"originFileObj\":null,\"status\":\"done\",\"url\":\"\\/upload\\/20181010\\/2018100903100977162.jpg\"}]}',1539136745,1539136778,1539136778),
	(28,2,1,'测试','11','{\"files\":null}',1539404491,1539404500,1539404500),
	(29,2,1,'测试','11','{\"files\":null}',1539404491,1539404504,1539404504),
	(30,2,1,'测试留言','留言的内容1231321','{\"files\":null}',1539324154,1539410571,1539410571);

/*!40000 ALTER TABLE `par_user_comment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_user_comment_audit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_user_comment_audit`;

CREATE TABLE `par_user_comment_audit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) DEFAULT NULL,
  `audit_user_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '审核状态;1:通过;2:不通过',
  `reason` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_user_comment_audit` WRITE;
/*!40000 ALTER TABLE `par_user_comment_audit` DISABLE KEYS */;

INSERT INTO `par_user_comment_audit` (`id`, `comment_id`, `audit_user_id`, `status`, `reason`, `created_at`, `updated_at`)
VALUES
	(2,12,2,0,NULL,1,1),
	(3,14,2,0,'123',1536760317,1538880220),
	(5,16,2,0,NULL,1537251696,1537251696),
	(6,17,2,0,NULL,1537378722,1537378722),
	(12,19,2,0,NULL,1538877618,1538877618),
	(13,20,2,0,NULL,1538877634,1538877634),
	(14,18,2,2,'3123',1538880289,1538880307),
	(17,21,2,0,NULL,1539018029,1539018029),
	(20,24,2,1,NULL,1539018084,1539018237),
	(21,25,2,0,NULL,1539055631,1539055631),
	(22,26,2,1,NULL,1539061763,1539061812),
	(23,27,2,1,NULL,1539136778,1539137051),
	(24,28,2,0,NULL,1539404500,1539404500),
	(25,29,2,1,NULL,1539404504,1539410660),
	(26,30,2,0,NULL,1539410571,1539410571);

/*!40000 ALTER TABLE `par_user_comment_audit` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_user_comment_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_user_comment_user`;

CREATE TABLE `par_user_comment_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_user_comment_user` WRITE;
/*!40000 ALTER TABLE `par_user_comment_user` DISABLE KEYS */;

INSERT INTO `par_user_comment_user` (`id`, `comment_id`, `user_id`, `created_at`, `updated_at`)
VALUES
	(1,1,1,1,1),
	(2,8,2,1536758591,1536758591),
	(3,8,5,1536758591,1536758591),
	(4,9,2,1536758805,1536758805),
	(5,9,5,1536758805,1536758805),
	(6,10,2,1536758826,1536758826),
	(7,10,5,1536758826,1536758826),
	(8,11,2,1536758844,1536758844),
	(9,11,5,1536758844,1536758844),
	(10,12,2,1536758864,1536758864),
	(11,12,9,1536758864,1536758864),
	(12,14,2,1536760317,1536760317),
	(13,16,2,1537251696,1537251696),
	(14,16,10,1537251696,1537251696),
	(15,16,11,1537251696,1537251696),
	(16,16,12,1537251696,1537251696),
	(17,17,2,1537378722,1537378722),
	(18,17,10,1537378722,1537378722),
	(19,17,11,1537378722,1537378722),
	(20,17,12,1537378722,1537378722),
	(21,18,2,1538875079,1538875079),
	(22,18,10,1538875079,1538875079),
	(23,18,11,1538875079,1538875079),
	(24,18,12,1538875079,1538875079),
	(25,19,2,1538877618,1538877618),
	(26,19,10,1538877618,1538877618),
	(27,19,11,1538877618,1538877618),
	(28,19,12,1538877618,1538877618),
	(29,20,2,1538877634,1538877634),
	(30,20,10,1538877634,1538877634),
	(31,20,11,1538877634,1538877634),
	(32,20,12,1538877634,1538877634),
	(33,24,2,1539018084,1539018084),
	(34,25,2,1539055631,1539055631),
	(35,26,2,1539061764,1539061764),
	(36,27,2,1539136778,1539136778),
	(37,28,2,1539404500,1539404500),
	(38,29,2,1539404505,1539404505),
	(39,30,2,1539410571,1539410571),
	(40,30,5,1539410571,1539410571);

/*!40000 ALTER TABLE `par_user_comment_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_user_info_party_experience
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_user_info_party_experience`;

CREATE TABLE `par_user_info_party_experience` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `rdsq_passed_at` int(11) unsigned DEFAULT NULL COMMENT '入党申请',
  `rdsq_more` text COMMENT '入党申请',
  `jjfz_passed_at` int(11) unsigned DEFAULT NULL COMMENT '积极分子',
  `jjfz_more` text COMMENT '积极分子',
  `fzdx_passed_at` int(11) unsigned DEFAULT NULL COMMENT '发展对象',
  `fzdx_more` text COMMENT '发展对象',
  `ybdy_passed_at` int(11) unsigned DEFAULT NULL COMMENT '预备党员',
  `ybdy_more` text COMMENT '预备党员',
  `zsdy_passed_at` int(11) unsigned DEFAULT NULL COMMENT '正式党员',
  `zsdy_more` text COMMENT '正式党员',
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_user_info_party_experience` WRITE;
/*!40000 ALTER TABLE `par_user_info_party_experience` DISABLE KEYS */;

INSERT INTO `par_user_info_party_experience` (`id`, `user_id`, `rdsq_passed_at`, `rdsq_more`, `jjfz_passed_at`, `jjfz_more`, `fzdx_passed_at`, `fzdx_more`, `ybdy_passed_at`, `ybdy_more`, `zsdy_passed_at`, `zsdy_more`, `created_at`, `updated_at`)
VALUES
	(1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32131,NULL,0,0);

/*!40000 ALTER TABLE `par_user_info_party_experience` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_user_info_party_relation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_user_info_party_relation`;

CREATE TABLE `par_user_info_party_relation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `started_at` int(11) unsigned NOT NULL COMMENT '入职日期',
  `ended_at` int(11) unsigned NOT NULL COMMENT '离职日期',
  `department_name` varchar(255) DEFAULT NULL COMMENT '单位名称',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_user_info_party_relation` WRITE;
/*!40000 ALTER TABLE `par_user_info_party_relation` DISABLE KEYS */;

INSERT INTO `par_user_info_party_relation` (`id`, `user_id`, `started_at`, `ended_at`, `department_name`, `sort_order`, `created_at`, `updated_at`)
VALUES
	(1,11,1,2,'3213123',0,0,0),
	(2,11,55,22,'32131',0,0,0),
	(3,11,23121321,312,'32121',0,0,0);

/*!40000 ALTER TABLE `par_user_info_party_relation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_user_notification
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_user_notification`;

CREATE TABLE `par_user_notification` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `is_checked` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已读',
  `related_type` tinyint(2) unsigned NOT NULL COMMENT '信息关联的类型',
  `related_id` int(11) unsigned NOT NULL COMMENT '关联的id',
  `operate_type` tinyint(2) unsigned NOT NULL,
  `is_send_sms` tinyint(1) unsigned DEFAULT NULL COMMENT '是否发送短信',
  `out_id` varchar(255) DEFAULT NULL COMMENT '短信接口流水号',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_user_notification` WRITE;
/*!40000 ALTER TABLE `par_user_notification` DISABLE KEYS */;

INSERT INTO `par_user_notification` (`id`, `user_id`, `is_checked`, `related_type`, `related_id`, `operate_type`, `is_send_sms`, `out_id`, `created_at`, `updated_at`)
VALUES
	(1,2,1,1,0,0,NULL,NULL,1,1539012885),
	(2,2,1,2,0,0,NULL,NULL,1,1539020270),
	(3,2,1,3,0,0,NULL,NULL,0,0),
	(4,1,1,3,0,0,NULL,NULL,0,0),
	(5,2,1,3,24,2,NULL,NULL,1539018084,1539020421),
	(6,2,1,3,24,4,NULL,NULL,1539018237,1539019916),
	(7,2,1,3,24,1,NULL,NULL,1539018238,1539055645),
	(8,2,1,3,25,2,NULL,NULL,1539055631,1539055647),
	(9,2,1,3,26,2,NULL,NULL,1539061763,1539061779),
	(10,2,0,3,26,4,NULL,NULL,1539061812,1539061812),
	(11,2,0,3,26,1,NULL,NULL,1539061813,1539061813),
	(12,2,1,2,5,2,NULL,NULL,1539094836,1539411660),
	(13,2,0,2,5,4,NULL,NULL,1539094897,1539094897),
	(14,2,0,2,5,3,NULL,NULL,1539094898,1539094898),
	(15,2,0,2,5,3,NULL,NULL,1539094898,1539094898),
	(16,2,1,3,27,2,NULL,NULL,1539136778,1539136882),
	(17,2,1,3,27,4,NULL,NULL,1539137051,1539411647),
	(18,2,1,3,27,1,NULL,NULL,1539137051,1539411666),
	(19,2,0,2,6,2,NULL,NULL,1539139548,1539139548),
	(20,2,0,2,6,4,NULL,NULL,1539139664,1539139664),
	(21,2,0,2,6,3,NULL,NULL,1539139665,1539139665),
	(22,10,0,2,6,3,NULL,NULL,1539139665,1539139665),
	(23,2,0,3,28,2,0,NULL,1539404500,1539404500),
	(24,2,0,3,29,2,1,NULL,1539404504,1539404504),
	(25,2,1,3,30,2,1,NULL,1539410571,1539410645),
	(26,2,0,3,29,4,1,NULL,1539410660,1539410660),
	(27,2,0,3,29,1,1,NULL,1539410661,1539410661),
	(28,2,0,2,7,2,1,NULL,1539411405,1539411405),
	(29,2,0,2,7,4,1,NULL,1539411476,1539411476),
	(30,2,0,2,7,3,1,NULL,1539411477,1539411477),
	(31,5,0,2,7,3,1,NULL,1539411477,1539411477),
	(32,10,0,2,7,3,1,NULL,1539411478,1539411478);

/*!40000 ALTER TABLE `par_user_notification` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_user_payment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_user_payment`;

CREATE TABLE `par_user_payment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `amount` int(11) unsigned NOT NULL,
  `api_recive_msg` text NOT NULL COMMENT '支付接口接受到的信息',
  `created_at` int(11) unsigned NOT NULL,
  `finished_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_user_payment` WRITE;
/*!40000 ALTER TABLE `par_user_payment` DISABLE KEYS */;

INSERT INTO `par_user_payment` (`id`, `user_id`, `type`, `amount`, `api_recive_msg`, `created_at`, `finished_at`, `updated_at`)
VALUES
	(1,5,1,1234,'',1536668100,1536668174,0);

/*!40000 ALTER TABLE `par_user_payment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_vote
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_vote`;

CREATE TABLE `par_vote` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `initiate_user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发起人',
  `title` varchar(255) NOT NULL DEFAULT '',
  `initiate_content` text COMMENT '发起时候的内容',
  `is_publicized` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否公示',
  `publicity_content` text COMMENT '公示发布时候的内容',
  `published_at` int(11) unsigned DEFAULT NULL,
  `started_at` int(11) unsigned DEFAULT NULL,
  `ended_at` int(11) unsigned DEFAULT NULL,
  `created_at` int(11) unsigned DEFAULT NULL,
  `updated_at` int(11) unsigned DEFAULT NULL,
  `more` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_vote` WRITE;
/*!40000 ALTER TABLE `par_vote` DISABLE KEYS */;

INSERT INTO `par_vote` (`id`, `initiate_user_id`, `title`, `initiate_content`, `is_publicized`, `publicity_content`, `published_at`, `started_at`, `ended_at`, `created_at`, `updated_at`, `more`)
VALUES
	(2,2,'111','222',1,NULL,NULL,1537803328,1537803329,1537802524,1537802524,'{\"files\":[{\"size\":5127998,\"type\":\"image\\/jpeg\",\"status\":\"done\"},{\"size\":5212585,\"type\":\"image\\/jpeg\",\"status\":\"done\"}]}'),
	(3,2,'123','123321',1,'123312',1538899096,1538899033,1538899033,1538897528,1538899096,'{\"files\":[{\"lastModified\":1523412588000,\"lastModifiedDate\":\"2018-04-11T02:09:48.000Z\",\"name\":\"IMG_0003.JPG\",\"size\":2616894,\"type\":\"image\\/jpeg\",\"uid\":\"vc-upload-1538897488310-2\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181007\\/IMG_0003.JPG\"},\"percent\":100,\"originFileObj\":{\"uid\":\"vc-upload-1538897488310-2\"},\"status\":\"done\",\"url\":\"\\/upload\\/20181007\\/IMG_0003.JPG\"},{\"lastModified\":1523412584000,\"lastModifiedDate\":\"2018-04-11T02:09:44.000Z\",\"name\":\"IMG_0009.JPG\",\"size\":1950162,\"type\":\"image\\/jpeg\",\"uid\":\"vc-upload-1538897488310-3\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181007\\/IMG_0009.JPG\"},\"percent\":100,\"originFileObj\":{\"uid\":\"vc-upload-1538897488310-3\"},\"status\":\"done\",\"url\":\"\\/upload\\/20181007\\/IMG_0009.JPG\"}]}');

/*!40000 ALTER TABLE `par_vote` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_vote_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_vote_user`;

CREATE TABLE `par_vote_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vote_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `is_submited` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '参与表决人是否提交结果',
  `vote_result` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '结果:1:同意;2:不同意;3:弃权;',
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_vote_user` WRITE;
/*!40000 ALTER TABLE `par_vote_user` DISABLE KEYS */;

INSERT INTO `par_vote_user` (`id`, `vote_id`, `user_id`, `is_submited`, `vote_result`, `created_at`, `updated_at`)
VALUES
	(5,2,2,1,2,1537802524,1537806314),
	(6,2,10,0,0,1537802524,1537802524),
	(7,2,11,0,0,1537802524,1537802524),
	(8,2,12,0,0,1537802524,1537802524),
	(9,3,2,1,1,1538897528,1538898145),
	(10,3,10,0,0,1538897528,1538897528),
	(11,3,11,0,0,1538897528,1538897528),
	(12,3,12,0,0,1538897528,1538897528);

/*!40000 ALTER TABLE `par_vote_user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
