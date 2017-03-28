/*
SQLyog Enterprise v9.30 
MySQL - 5.7.16-log : Database - geo_tracking
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`geo_tracking` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `geo_tracking`;

/*Table structure for table `tbl_assignedtrackers` */

DROP TABLE IF EXISTS `tbl_assignedtrackers`;

CREATE TABLE `tbl_assignedtrackers` (
  `TrackerIMEI_ID` double NOT NULL,
  `UserTaxNumber_ID` double NOT NULL,
  `Nickname` varchar(45) DEFAULT NULL,
  `LinkDate` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`TrackerIMEI_ID`,`UserTaxNumber_ID`),
  KEY `fk_TBL_AssignedTrackers_TBL_Users1_idx` (`UserTaxNumber_ID`),
  CONSTRAINT `fk_TBL_AssignedTrackers_TBL_Trackers2` FOREIGN KEY (`TrackerIMEI_ID`) REFERENCES `tbl_trackers` (`TrackerIMEI_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_TBL_AssignedTrackers_TBL_Users2` FOREIGN KEY (`UserTaxNumber_ID`) REFERENCES `tbl_users` (`UserTaxNumber_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_assignedtrackers` */

insert  into `tbl_assignedtrackers`(`TrackerIMEI_ID`,`UserTaxNumber_ID`,`Nickname`,`LinkDate`) values (358456985123694,146995081,'DemoTracker','2017-03-06 04:17:06.564212');

/*Table structure for table `tbl_cities` */

DROP TABLE IF EXISTS `tbl_cities`;

CREATE TABLE `tbl_cities` (
  `City_ID` int(11) NOT NULL AUTO_INCREMENT,
  `City` varchar(45) NOT NULL,
  PRIMARY KEY (`City_ID`),
  UNIQUE KEY `City_ID_UNIQUE` (`City_ID`),
  UNIQUE KEY `City_UNIQUE` (`City`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_cities` */

insert  into `tbl_cities`(`City_ID`,`City`) values (1,'Athens'),(7,'Avlona'),(6,'Kalamata'),(4,'Korinthos'),(3,'Patra'),(5,'Porto Heli'),(2,'Thesalloniki');

/*Table structure for table `tbl_gender` */

DROP TABLE IF EXISTS `tbl_gender`;

CREATE TABLE `tbl_gender` (
  `Gender_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Gender` varchar(20) NOT NULL,
  PRIMARY KEY (`Gender_ID`),
  UNIQUE KEY `Gender_UNIQUE` (`Gender`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_gender` */

insert  into `tbl_gender`(`Gender_ID`,`Gender`) values (2,'Female'),(1,'Male'),(3,'Unknown');

/*Table structure for table `tbl_locations` */

DROP TABLE IF EXISTS `tbl_locations`;

CREATE TABLE `tbl_locations` (
  `Location_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TrackerIMEI_ID` double NOT NULL,
  `Longitude` double NOT NULL DEFAULT '0',
  `Latitude` double NOT NULL DEFAULT '0',
  `Speed` varchar(30) DEFAULT '-1',
  `Altitude` double DEFAULT '-1',
  `Battery` varchar(20) DEFAULT '0',
  `EventTime` datetime NOT NULL,
  PRIMARY KEY (`Location_ID`,`TrackerIMEI_ID`),
  UNIQUE KEY `Location_ID_UNIQUE` (`Location_ID`),
  KEY `fk_TBL_Locations_TBL_Trackers1_idx` (`TrackerIMEI_ID`),
  CONSTRAINT `fk_TBL_Locations_TBL_Trackers2` FOREIGN KEY (`TrackerIMEI_ID`) REFERENCES `tbl_trackers` (`TrackerIMEI_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_locations` */

insert  into `tbl_locations`(`Location_ID`,`TrackerIMEI_ID`,`Longitude`,`Latitude`,`Speed`,`Altitude`,`Battery`,`EventTime`) values (8,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 02:58:57'),(9,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 02:58:57'),(10,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 02:58:57'),(11,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 02:58:57'),(12,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 02:58:57'),(13,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 02:58:57'),(14,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 02:58:57'),(15,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 02:58:57'),(16,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 02:58:57'),(17,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 02:58:57'),(18,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 02:58:57'),(19,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 03:09:50'),(20,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 03:09:50'),(21,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 03:09:50'),(22,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 03:09:50'),(23,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 03:09:50'),(24,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 03:09:50'),(25,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2019-03-06 03:24:50');

/*Table structure for table `tbl_logs` */

DROP TABLE IF EXISTS `tbl_logs`;

CREATE TABLE `tbl_logs` (
  `Log_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserTaxNumber_ID` double NOT NULL,
  `When` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `What` longtext,
  PRIMARY KEY (`Log_ID`,`UserTaxNumber_ID`),
  UNIQUE KEY `Log_ID_UNIQUE` (`Log_ID`),
  KEY `fk_TBL_Logs_TBL_Users1_idx` (`UserTaxNumber_ID`),
  CONSTRAINT `fk_TBL_Logs_TBL_Users1` FOREIGN KEY (`UserTaxNumber_ID`) REFERENCES `tbl_users` (`UserTaxNumber_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_logs` */

/*Table structure for table `tbl_msisdn` */

DROP TABLE IF EXISTS `tbl_msisdn`;

CREATE TABLE `tbl_msisdn` (
  `MSISDN_ID` double NOT NULL,
  `PIN1` int(11) NOT NULL,
  `PIN2` int(11) NOT NULL,
  `PUK1` int(11) NOT NULL,
  `PUK2` int(11) NOT NULL,
  `AdditionDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`MSISDN_ID`),
  UNIQUE KEY `MSISDN_ID_UNIQUE` (`MSISDN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_msisdn` */

insert  into `tbl_msisdn`(`MSISDN_ID`,`PIN1`,`PIN2`,`PUK1`,`PUK2`,`AdditionDate`) values (6934575852,4444,4444,4444,4444,'2017-03-09 14:46:03'),(6942033581,5555,5555,5555,5555,'2017-03-06 02:49:08'),(6980118854,9999,9999,9999,9999,'2017-03-24 23:37:25'),(6999999999,9999,9999,9999,9999,'2017-03-14 19:26:52');

/*Table structure for table `tbl_poi_locations` */

DROP TABLE IF EXISTS `tbl_poi_locations`;

CREATE TABLE `tbl_poi_locations` (
  `Location_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserTaxNumber_ID` double NOT NULL,
  `Longitude` double NOT NULL,
  `Latitude` double NOT NULL,
  `AddTime` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Location_ID`,`UserTaxNumber_ID`),
  UNIQUE KEY `Location_ID_UNIQUE` (`Location_ID`),
  KEY `fk_TBL_POI_Locations_TBL_Users1_idx` (`UserTaxNumber_ID`),
  CONSTRAINT `fk_TBL_POI_Locations_TBL_Users1` FOREIGN KEY (`UserTaxNumber_ID`) REFERENCES `tbl_users` (`UserTaxNumber_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_poi_locations` */

/*Table structure for table `tbl_streets` */

DROP TABLE IF EXISTS `tbl_streets`;

CREATE TABLE `tbl_streets` (
  `Streets_ID` int(11) NOT NULL AUTO_INCREMENT,
  `StreetName` varchar(45) NOT NULL,
  PRIMARY KEY (`Streets_ID`),
  UNIQUE KEY `idTBL_Streets_UNIQUE` (`Streets_ID`),
  UNIQUE KEY `StreetName_UNIQUE` (`StreetName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_streets` */

insert  into `tbl_streets`(`Streets_ID`,`StreetName`) values (2,'Akriton'),(4,'Eleftheriou Venizelou'),(1,'Ermou'),(3,'Thiseos');

/*Table structure for table `tbl_trackermodels` */

DROP TABLE IF EXISTS `tbl_trackermodels`;

CREATE TABLE `tbl_trackermodels` (
  `TrackerModel_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ModelName` varchar(45) NOT NULL,
  PRIMARY KEY (`TrackerModel_ID`),
  UNIQUE KEY `TrackerModel_ID_UNIQUE` (`TrackerModel_ID`),
  UNIQUE KEY `ModelName_UNIQUE` (`ModelName`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_trackermodels` */

insert  into `tbl_trackermodels`(`TrackerModel_ID`,`ModelName`) values (4,'TK-101'),(3,'TK-102'),(7,'TK-102B'),(1,'TK-102B-C1'),(5,'TK-103'),(6,'TK-103B'),(10,'TK-104'),(11,'TK-106'),(18,'TK-110'),(12,'TK-201'),(13,'TK-201B'),(14,'TK-202'),(15,'TK-203'),(16,'TK-206'),(8,'XT-009'),(9,'XT-011'),(17,'XT-107');

/*Table structure for table `tbl_trackers` */

DROP TABLE IF EXISTS `tbl_trackers`;

CREATE TABLE `tbl_trackers` (
  `TrackerIMEI_ID` double NOT NULL,
  `MSISDN_ID` double NOT NULL DEFAULT '6999999999',
  `TrackerModel_ID` int(11) NOT NULL,
  `SerialNumber` varchar(30) NOT NULL,
  `AddDate` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `Status` int(11) NOT NULL DEFAULT '0',
  `LastUpdate` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  `Condition` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TrackerIMEI_ID`,`MSISDN_ID`,`TrackerModel_ID`),
  UNIQUE KEY `TrackerIMEI_ID_UNIQUE` (`TrackerIMEI_ID`),
  UNIQUE KEY `MSISDN_ID_UNIQUE` (`MSISDN_ID`),
  KEY `fk_TBL_Trackers_TBL_TrackerModels1_idx` (`TrackerModel_ID`),
  CONSTRAINT `FK_tbl_trackers` FOREIGN KEY (`MSISDN_ID`) REFERENCES `tbl_msisdn` (`MSISDN_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_trackers2` FOREIGN KEY (`TrackerModel_ID`) REFERENCES `tbl_trackermodels` (`TrackerModel_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_trackers` */

insert  into `tbl_trackers`(`TrackerIMEI_ID`,`MSISDN_ID`,`TrackerModel_ID`,`SerialNumber`,`AddDate`,`Status`,`LastUpdate`,`Condition`) values (352887073813341,6980118854,1,'087073813341','2017-03-24 23:42:05.050122',0,'1900-01-01 00:00:01',1),(358456985123694,6942033581,1,'555555','2017-03-06 03:36:41.000000',0,'2017-03-08 01:50:00',1),(385469845615875,6934575852,3,'444444','2017-03-08 00:00:01.000000',0,'1900-01-01 00:00:01',1);

/*Table structure for table `tbl_useraddress` */

DROP TABLE IF EXISTS `tbl_useraddress`;

CREATE TABLE `tbl_useraddress` (
  `UserTaxNumber_ID` double NOT NULL,
  `City_ID` int(11) NOT NULL DEFAULT '-1',
  `Street_ID` int(11) NOT NULL DEFAULT '-1',
  `StreetNumber` varchar(45) DEFAULT NULL,
  `PostalCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UserTaxNumber_ID`,`City_ID`,`Street_ID`),
  KEY `fk_TBL_UserAddress_TBL_Cities1_idx` (`City_ID`),
  KEY `fk_TBL_UserAddress_TBL_Streets1_idx` (`Street_ID`),
  CONSTRAINT `fk_TBL_UserAddress_TBL_Cities1` FOREIGN KEY (`City_ID`) REFERENCES `tbl_cities` (`City_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_TBL_UserAddress_TBL_Streets1` FOREIGN KEY (`Street_ID`) REFERENCES `tbl_streets` (`Streets_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_TBL_UserAddress_TBL_Users1` FOREIGN KEY (`UserTaxNumber_ID`) REFERENCES `tbl_users` (`UserTaxNumber_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_useraddress` */

insert  into `tbl_useraddress`(`UserTaxNumber_ID`,`City_ID`,`Street_ID`,`StreetNumber`,`PostalCode`) values (146995081,1,2,'10','17564');

/*Table structure for table `tbl_userdetails` */

DROP TABLE IF EXISTS `tbl_userdetails`;

CREATE TABLE `tbl_userdetails` (
  `UserTaxNumber_ID` double NOT NULL,
  `Gender_ID` int(11) NOT NULL DEFAULT '-1',
  `Name` varchar(45) DEFAULT NULL,
  `Surname` varchar(45) DEFAULT NULL,
  `FatherName` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `IDnumber` varchar(45) DEFAULT NULL,
  `TelephoneA` double DEFAULT NULL,
  `TelephoneB` double DEFAULT NULL,
  PRIMARY KEY (`UserTaxNumber_ID`,`Gender_ID`),
  UNIQUE KEY `UserTaxNumber_ID_UNIQUE` (`UserTaxNumber_ID`),
  KEY `fk_TBL_UserDetails_TBL_Gender_idx` (`Gender_ID`),
  CONSTRAINT `FK_tbl_userdetails` FOREIGN KEY (`Gender_ID`) REFERENCES `tbl_gender` (`Gender_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_userdetails2` FOREIGN KEY (`UserTaxNumber_ID`) REFERENCES `tbl_users` (`UserTaxNumber_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_userdetails` */

insert  into `tbl_userdetails`(`UserTaxNumber_ID`,`Gender_ID`,`Name`,`Surname`,`FatherName`,`Email`,`IDnumber`,`TelephoneA`,`TelephoneB`) values (146995081,1,'George','Papakonstantinou','Fragkiskos','gew.papakonstantinou@gmail.com','276308025',6942033581,NULL),(155685972,2,'testina','testinaaa','testos','testina@testole.com','ab259545',6933335554,NULL);

/*Table structure for table `tbl_users` */

DROP TABLE IF EXISTS `tbl_users`;

CREATE TABLE `tbl_users` (
  `UserTaxNumber_ID` double NOT NULL,
  `Username` varchar(22) NOT NULL DEFAULT 'not_set',
  `Password` varchar(32) NOT NULL DEFAULT 'not_set',
  `Privilege` int(11) NOT NULL DEFAULT '1',
  `Status` int(11) NOT NULL DEFAULT '0',
  `CreateTime` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`UserTaxNumber_ID`),
  UNIQUE KEY `UserTaxNumber_ID_UNIQUE` (`UserTaxNumber_ID`),
  UNIQUE KEY `Username_UNIQUE` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_users` */

insert  into `tbl_users`(`UserTaxNumber_ID`,`Username`,`Password`,`Privilege`,`Status`,`CreateTime`) values (146995081,'gpapakonstantinou','1111',0,1,'2017-03-07 18:36:14.026933'),(155685972,'testtesttest','1111',1,1,'2017-03-09 14:43:35.354719');

/* Trigger structure for table `tbl_locations` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `TRG_AddDataCheckStatus` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `TRG_AddDataCheckStatus` AFTER INSERT ON `tbl_locations` FOR EACH ROW BEGIN
	UPDATE `geo_tracking`.`tbl_trackers`
	SET `tbl_trackers`.`LastUpdate` = NEW.`EventTime`, `tbl_trackers`.`Status` = 1	
	WHERE `tbl_trackers`.`TrackerIMEI_ID` = NEW.`TrackerIMEI_ID`;
    END */$$


DELIMITER ;

/*!50106 set global event_scheduler = 1*/;

/* Event structure for event `EVENT_CheckTrackerStatus` */

/*!50106 DROP EVENT IF EXISTS `EVENT_CheckTrackerStatus`*/;

DELIMITER $$

/*!50106 CREATE DEFINER=`root`@`localhost` EVENT `EVENT_CheckTrackerStatus` ON SCHEDULE EVERY 180 SECOND STARTS '2017-03-07 19:36:24' ON COMPLETION PRESERVE ENABLE DO BEGIN
   UPDATE `geo_tracking`.`tbl_trackers`
   SET `tbl_trackers`.`Status` = 0
   WHERE (`tbl_trackers`.`LastUpdate` < TIMESTAMP(NOW()-0300)) AND (`tbl_trackers`.`Status` = 1);
   
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
