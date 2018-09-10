# ************************************************************
# Sequel Pro SQL dump
# Version 5224
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.12)
# Database: party
# Generation Time: 2018-09-10 16:38:12 +0000
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
	(1,0,'11111','11','22','33','44',55,'66','0-',1536141060,0,1536248392,'{\"thumbnail\":\"\\/upload\\/20180905\\/IMG_20171013_111047.jpg\"}'),
	(2,1,'2',NULL,NULL,NULL,'',NULL,'','0-1-',1536052798,0,0,NULL),
	(4,2,'4',NULL,NULL,NULL,'',NULL,'','0-1-2-',0,0,0,NULL),
	(5,2,'5',NULL,NULL,NULL,'',NULL,'','0-1-2-',0,0,0,NULL),
	(6,4,'6',NULL,NULL,NULL,'',NULL,'','0-1-2-4-',0,0,0,NULL);

/*!40000 ALTER TABLE `par_department` ENABLE KEYS */;
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
	(1,'考题分类1',0,1536592702);

/*!40000 ALTER TABLE `par_exam_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_exam_excel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_exam_excel`;

CREATE TABLE `par_exam_excel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `category_id` int(11) unsigned NOT NULL,
  `question_count` int(11) unsigned NOT NULL DEFAULT '0',
  `more` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` int(11) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_exam_excel` WRITE;
/*!40000 ALTER TABLE `par_exam_excel` DISABLE KEYS */;

