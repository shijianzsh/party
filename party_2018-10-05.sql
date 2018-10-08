# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.23)
# Database: party
# Generation Time: 2018-10-05 10:01:00 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
  `description` varchar(255) DEFAULT NULL COMMENT 'not required.描述',
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_auth_map` WRITE;
/*!40000 ALTER TABLE `par_auth_map` DISABLE KEYS */;

INSERT INTO `par_auth_map` (`id`, `method`, `namespace`, `entrance`, `param_1`, `param_2`, `param_3`, `description`, `created_at`, `updated_at`)
VALUES
	(1,'get','api','token',NULL,NULL,NULL,NULL,0,0),
	(2,'post','api','upload',NULL,NULL,NULL,NULL,0,0),
	(3,'post','api','login',NULL,NULL,NULL,NULL,0,0),
	(4,'post','api','departments','?','department',NULL,'Department@departmentDepartmentList',0,0),
	(5,'get','api','departments',NULL,NULL,NULL,'resource index',0,0),
	(6,'get','api','departments','?',NULL,NULL,'resource show',0,0),
	(7,'post','api','departments','?',NULL,NULL,'resource store',0,0),
	(8,'put','api','departments','?',NULL,NULL,'resource update',0,0),
	(9,'delete','api','departments','?',NULL,NULL,'resource destroy',0,0),
	(11,'get','api','department_work_plans',NULL,NULL,NULL,'resource index',0,0),
	(12,'get','api','department_work_plans','?',NULL,NULL,'resource show',0,0),
	(13,'post','api','department_work_plans','?',NULL,NULL,'resource store',0,0),
	(14,'put','api','department_work_plans','?',NULL,NULL,'resource update',0,0),
	(15,'delete','api','department_work_plans','?',NULL,NULL,'resource destroy',0,0),
	(16,'get','api','department_activity_plans',NULL,NULL,NULL,'resource index',0,0),
	(17,'get','api','department_activity_plans','?',NULL,NULL,'resource show',0,0),
	(18,'post','api','department_activity_plans','?',NULL,NULL,'resource store',0,0),
	(19,'put','api','department_activity_plans','?',NULL,NULL,'resource update',0,0),
	(20,'delete','api','department_activity_plans','?',NULL,NULL,'resource destroy',0,0),
	(21,'get','api','user_payments',NULL,NULL,NULL,'resource index',0,0),
	(22,'get','api','user_payments','?',NULL,NULL,'resource show',0,0),
	(23,'post','api','user_payments','?',NULL,NULL,'resource store',0,0),
	(24,'put','api','user_payments','?',NULL,NULL,'resource update',0,0),
	(25,'delete','api','user_payments','?',NULL,NULL,'resource destroy',0,0),
	(26,'get','api','articles',NULL,NULL,NULL,'resource index',0,0),
	(27,'get','api','articles','?',NULL,NULL,'resource show',0,0),
	(28,'post','api','articles','?',NULL,NULL,'resource store',0,0),
	(29,'put','api','articles','?',NULL,NULL,'resource update',0,0),
	(30,'delete','api','articles','?',NULL,NULL,'resource destroy',0,0),
	(31,'get','api','categories',NULL,NULL,NULL,'resource index',0,0),
	(32,'get','api','categories','?',NULL,NULL,'resource show',0,0),
	(33,'post','api','categories','?',NULL,NULL,'resource store',0,0),
	(34,'put','api','categories','?',NULL,NULL,'resource update',0,0),
	(35,'delete','api','categories','?',NULL,NULL,'resource destroy',0,0),
	(36,'get','api','comments',NULL,NULL,NULL,'resource index',0,0),
	(37,'get','api','comments','?',NULL,NULL,'resource show',0,0),
	(38,'post','api','comments','?',NULL,NULL,'resource store',0,0),
	(39,'put','api','comments','?',NULL,NULL,'resource update',0,0),
	(40,'delete','api','comments','?',NULL,NULL,'resource destroy',0,0),
	(41,'get','api','meetings',NULL,NULL,NULL,'resource index',0,0),
	(42,'get','api','meetings','?',NULL,NULL,'resource show',0,0),
	(43,'post','api','meetings','?',NULL,NULL,'resource store',0,0),
	(44,'put','api','meetings','?',NULL,NULL,'resource update',0,0),
	(45,'delete','api','meetings','?',NULL,NULL,'resource destroy',0,0),
	(46,'get','api','elections',NULL,NULL,NULL,'resource index',0,0),
	(47,'get','api','elections','?',NULL,NULL,'resource show',0,0),
	(48,'post','api','elections','?',NULL,NULL,'resource store',0,0),
	(49,'put','api','elections','?',NULL,NULL,'resource update',0,0),
	(50,'delete','api','elections','?',NULL,NULL,'resource destroy',0,0),
	(51,'get','api','votes',NULL,NULL,NULL,'resource index',0,0),
	(52,'get','api','votes','?',NULL,NULL,'resource show',0,0),
	(53,'post','api','votes','?',NULL,NULL,'resource store',0,0),
	(54,'put','api','votes','?',NULL,NULL,'resource update',0,0),
	(55,'delete','api','votes','?',NULL,NULL,'resource destroy',0,0),
	(56,'get','api','exam_categorys',NULL,NULL,NULL,'resource index',0,0),
	(57,'get','api','exam_categorys','?',NULL,NULL,'resource show',0,0),
	(58,'post','api','exam_categorys','?',NULL,NULL,'resource store',0,0),
	(59,'put','api','exam_categorys','?',NULL,NULL,'resource update',0,0),
	(60,'delete','api','exam_categorys','?',NULL,NULL,'resource destroy',0,0),
	(61,'get','api','exam_excels',NULL,NULL,NULL,'resource index',0,0),
	(62,'get','api','exam_excels','?',NULL,NULL,'resource show',0,0),
	(63,'post','api','exam_excels','?',NULL,NULL,'resource store',0,0),
	(64,'put','api','exam_excels','?',NULL,NULL,'resource update',0,0),
	(65,'delete','api','exam_excels','?',NULL,NULL,'resource destroy',0,0),
	(66,'get','api','exam_papers',NULL,NULL,NULL,'resource index',0,0),
	(67,'get','api','exam_papers','?',NULL,NULL,'resource show',0,0),
	(68,'post','api','exam_papers','?',NULL,NULL,'resource store',0,0),
	(69,'put','api','exam_papers','?',NULL,NULL,'resource update',0,0),
	(70,'delete','api','exam_papers','?',NULL,NULL,'resource destroy',0,0),
	(71,'get','api','exam_results',NULL,NULL,NULL,'resource index',0,0),
	(72,'get','api','exam_results','?',NULL,NULL,'resource show',0,0),
	(73,'post','api','exam_results','?',NULL,NULL,'resource store',0,0),
	(74,'put','api','exam_results','?',NULL,NULL,'resource update',0,0),
	(75,'delete','api','exam_results','?',NULL,NULL,'resource destroy',0,0),
	(76,'get','api','auth_map',NULL,NULL,NULL,'resource index',0,0),
	(77,'get','api','auth_map','?',NULL,NULL,'resource show',0,0),
	(78,'post','api','auth_map','?',NULL,NULL,'resource store',0,0),
	(79,'put','api','auth_map','?',NULL,NULL,'resource update',0,0),
	(80,'delete','api','auth_map','?',NULL,NULL,'resource destroy',0,0),
	(81,'get','api','auth_role',NULL,NULL,NULL,'resource index',0,0),
	(82,'get','api','auth_role','?',NULL,NULL,'resource show',0,0),
	(83,'post','api','auth_role','?',NULL,NULL,'resource store',0,0),
	(84,'put','api','auth_role','?',NULL,NULL,'resource update',0,0),
	(85,'delete','api','auth_role','?',NULL,NULL,'resource destroy',0,0),
	(86,'get','api','users','?','party_info',NULL,'User@getUserWithPartyInfo',0,0),
	(87,'post','api','users','?','change_password',NULL,'User@changePassword',0,0),
	(88,'get','api','articles','published',NULL,NULL,'Article@publishedArticleList',0,0),
	(89,'get','api','articles','user',NULL,NULL,'Article@userArticleList',0,0),
	(90,'get','api','articles','audit_user',NULL,NULL,'Article@auditUserArticleList',0,0),
	(91,'get','api','articles','?','check',NULL,'Article@checkArticle',0,0),
	(92,'post','api','articles','?','audit',NULL,'Article@audit',0,0),
	(93,'get','api','comments','audit_user',NULL,NULL,'Comment@auditUserCommentList',0,0),
	(94,'get','api','meetings','department',NULL,NULL,'Meeting@departmentMeetingList',0,0),
	(95,'get','api','meetings','attend_user',NULL,NULL,'Meeting@attendUserMeetingList',0,0),
	(96,'get','api','meetings','audit_user',NULL,NULL,'Meeting@auditUserMeetingList',0,0),
	(97,'post','api','meetings','?','audit',NULL,'Meeting@audit',0,0),
	(98,'post','api','meetings','?','sign_in',NULL,'Meeting@signIn',0,0),
	(99,'get','api','elections','?','publicized',NULL,'Election@getPublicizedElection',0,0),
	(100,'get','api','elections','?','attend',NULL,'Election@getAttendElection',0,0),
	(101,'post','api','elections','?','attend_submit',NULL,'Election@AttendSubmit',0,0),
	(102,'get','api','votes','?','publicized',NULL,'Vote@getPublicizedVote',0,0),
	(103,'get','api','votes','?','attend',NULL,'Vote@getAttendVote',0,0),
	(104,'post','api','votes','?','attend_submit',NULL,'Vote@AttendSubmit',0,0),
	(105,'post','api','exam_results','?','start',NULL,'ExamResult@start',0,0),
	(106,'post','api','exam_results','?','submit',NULL,'ExamResult@submit',0,0),
	(107,'get','api','departments','?','coordinate',NULL,'Department@getDepartmentCoordinateList',0,0),
	(108,'get','api','categories','?','children_and_published_article',NULL,'Category@getCategoryChildrenAndPublishedArticleList',0,0),
	(109,'get','api','article_comments',NULL,NULL,NULL,'resource index',0,0),
	(110,'get','api','article_comments','?',NULL,NULL,'resource show',0,0),
	(111,'post','api','article_comments','?',NULL,NULL,'resource store',0,0),
	(112,'put','api','article_comments','?',NULL,NULL,'resource update',0,0),
	(113,'delete','api','article_comments','?',NULL,NULL,'resource destroy',0,0),
	(114,'post','api','users','?','update_one_field',NULL,'User@updateOneField',0,0),
	(115,'get','api','users',NULL,NULL,NULL,'resource index',0,0),
	(116,'get','api','users','?',NULL,NULL,'resource show',0,0),
	(117,'post','api','users','?',NULL,NULL,'resource store',0,0),
	(118,'put','api','users','?',NULL,NULL,'resource update',0,0),
	(119,'delete','api','users','?',NULL,NULL,'resource destroy',0,0),
	(120,'get','api','user_notifications',NULL,NULL,NULL,'resource index',0,0),
	(121,'get','api','user_notifications','?',NULL,NULL,'resource show',0,0),
	(122,'post','api','user_notifications','?',NULL,NULL,'resource store',0,0),
	(123,'put','api','user_notifications','?',NULL,NULL,'resource update',0,0),
	(124,'delete','api','user_notifications','?',NULL,NULL,'resource destroy',0,0),
	(125,'post','api','pusher','?','index','?','Pusher@Socket',0,0),
	(126,'post','api','pusher','?','sms',NULL,'Pusher@Sms',0,0);

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
	(1,'测试role1111',1,1538468542),
	(2,'测试role2',1,1),
	(4,'测试role3',1538468578,1538468578);

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
	(3,2,2,0,0),
	(4,2,56,0,0),
	(8,1,1,1538468542,1538468542),
	(9,1,2,1538468542,1538468542),
	(10,1,3,1538468542,1538468542),
	(11,1,4,1538468542,1538468542),
	(12,1,5,1538468542,1538468542),
	(13,4,5,1538468578,1538468578);

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
	(6,1,1,1538470239,1538470239),
	(7,2,1,1538470239,1538470239),
	(8,4,1,1538470239,1538470239);

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
	(1,0,'1','','32321312',116400244,39925560,'123','321321','书记','0-',1538473145,0,1538473149,'{\"thumbnail\":\"\\/upload\\/20181002\\/IMG_20170907_170000.jpg\",\"monitor_map\":\"\\/upload\\/20181002\\/IMG_20160403_055750.jpg\"}'),
	(2,1,'11','22','33',55000000,0,'66','77','88','1-',1538477550,1538391155,1538391218,'{\"thumbnail\":\"\\/upload\\/20181001\\/IMG_20160403_131102.jpg\"}'),
	(3,1,'11','22','33',44000000,55000000,'66','77','88','1-',1538477550,1538391194,1538391194,'{\"thumbnail\":\"\\/upload\\/20181001\\/IMG_20170907_170000.jpg\"}');

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
	(2,1,2,'11',32321,2,'{\"files\":[{\"size\":5127998,\"type\":\"image\\/jpeg\",\"status\":\"done\"},{\"size\":5212585,\"type\":\"image\\/jpeg\",\"status\":\"done\"}]}',1536596843,1537720078,1537720078);

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
	(5,2,12,1537720078,1537720078);

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
	(1,1,5,'关于党支部内投票选举的计划','NULL321321312321322','[]',1,1,1);

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
  `started_at` int(11) unsigned NOT NULL DEFAULT '0',
  `ended_at` int(11) unsigned NOT NULL DEFAULT '0',
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  `more` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_election` WRITE;
/*!40000 ALTER TABLE `par_election` DISABLE KEYS */;

