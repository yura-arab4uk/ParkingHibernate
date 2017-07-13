-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: parkinghibernate
-- ------------------------------------------------------
-- Server version	5.5.51

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `enabled` smallint(5) unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,1,'Audi'),(2,1,'BMW'),(3,1,'Mercedes Benz'),(4,1,'Opel'),(5,1,'Porsche'),(6,1,'Volkswagen'),(7,1,'Alfa Romeo'),(8,1,'Ferrari'),(9,1,'Fiat'),(10,1,'Lamborghini'),(11,1,'Lexus'),(12,1,'Toyota'),(13,1,'Nissan'),(14,1,'Suzuki'),(15,1,'Богдан'),(16,1,'ВАЗ'),(17,1,'Москвич'),(18,1,'Renault'),(25,1,'McLaren'),(26,1,'Land Rover'),(28,0,'Rosh'),(29,0,'Ð¿Ðº'),(30,0,'а'),(31,0,'пап'),(32,0,'уу');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `enabled` smallint(5) unsigned NOT NULL DEFAULT '1',
  `car_number` varchar(10) NOT NULL,
  `checkin_datetime` datetime NOT NULL,
  `checkout_datetime` datetime DEFAULT NULL,
  `parking_time` bigint(20) unsigned DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `color_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_r01qk4ukt9m17y3jqttb70am6` (`checkin_datetime`),
  KEY `FK_bbvx0lbdsqyhbvdfmw1p9uiqf` (`brand_id`),
  KEY `FK_2bo6nbdl8sh0vsomdtsnwtaut` (`color_id`),
  CONSTRAINT `FK_2bo6nbdl8sh0vsomdtsnwtaut` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`),
  CONSTRAINT `FK_bbvx0lbdsqyhbvdfmw1p9uiqf` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,0,'2','2017-01-30 18:56:01','2017-01-30 20:56:25',2,1,1),(2,0,'2','2017-01-30 19:09:05','2017-01-30 20:56:28',2,1,1),(3,0,'2','2017-01-30 19:11:31','2017-01-30 20:56:31',2,1,1),(4,0,'2','2017-01-30 19:23:37','2017-01-30 20:56:32',2,1,1),(5,0,'2','2017-01-30 19:40:34','2017-01-30 20:56:32',2,1,1),(6,0,'1','2017-01-30 20:32:52','2017-01-30 20:56:33',10,1,1),(7,0,'3','2017-01-30 20:40:10','2017-01-30 21:02:30',3,1,1),(8,0,'3','2017-01-30 20:50:54','2017-01-30 21:02:31',3,1,1),(9,0,'fgd','2017-01-30 21:02:40','2017-01-30 22:40:10',3,2,6),(10,0,'3','2017-01-30 21:09:32','2017-01-30 22:40:11',3,1,1),(11,0,'5','2017-01-30 21:12:35','2017-01-30 22:40:12',5,1,1),(12,0,'3','2017-01-30 21:15:33','2017-01-30 22:40:13',3,1,1),(13,0,'3','2017-01-30 21:18:02','2017-01-30 22:40:13',3,1,1),(14,0,'3','2017-01-30 21:19:13','2017-01-30 22:40:14',3,1,1),(15,0,'3','2017-01-30 21:20:03','2017-01-30 22:40:14',3,1,1),(16,0,'2','2017-01-30 21:21:22','2017-01-30 22:40:14',2,1,1),(17,0,'3','2017-01-30 21:24:29','2017-01-30 22:40:15',3,1,1),(18,0,'1','2017-01-30 21:27:17','2017-01-30 22:40:16',1,1,1),(19,0,'1','2017-01-30 22:06:13','2017-01-30 22:40:16',1,1,1),(20,0,'1','2017-01-30 22:18:03','2017-01-30 22:40:17',1,1,1),(21,0,'1','2017-01-30 22:30:33','2017-01-30 22:40:17',1,1,1),(22,0,'1','2017-01-30 22:39:04','2017-01-30 22:40:18',1,1,1),(23,0,'ВА3345ІВ','2017-01-30 22:39:23','2017-01-30 22:42:57',130,2,12),(24,0,'3','2017-01-30 22:55:29','2017-01-31 15:44:27',3,8,6),(25,0,'dfre','2017-01-31 15:44:34','2017-01-31 15:45:06',3,1,1),(26,0,'2','2017-01-31 15:44:56','2017-01-31 15:45:05',2,1,1),(27,0,'3','2017-01-31 15:45:01','2017-01-31 15:45:06',3,1,1),(28,0,'3','2017-01-31 16:03:34','2017-01-31 16:03:43',3,1,1),(29,0,'3','2017-01-31 21:24:19','2017-01-31 21:27:17',3,1,1),(30,0,'3','2017-01-31 21:27:28','2017-01-31 21:27:38',3,1,1),(31,0,'SUPER','2017-01-31 21:28:12','2017-01-31 21:28:38',3,2,12),(32,0,'car_number','2017-01-31 21:41:49','2017-01-31 22:43:50',10,1,1),(33,0,'5','2017-01-31 21:43:50','2017-01-31 22:43:49',5,5,5),(34,0,'в','2017-01-31 22:43:43','2017-01-31 22:45:13',60,2,12),(35,0,'уц','2017-01-31 22:45:25','2017-01-31 22:45:54',3,1,1),(36,0,'654','2017-01-31 22:45:31','2017-01-31 22:45:57',2,1,1),(37,0,'1','2017-01-31 22:52:35','2017-01-31 22:54:07',3,1,1),(38,0,'1','2017-01-31 22:54:02','2017-01-31 23:02:00',3,4,1),(39,0,'3','2017-01-31 23:02:10','2017-01-31 23:02:27',3,1,1),(40,0,'2','2017-01-31 23:02:36','2017-01-31 23:02:46',2,1,1),(41,0,'2','2017-01-31 23:02:40','2017-01-31 23:02:47',2,1,1),(42,0,'Car','2017-02-01 18:21:35','2017-02-01 18:21:55',2,1,1),(43,0,'IBV','2017-02-02 18:28:23','2017-02-02 21:09:24',3,1,1),(44,0,'2','2017-02-03 14:40:54','2017-02-03 14:46:15',2,1,1),(45,1,'уаі','2017-02-03 14:46:36',NULL,2,1,1);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_rider`