INSERT INTO `par_exam_excel` (`id`, `user_id`, `category_id`, `question_count`, `more`, `created_at`, `updated_at`)
VALUES
	(10,1,2,4,NULL,0,0),
	(16,1,2,2,'{\"file\":[{\"uid\":\"\\/upload\\/20180910\\/\\u9898.xlsx\",\"name\":\"\\u9898.xlsx\",\"size\":8958,\"type\":\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"status\":\"done\",\"url\":\"\\/upload\\/20180910\\/\\u9898.xlsx\"}]}',1536596998,1536596998),
	(17,1,2,2,'{\"file\":[{\"uid\":\"\\/upload\\/20180910\\/\\u9898.xlsx\",\"name\":\"\\u9898.xlsx\",\"size\":8958,\"type\":\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"status\":\"done\",\"url\":\"\\/upload\\/20180910\\/\\u9898.xlsx\"}]}',1536597018,1536597018),
	(22,1,2,2,'{\"file\":[{\"uid\":\"\\/upload\\/20180910\\/\\u9898.xlsx\",\"name\":\"\\u9898.xlsx\",\"size\":8958,\"type\":\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"status\":\"done\",\"url\":\"\\/upload\\/20180910\\/\\u9898.xlsx\"}]}',1536597322,1536597322),
	(24,1,2,2,'{\"file\":[{\"uid\":\"\\/upload\\/20180910\\/\\u9898.xlsx\",\"name\":\"\\u9898.xlsx\",\"size\":8958,\"type\":\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"status\":\"done\",\"url\":\"\\/upload\\/20180910\\/\\u9898.xlsx\"}]}',1536597472,1536597472);

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
  `max_score` int(11) unsigned NOT NULL DEFAULT '0',
  `pass_score` int(11) unsigned NOT NULL DEFAULT '0',
  `questions_count` int(11) unsigned NOT NULL DEFAULT '0',
  `published_at` int(11) unsigned NOT NULL DEFAULT '0',
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
	(4,'测试paper',1,1,16,60,1,555,555,1535009728,1535009728),
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
	(24,24,2,0,'问题2','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1536597472,1536597472);

/*!40000 ALTER TABLE `par_exam_question` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_exam_user_result
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_exam_user_result`;

CREATE TABLE `par_exam_user_result` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `paper_id` int(11) unsigned NOT NULL,
  `paper_snapshoot` longtext NOT NULL,
  `answers_snapshoot` longtext NOT NULL,
  `score` int(11) unsigned NOT NULL DEFAULT '0',
  `is_passed` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0:未通过;1:通过',
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table par_meeting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_meeting`;

CREATE TABLE `par_meeting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `initiate_user_id` int(11) unsigned NOT NULL COMMENT '发起人，预约人',
  `need_audit` tinyint(1) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `type` int(11) unsigned NOT NULL,
  `location` varchar(255) NOT NULL DEFAULT '',
  `opened_at` int(11) unsigned NOT NULL,
  `ended_at` int(11) unsigned NOT NULL,
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_meeting` WRITE;
/*!40000 ALTER TABLE `par_meeting` DISABLE KEYS */;

INSERT INTO `par_meeting` (`id`, `initiate_user_id`, `need_audit`, `title`, `type`, `location`, `opened_at`, `ended_at`, `created_at`, `updated_at`)
VALUES
	(3,0,1,'测试title',2,'测试location',1535096224,1535096324,1535096124,1535096124),
	(4,0,1,'测试title',2,'测试location',1535096355,1535096455,1535096255,1535096255);

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
	(1,3,5,0,'',1535096124,1535096124),
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
  `type` int(11) DEFAULT NULL COMMENT '用户类型',
  `is_signed_in` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `need_appointment` int(11) DEFAULT NULL,
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  `appointmented_at` int(11) DEFAULT NULL,
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
	(102,0,'/upload/20180910/题.xlsx',1536596498);

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
  `user_login` varchar(20) NOT NULL DEFAULT '',
  `user_password` varchar(20) NOT NULL DEFAULT '',
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  `access_token` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '每次登陆更新',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_user` WRITE;
/*!40000 ALTER TABLE `par_user` DISABLE KEYS */;

INSERT INTO `par_user` (`id`, `type`, `department_id`, `name`, `user_login`, `user_password`, `created_at`, `updated_at`, `access_token`)
VALUES
	(1,0,0,'李静波','admin','bd417e904f9c00d3',0,1536587609,'eyJpdiI6IkpadXQ5TklWcGRNRFZYNjNvNTVmSlE9PSIsInZhbHVlIjoiV1pPejBqQUw0d0FrWHJpaDZDZEJROUxxQnAzSytpOVUzcnV6NlVXYU1IY1JwRE9mNzF6UEZmeXdEckJsRXREeXpENUtOSkhSQVwvR0NEZW1sYTE5amRxT3J1Y1N6UlJSRnhTMW1lck1hNDRpSFFzc3lkNk5VdXRHODA1MXNhQ1wvN3BqOEl0cm5kUnRmRWI1UlpRR09rOWhcL0Q0b0VUaUdCb1Z3TFwvRlRpbGYybk1KSmU1c2E2MDlcL0VuSFRsc3JldjE3bjZqZmhReG1FVXpFWkJVTmM3a1pQZmNkcWJVN1FpcUJqejN2c1pPWnRWc2lzTXJRWDB2ZER4U0Nxek1DK0FtSHBwU01NcWtNSzBFOEtIMXpacjFrT0t4aTJ3NWswOE5QV21DT0FBQ0Q5XC9jNmxpS2htRG9RaW9XWHZFblMxOE9hZFplRERQUXJOTkFjZGkwXC9PTlEzc0Z1eU5ibklNUFdBSHFURE12aUs5UzhPazhnNGk3VmVMVDhKcHZhekF5elN2OXdLZHRBak9kQUhjWmJ4dnNJSW1FcDU1SkIyN2NONlRWTjR4cGwxVHc9IiwibWFjIjoiYmI3ZWVmNTk0Mzg2NzBmMjU0NDY0MDk0YTNkMzM2Njc4M2ZlNTdkMGEyM2U4OGRmZmY5NjEzZGIzMmFjM2I3MyJ9'),
	(2,1,0,'','leader','bd417e904f9c00d3',0,1536589949,'eyJpdiI6Ik9mREdpYUtWbXRicGZzcjRPWnNcL0p3PT0iLCJ2YWx1ZSI6IlpQTEh4VEpQZVRUamxqSitORURkTkVLT0wyRjRGdDFWK1wvTFVmK3JiNE9rU1Z0M1VGenhmcWRha0NaU1hNNWNzNWVDN21QYkRadkZ0MUhvWW1heEJtUkxQNDZWTnhHdlFIN0N4Z3FuNVZrRGxNUnorcEloWTE3YTUxb3kzQlRVdXlaS0Vxa04xNEY0Vnc1SmU5Q2dCNmgwNmw1QVc2XC9hNGNrUzRrd1VXMzJBdXlTczVSNkVLTlwvS3owYzNIR3RwR2lra3NIdldmNHhCZEp2QU56N1NQSythTVpiaW0yeGp0UzdOUUdSa000eUt4c29OeGkrY2YrenJPNDBnYnN4STRZTFlFeitSSDRlVFwvcE4yd1RkWEV1b2pFUFQzK3hHeWxmM1VCT1NwSHBOU3VONDd4SDZvZHVvUXIyaFlnS1BCeTFCbUc4dDVpV0t3TWZWaktoUWRoVzJITjZUUFdvRitaN09WSjNuSEZTUHI4ZVJSYTE1K3BLQVgxWWh5RWJ2TWZkaDlJNUxjUkdQMVd5SFI1K3QzdmlldUJPcnludld5bWFmOGk3MWJNWWFVPSIsIm1hYyI6IjlhZjkwNjEwOGFlYjM5ODhmYThhNjAzZDIyZmJjZmQxMDJhNzBhZGMzODQ0NjUwOTc0ODQzNTNmMWNlYjZmY2UifQ==');

/*!40000 ALTER TABLE `par_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_user_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_user_comment`;

CREATE TABLE `par_user_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发起人id',
  `need_audit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `comment_title` int(11) DEFAULT NULL,
  `comment_content` int(11) DEFAULT NULL,
  `more` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_user_comment` WRITE;
/*!40000 ALTER TABLE `par_user_comment` DISABLE KEYS */;

INSERT INTO `par_user_comment` (`id`, `user_id`, `need_audit`, `comment_title`, `comment_content`, `more`, `created_at`, `updated_at`)
VALUES
	(1,1,0,11,22,NULL,1,2);

/*!40000 ALTER TABLE `par_user_comment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table par_user_comment_audit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_user_comment_audit`;

CREATE TABLE `par_user_comment_audit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) DEFAULT NULL,
  `audit_user_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '审核状态;1:通过;2:不通过',
  `reason` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
	(1,1,1,1,1);

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



# Dump of table par_user_payment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `par_user_payment`;

CREATE TABLE `par_user_payment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `amount` int(11) unsigned NOT NULL,
  `api_recive_msg` text NOT NULL,
  `created_at` int(11) unsigned NOT NULL,
  `finished_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
