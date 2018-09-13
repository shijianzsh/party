# ************************************************************
# Sequel Pro SQL dump
# Version 5224
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.12)
# Database: party
# Generation Time: 2018-09-13 16:51:05 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table par_department
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_department`;

CREATE TABLE `par_department` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `introduce` text,
  `location` varchar(255) DEFAULT NULL COMMENT '位置',
  `coordinate` varchar(255) DEFAULT NULL COMMENT '百度地图接口坐标',
  `telphone` varchar(20) DEFAULT '',
  `cellphone` int(11) DEFAULT NULL,
  `secretary` varchar(10) DEFAULT '' COMMENT '现任书记姓名',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `established_at` int(11) unsigned NOT NULL COMMENT '成立日期',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0',
  `more` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_department` WRITE;
/*!40000 ALTER TABLE `par_department` DISABLE KEYS */;

INSERT INTO `par_department` (`id`, `parent_id`, `name`, `introduce`, `location`, `coordinate`, `telphone`, `cellphone`, `secretary`, `path`, `established_at`, `created_at`, `updated_at`, `more`)
VALUES
	(1,0,'呼市党支部','11','22','33','44',55,'张三','0-',1536141060,0,1536248392,'{\"thumbnail\":\"\\/upload\\/20180905\\/IMG_20171013_111047.jpg\"}'),
	(2,1,'新城区党支部',NULL,NULL,NULL,'',NULL,'李四','0-1-',1536052798,0,0,NULL),
	(4,2,'新华大街党支部',NULL,NULL,NULL,'',NULL,'王五','0-1-2-',0,0,0,NULL),
	(5,2,'万达党支部',NULL,NULL,NULL,'',NULL,'','0-1-2-',0,0,0,NULL),
	(6,4,'6',NULL,NULL,NULL,'',NULL,'','0-1-2-4-',0,0,0,NULL);

/*!40000 ALTER TABLE `par_department` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_department_activity_plan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_department_activity_plan`;

CREATE TABLE `par_department_activity_plan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `content` int(11) DEFAULT NULL,
  `attend_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `more` int(11) DEFAULT NULL,
  `published_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_department_activity_plan` WRITE;
/*!40000 ALTER TABLE `par_department_activity_plan` DISABLE KEYS */;

INSERT INTO `par_department_activity_plan` (`id`, `department_id`, `user_id`, `title`, `content`, `attend_type`, `more`, `published_at`, `created_at`, `updated_at`)
VALUES
	(1,1,5,'活动规划测试标题',NULL,1,NULL,1,1,1);

/*!40000 ALTER TABLE `par_department_activity_plan` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_department_activity_plan_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_department_activity_plan_user`;

CREATE TABLE `par_department_activity_plan_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `published_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table par_department_work_plan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_department_work_plan`;

CREATE TABLE `par_department_work_plan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `more` longtext,
  `published_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_department_work_plan` WRITE;
/*!40000 ALTER TABLE `par_department_work_plan` DISABLE KEYS */;

INSERT INTO `par_department_work_plan` (`id`, `department_id`, `user_id`, `title`, `content`, `more`, `published_at`, `created_at`, `updated_at`)
VALUES
	(1,1,5,'关于党支部内投票选举的计划',NULL,NULL,1,1,1);

/*!40000 ALTER TABLE `par_department_work_plan` ENABLE KEYS */;
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
	(3,'考题分类2',0,0);

/*!40000 ALTER TABLE `par_exam_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_exam_excel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_exam_excel`;

CREATE TABLE `par_exam_excel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `category_id` int(11) unsigned NOT NULL,
  `file_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `question_count` int(11) unsigned NOT NULL DEFAULT '0',
  `more` text CHARACTER SET utf8 COLLATE utf8_general_ci,
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
	(25,9,2,'/upload/20180912/题.xlsx',2,'{\"file\":[{\"uid\":\"\\/upload\\/20180912\\/\\u9898.xlsx\",\"name\":\"\\u9898.xlsx\",\"size\":8914,\"type\":\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"status\":\"done\",\"url\":\"\\/upload\\/20180912\\/\\u9898.xlsx\"}]}',1536762695,1536762907);

/*!40000 ALTER TABLE `par_exam_excel` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_exam_paper
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_exam_paper`;

CREATE TABLE `par_exam_paper` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_exam_paper` WRITE;
/*!40000 ALTER TABLE `par_exam_paper` DISABLE KEYS */;