INSERT INTO `par_election` (`id`, `initiate_user_id`, `title`, `option_select_count`, `initiate_content`, `is_publicized`, `publicity_content`, `started_at`, `ended_at`, `created_at`, `updated_at`, `more`)
VALUES
	(1,2,'13321',1,'本次选举的议题是',0,NULL,1,1,1,2,'{\"files\":[{\"size\":5127998,\"type\":\"image\\/jpeg\",\"status\":\"done\"},{\"size\":5212585,\"type\":\"image\\/jpeg\",\"status\":\"done\"}]}'),
	(2,0,'1',2,'222',1,NULL,1537792400,1537892463,1537774354,1537774354,'{\"files\":[{\"size\":5127998,\"type\":\"image\\/jpeg\",\"status\":\"done\"},{\"size\":5212585,\"type\":\"image\\/jpeg\",\"status\":\"done\"}]}'),
	(3,0,'2',3,'222',1,NULL,1537860690,1538033493,1537774468,1537774468,'{\"files\":[{\"size\":5127998,\"type\":\"image\\/jpeg\",\"status\":\"done\"},{\"size\":5212585,\"type\":\"image\\/jpeg\",\"status\":\"done\"}]}'),
	(7,2,'测试选举',2,'12312',1,NULL,1537842343,1537842342,1537928761,1537928761,'{\"files\":[{\"size\":5127998,\"type\":\"image\\/jpeg\",\"status\":\"done\"},{\"size\":5212585,\"type\":\"image\\/jpeg\",\"status\":\"done\"}]}');

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
	(16,7,NULL,12,1537928761,1537928761);

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
	(7,7,2,16,1537928989,1537928989);

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
	(16,7,9,1537928761,1537928761);

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
	(1,'考题分类1',0,1536592702),
	(3,'考题分类2',0,0),
	(4,'123',1537946744,1537946744);

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
	(10,1,2,'1',4,NULL,0,0),
	(16,1,2,'2',2,'{\"file\":[{\"uid\":\"\\/upload\\/20180910\\/\\u9898.xlsx\",\"name\":\"\\u9898.xlsx\",\"size\":8958,\"type\":\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"status\":\"done\",\"url\":\"\\/upload\\/20180910\\/\\u9898.xlsx\"}]}',1536596998,1536596998),
	(17,1,2,'3',2,'{\"file\":[{\"uid\":\"\\/upload\\/20180910\\/\\u9898.xlsx\",\"name\":\"\\u9898.xlsx\",\"size\":8958,\"type\":\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"status\":\"done\",\"url\":\"\\/upload\\/20180910\\/\\u9898.xlsx\"}]}',1536597018,1536597018),
	(22,1,2,'4',2,'{\"file\":[{\"uid\":\"\\/upload\\/20180910\\/\\u9898.xlsx\",\"name\":\"\\u9898.xlsx\",\"size\":8958,\"type\":\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"status\":\"done\",\"url\":\"\\/upload\\/20180910\\/\\u9898.xlsx\"}]}',1536597322,1536597322),
	(24,9,2,'55',2,'{\"file\":[{\"uid\":\"\\/upload\\/20180910\\/\\u9898.xlsx\",\"name\":\"\\u9898.xlsx\",\"size\":8958,\"type\":\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"status\":\"done\",\"url\":\"\\/upload\\/20180910\\/\\u9898.xlsx\"}]}',1536597472,1536597472),
	(25,9,2,'/upload/20180912/题.xlsx',2,'{\"file\":[{\"uid\":\"\\/upload\\/20180912\\/\\u9898.xlsx\",\"name\":\"\\u9898.xlsx\",\"size\":8914,\"type\":\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"status\":\"done\",\"url\":\"\\/upload\\/20180912\\/\\u9898.xlsx\"}]}',1536762695,1536762907),
	(26,1,1,'/upload/20180926/题.xlsx',23,'{\"file\":[{\"uid\":\"\\/upload\\/20180926\\/\\u9898.xlsx\",\"name\":\"\\u9898.xlsx\",\"size\":9500,\"type\":\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"status\":\"done\",\"url\":\"\\/upload\\/20180926\\/\\u9898.xlsx\"}]}',1537947710,1537947710);

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
	(1,NULL,'测试paper',50,1,8,60,1,555,1537930000,0,1535013092,NULL),
	(4,NULL,'测试paper',1,0,16,60,1,555,1537930000,1535009728,1535009728,NULL),
	(5,NULL,'测试paper',50,1,16,60,1,555,1537930000,1535010189,1535010189,NULL);

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
	(3,4,4,8,X'',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1535009728,1535009728),
	(4,4,16,8,X'E997AEE9A29832',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1535009728,1535009728),
	(5,5,3,8,X'',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863227D',X'5B2241222C2242225D',1535010189,1535010189),
	(6,5,4,8,X'',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1535010189,1535010189);

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
	(1,2,1,0,'','','',0,0),
	(2,3,1,0,'','','',0,0),
	(3,8,1,0,'','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\"}','[\"A\",\"B\"]',1534967224,1534967224),
	(4,8,2,0,'','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1534967224,1534967224),
	(15,9,1,1,'问题1     12312312','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\"}','[\"A\",\"B\"]',1534967893,1534967893),
	(16,9,2,0,'问题2','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1534967893,1534967893),
	(17,16,1,1,'问题1     12312312','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\"}','A;B',1536596998,1536596998),
	(18,16,2,0,'问题2','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','B',1536596998,1536596998),
	(19,17,1,1,'问题1     12312312','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\"}','A;B',1536597018,1536597018),
	(20,17,2,0,'问题2','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','B',1536597018,1536597018),
	(21,22,1,1,'问题1     12312312','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\"}','A;B',1536597322,1536597322),
	(22,22,2,0,'问题2','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','B',1536597322,1536597322),
	(23,24,1,1,'问题1     12312312','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\"}','[\"A\",\"B\"]',1536597472,1536597472),
	(24,24,2,0,'问题2','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1536597472,1536597472),
	(31,25,1,1,'问题1     12312312','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\"}','[\"A\",\"B\"]',1536762907,1536762907),
	(32,25,2,0,'问题22222','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1536762907,1536762907),
	(33,26,1,1,'问题1     12312312','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\"}','[\"A\",\"B\"]',1537947710,1537947710),
	(34,26,2,0,'问题211111','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"A\"]',1537947710,1537947710),
	(35,26,3,0,'问题211112','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537947710,1537947710),
	(36,26,4,0,'问题211113','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"C\"]',1537947710,1537947710),
	(37,26,5,0,'问题211114','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"D\"]',1537947710,1537947710),
	(38,26,6,0,'问题211115','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"A\"]',1537947710,1537947710),
	(39,26,7,0,'问题211116','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537947710,1537947710),
	(40,26,8,0,'问题211117','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"C\"]',1537947710,1537947710),
	(41,26,9,0,'问题211118','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\",\"D\"]',1537947710,1537947710),
	(42,26,10,0,'问题211119','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537947710,1537947710),
	(43,26,11,0,'问题211120','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537947710,1537947710),
	(44,26,12,0,'问题211121','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537947710,1537947710),
	(45,26,13,0,'问题211122','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537947710,1537947710),
	(46,26,14,0,'问题211123','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537947710,1537947710),
	(47,26,15,0,'问题211124','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537947710,1537947710),
	(48,26,16,0,'问题211125','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537947710,1537947710),
	(49,26,17,0,'问题211126','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537947710,1537947710),
	(50,26,18,0,'问题211127','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537947710,1537947710),
	(51,26,19,0,'问题211128','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537947710,1537947710),
	(52,26,20,0,'问题211129','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537947710,1537947710),
	(53,26,21,0,'问题211130','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537947710,1537947710),
	(54,26,22,0,'问题211131','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537947710,1537947710),
	(55,26,23,0,'问题211132','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537947710,1537947710);

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
	(2,9,1,1,'','',11,1,123,2132321),
	(3,2,4,0,'{\"id\":4,\"name\":\"\\u6d4b\\u8bd5paper\",\"duration\":1,\"is_restrict_user\":0,\"max_score\":16,\"pass_score\":60,\"questions_count\":1,\"published_at\":555,\"finished_at\":1537930000,\"created_at\":\"1535009728\",\"updated_at\":\"1535009728\",\"more\":null,\"time_status\":1,\"time_status_format\":\"\\u8fdb\\u884c\\u4e2d\",\"published_at_format\":\"1970-01-01 00:09:15\",\"finished_at_format\":\"2018-09-26 02:46:40\",\"created_at_format\":\"2018-08-23 07:35:28\",\"updated_at_format\":\"2018-08-23 07:35:28\",\"questions\":[{\"id\":3,\"paper_id\":4,\"question_id\":4,\"question_score\":8,\"title\":\"\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"B\"],\"created_at\":\"1535009728\",\"updated_at\":\"1535009728\",\"created_at_format\":\"2018-08-23 07:35:28\"},{\"id\":4,\"paper_id\":4,\"question_id\":16,\"question_score\":8,\"title\":\"\\u95ee\\u98982\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"B\"],\"created_at\":\"1535009728\",\"updated_at\":\"1535009728\",\"created_at_format\":\"2018-08-23 07:35:28\"}],\"attend_users\":[]}',NULL,NULL,0,1537929214,1537929214);

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
	(4,1,2,1,'测试title1',1,'测试location2',1535096355,1535096455,1535096255,1535096255);

/*!40000 ALTER TABLE `par_meeting` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_meeting_audit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_meeting_audit`;

CREATE TABLE `par_meeting_audit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) unsigned NOT NULL,
  `audit_user_id` int(11) unsigned NOT NULL,
  `status` smallint(2) NOT NULL COMMENT '审核状态 可为负值',
  `reason` varchar(255) NOT NULL DEFAULT '',
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_meeting_audit` WRITE;
/*!40000 ALTER TABLE `par_meeting_audit` DISABLE KEYS */;

INSERT INTO `par_meeting_audit` (`id`, `meeting_id`, `audit_user_id`, `status`, `reason`, `created_at`, `updated_at`)
VALUES
	(1,3,9,-2,'',1535096124,1535096124),
	(2,4,5,2,'测试reason',1535096255,1535096954);

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
	(2,3,5,2,0,0,NULL,0,0);

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
	(32,6,10000,'1999','','','','0-5-6-','{\"thumbnail\":\"\"}',1538395794,1538395794);

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
	(1,2,1,10000,1536292717,1536292717),
	(2,2,5,10000,1536311556,1536311556),
	(3,2,7,10000,1536311667,1536311667),
	(4,11,9,10000,1536504610,1536504610),
	(5,11,2,10000,0,0),
	(6,11,3,10000,0,0),
	(7,11,4,10000,0,0),
	(8,11,5,10000,0,0),
	(9,11,6,10000,0,0),
	(10,2,11,10000,1537328842,1537328842),
	(11,12,12,10000,1537378852,1537378852),
	(12,2,13,10000,1538013619,1538013619),
	(13,3,14,10000,1538379370,1538379370),
	(14,30,15,10000,1538397886,1538397886);

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
	(3,0,1,1,1,0,41,0,0,'标题',X'E69198E8A681','来源','正文\n','',1536311463,1538143821,1,'{\"thumbnail\":\"\\/upload\\/20180918\\/IMG_20160403_135828.jpg\",\"photos\":null,\"videos\":null,\"files\":[{\"uid\":\"\\/upload\\/20180910\\/\\u5e73\\u53f0\\u9996\\u98755.jpg\",\"name\":\"\\u5e73\\u53f0\\u9996\\u98755.jpg\",\"size\":8252622,\"type\":\"image\\/jpeg\",\"status\":\"done\",\"url\":\"\\/upload\\/20180910\\/\\u5e73\\u53f0\\u9996\\u98755.jpg\"},{\"uid\":\"\\/upload\\/20180910\\/\\u684c\\u9762\\u56fe\\u6807.png\",\"name\":\"\\u684c\\u9762\\u56fe\\u6807.png\",\"size\":5652,\"type\":\"image\\/png\",\"status\":\"done\",\"url\":\"\\/upload\\/20180910\\/\\u684c\\u9762\\u56fe\\u6807.png\"}]}'),
	(4,0,0,1,0,0,2,0,0,'3',X'33','2','4','',1536311527,1537379070,1537169145,'{\"thumbnail\":\"\\/upload\\/20180918\\/IMG_20160403_135828.jpg\",\"photos\":null,\"videos\":null,\"files\":null}'),
	(7,0,1,0,0,0,12,0,0,'5',X'33','2','4','',1536311667,1537373276,1537169145,'{\"thumbnail\":\"\\/upload\\/20180918\\/IMG_20160403_135828.jpg\",\"photos\":\"\\\"null\\\"\",\"videos\":\"\\\"null\\\"\",\"files\":\"\\\"null\\\"\"}'),
	(9,0,0,0,0,0,1,0,0,'6',X'333333333231333132','','','',1536594705,1538066235,1,'{\"thumbnail\":\"\\/upload\\/20180918\\/IMG_20160403_135828.jpg\",\"photos\":null,\"videos\":null,\"files\":[{\"lastModified\":1532954176000,\"lastModifiedDate\":\"2018-07-30T12:36:16.000Z\",\"name\":\"\\u7fa4\\u4f17\\u767b\\u5f55\\u9996\\u9875.jpg\",\"size\":4939360,\"type\":\"image\\/jpeg\",\"uid\":\"vc-upload-1536594568293-14\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20180910\\/\\u7fa4\\u4f17\\u767b\\u5f55\\u9996\\u9875.jpg\"},\"percent\":100,\"originFileObj\":{\"uid\":\"vc-upload-1536594568293-14\"},\"status\":\"done\"},{\"lastModified\":1532952240000,\"lastModifiedDate\":\"2018-07-30T12:04:00.000Z\",\"name\":\"\\u8868\\u5355\\u4eba\\u6811\\u5f62.jpg\",\"size\":7683678,\"type\":\"image\\/jpeg\",\"uid\":\"vc-upload-1536594568293-15\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20180910\\/\\u8868\\u5355\\u4eba\\u6811\\u5f62.jpg\"},\"percent\":100,\"originFileObj\":{\"uid\":\"vc-upload-1536594568293-15\"},\"status\":\"done\"}]}'),
	(10,0,0,0,0,0,0,0,0,'7',X'33323131333132333132','','','',1537169145,1537169145,1537169145,'{\"thumbnail\":\"\\/upload\\/20180918\\/IMG_20160403_135828.jpg\",\"photos\":null,\"videos\":null,\"files\":null}'),
	(11,0,0,1,0,0,29,0,0,'1231221','','','','',1537328842,1538395109,1537328825,'{\"thumbnail\":\"\\/upload\\/20180927\\/IMG_20160403_135829.jpg\",\"photos\":[{\"uid\":\"\\/upload\\/20180919\\/IMG_20160404_180229.jpg\",\"name\":\"IMG_20160404_180229.jpg\",\"size\":4370042,\"type\":\"image\\/jpeg\",\"status\":\"done\",\"url\":\"\\/upload\\/20180919\\/IMG_20160404_180229.jpg\",\"thumbUrl\":\"http:\\/\\/party.test\\/\\/upload\\/20180919\\/IMG_20160404_180229.jpg\"},{\"uid\":\"\\/upload\\/20180919\\/IMG_20160404_180226.jpg\",\"name\":\"IMG_20160404_180226.jpg\",\"size\":4225733,\"type\":\"image\\/jpeg\",\"status\":\"done\",\"url\":\"\\/upload\\/20180919\\/IMG_20160404_180226.jpg\",\"thumbUrl\":\"http:\\/\\/party.test\\/\\/upload\\/20180919\\/IMG_20160404_180226.jpg\"},{\"uid\":\"\\/upload\\/20180919\\/IMG_20160404_180222.jpg\",\"name\":\"IMG_20160404_180222.jpg\",\"size\":4599632,\"type\":\"image\\/jpeg\",\"status\":\"done\",\"url\":\"\\/upload\\/20180919\\/IMG_20160404_180222.jpg\",\"thumbUrl\":\"http:\\/\\/party.test\\/\\/upload\\/20180919\\/IMG_20160404_180222.jpg\"},{\"uid\":\"\\/upload\\/20180919\\/IMG_20160404_180224.jpg\",\"name\":\"IMG_20160404_180224.jpg\",\"size\":4288682,\"type\":\"image\\/jpeg\",\"status\":\"done\",\"url\":\"\\/upload\\/20180919\\/IMG_20160404_180224.jpg\",\"thumbUrl\":\"http:\\/\\/party.test\\/\\/upload\\/20180919\\/IMG_20160404_180224.jpg\"}],\"videos\":null,\"files\":[{\"uid\":\"\\/upload\\/20180919\\/IMG_20160404_180229.jpg\",\"name\":\"IMG_20160404_180229.jpg\",\"size\":4370042,\"type\":\"image\\/jpeg\",\"status\":\"done\",\"url\":\"\\/upload\\/20180919\\/IMG_20160404_180229.jpg\"},{\"uid\":\"\\/upload\\/20180919\\/IMG_20160404_180226.jpg\",\"name\":\"IMG_20160404_180226.jpg\",\"size\":4225733,\"type\":\"image\\/jpeg\",\"status\":\"done\",\"url\":\"\\/upload\\/20180919\\/IMG_20160404_180226.jpg\"},{\"uid\":\"\\/upload\\/20180919\\/IMG_20160404_180222.jpg\",\"name\":\"IMG_20160404_180222.jpg\",\"size\":4599632,\"type\":\"image\\/jpeg\",\"status\":\"done\",\"url\":\"\\/upload\\/20180919\\/IMG_20160404_180222.jpg\"},{\"uid\":\"\\/upload\\/20180919\\/IMG_20160404_180224.jpg\",\"name\":\"IMG_20160404_180224.jpg\",\"size\":4288682,\"type\":\"image\\/jpeg\",\"status\":\"done\",\"url\":\"\\/upload\\/20180919\\/IMG_20160404_180224.jpg\"}]}'),
	(12,0,0,0,0,0,0,0,0,'12321','','','','',1537378852,1537378852,0,'{\"thumbnail\":null,\"photos\":null,\"videos\":null,\"files\":null}'),
	(13,0,0,0,0,0,0,0,0,'123',X'33313233','321','3123123','',1538013619,1538013619,0,'{\"thumbnail\":null,\"photos\":null,\"videos\":null,\"files\":null}'),
	(14,0,0,1,0,0,1,0,0,'11',X'3333','22','','',1538379371,1538379375,1538292964,'{\"thumbnail\":null,\"photos\":null,\"videos\":null,\"files\":null}'),
	(15,0,0,1,1,0,70,0,0,'测试',X'313233','123','','article_video_comment',1538397886,1538404532,1538311480,'{\"thumbnail\":\"\\/upload\\/20181001\\/IMG_20170907_170000.jpg\",\"photos\":null,\"videos\":[{\"lastModified\":1523414793032,\"lastModifiedDate\":\"2018-04-11T02:46:33.032Z\",\"name\":\"VID_20160404_141542.mp4\",\"size\":17726586,\"type\":\"video\\/mp4\",\"uid\":\"vc-upload-1538397807923-7\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181001\\/VID_20160404_141542.mp4\"},\"percent\":100,\"originFileObj\":{\"uid\":\"vc-upload-1538397807923-7\"},\"status\":\"done\",\"url\":\"\\/upload\\/20181001\\/VID_20160404_141542.mp4\"}],\"files\":[{\"lastModified\":1533519851569,\"lastModifiedDate\":\"2018-08-06T01:44:11.569Z\",\"name\":\"IMG_20170907_170000.jpg\",\"size\":5127998,\"type\":\"image\\/jpeg\",\"uid\":\"vc-upload-1538399027246-5\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181001\\/IMG_20170907_170000.jpg\"},\"percent\":100,\"originFileObj\":{\"uid\":\"vc-upload-1538399027246-5\"},\"status\":\"done\",\"url\":\"\\/upload\\/20181001\\/IMG_20170907_170000.jpg\"},{\"lastModified\":1523414908701,\"lastModifiedDate\":\"2018-04-11T02:48:28.701Z\",\"name\":\"IMG_20171013_111047.jpg\",\"size\":4245915,\"type\":\"image\\/jpeg\",\"uid\":\"vc-upload-1538399027246-6\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20181001\\/IMG_20171013_111047.jpg\"},\"percent\":100,\"originFileObj\":{\"uid\":\"vc-upload-1538399027246-6\"},\"status\":\"done\",\"url\":\"\\/upload\\/20181001\\/IMG_20171013_111047.jpg\"}]}');

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
	(7,1,0,0,'',1536502722,1536502722),
	(10,3,0,1,'',1536595466,1536595466),
	(11,2,0,0,'',1537240159,1537240159);

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
	(11,15,2,'qewqewq',1538404542,1538404542);

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
	(203,0,'/upload/20181002/IMG_20160403_055750.jpg',1538472950);

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
	(1,0,0,'李静波','男',NULL,'111',NULL,'admin','bd417e904f9c00d3','eyJpdiI6IjR3c2FaclVsUmdZZEw0OFphNGZwNGc9PSIsInZhbHVlIjoiMDFROE9EOEdlVkpYZnR5M05QTHgzQXBVVkN6eElHbmJcL0JuZEYrZ1ljdXQ1aHV3TzJpcXJrQjU1bm9haUQ4VU92VkhQanpzbkFBVjExV25hZFdTY04wYnN0em1ETzR1VkRRXC9LUUtsdUpRS0FPRjlhTUJ0U2h5WDk5S0RkU2FtMzlrMDNSS0JFeVZCWDZWXC90dFJJOEQybHhpbThWR3Y5YVA4bnJVZEh0U2dcL0Z0bThQMkhNdys0ZExSMVwvUFNPa3NYc2kyVkJ0XC9XNEZQUTVwY3FKdzFpWDFKcFptaExqNzhFVGRpZVVkZUJndmlCTUpyQ3hZTGs2bGVLR1hhRnhSYmlGUzdGSzhHeU5IeFNXT1lCcWxNVzdxcFlQZ25WMlRnTzRLNDlRQ1pGTU8xNFBLV3R2QlRVRzR4MmdkRjg2UnJwNENtVVdlSjZDeXFPWDI5ckpBYjFFNnZ5OVBJazJ3bUt0WmRLN2gzVG95N1JBWndwSmFKYkpJcEtmNEpNeWRVMUxaWU1KNFc5UzFZeXBISFptVmh5TitnNk1xU0FcL1llYTRGZUxISitPMWs9IiwibWFjIjoiZDA4Zjk5ODgwZTYzN2MxZTUwYjFkN2E1OGQxMWZiNGIwNjlmOGQ5NzdiZTFkNjA1Y2FlZGYyMTRiNzE3NmM2MCJ9',NULL,0,1538726699,'{\"thumbnail\":\"\\/upload\\/20180918\\/IMG_20160403_135828.jpg\"}'),
	(2,1,1,'123','女','15598259922',NULL,NULL,'leader','bd417e904f9c00d3','eyJpdiI6IldxSWp1YUcwa3ZEZGtMSkZMRCtjZ1E9PSIsInZhbHVlIjoiYnRPc0ppdWhTUnA1clZsUG9DOHlYbkhqS2VsYVZhbmRcL3NGSlNZVElCQTYxM0pnSkh1ZzhwRUk4cWExNGV6TVFTTVo5NTQ0N0RUZVN3eWRuOHFkR09tbG91c3YySTg5UWdscXE3aGhuQmdqK2ZBOGordlhUOHQ2YzJid2RCRVwveDlvRUlCWTg5Y2pQZ3BFRHV2cXFTNXhFdkNCTUd6R2xLd0NScWZiUm10UVZMR3RMeWlJRHlkTVVCWUNZdGtoOTRGK1wvclU0UVZpRHl3ZVZcL0ZhUWdiWjlSeXhBMDdVTG5xcVp5bjJENWpPWmd5YVlmTmRrMktWMXRUSEtkdmtvV0I3VTRBOFc4RkVmZzM0NDNiR2JNeEowUlQrS2U2S1ErS0VDcHBsb3kwMkc2RDI4dm1Scnl3SzVldTMweGgwNDhKcHhJTEtBZEs1SUh2NGNGVDVkSXhRaElSSFJ4U2VGRmJHcWpUd1ZxTEhsUUszaTNlUEVLMnFrYVwvb2MyNG1VXC9PalwvbktmTGxsK3djUnZnQlJLb0gya0xXWHFhNDM3MkhtaU5peCtcL3k5eHZRPSIsIm1hYyI6IjBmOGZmYWVjMjE1MWE0Mjg4MTE0YWExMDAwMTkwYzE2NTVjZjdjNDExZTZiMGI2OTBjNDRiNTM5MzY0NjM4MTMifQ==',NULL,0,1538731120,'{\"thumbnail\":\"\\/upload\\/20180918\\/IMG_20160403_135828.jpg\"}'),
	(5,2,2,'张三','男','15598259922',NULL,NULL,'party','bd417e904f9c00d3','eyJpdiI6Ilp3bytDS3A0dmFCMjBCOStwY1h6RHc9PSIsInZhbHVlIjoidStjaTN4dFBSRWVYT3lZS1pmVm13eWVSQmZKMW9rSGVsVTVTMWVtRGtpdmJsMW5id1poclwva2tCSVVkcEhmaE1wXC9UcXZlVURkNlZocDZlbzBUU1pKZDhjRTAraCs3elRNdkZKMTRuTFRlUGpzc0dVR2xlaU1qQ2l5bmduWFRyQmxhb1VJVTVcL3NNdVJOYVB2VlwvUHFQVXV6a29mTlo2SHFWcENockVWMDQwXC8yVEFxXC9rcjBJUEhFb0UxTk9aZ2dFaDNSc2M1aDAzSzNzMk03YkRiYWhlRmV5dEpMcUNpNFdmOXdMNlk0VzlWMTc5QlZZV0lCR1RCbGRlRDV2aUF3UGZTQVFRSm5TOWVxUTk4bTJoZ2w3bEN5eElyZUhcL3c1UmtVcVhmVXlxTGNPdlwvcVhQUHlodzl1MnhQYmZcL1g3Qk5cL2RiXC9zbHBaVHg0VnZ4Rk9DNnUwR3hLS3pvVGl5aTc0YkVvSkphNTFUbmk0U1wvcWVaZU4xY0lobXZ5QkJpc3hEa1ozVHlZXC9hclhLejZJRmtOeVRZN090MjYrbGZodk04MHlkVVhiY3RzZGs9IiwibWFjIjoiMjQ5YWZhNzhkMDE3NGY5Yjg4Y2ZjYmVjM2U4ZjUzZGMwZGUzN2M1ODg0NzkyYWVkYWZhZjI2YmNiNWEzYWY5NSJ9',NULL,0,1537170468,NULL),
	(9,2,2,'李四','女','12312','办公室委员11',NULL,'lisi','bd417e904f9c00d3',NULL,321,0,1537153577,NULL),
	(10,1,1,'王五','',NULL,NULL,NULL,'4','bd417e904f9c00d3',NULL,NULL,1537169358,1537169358,'{\"thumbnail\":\"\\/upload\\/20180918\\/IMG_20160403_135828.jpg\"}'),
	(11,1,1,'1','',NULL,'312321','112121','123123','123456',NULL,NULL,1537240584,1537240584,'{\"thumbnail\":\"\\/upload\\/20180918\\/IMG_20160403_135828.jpg\"}'),
	(12,1,1,'2','',NULL,'312321','321321321312','123123','123456',NULL,NULL,1537240740,1537240740,'{\"thumbnail\":\"\\/upload\\/20180918\\/IMG_20160403_135828.jpg\"}'),
	(13,2,2,'国家','',NULL,'321321',NULL,'23132','123',NULL,NULL,1538469495,1538469495,'{\"thumbnail\":\"\\/upload\\/20181002\\/IMG_20170907_170000.jpg\"}'),
	(14,2,2,'国家','',NULL,'321321',NULL,'23132','123',NULL,NULL,1538469606,1538469606,'{\"thumbnail\":\"\\/upload\\/20181002\\/IMG_20170907_170000.jpg\"}');

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
	(16,2,1,'111','222','{\"files\":null}',1536042091,1537251696,1537251696),
	(17,2,1,'12323','321321','{\"files\":null}',1535909916,1537378722,1537378722);

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
	(2,12,2,1,NULL,1,1),
	(3,14,2,0,NULL,1536760317,1536760317),
	(5,16,2,0,NULL,1537251696,1537251696),
	(6,17,2,0,NULL,1537378722,1537378722);

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
	(20,17,12,1537378722,1537378722);

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
  `out_id` varchar(255) DEFAULT NULL COMMENT '短信接口流水号',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
  `started_at` int(11) unsigned DEFAULT NULL,
  `ended_at` int(11) unsigned DEFAULT NULL,
  `created_at` int(11) unsigned DEFAULT NULL,
  `updated_at` int(11) unsigned DEFAULT NULL,
  `more` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_vote` WRITE;
/*!40000 ALTER TABLE `par_vote` DISABLE KEYS */;

INSERT INTO `par_vote` (`id`, `initiate_user_id`, `title`, `initiate_content`, `is_publicized`, `publicity_content`, `started_at`, `ended_at`, `created_at`, `updated_at`, `more`)
VALUES
	(2,2,'111','222',1,NULL,1537803328,1537803329,1537802524,1537802524,'{\"files\":[{\"size\":5127998,\"type\":\"image\\/jpeg\",\"status\":\"done\"},{\"size\":5212585,\"type\":\"image\\/jpeg\",\"status\":\"done\"}]}');

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
	(8,2,12,0,0,1537802524,1537802524);

/*!40000 ALTER TABLE `par_vote_user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
