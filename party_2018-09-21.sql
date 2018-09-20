# ************************************************************
# Sequel Pro SQL dump
# Version 5224
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.12)
# Database: party
# Generation Time: 2018-09-20 16:15:00 +0000
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
  `cellphone` varchar(255) DEFAULT NULL,
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
	(1,0,'呼市党支部','11','22','33','44','55','张三','0-',1536141060,0,1536248392,'{\"thumbnail\":\"\\/upload\\/20180905\\/IMG_20171013_111047.jpg\"}'),
	(2,1,'新城区党支部',NULL,NULL,NULL,'',NULL,'李四','0-1-',1536052798,0,0,NULL),
	(4,2,'新华大街党支部',NULL,NULL,NULL,'',NULL,'王五','0-1-2-',0,0,0,NULL),
	(5,2,'万达党支部',NULL,NULL,NULL,'',NULL,'','0-1-2-',0,0,0,NULL),
	(6,4,'fdsfss',NULL,NULL,NULL,'',NULL,'','0-1-2-4-',0,0,0,NULL),
	(7,0,'123123123','','','','','15598259922','','0-',1537154012,1537154153,1537154153,'{\"thumbnail\":\"\"}'),
	(8,2,'11111','','','','','15598259922','','0-1-2-',1537154012,1537154166,1537154166,'{\"thumbnail\":\"\"}');

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
	(2,'考题分类2',0,0);

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
	(26,9,1,'/upload/20180920/题.xlsx',23,'{\"file\":[{\"uid\":\"\\/upload\\/20180920\\/\\u9898.xlsx\",\"name\":\"\\u9898.xlsx\",\"size\":9500,\"type\":\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"status\":\"done\",\"url\":\"\\/upload\\/20180920\\/\\u9898.xlsx\"}]}',1537455512,1537455512);

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
  `more` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_exam_paper` WRITE;
/*!40000 ALTER TABLE `par_exam_paper` DISABLE KEYS */;

INSERT INTO `par_exam_paper` (`id`, `name`, `duration`, `is_restrict_user`, `max_score`, `pass_score`, `questions_count`, `published_at`, `finished_at`, `created_at`, `updated_at`, `more`)
VALUES
	(10,'国家',120,1,10,6,10,1536541970,1537628372,1537455679,1537455679,'{\"thumbnail\":\"\\/upload\\/20180920\\/IMG_20160403_055750.jpg\"}');

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
	(31,10,46,1,X'E997AEE9A298323131313233',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1537455679,1537455679),
	(32,10,44,1,X'E997AEE9A298323131313231',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1537455679,1537455679),
	(33,10,45,1,X'E997AEE9A298323131313232',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1537455679,1537455679),
	(34,10,48,1,X'E997AEE9A298323131313235',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1537455679,1537455679),
	(35,10,38,1,X'E997AEE9A298323131313135',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2241225D',1537455679,1537455679),
	(36,10,54,1,X'E997AEE9A298323131313331',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1537455679,1537455679),
	(37,10,33,1,X'E997AEE9A2983120202020203132333132333132',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863227D',X'5B2241222C2242225D',1537455679,1537455679),
	(38,10,55,1,X'E997AEE9A298323131313332',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1537455679,1537455679),
	(39,10,49,1,X'E997AEE9A298323131313236',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1537455679,1537455679),
	(40,10,35,1,X'E997AEE9A298323131313132',X'7B2241223A225C75376235345C753638343861222C2242223A225C75376235345C753638343862222C2243223A225C75376235345C753638343863222C2244223A225C75376235345C753638343864227D',X'5B2242225D',1537455679,1537455679);

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
	(7,10,2,1,1);

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
	(33,26,1,1,'问题1     12312312','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\"}','[\"A\",\"B\"]',1537455512,1537455512),
	(34,26,2,0,'问题211111','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"A\"]',1537455512,1537455512),
	(35,26,3,0,'问题211112','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537455512,1537455512),
	(36,26,4,0,'问题211113','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"C\"]',1537455512,1537455512),
	(37,26,5,0,'问题211114','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"D\"]',1537455512,1537455512),
	(38,26,6,0,'问题211115','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"A\"]',1537455512,1537455512),
	(39,26,7,0,'问题211116','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537455512,1537455512),
	(40,26,8,0,'问题211117','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"C\"]',1537455512,1537455512),
	(41,26,9,0,'问题211118','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\",\"D\"]',1537455512,1537455512),
	(42,26,10,0,'问题211119','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537455512,1537455512),
	(43,26,11,0,'问题211120','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537455512,1537455512),
	(44,26,12,0,'问题211121','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537455512,1537455512),
	(45,26,13,0,'问题211122','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537455512,1537455512),
	(46,26,14,0,'问题211123','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537455512,1537455512),
	(47,26,15,0,'问题211124','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537455512,1537455512),
	(48,26,16,0,'问题211125','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537455512,1537455512),
	(49,26,17,0,'问题211126','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537455512,1537455512),
	(50,26,18,0,'问题211127','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537455512,1537455512),
	(51,26,19,0,'问题211128','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537455512,1537455512),
	(52,26,20,0,'问题211129','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537455512,1537455512),
	(53,26,21,0,'问题211130','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537455512,1537455512),
	(54,26,22,0,'问题211131','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537455512,1537455512),
	(55,26,23,0,'问题211132','{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"}','[\"B\"]',1537455512,1537455512);

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
  `paper_snapshot` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `answers_snapshot` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
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
	(9,2,10,1,'{\"id\":10,\"name\":\"\\u56fd\\u5bb6\",\"duration\":20,\"is_restrict_user\":1,\"max_score\":10,\"pass_score\":6,\"questions_count\":10,\"published_at\":1536541970,\"finished_at\":1537628372,\"created_at\":\"1537455679\",\"updated_at\":\"1537455679\",\"more\":{\"thumbnail\":\"\\/upload\\/20180920\\/IMG_20160403_055750.jpg\"},\"time_status\":1,\"time_status_format\":\"\\u8fdb\\u884c\\u4e2d\",\"published_at_format\":\"2018-09-10 01:12:50\",\"finished_at_format\":\"2018-09-22 14:59:32\",\"created_at_format\":\"2018-09-20 15:01:19\",\"updated_at_format\":\"2018-09-20 15:01:19\",\"questions\":[{\"id\":31,\"paper_id\":10,\"question_id\":46,\"question_score\":1,\"title\":\"\\u95ee\\u9898211123\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"B\"],\"created_at\":\"1537455679\",\"updated_at\":\"1537455679\",\"created_at_format\":\"2018-09-20 15:01:19\"},{\"id\":32,\"paper_id\":10,\"question_id\":44,\"question_score\":1,\"title\":\"\\u95ee\\u9898211121\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"B\"],\"created_at\":\"1537455679\",\"updated_at\":\"1537455679\",\"created_at_format\":\"2018-09-20 15:01:19\"},{\"id\":33,\"paper_id\":10,\"question_id\":45,\"question_score\":1,\"title\":\"\\u95ee\\u9898211122\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"B\"],\"created_at\":\"1537455679\",\"updated_at\":\"1537455679\",\"created_at_format\":\"2018-09-20 15:01:19\"},{\"id\":34,\"paper_id\":10,\"question_id\":48,\"question_score\":1,\"title\":\"\\u95ee\\u9898211125\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"B\"],\"created_at\":\"1537455679\",\"updated_at\":\"1537455679\",\"created_at_format\":\"2018-09-20 15:01:19\"},{\"id\":35,\"paper_id\":10,\"question_id\":38,\"question_score\":1,\"title\":\"\\u95ee\\u9898211115\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"A\"],\"created_at\":\"1537455679\",\"updated_at\":\"1537455679\",\"created_at_format\":\"2018-09-20 15:01:19\"},{\"id\":36,\"paper_id\":10,\"question_id\":54,\"question_score\":1,\"title\":\"\\u95ee\\u9898211131\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"B\"],\"created_at\":\"1537455679\",\"updated_at\":\"1537455679\",\"created_at_format\":\"2018-09-20 15:01:19\"},{\"id\":37,\"paper_id\":10,\"question_id\":33,\"question_score\":1,\"title\":\"\\u95ee\\u98981     12312312\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\"},\"answers\":[\"A\",\"B\"],\"created_at\":\"1537455679\",\"updated_at\":\"1537455679\",\"created_at_format\":\"2018-09-20 15:01:19\"},{\"id\":38,\"paper_id\":10,\"question_id\":55,\"question_score\":1,\"title\":\"\\u95ee\\u9898211132\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"B\"],\"created_at\":\"1537455679\",\"updated_at\":\"1537455679\",\"created_at_format\":\"2018-09-20 15:01:19\"},{\"id\":39,\"paper_id\":10,\"question_id\":49,\"question_score\":1,\"title\":\"\\u95ee\\u9898211126\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"B\"],\"created_at\":\"1537455679\",\"updated_at\":\"1537455679\",\"created_at_format\":\"2018-09-20 15:01:19\"},{\"id\":40,\"paper_id\":10,\"question_id\":35,\"question_score\":1,\"title\":\"\\u95ee\\u9898211112\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"B\"],\"created_at\":\"1537455679\",\"updated_at\":\"1537455679\",\"created_at_format\":\"2018-09-20 15:01:19\"}],\"attend_users\":[{\"id\":2,\"type\":1,\"department_id\":1,\"name\":\"123\",\"sex\":\"\\u5973\",\"cellphone\":null,\"duty\":null,\"user_login\":\"leader\",\"user_password\":\"bd417e904f9c00d3\",\"access_token\":\"eyJpdiI6IkJiQm4zckw0cUFHXC9BOUEwWnA1UGxnPT0iLCJ2YWx1ZSI6IkJXME85TTRya0hoNUUrV3lyQkh3Y1hncElRVEFWaUhFZXl1bDJUUEQzc0V6RDlmKzBWQVVsbW84dTIwNzZJbXBvK3FrTUh3QzJBTlwvanNDQUU4VGxwakJ3YUxEMVVUdElNc1pJMFZkcG8zOWZFY3p5UDh6RFwvSjJhbERraHFHTVVRdGlXXC9OMng5Mk05azc5MnhvMG1oam5WYjBtWVV2MkV0anVZV1ZZdVN6UEQwVUVCNGZTWG51aVVrckdkV3J4QkVFMWtjZlwvMGRrV2tlT3d6dzdBenNzYmsyK1BNcHdcL0Y3T0dsemhsaXl3Zmh5WDVKS1wvU253d3V2WWZVSEhPTXdxUGtUMm9cLzB4dWRaRnlHUUlObzlPbEV2R2hRWmNSZWFzMUxvQjAwU0YzTUROYmpta2RuSG9uaGNreW4xeWJnSDlUR1gzcWNXMGJxSDU5XC9jSXlRZmFpeHF0cWZCem9teHJkQTdnZFwveUlhaEZvakVHOE85Z055V0RxbmwrUTlzOHZXUjFPQ0Q4ZFRlZ3pSVHpUZFlFb1wva2xadUFnU0puNkRDNzhxYjNTZXUwPSIsIm1hYyI6ImRiZjViMWQ4Njk2ODAxZGVmYzA2NjI3ZDllZmYxZGViZjE5NTI0ZTE3Yzk2MjI2MGY0NjVmNDhmY2ViODZmZjAifQ==\",\"borned_at\":null,\"created_at\":\"0\",\"updated_at\":\"1537454340\",\"more\":{\"thumbnail\":\"\\/upload\\/20180918\\/IMG_20160403_135828.jpg\"},\"paper_id\":10,\"type_format\":\"\\u9886\\u5bfc\",\"borned_at_format\":\"\",\"thumbnail_format\":\"\\/upload\\/20180918\\/IMG_20160403_135828.jpg\"}]}','[{\"id\":31,\"paper_id\":10,\"question_id\":46,\"question_score\":1,\"title\":\"\\u95ee\\u9898211123\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"B\"],\"created_at\":\"1537455679\",\"updated_at\":\"1537455679\",\"created_at_format\":\"2018-09-20 15:01:19\",\"user_answers\":[\"D\"],\"user_answers_format\":\"D\"},{\"id\":32,\"paper_id\":10,\"question_id\":44,\"question_score\":1,\"title\":\"\\u95ee\\u9898211121\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"B\"],\"created_at\":\"1537455679\",\"updated_at\":\"1537455679\",\"created_at_format\":\"2018-09-20 15:01:19\",\"user_answers\":[\"D\"],\"user_answers_format\":\"D\"},{\"id\":33,\"paper_id\":10,\"question_id\":45,\"question_score\":1,\"title\":\"\\u95ee\\u9898211122\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"B\"],\"created_at\":\"1537455679\",\"updated_at\":\"1537455679\",\"created_at_format\":\"2018-09-20 15:01:19\",\"user_answers\":[\"C\"],\"user_answers_format\":\"C\"},{\"id\":34,\"paper_id\":10,\"question_id\":48,\"question_score\":1,\"title\":\"\\u95ee\\u9898211125\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"B\"],\"created_at\":\"1537455679\",\"updated_at\":\"1537455679\",\"created_at_format\":\"2018-09-20 15:01:19\",\"user_answers\":[\"B\"],\"user_answers_format\":\"B\"},{\"id\":35,\"paper_id\":10,\"question_id\":38,\"question_score\":1,\"title\":\"\\u95ee\\u9898211115\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"A\"],\"created_at\":\"1537455679\",\"updated_at\":\"1537455679\",\"created_at_format\":\"2018-09-20 15:01:19\",\"user_answers\":[\"D\"],\"user_answers_format\":\"D\",\"is_correct\":0},{\"id\":36,\"paper_id\":10,\"question_id\":54,\"question_score\":1,\"title\":\"\\u95ee\\u9898211131\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"B\"],\"created_at\":\"1537455679\",\"updated_at\":\"1537455679\",\"created_at_format\":\"2018-09-20 15:01:19\",\"user_answers\":[\"B\"],\"user_answers_format\":\"B\"},{\"id\":37,\"paper_id\":10,\"question_id\":33,\"question_score\":1,\"title\":\"\\u95ee\\u98981     12312312\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\"},\"answers\":[\"A\",\"B\"],\"created_at\":\"1537455679\",\"updated_at\":\"1537455679\",\"created_at_format\":\"2018-09-20 15:01:19\",\"user_answers\":[\"A\",\"C\"],\"user_answers_format\":\"A,C\",\"is_correct\":0},{\"id\":38,\"paper_id\":10,\"question_id\":55,\"question_score\":1,\"title\":\"\\u95ee\\u9898211132\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"B\"],\"created_at\":\"1537455679\",\"updated_at\":\"1537455679\",\"created_at_format\":\"2018-09-20 15:01:19\",\"user_answers\":[\"C\"],\"user_answers_format\":\"C\"},{\"id\":39,\"paper_id\":10,\"question_id\":49,\"question_score\":1,\"title\":\"\\u95ee\\u9898211126\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"B\"],\"created_at\":\"1537455679\",\"updated_at\":\"1537455679\",\"created_at_format\":\"2018-09-20 15:01:19\",\"user_answers\":[\"C\"],\"user_answers_format\":\"C\"},{\"id\":40,\"paper_id\":10,\"question_id\":35,\"question_score\":1,\"title\":\"\\u95ee\\u9898211112\",\"options\":{\"A\":\"\\u7b54\\u6848a\",\"B\":\"\\u7b54\\u6848b\",\"C\":\"\\u7b54\\u6848c\",\"D\":\"\\u7b54\\u6848d\"},\"answers\":[\"B\"],\"created_at\":\"1537455679\",\"updated_at\":\"1537455679\",\"created_at_format\":\"2018-09-20 15:01:19\",\"user_answers\":[\"A\"],\"user_answers_format\":\"A\",\"is_correct\":1}]',1,0,1537457787,1537459996);

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
  `ended_at` int(11) unsigned DEFAULT NULL,
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_meeting` WRITE;
/*!40000 ALTER TABLE `par_meeting` DISABLE KEYS */;