INSERT INTO `par_exam_paper` (`id`, `name`, `duration`, `is_restrict_user`, `max_score`, `pass_score`, `questions_count`, `published_at`, `finished_at`, `created_at`, `updated_at`)
VALUES
	(1,'测试paper',50,1,8,60,1,555,555,0,1535013092),
	(4,'测试paper',1,0,16,60,1,555,555,1535009728,1535009728),
	(5,'测试paper',50,1,16,60,1,555,555,1535010189,1535010189);

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
  `answers` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
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
	(32,25,2,0,'问题22222','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1536762907,1536762907);

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
  `paper_snapshoot` longtext NOT NULL,
  `answers_snapshoot` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `score` int(11) unsigned DEFAULT NULL,
  `is_passed` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0:未通过;1:通过',
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_exam_user_result` WRITE;
/*!40000 ALTER TABLE `par_exam_user_result` DISABLE KEYS */;

INSERT INTO `par_exam_user_result` (`id`, `user_id`, `paper_id`, `is_submitted`, `paper_snapshoot`, `answers_snapshoot`, `score`, `is_passed`, `created_at`, `updated_at`)
VALUES
	(2,9,1,1,'','',11,1,123,2132321);

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
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '会议地点',
  `opened_at` int(11) unsigned NOT NULL,
  `ended_at` int(11) unsigned NOT NULL,
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_meeting` WRITE;
/*!40000 ALTER TABLE `par_meeting` DISABLE KEYS */;

INSERT INTO `par_meeting` (`id`, `department_id`, `initiate_user_id`, `need_audit`, `title`, `type`, `location`, `opened_at`, `ended_at`, `created_at`, `updated_at`)
VALUES
	(3,1,5,1,'测试title1',2,'测试location2',1535096224,1535096324,1535096124,1535096124),
	(4,1,1,1,'测试title1',1,'测试location2',1535096355,1535096455,1535096255,1535096255);

/*!40000 ALTER TABLE `par_meeting` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_meeting_audit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_meeting_audit`;

CREATE TABLE `par_meeting_audit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) unsigned NOT NULL,
  `audit_user_id` int(11) unsigned NOT NULL,
  `status` smallint(2) NOT NULL,
  `reason` varchar(255) NOT NULL DEFAULT '',
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_meeting_audit` WRITE;
/*!40000 ALTER TABLE `par_meeting_audit` DISABLE KEYS */;

INSERT INTO `par_meeting_audit` (`id`, `meeting_id`, `audit_user_id`, `status`, `reason`, `created_at`, `updated_at`)
VALUES
	(1,3,9,0,'',1535096124,1535096124),
	(2,4,5,-2,'测试reason',1535096255,1535096954);

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
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  `appointmented_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_meeting_user` WRITE;
/*!40000 ALTER TABLE `par_meeting_user` DISABLE KEYS */;

INSERT INTO `par_meeting_user` (`id`, `meeting_id`, `user_id`, `type`, `is_signed_in`, `need_appointment`, `created_at`, `updated_at`, `appointmented_at`)
VALUES
	(1,3,9,1,0,0,1,2,3),
	(2,3,5,2,0,0,0,0,NULL);

/*!40000 ALTER TABLE `par_meeting_user` ENABLE KEYS */;
UNLOCK TABLES;


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
  `article_template` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
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
	(2,1,10000,'市委新闻','','list','article','0-1-','{\"thumbnail\":\"\"}',1536289545,1536289545),
	(3,1,10000,'区委新闻','','list','article','0-1-','{\"thumbnail\":\"\"}',1536289555,1536289555),
	(4,1,10000,'本组织新闻','','list','article','0-1-','{\"thumbnail\":\"\"}',1536289563,1536289575),
	(5,0,10000,'党建展览','','','','0-','{\"thumbnail\":\"\"}',1536584583,1536584583),
	(6,5,10000,'党历回顾','','','','0-5-','{\"thumbnail\":\"\"}',1536584600,1536584600),
	(7,5,10000,'红色展览','','','','0-5-','{\"thumbnail\":\"\"}',1536584609,1536584609),
	(8,5,10000,'先锋时代','','','','0-5-','{\"thumbnail\":\"\"}',1536584616,1536584616),
	(9,5,10000,'党的先锋','','','','0-5-','{\"thumbnail\":\"\"}',1536584623,1536584623);

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
	(4,2,8,10000,1536504610,1536504610);

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
  `is_published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `post_hits` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `post_comments` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `post_like` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `post_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_excerpt` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'post摘要',
  `post_source` text COMMENT '转载文章的来源',
  `post_content` longtext COMMENT '文章内容',
  `template` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0',
  `published_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `more` text COMMENT '扩展属性,如缩略图;格式为json',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_portal_post` WRITE;
/*!40000 ALTER TABLE `par_portal_post` DISABLE KEYS */;

INSERT INTO `par_portal_post` (`id`, `user_id`, `need_audit`, `post_status`, `comment_status`, `is_top`, `is_published`, `post_hits`, `post_comments`, `post_like`, `post_title`, `post_excerpt`, `post_source`, `post_content`, `template`, `created_at`, `updated_at`, `published_at`, `more`)
VALUES
	(2,0,1,0,0,0,0,0,0,0,'1',X'33','2','4','',1536311347,1536311347,0,'{\"thumbnail\":null,\"photos\":null,\"videos\":null,\"files\":null}'),
	(3,0,1,0,0,0,0,0,0,0,'1',X'33','2','4','',1536311463,1536595466,0,'{\"thumbnail\":null,\"photos\":null,\"videos\":null,\"files\":[{\"uid\":\"\\/upload\\/20180910\\/\\u5e73\\u53f0\\u9996\\u98755.jpg\",\"name\":\"\\u5e73\\u53f0\\u9996\\u98755.jpg\",\"size\":8252622,\"type\":\"image\\/jpeg\",\"status\":\"done\",\"url\":\"\\/upload\\/20180910\\/\\u5e73\\u53f0\\u9996\\u98755.jpg\"},{\"uid\":\"\\/upload\\/20180910\\/\\u684c\\u9762\\u56fe\\u6807.png\",\"name\":\"\\u684c\\u9762\\u56fe\\u6807.png\",\"size\":5652,\"type\":\"image\\/png\",\"status\":\"done\",\"url\":\"\\/upload\\/20180910\\/\\u684c\\u9762\\u56fe\\u6807.png\"}]}'),
	(4,0,1,0,0,0,0,0,0,0,'1',X'33','2','4','',1536311527,1536311527,0,'{\"thumbnail\":null,\"photos\":null,\"videos\":null,\"files\":null}'),
	(5,0,1,0,0,0,0,0,0,0,'1',X'33','2','4','',1536311556,1536311556,0,'{\"thumbnail\":null,\"photos\":null,\"videos\":null,\"files\":null}'),
	(7,0,1,0,0,0,0,0,0,0,'1',X'33','2','4','',1536311667,1536312804,0,'{\"thumbnail\":null,\"photos\":\"\\\"null\\\"\",\"videos\":\"\\\"null\\\"\",\"files\":\"\\\"null\\\"\"}'),
	(9,0,0,0,0,0,0,0,0,0,'','','','','',1536594705,1536594705,0,'{\"thumbnail\":null,\"photos\":null,\"videos\":null,\"files\":[{\"lastModified\":1532954176000,\"lastModifiedDate\":\"2018-07-30T12:36:16.000Z\",\"name\":\"\\u7fa4\\u4f17\\u767b\\u5f55\\u9996\\u9875.jpg\",\"size\":4939360,\"type\":\"image\\/jpeg\",\"uid\":\"vc-upload-1536594568293-14\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20180910\\/\\u7fa4\\u4f17\\u767b\\u5f55\\u9996\\u9875.jpg\"},\"percent\":100,\"originFileObj\":{\"uid\":\"vc-upload-1536594568293-14\"},\"status\":\"done\"},{\"lastModified\":1532952240000,\"lastModifiedDate\":\"2018-07-30T12:04:00.000Z\",\"name\":\"\\u8868\\u5355\\u4eba\\u6811\\u5f62.jpg\",\"size\":7683678,\"type\":\"image\\/jpeg\",\"uid\":\"vc-upload-1536594568293-15\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20180910\\/\\u8868\\u5355\\u4eba\\u6811\\u5f62.jpg\"},\"percent\":100,\"originFileObj\":{\"uid\":\"vc-upload-1536594568293-15\"},\"status\":\"done\"}]}');

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
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
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
	(10,3,0,0,'',1536595466,1536595466);

/*!40000 ALTER TABLE `par_portal_post_audit` ENABLE KEYS */;
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
	(113,0,'/upload/20180912/题.xlsx',1536762905);

/*!40000 ALTER TABLE `par_upload_file_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_user`;

CREATE TABLE `par_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '0:超级管理员;1:单位超级管理员;2:领导;3:党员;4:群众',
  `department_id` int(11) unsigned NOT NULL,
  `name` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sex` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `cellphone` varchar(20) DEFAULT NULL,
  `user_login` varchar(20) NOT NULL DEFAULT '',
  `user_password` varchar(20) NOT NULL DEFAULT '',
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  `access_token` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '每次登陆更新',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_user` WRITE;
/*!40000 ALTER TABLE `par_user` DISABLE KEYS */;

INSERT INTO `par_user` (`id`, `type`, `department_id`, `name`, `sex`, `cellphone`, `user_login`, `user_password`, `created_at`, `updated_at`, `access_token`)
VALUES
	(1,0,0,'李静波','男',NULL,'admin','bd417e904f9c00d3',0,1536851581,'eyJpdiI6ImUweFAxNnlkaUl1bzlWZnJkazk0c1E9PSIsInZhbHVlIjoiOFhnNnA3anZyM3haNnhOTFh4QkVUcVNKd05IYmNrb2gzNkVsQytGVUZRcGFNVlBWa1FVN1g5U1o4SmgzZkV6ZDB3dGFpK3VwSkl0UnN4QlNsNnFJU0FTT2xGN2I1Y1hYTVVjV3g2bUlKZlhkWGdJUFNEam85b2VDMnUwNEpOVjZWeWZma3JDVkJQazQ3aitZWTJyTk9vSzF3TVB0VkFuaXZ6SVRHdlwvRmkxZ3llRkh6Z0lPMDNVZ0RwWWRZam84SGl4Y2xuR3FXTEFaY3F3ZGwyWkNwWDc0XC95WjlGaVwvckhcLzZOOUx1MHd4SWhmQVM3aU5wazB0TW83RDF0OE1veEU3bTdFS2hwdHFXUGxnTlRRaVpZWWRrNGVueWNMbHlieTIxbnBtVWZSTXdiOFNLUkNFTEx0T0xyRVpOeGdPY2tqb2hZdXI2NkozVFh0MFhhdGZnbXBLMWttVmxLcFYycFJMckhSNVwvRGhleERIbCtnTHdFekFoM2pyblhcL1p5VnZcL0JaN3FLR1BOaDNUU1VoYmhETjhSaW9aZUJqcXBweE1SRHYxWWNCc2ZzRzg9IiwibWFjIjoiZWZhNzk5ODBhMWMxNGU1NTU3MGIxYTQ4YjRhNzI2MjNiOTNlNWRkYWE1MDQzMThhNDQ2MGY4ZDc4YWY5MGZhNiJ9'),
	(2,1,1,'123','女',NULL,'leader','bd417e904f9c00d3',0,1536857017,'eyJpdiI6InlaM1lYVTRPQzJ6czQrNjlub3ZcL0hRPT0iLCJ2YWx1ZSI6Imt4NUthTng3ejE5WnNicm55NkxPV2tUUnFEMlwvZVVWSk1PMHRYWUlldVdcL0x0RHE3V3h2UUVSVXoyXC9yWWRkMGtrQXdjYmgxZkM4TXJkVkVsdE9QZ3NrclBRUkpOWURQVHlcL3ZIaFVQTlJtaHBSd0pVSm12RTdZTkRJOEZoTXJTdFY3bHFKZzBRNFY0bkVIbkMxOHZlanhXU3ZGMzVuT3VJamppeGNZOGs3Q2xMVlN6Qm5JaXZWNTNFR0RBNnVyNThoYlI0SVUwRVwvR1R2SnlIZTVOMGtyN3c0NUFVR2hVcDZiS1E5YjFPZWd3XC91Uk5UenZ3ZXordkljd2l1RUU1SzFDOUsyNEdRSHVSZXZuYXNjeGJLZ3pldzZUNnFGTjE3REFUZkM5RVlZamZtbHN3V3pzVis0TVl5azBKTVQwQXo1N0YxdWgzb1BnUHVGY1dQRlBhaVVWZE1BNXF2NFJFVkQxMVpveGJTS3BWeTNjZWxTYkJ1OG5vcFpMNnZxaURJMGpBRWpEU1BvTTJ4SWJ4UDVpSmRpcTNNTFwvcHZZYldENXpHTVNST3lNZ2R3PSIsIm1hYyI6IjU2MmMyOGMzOWIyM2IxNmQ0ZmQzZDU3NDNiZTQzOTEwMzhlNWQ5NzJiZmEzNWQ3OGVhNGE4OWI1YjhiMzE0NjIifQ=='),
	(5,2,2,'张三','男','15598259922','party','',0,0,NULL),
	(9,2,2,'李四','女','12312','lisi','',0,1,NULL);

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
  `more` text CHARACTER SET utf8 COLLATE utf8_general_ci,
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
	(14,9,1,'321','321','{\"files\":null}',1536760316,1536760317,1536760317);

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
	(3,14,2,0,NULL,1536760317,1536760317);

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
	(12,14,2,1536760317,1536760317);

/*!40000 ALTER TABLE `par_user_comment_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_user_notification
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_user_notification`;

CREATE TABLE `par_user_notification` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `is_checked` int(11) unsigned NOT NULL DEFAULT '0',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table par_user_party_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_user_party_info`;

CREATE TABLE `par_user_party_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `joined_at` int(11) NOT NULL COMMENT '入党日期',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_user_party_info` WRITE;
/*!40000 ALTER TABLE `par_user_party_info` DISABLE KEYS */;

INSERT INTO `par_user_party_info` (`id`, `user_id`, `joined_at`, `created_at`, `updated_at`)
VALUES
	(1,5,312312,0,0);

/*!40000 ALTER TABLE `par_user_party_info` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_user_payment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_user_payment`;

CREATE TABLE `par_user_payment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `amount` int(11) unsigned NOT NULL,
  `api_recive_msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付接口接受到的信息',
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


# Dump of table par_user_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_user_role`;

CREATE TABLE `par_user_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table par_vote
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_vote`;

CREATE TABLE `par_vote` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `is_ restrict_user` int(11) DEFAULT NULL COMMENT '是否限定人员;0:所有人可以参加;1:只有关联人员可以参加',
  `initiate_user_id` int(11) DEFAULT NULL COMMENT '发起人',
  `type` tinyint(1) DEFAULT NULL COMMENT '类型;1:选举;2:表决;',
  `option_type` tinyint(1) DEFAULT NULL COMMENT '选项类型;1:人;2:文字',
  `initiate_content` text COMMENT '发起时候的内容',
  `is_publish` tinyint(1) DEFAULT NULL COMMENT '是否公示',
  `publish_content` text COMMENT '公示发布时候的内容',
  `started_at` int(11) DEFAULT NULL,
  `ended_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table par_vote_option
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_vote_option`;

CREATE TABLE `par_vote_option` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vote_id` int(11) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL COMMENT '选项类型;1:人;2:文字',
  `content_user_id` int(11) unsigned DEFAULT NULL COMMENT 'type=1时填写',
  `content_text` varchar(255) DEFAULT NULL COMMENT 'type=2时填写',
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table par_vote_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_vote_user`;

CREATE TABLE `par_vote_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vote_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `select_option_id` int(11) unsigned NOT NULL,
  `created_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