--

DROP TABLE IF EXISTS `car_rider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_rider` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `enabled` smallint(5) unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) DEFAULT NULL,
  `phone_number` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_6sobv8mv9q9yv86h4tyaqw9e9` FOREIGN KEY (`id`) REFERENCES `car` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_rider`
--

LOCK TABLES `car_rider` WRITE;
/*!40000 ALTER TABLE `car_rider` DISABLE KEYS */;
INSERT INTO `car_rider` VALUES (1,0,'2',2),(2,0,'2',2),(3,0,'2',2),(4,0,'2',2),(5,0,'2',2),(6,0,'1',1),(7,0,'3',3),(8,0,'3',3),(9,0,'Iwan',3),(10,0,'3',3),(11,0,'5',5),(12,0,'3',3),(13,0,'3',3),(14,0,'3',3),(15,0,'3',3),(16,0,'2',2),(17,0,'3',3),(18,0,'1',1),(19,0,'1',1),(20,0,'1',1),(21,0,'1',1),(22,0,'1',1),(23,0,'Василько',2455346),(24,0,'3',3),(25,0,'3',3),(26,0,'2',2),(27,0,'3',3),(28,0,'3',3),(29,0,'3',3),(30,0,'3',3),(31,0,'Ivan',972242924),(32,0,'name',25),(33,0,'5',5),(34,0,'Антошка',231),(35,0,'3',3),(36,0,'па',2),(37,0,'1',3),(38,0,'аві',3),(39,0,'3',3),(40,0,'2',2),(41,0,'2',2),(42,0,'He',2),(43,0,'3',3),(44,0,'2',1),(45,1,'ауі',2);
/*!40000 ALTER TABLE `car_rider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `color` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `enabled` smallint(5) unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,1,'Red'),(2,1,'Red Orange'),(3,1,'Orange'),(4,1,'Yellow'),(5,1,'Yellow Green'),(6,1,'Green'),(7,1,'Sky Blue'),(8,1,'Blue'),(9,1,'Purple'),(10,1,'White'),(11,1,'Brown'),(12,1,'Black'),(14,0,'greenr'),(15,0,'d'),(16,0,'greenbr'),(17,0,'e'),(18,0,'43243'),(19,0,'аа'),(20,0,'gg'),(21,0,'ф'),(22,0,'1'),(23,0,'REDAKA'),(24,0,''),(25,0,'fvd'),(26,0,'ее'),(27,0,'5');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-03 15:07:27