INSERT INTO `par_meeting` (`id`, `department_id`, `initiate_user_id`, `need_audit`, `title`, `type`, `location`, `opened_at`, `ended_at`, `created_at`, `updated_at`)
VALUES
	(3,1,2,1,'测试title1',2,'测试location2',1535096224,1535096324,1535096124,1535096124),
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
	(15,1,10000,'热门新闻','','list_news','','0-1-','{\"thumbnail\":\"\"}',1537253726,1537253726);

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
	(11,12,12,10000,1537378852,1537378852);

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
	(2,0,1,0,0,0,0,6,0,0,'1',X'33','2','4','',1536311347,1537378837,1537169145,'{\"thumbnail\":\"\\/upload\\/20180918\\/IMG_20170907_170000.jpg\",\"photos\":null,\"videos\":null,\"files\":null}'),
	(3,0,1,0,0,0,0,0,0,0,'2',X'33','2','4','',1536311463,1536595466,1537169145,'{\"thumbnail\":\"\\/upload\\/20180918\\/IMG_20160403_135828.jpg\",\"photos\":null,\"videos\":null,\"files\":[{\"uid\":\"\\/upload\\/20180910\\/\\u5e73\\u53f0\\u9996\\u98755.jpg\",\"name\":\"\\u5e73\\u53f0\\u9996\\u98755.jpg\",\"size\":8252622,\"type\":\"image\\/jpeg\",\"status\":\"done\",\"url\":\"\\/upload\\/20180910\\/\\u5e73\\u53f0\\u9996\\u98755.jpg\"},{\"uid\":\"\\/upload\\/20180910\\/\\u684c\\u9762\\u56fe\\u6807.png\",\"name\":\"\\u684c\\u9762\\u56fe\\u6807.png\",\"size\":5652,\"type\":\"image\\/png\",\"status\":\"done\",\"url\":\"\\/upload\\/20180910\\/\\u684c\\u9762\\u56fe\\u6807.png\"}]}'),
	(4,0,1,0,0,0,0,2,0,0,'3',X'33','2','4','',1536311527,1537379070,1537169145,'{\"thumbnail\":\"\\/upload\\/20180918\\/IMG_20160403_135828.jpg\",\"photos\":null,\"videos\":null,\"files\":null}'),
	(7,0,1,0,0,0,0,12,0,0,'5',X'33','2','4','',1536311667,1537373276,1537169145,'{\"thumbnail\":\"\\/upload\\/20180918\\/IMG_20160403_135828.jpg\",\"photos\":\"\\\"null\\\"\",\"videos\":\"\\\"null\\\"\",\"files\":\"\\\"null\\\"\"}'),
	(9,0,0,0,0,0,0,0,0,0,'6',X'333333333231333132','','','',1536594705,1536594705,1537169145,'{\"thumbnail\":\"\\/upload\\/20180918\\/IMG_20160403_135828.jpg\",\"photos\":null,\"videos\":null,\"files\":[{\"lastModified\":1532954176000,\"lastModifiedDate\":\"2018-07-30T12:36:16.000Z\",\"name\":\"\\u7fa4\\u4f17\\u767b\\u5f55\\u9996\\u9875.jpg\",\"size\":4939360,\"type\":\"image\\/jpeg\",\"uid\":\"vc-upload-1536594568293-14\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20180910\\/\\u7fa4\\u4f17\\u767b\\u5f55\\u9996\\u9875.jpg\"},\"percent\":100,\"originFileObj\":{\"uid\":\"vc-upload-1536594568293-14\"},\"status\":\"done\"},{\"lastModified\":1532952240000,\"lastModifiedDate\":\"2018-07-30T12:04:00.000Z\",\"name\":\"\\u8868\\u5355\\u4eba\\u6811\\u5f62.jpg\",\"size\":7683678,\"type\":\"image\\/jpeg\",\"uid\":\"vc-upload-1536594568293-15\",\"response\":{\"success\":1,\"data\":\"\\/upload\\/20180910\\/\\u8868\\u5355\\u4eba\\u6811\\u5f62.jpg\"},\"percent\":100,\"originFileObj\":{\"uid\":\"vc-upload-1536594568293-15\"},\"status\":\"done\"}]}'),
	(10,0,0,0,0,0,0,0,0,0,'7',X'33323131333132333132','','','',1537169145,1537169145,1537169145,'{\"thumbnail\":\"\\/upload\\/20180918\\/IMG_20160403_135828.jpg\",\"photos\":null,\"videos\":null,\"files\":null}'),
	(11,0,0,1,0,0,0,1,0,0,'1231221','','','','',1537328842,1537328848,1537328825,'{\"thumbnail\":\"\\/upload\\/20180919\\/IMG_20160404_175519.jpg\",\"photos\":[{\"name\":\"IMG_20160404_180226.jpg\",\"size\":4225733,\"type\":\"image\\/jpeg\",\"url\":\"\\/upload\\/20180919\\/IMG_20160404_180226.jpg\"},{\"name\":\"IMG_20160403_145358.jpg\",\"size\":5282623,\"type\":\"image\\/jpeg\",\"url\":\"\\/upload\\/20180919\\/IMG_20160403_145358.jpg\"},{\"name\":\"IMG_20171013_111047.jpg\",\"size\":4245915,\"type\":\"image\\/jpeg\",\"url\":\"\\/upload\\/20180919\\/IMG_20171013_111047.jpg\"}],\"videos\":null,\"files\":[{\"uid\":\"\\/upload\\/20180919\\/IMG_20160404_180229.jpg\",\"name\":\"IMG_20160404_180229.jpg\",\"size\":4370042,\"type\":\"image\\/jpeg\",\"status\":\"done\",\"url\":\"\\/upload\\/20180919\\/IMG_20160404_180229.jpg\"},{\"uid\":\"\\/upload\\/20180919\\/IMG_20160404_180226.jpg\",\"name\":\"IMG_20160404_180226.jpg\",\"size\":4225733,\"type\":\"image\\/jpeg\",\"status\":\"done\",\"url\":\"\\/upload\\/20180919\\/IMG_20160404_180226.jpg\"},{\"uid\":\"\\/upload\\/20180919\\/IMG_20160404_180222.jpg\",\"name\":\"IMG_20160404_180222.jpg\",\"size\":4599632,\"type\":\"image\\/jpeg\",\"status\":\"done\",\"url\":\"\\/upload\\/20180919\\/IMG_20160404_180222.jpg\"},{\"uid\":\"\\/upload\\/20180919\\/IMG_20160404_180224.jpg\",\"name\":\"IMG_20160404_180224.jpg\",\"size\":4288682,\"type\":\"image\\/jpeg\",\"status\":\"done\",\"url\":\"\\/upload\\/20180919\\/IMG_20160404_180224.jpg\"}]}'),
	(12,0,0,0,0,0,0,0,0,0,'12321','','','','',1537378852,1537378852,0,'{\"thumbnail\":null,\"photos\":null,\"videos\":null,\"files\":null}');

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
	(10,3,0,0,'',1536595466,1536595466),
	(11,2,0,0,'',1537240159,1537240159);

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
	(142,0,'/upload/20180920/题.xlsx',1537455509),
	(143,0,'/upload/20180920/IMG_20160403_055750.jpg',1537455583);

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
  `duty` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职务',
  `user_login` varchar(20) NOT NULL DEFAULT '',
  `user_password` varchar(20) NOT NULL DEFAULT '',
  `access_token` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '每次登陆更新',
  `borned_at` int(11) DEFAULT NULL COMMENT '生日',
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  `more` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_user` WRITE;
/*!40000 ALTER TABLE `par_user` DISABLE KEYS */;

INSERT INTO `par_user` (`id`, `type`, `department_id`, `name`, `sex`, `cellphone`, `duty`, `user_login`, `user_password`, `access_token`, `borned_at`, `created_at`, `updated_at`, `more`)
VALUES
	(1,0,0,'李静波','男',NULL,NULL,'admin','bd417e904f9c00d3','eyJpdiI6InEwS1dTZGpOczZtbTNhV2VKNUZVN2c9PSIsInZhbHVlIjoibEJBWVFMYTlHTlNRcVZSTGRXVVNcL21ybGxLbkE1WHJ1aEN3Q2NzS0tScjl5d3NZZURIR09pVTE1ZkUyeXdKZzh0RmtoZGdmNGl2UHc2SVE0b2hUZnZtSFRyRjlFbTBzaGtDSXBuM1V1VnNDTVhDVXJlc0t4OXBDRG5DNlByemZ1TGdlS1NiK1hGSndueTMySnZIZk1SVFEyZ1YreitManNGU1p3MkRSQzNTZFZqSjJJemsySmhJRTFZaDl1N3c3U1VxTFNRTkFKSmIwXC9PSXMzR1FkVEFEODdyTjdObWxhMzJDcU1FcGRzZXNwalBtR1VhdkF2ZzdhNmF1U0NJNkQ0dEFhUmIwa0ZqWHpWSnJRRnNndmNyUEdFeTl2OGw5OWxcL0hQbXJwaVVTYlh4RHFaY2wxZEtIdGtjdGpqOXdzaURXb1NwUDVXRFVWcVZ0dzI0YXAwWFwvNFBVZDV4THNpQWd0anBpNDE5aFZRaVZoQkV4TWNBTXFscGkxNkNrNW1cLytwMW5LZUZyNGlBMGJ6dWdUeEl5ajViY1FIc2V2eXZEa3JTczFVUENMVDY4PSIsIm1hYyI6IjlkNDhlZTdjNmI5ZTVlZDIwOGMyY2IyODZlMGU4Y2U2NTE0Y2IxODdlOTA5OGQyOGYzMGEzYTYzNWVhOTUxM2MifQ==',NULL,0,1537372563,NULL),
	(2,1,1,'123','女',NULL,NULL,'leader','bd417e904f9c00d3','eyJpdiI6IkJiQm4zckw0cUFHXC9BOUEwWnA1UGxnPT0iLCJ2YWx1ZSI6IkJXME85TTRya0hoNUUrV3lyQkh3Y1hncElRVEFWaUhFZXl1bDJUUEQzc0V6RDlmKzBWQVVsbW84dTIwNzZJbXBvK3FrTUh3QzJBTlwvanNDQUU4VGxwakJ3YUxEMVVUdElNc1pJMFZkcG8zOWZFY3p5UDh6RFwvSjJhbERraHFHTVVRdGlXXC9OMng5Mk05azc5MnhvMG1oam5WYjBtWVV2MkV0anVZV1ZZdVN6UEQwVUVCNGZTWG51aVVrckdkV3J4QkVFMWtjZlwvMGRrV2tlT3d6dzdBenNzYmsyK1BNcHdcL0Y3T0dsemhsaXl3Zmh5WDVKS1wvU253d3V2WWZVSEhPTXdxUGtUMm9cLzB4dWRaRnlHUUlObzlPbEV2R2hRWmNSZWFzMUxvQjAwU0YzTUROYmpta2RuSG9uaGNreW4xeWJnSDlUR1gzcWNXMGJxSDU5XC9jSXlRZmFpeHF0cWZCem9teHJkQTdnZFwveUlhaEZvakVHOE85Z055V0RxbmwrUTlzOHZXUjFPQ0Q4ZFRlZ3pSVHpUZFlFb1wva2xadUFnU0puNkRDNzhxYjNTZXUwPSIsIm1hYyI6ImRiZjViMWQ4Njk2ODAxZGVmYzA2NjI3ZDllZmYxZGViZjE5NTI0ZTE3Yzk2MjI2MGY0NjVmNDhmY2ViODZmZjAifQ==',NULL,0,1537454340,'{\"thumbnail\":\"\\/upload\\/20180918\\/IMG_20160403_135828.jpg\"}'),
	(5,2,2,'张三','男','15598259922',NULL,'party','bd417e904f9c00d3','eyJpdiI6Ilp3bytDS3A0dmFCMjBCOStwY1h6RHc9PSIsInZhbHVlIjoidStjaTN4dFBSRWVYT3lZS1pmVm13eWVSQmZKMW9rSGVsVTVTMWVtRGtpdmJsMW5id1poclwva2tCSVVkcEhmaE1wXC9UcXZlVURkNlZocDZlbzBUU1pKZDhjRTAraCs3elRNdkZKMTRuTFRlUGpzc0dVR2xlaU1qQ2l5bmduWFRyQmxhb1VJVTVcL3NNdVJOYVB2VlwvUHFQVXV6a29mTlo2SHFWcENockVWMDQwXC8yVEFxXC9rcjBJUEhFb0UxTk9aZ2dFaDNSc2M1aDAzSzNzMk03YkRiYWhlRmV5dEpMcUNpNFdmOXdMNlk0VzlWMTc5QlZZV0lCR1RCbGRlRDV2aUF3UGZTQVFRSm5TOWVxUTk4bTJoZ2w3bEN5eElyZUhcL3c1UmtVcVhmVXlxTGNPdlwvcVhQUHlodzl1MnhQYmZcL1g3Qk5cL2RiXC9zbHBaVHg0VnZ4Rk9DNnUwR3hLS3pvVGl5aTc0YkVvSkphNTFUbmk0U1wvcWVaZU4xY0lobXZ5QkJpc3hEa1ozVHlZXC9hclhLejZJRmtOeVRZN090MjYrbGZodk04MHlkVVhiY3RzZGs9IiwibWFjIjoiMjQ5YWZhNzhkMDE3NGY5Yjg4Y2ZjYmVjM2U4ZjUzZGMwZGUzN2M1ODg0NzkyYWVkYWZhZjI2YmNiNWEzYWY5NSJ9',NULL,0,1537170468,NULL),
	(9,2,2,'李四','女','12312','办公室委员11','lisi','bd417e904f9c00d3',NULL,321,0,1537153577,NULL),
	(10,1,1,'2','',NULL,NULL,'4','bd417e904f9c00d3',NULL,NULL,1537169358,1537169358,'{\"thumbnail\":\"\\/upload\\/20180918\\/IMG_20160403_135828.jpg\"}'),
	(11,1,1,'123121','',NULL,'312321','123123','123456',NULL,NULL,1537240584,1537240584,'{\"thumbnail\":\"\\/upload\\/20180918\\/IMG_20160403_135828.jpg\"}'),
	(12,1,1,'123121','',NULL,'312321','123123','123456',NULL,NULL,1537240740,1537240740,'{\"thumbnail\":\"\\/upload\\/20180918\\/IMG_20160403_135828.jpg\"}');

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
  `rdsq_more` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '入党申请',
  `jjfz_passed_at` int(11) unsigned DEFAULT NULL COMMENT '积极分子',
  `jjfz_more` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '积极分子',
  `fzdx_passed_at` int(11) unsigned DEFAULT NULL COMMENT '发展对象',
  `fzdx_more` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '发展对象',
  `ybdy_passed_at` int(11) unsigned DEFAULT NULL COMMENT '预备党员',
  `ybdy_more` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '预备党员',
  `zsdy_passed_at` int(11) unsigned DEFAULT NULL COMMENT '正式党员',
  `zsdy_more` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '正式党员',
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
  `department_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '单位名称',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `created_at` int(11) unsigned NOT NULL,
  `updated_at` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `par_user_info_party_relation` WRITE;
/*!40000 ALTER TABLE `par_user_info_party_relation` DISABLE KEYS */;

INSERT INTO `par_user_info_party_relation` (`id`, `user_id`, `started_at`, `ended_at`, `department_name`, `sort_order`, `created_at`, `updated_at`)
VALUES
	(1,2,1,2,'3213123',0,0,0),
	(2,2,55,22,'32131',0,0,0),
	(3,2,23121321,312,'32121',0,0,0);

/*!40000 ALTER TABLE `par_user_info_party_relation` ENABLE KEYS */;
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
