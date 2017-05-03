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

insert  into `tbl_assignedtrackers`(`TrackerIMEI_ID`,`UserTaxNumber_ID`,`Nickname`,`LinkDate`) values (352887073813341,155685972,'DemoTracker2','2017-04-17 00:21:23.425859'),(358456985123694,155685972,'DemoTracker1','2017-04-17 00:21:20.169853'),(358654654876852,155685972,'DemoTracker3','2017-04-17 00:21:26.304864'),(385469845615875,155685972,'DemoTracker4','2017-04-17 00:21:28.446868'),(387516546513511,155685972,'DemoTracker5','2017-04-17 00:21:30.169871'),(387516546513513,155685972,'DemoTracker6','2017-04-17 00:21:54.924914'),(387516546513515,155685972,'DemoTracker7','2017-04-17 00:21:57.977920'),(387516546513518,155685972,'DemoTracker8','2017-04-17 00:22:00.879925');

/*Table structure for table `tbl_cities` */

DROP TABLE IF EXISTS `tbl_cities`;

CREATE TABLE `tbl_cities` (
  `City_ID` int(11) NOT NULL AUTO_INCREMENT,
  `City` varchar(45) NOT NULL,
  PRIMARY KEY (`City_ID`),
  UNIQUE KEY `City_ID_UNIQUE` (`City_ID`),
  UNIQUE KEY `City_UNIQUE` (`City`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_cities` */

insert  into `tbl_cities`(`City_ID`,`City`) values (8,''),(1,'Athens'),(7,'Avlona'),(6,'Kalamata'),(4,'Korinthos'),(3,'Patra'),(5,'Porto Heli'),(2,'Thesalloniki');

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_locations` */

insert  into `tbl_locations`(`Location_ID`,`TrackerIMEI_ID`,`Longitude`,`Latitude`,`Speed`,`Altitude`,`Battery`,`EventTime`) values (8,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 02:58:57'),(9,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 02:58:57'),(10,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 02:58:57'),(11,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 02:58:57'),(12,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 02:58:57'),(13,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 02:58:57'),(14,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 02:58:57'),(15,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 02:58:57'),(16,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 02:58:57'),(17,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 02:58:57'),(18,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 02:58:57'),(19,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 03:09:50'),(20,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 03:09:50'),(21,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 03:09:50'),(22,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 03:09:50'),(23,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 03:09:50'),(24,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2017-03-06 03:09:50'),(25,358456985123694,37.9444001,23.7074772,'-1',-1,'0','2019-03-06 03:24:50'),(26,358456985123694,37.98847,23.75152,'-1',-1,'0','2017-03-06 02:58:57'),(27,358456985123694,37.93904,23.704395,'-1',-1,'0','2017-03-06 02:58:57'),(28,358456985123694,37.93915,23.70416,'-1',-1,'0','2017-03-06 02:58:57'),(29,358456985123694,37.9388,23.70437,'-1',-1,'0','2017-03-06 02:58:57');

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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_logs` */

insert  into `tbl_logs`(`Log_ID`,`UserTaxNumber_ID`,`When`,`What`) values (10,155685972,'2017-04-02 21:41:20.944858','testtesttest logged in as User'),(11,155685972,'2017-04-02 21:43:48.000269','testtesttest logged in as User'),(12,146995081,'2017-04-02 21:51:38.824199','gpapakonstantinou logged in as Administrator'),(13,155685972,'2017-04-03 00:19:11.422568','testtesttest logged in as User'),(14,155685972,'2017-04-03 00:52:58.955952','testtesttest logged in as User'),(15,155685972,'2017-04-03 01:41:04.576147','testtesttest edited his details with: apapap@apapap.gr,dc695753,6987654321,6901234567'),(16,155685972,'2017-04-03 11:59:19.127060','testtesttest logged in as User'),(17,155685972,'2017-04-04 17:45:50.406881','testtesttest logged in as User'),(18,155685972,'2017-04-04 17:47:33.592366','testtesttest edited his details with: papatrexas@gmail.com,ak9999,6999999999,6933333333'),(19,155685972,'2017-04-14 18:34:32.893839','testtesttest logged in as User'),(20,155685972,'2017-04-15 14:15:28.606838','testtesttest logged in as User'),(21,155685972,'2017-04-15 20:22:28.928993','testtesttest logged in as User'),(22,155685972,'2017-04-15 20:32:06.824085','testtesttest logged in as User'),(23,155685972,'2017-04-16 18:13:07.334740','testtesttest logged in as User'),(24,155685972,'2017-04-16 18:54:31.212663','testtesttest logged in as User'),(25,155685972,'2017-04-16 18:56:48.344318','testtesttest logged in as User'),(26,155685972,'2017-04-16 18:58:06.302485','testtesttest logged in as User'),(27,155685972,'2017-04-16 19:12:06.852331','testtesttest logged in as User'),(28,155685972,'2017-04-16 20:00:11.077670','testtesttest logged in as User'),(29,155685972,'2017-04-16 21:58:40.638523','testtesttest logged in as User'),(30,155685972,'2017-04-16 22:04:32.676434','testtesttest logged in as User'),(31,155685972,'2017-04-16 22:05:03.834121','testtesttest logged in as User'),(32,155685972,'2017-04-16 22:25:46.962364','testtesttest logged in as User'),(33,155685972,'2017-04-16 22:28:29.105262','testtesttest logged in as User'),(34,155685972,'2017-04-16 22:37:18.637121','testtesttest logged in as User'),(35,155685972,'2017-04-16 22:46:11.183570','testtesttest logged in as User'),(36,155685972,'2017-04-16 22:47:57.928910','testtesttest logged in as User'),(37,155685972,'2017-04-16 23:15:35.706332','testtesttest logged in as User'),(38,155685972,'2017-04-16 23:28:40.200108','testtesttest logged in as User'),(39,155685972,'2017-04-16 23:32:01.897448','testtesttest logged in as User'),(40,155685972,'2017-04-16 23:40:08.407954','testtesttest logged in as User'),(41,155685972,'2017-04-16 23:45:31.539536','testtesttest logged in as User'),(42,155685972,'2017-04-17 00:32:30.176414','testtesttest logged in as User'),(43,155685972,'2017-04-17 22:33:56.619581','testtesttest logged in as User'),(44,155685972,'2017-04-17 22:38:25.796936','testtesttest logged in as User'),(45,155685972,'2017-04-17 22:41:56.241945','testtesttest logged in as User'),(46,155685972,'2017-04-20 11:23:55.733825','testtesttest logged in as User'),(47,155685972,'2017-04-28 00:41:19.789430','testtesttest logged in as User'),(48,155685972,'2017-04-28 18:56:23.190885','testtesttest logged in as User');

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

insert  into `tbl_msisdn`(`MSISDN_ID`,`PIN1`,`PIN2`,`PUK1`,`PUK2`,`AdditionDate`) values (6933333333,3333,4444,5555,6666,'2017-04-17 00:10:11'),(6934575852,4444,4444,4444,4444,'2017-03-09 14:46:03'),(6942033581,5555,5555,5555,5555,'2017-03-06 02:49:08'),(6944444444,4444,5555,6666,7777,'2017-04-17 00:10:32'),(6980118854,9999,9999,9999,9999,'2017-03-24 23:37:25'),(6988888888,5555,6666,7777,8888,'2017-04-17 00:11:00'),(6999427216,1111,2222,3333,4444,'2017-04-17 00:09:47'),(6999999999,9999,9999,9999,9999,'2017-03-14 19:26:52');

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
  PRIMARY KEY (`TrackerIMEI_ID`,`TrackerModel_ID`),
  UNIQUE KEY `TrackerIMEI_ID_UNIQUE` (`TrackerIMEI_ID`),
  UNIQUE KEY `MSISDN_ID_UNIQUE` (`MSISDN_ID`),
  KEY `fk_TBL_Trackers_TBL_TrackerModels1_idx` (`TrackerModel_ID`),
  CONSTRAINT `FK_tbl_trackers` FOREIGN KEY (`MSISDN_ID`) REFERENCES `tbl_msisdn` (`MSISDN_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_trackers2` FOREIGN KEY (`TrackerModel_ID`) REFERENCES `tbl_trackermodels` (`TrackerModel_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_trackers` */

insert  into `tbl_trackers`(`TrackerIMEI_ID`,`MSISDN_ID`,`TrackerModel_ID`,`SerialNumber`,`AddDate`,`Status`,`LastUpdate`,`Condition`) values (352887073813341,6980118854,1,'087073813341','2017-03-24 23:42:05.050122',0,'1900-01-01 00:00:01',1),(358456985123694,6942033581,1,'555555','2017-04-15 20:45:22.133391',1,'2017-03-06 02:58:57',1),(358654654876852,6999999999,1,'666666','2017-04-17 00:11:58.421864',0,'1900-01-01 00:00:01',1),(385469845615875,6934575852,3,'444444','2017-03-08 00:00:01.000000',0,'1900-01-01 00:00:01',1),(387516546513511,6999427216,1,'333333','2017-04-17 00:16:36.278351',0,'1900-01-01 00:00:01',1),(387516546513513,6944444444,1,'888888','2017-04-17 00:15:01.994185',0,'1900-01-01 00:00:01',1),(387516546513515,6933333333,1,'777777','2017-04-17 00:14:17.950109',0,'1900-01-01 00:00:01',1),(387516546513518,6988888888,1,'999999','2017-04-17 00:15:29.600234',0,'1900-01-01 00:00:01',1);

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

insert  into `tbl_useraddress`(`UserTaxNumber_ID`,`City_ID`,`Street_ID`,`StreetNumber`,`PostalCode`) values (146995081,1,2,'10','17564'),(155685972,6,3,'15','15975');

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

insert  into `tbl_userdetails`(`UserTaxNumber_ID`,`Gender_ID`,`Name`,`Surname`,`FatherName`,`Email`,`IDnumber`,`TelephoneA`,`TelephoneB`) values (146995081,1,'George','Papakonstantinou','Fragkiskos','gew.papakonstantinou@gmail.com','276308025',6942033581,NULL),(155685972,2,'testina','testinaaa','testos','papatrexas@gmail.com','ak9999',6999999999,6933333333);

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
