/*
SQLyog Enterprise v12.08 (32 bit)
MySQL - 5.0.45-community-nt : Database - crk5
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`crk5` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `crk5`;

/*Table structure for table `cpsj` */

DROP TABLE IF EXISTS `cpsj`;

CREATE TABLE `cpsj` (
  `cpsj_id` int(100) NOT NULL auto_increment,
  `hjh_id` varchar(100) default NULL,
  `txm_barcode` varchar(100) default NULL,
  PRIMARY KEY  (`cpsj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cpsj` */

/*Table structure for table `gcmc` */

DROP TABLE IF EXISTS `gcmc`;

CREATE TABLE `gcmc` (
  `gcmc_id` int(10) NOT NULL auto_increment,
  `gcmc_name` text,
  `khmc_id` int(10) default NULL,
  PRIMARY KEY  (`gcmc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `gcmc` */

insert  into `gcmc`(`gcmc_id`,`gcmc_name`,`khmc_id`) values (1,'二食堂',1),(2,'三食堂',1),(3,'教学教研部',2),(4,'市场咨询部',2);

/*Table structure for table `hjh` */

DROP TABLE IF EXISTS `hjh`;

CREATE TABLE `hjh` (
  `hjh_id` varchar(100) NOT NULL,
  `hjh_name` text,
  PRIMARY KEY  (`hjh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hjh` */

insert  into `hjh`(`hjh_id`,`hjh_name`) values ('1','1号货架'),('2','2号货架');

/*Table structure for table `khmc` */

DROP TABLE IF EXISTS `khmc`;

CREATE TABLE `khmc` (
  `khmc_id` int(11) NOT NULL auto_increment,
  `khmc_name` text,
  PRIMARY KEY  (`khmc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `khmc` */

insert  into `khmc`(`khmc_id`,`khmc_name`) values (1,'范彬彬'),(2,'周杰伦');

/*Table structure for table `txm` */

DROP TABLE IF EXISTS `txm`;

CREATE TABLE `txm` (
  `txm_barcode` varchar(100) NOT NULL,
  `yclrk_id` varchar(100) default NULL,
  `txm_barcode_error` text,
  PRIMARY KEY  (`txm_barcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `txm` */

insert  into `txm`(`txm_barcode`,`yclrk_id`,`txm_barcode_error`) values ('23100110201','4',NULL),('231001102010','4',NULL),('23100110202','4',NULL),('23100110203','4',NULL),('23100110204','4',NULL),('23100110205','4',NULL),('23100110206','4',NULL),('23100110207','4',NULL),('23100110208','4',NULL),('23100110209','4',NULL),('241002801501','2',NULL),('2410028015010','2',NULL),('241002801502','2',NULL),('241002801503','2',NULL),('241002801504','2',NULL),('241002801505','2',NULL),('241002801506','2',NULL),('241002801507','2',NULL),('241002801508','2',NULL),('241002801509','2',NULL);

/*Table structure for table `yclrk` */

DROP TABLE IF EXISTS `yclrk`;

CREATE TABLE `yclrk` (
  `yclrk_id` int(11) NOT NULL auto_increment,
  `yclrk_no` text,
  `yclrk_material_name` text,
  `khmc_id` varchar(11) default NULL,
  `gcmc_id` varchar(11) default NULL,
  `yclrk_team` text,
  `yclrk_checkout` text,
  `yclrk_standard` text,
  `yclrk_time` text,
  `yclrk_amount` text,
  `yclrk_amount_damage` text,
  `yclrk_shelves` text,
  `yclrk_barcode` text,
  `yclrk_barcode_iscreate` text,
  `yclrk_standard_width` text,
  `yclrk_standard_height` text,
  `yclrk_ck_time` text,
  `yclrk_cpsj_time` text,
  `yclrk_rest_amount` text,
  PRIMARY KEY  (`yclrk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `yclrk` */

insert  into `yclrk`(`yclrk_id`,`yclrk_no`,`yclrk_material_name`,`khmc_id`,`gcmc_id`,`yclrk_team`,`yclrk_checkout`,`yclrk_standard`,`yclrk_time`,`yclrk_amount`,`yclrk_amount_damage`,`yclrk_shelves`,`yclrk_barcode`,`yclrk_barcode_iscreate`,`yclrk_standard_width`,`yclrk_standard_height`,`yclrk_ck_time`,`yclrk_cpsj_time`,`yclrk_rest_amount`) values (2,'1002','广告易拉宝','2','4',NULL,NULL,NULL,'2016-10-18 10:06:10','10',NULL,'否','/barcode/1002/01.png,/barcode/1002/02.png,/barcode/1002/03.png,/barcode/1002/04.png,/barcode/1002/05.png,/barcode/1002/06.png,/barcode/1002/07.png,/barcode/1002/08.png,/barcode/1002/09.png,/barcode/1002/010.png','是','150','80',NULL,NULL,'100'),(3,'1003','大米','1','1',NULL,NULL,NULL,'2016-10-14 10:07:09','20',NULL,'否','barcode.do','否','100','50',NULL,NULL,'20'),(4,'1001','书本耗材','2','3',NULL,NULL,NULL,'2016-10-14 10:19:35','10',NULL,'否','/barcode/1001/01.png,/barcode/1001/02.png,/barcode/1001/03.png,/barcode/1001/04.png,/barcode/1001/05.png,/barcode/1001/06.png,/barcode/1001/07.png,/barcode/1001/08.png,/barcode/1001/09.png,/barcode/1001/010.png','是','20','10',NULL,NULL,'10');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
