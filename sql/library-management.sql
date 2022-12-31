/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.7.39-log : Database - library-management
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`library-management` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `library-management`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatetime` datetime DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username_key` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `admin` */

insert  into `admin`(`id`,`username`,`phone`,`email`,`createtime`,`updatetime`,`password`,`status`) values (1,'admin','13988997788',NULL,'2022-10-08 22:21:26','2022-10-11 20:37:20','ead08e95e9c867a2ee833c232bf55dbc',1);

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `publish_date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '出版日期',
  `author` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '作者',
  `publisher` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '出版社',
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类',
  `book_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标准码',
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '封面',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `score` int(10) DEFAULT NULL COMMENT '积分',
  `nums` int(10) DEFAULT '0' COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `book_no_index` (`book_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `book` */

insert  into `book`(`id`,`name`,`description`,`publish_date`,`author`,`publisher`,`category`,`book_no`,`cover`,`createtime`,`updatetime`,`score`,`nums`) values (12,'计算机系统','卡内基 梅隆大学计算机学院院长兼美国4大机构院士撰写','2016-11-01','Randal E.Bryant','机械工业出版社','','1','http://localhost:9090/api/book/file/download/1672161075932?&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxIiwiZXhwIjoxNjczNDU3MDc1fQ.zZWQog6zy9KX4U3Bsj5P7ucX38GPxPvmjrEreilL06Q&play=1','2022-12-28 01:11:29',NULL,10,1),(13,'aa','aaa','2022-12-06','aa','aa','','2','http://localhost:9090/api/book/file/download/1672216635504?&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxIiwiZXhwIjoxNjczNTEyNjM1fQ.5n4vyR4VE4tCYVrTyKGFKry3vprOeCXfREXnRNqdYKk&play=1','2022-12-28 16:37:16','2022-12-28 00:00:00',10,2);

/*Table structure for table `borrow` */

DROP TABLE IF EXISTS `borrow`;

CREATE TABLE `borrow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图书名称',
  `book_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图书标准码',
  `user_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户会员码',
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名称',
  `user_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户联系方式',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `score` int(10) DEFAULT NULL COMMENT '借书积分',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '已借出' COMMENT '借书状态',
  `days` int(11) DEFAULT '1' COMMENT '借书天数',
  `return_date` datetime DEFAULT NULL COMMENT '归还日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `borrow` */

insert  into `borrow`(`id`,`book_name`,`book_no`,`user_no`,`user_name`,`user_phone`,`createtime`,`updatetime`,`score`,`status`,`days`,`return_date`) values (21,'计算机系统','1','20221228822212720','张桂铭','13182203273','2022-12-28 01:11:53',NULL,60,'已归还',6,'2023-01-03 00:00:00'),(22,'计算机系统','1','20221228998172885','龙书缘','13182203272','2022-12-28 01:12:15',NULL,10,'已借出',1,'2022-12-28 00:00:00'),(23,'aa','2','20221228998172885','龙书缘','13182203272','2022-12-28 16:39:11',NULL,10,'已归还',1,'2022-12-29 00:00:00');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `pid` int(11) DEFAULT NULL COMMENT '父级id',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `category` */

insert  into `category`(`id`,`name`,`remark`,`pid`,`createtime`,`updatetime`) values (3,'历史文化','历史文化',NULL,'2022-10-12 20:42:53',NULL),(4,'唐朝文化','唐朝文化',3,'2022-10-12 20:43:21',NULL),(5,'宋朝文化',NULL,3,'2022-10-12 20:46:29',NULL),(9,'现代文化','现代文化',3,'2022-10-12 21:00:41',NULL),(10,'科技','科技',NULL,'2022-10-12 21:50:08',NULL),(11,'高新科技',NULL,10,'2022-10-12 21:50:16',NULL),(12,'生物科技','生物科技',10,'2022-10-12 21:50:22',NULL),(13,'微分子科技',NULL,11,'2022-10-17 22:11:44',NULL);

/*Table structure for table `retur` */

DROP TABLE IF EXISTS `retur`;

CREATE TABLE `retur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图书名称',
  `book_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图书标准码',
  `user_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户会员码',
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名称',
  `user_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户联系方式',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `score` int(10) DEFAULT NULL COMMENT '借书积分',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '已借出' COMMENT '借书状态',
  `days` int(11) DEFAULT '1' COMMENT '借书天数',
  `return_date` datetime DEFAULT NULL COMMENT '归还日期',
  `real_date` datetime DEFAULT NULL COMMENT '实际归还日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `retur` */

insert  into `retur`(`id`,`book_name`,`book_no`,`user_no`,`user_name`,`user_phone`,`createtime`,`updatetime`,`score`,`status`,`days`,`return_date`,`real_date`) values (12,'计算机系统','1','20221228822212720','张桂铭','13182203273','2022-12-28 01:40:18',NULL,60,'已归还',6,'2023-01-03 00:00:00','2022-12-28 00:00:00'),(13,'aa','2','20221228998172885','龙书缘','13182203272','2022-12-28 16:39:56',NULL,10,'已归还',1,'2022-12-29 00:00:00','2022-12-28 00:00:00');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '会员码',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `sex` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatetime` datetime DEFAULT NULL,
  `account` int(10) DEFAULT '0' COMMENT '账户余额',
  `status` tinyint(1) DEFAULT '1' COMMENT '禁用状态 1不禁用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username_index` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`username`,`age`,`sex`,`phone`,`address`,`createtime`,`updatetime`,`account`,`status`) values (31,'李晋杰','20221228992686435',21,'男','18323244727','重庆市','2022-12-28 01:02:21','2022-12-28 01:46:56',130,1),(32,'邹某','202212282047963051',20,'男','13182203271','重庆市','2022-12-28 01:03:02',NULL,100,1),(33,'龙书缘','20221228998172885',20,'男','13182203272','重庆市','2022-12-28 01:03:29','2022-12-28 16:38:37',30,1),(34,'张桂铭','20221228822212720',20,'男','13182203273','重庆市','2022-12-28 01:04:31','2022-12-28 17:04:53',60,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
