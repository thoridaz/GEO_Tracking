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

/*Table structure for table `tbl_cities` */

DROP TABLE IF EXISTS `tbl_cities`;

CREATE TABLE `tbl_cities` (
  `City_ID` int(11) NOT NULL AUTO_INCREMENT,
  `City` varchar(45) NOT NULL,
  PRIMARY KEY (`City_ID`),
  UNIQUE KEY `City_ID_UNIQUE` (`City_ID`),
  UNIQUE KEY `City_UNIQUE` (`City`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tbl_gender` */

DROP TABLE IF EXISTS `tbl_gender`;

CREATE TABLE `tbl_gender` (
  `Gender_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Gender` varchar(20) NOT NULL,
  PRIMARY KEY (`Gender_ID`),
  UNIQUE KEY `Gender_UNIQUE` (`Gender`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tbl_locations` */

DROP TABLE IF EXISTS `tbl_locations`;

CREATE TABLE `tbl_locations` (
  `Location_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TrackerIMEI_ID` double NOT NULL,
  `Longitude` double NOT NULL,
  `Latitude` double NOT NULL,
  `Speed` varchar(30) DEFAULT '-1',
  `Altitude` double DEFAULT '-1',
  `Battery` varchar(20) DEFAULT '0',
  `EventTime` datetime NOT NULL,
  PRIMARY KEY (`Location_ID`,`TrackerIMEI_ID`),
  UNIQUE KEY `Location_ID_UNIQUE` (`Location_ID`),
  KEY `fk_TBL_Locations_TBL_Trackers1_idx` (`TrackerIMEI_ID`),
  CONSTRAINT `fk_TBL_Locations_TBL_Trackers2` FOREIGN KEY (`TrackerIMEI_ID`) REFERENCES `tbl_trackers` (`TrackerIMEI_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

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

/*Table structure for table `tbl_streets` */

DROP TABLE IF EXISTS `tbl_streets`;

CREATE TABLE `tbl_streets` (
  `Streets_ID` int(11) NOT NULL AUTO_INCREMENT,
  `StreetName` varchar(45) NOT NULL,
  PRIMARY KEY (`Streets_ID`),
  UNIQUE KEY `idTBL_Streets_UNIQUE` (`Streets_ID`),
  UNIQUE KEY `StreetName_UNIQUE` (`StreetName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tbl_trackermodels` */

DROP TABLE IF EXISTS `tbl_trackermodels`;

CREATE TABLE `tbl_trackermodels` (
  `TrackerModel_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ModelName` varchar(45) NOT NULL,
  PRIMARY KEY (`TrackerModel_ID`),
  UNIQUE KEY `TrackerModel_ID_UNIQUE` (`TrackerModel_ID`),
  UNIQUE KEY `ModelName_UNIQUE` (`ModelName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

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
