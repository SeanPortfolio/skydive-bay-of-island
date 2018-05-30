-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: thaueastlhs01.hosting.xuridisa.com    Database: skydivebayofislands_db
-- ------------------------------------------------------
-- Server version	5.6.33-0ubuntu0.14.04.1-log

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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,2) DEFAULT NULL,
  `booking_url` varchar(255) DEFAULT NULL,
  `activity_category_id` int(11) NOT NULL,
  `page_meta_data_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,299.00,NULL,15,36),(2,458.00,NULL,15,37),(3,329.00,NULL,16,38),(4,418.00,NULL,16,39),(5,399.00,NULL,17,40),(6,498.00,NULL,17,41),(7,500.00,NULL,15,48),(8,498.00,NULL,15,57),(9,597.00,NULL,15,58),(10,488.00,NULL,16,59),(11,528.00,NULL,16,60),(12,627.00,NULL,16,61),(13,558.00,NULL,17,62),(14,598.00,NULL,17,63),(15,697.00,NULL,17,64);
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_meta_data_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
INSERT INTO `blog_category` VALUES (1,9),(2,10),(3,11),(4,12),(5,46);
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post`
--

DROP TABLE IF EXISTS `blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_posted` datetime DEFAULT NULL,
  `page_meta_data_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post`
--

LOCK TABLES `blog_post` WRITE;
/*!40000 ALTER TABLE `blog_post` DISABLE KEYS */;
INSERT INTO `blog_post` VALUES (1,'2018-05-21 00:00:00',13),(2,'2018-03-14 00:00:00',14),(3,'2018-03-20 00:00:00',15),(4,'2015-03-15 00:00:00',16),(5,'2018-03-16 00:00:00',17),(6,'2018-03-06 00:00:00',18),(7,'2018-03-10 00:00:00',19),(8,'2018-03-11 00:00:00',20),(9,'2018-05-01 00:00:00',47);
/*!40000 ALTER TABLE `blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post_has_category`
--

DROP TABLE IF EXISTS `blog_post_has_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_post_has_category` (
  `category_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post_has_category`
--

LOCK TABLES `blog_post_has_category` WRITE;
/*!40000 ALTER TABLE `blog_post_has_category` DISABLE KEYS */;
INSERT INTO `blog_post_has_category` VALUES (2,2),(3,2),(1,3),(2,3),(3,3),(4,3),(1,5),(3,5),(4,5),(1,6),(3,6),(4,6),(1,7),(2,7),(3,7),(1,8),(3,8),(4,8),(1,9),(5,9),(1,4),(2,4),(3,4),(1,1),(2,1);
/*!40000 ALTER TABLE `blog_post_has_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_accessgroups`
--

DROP TABLE IF EXISTS `cms_accessgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_accessgroups` (
  `access_id` int(11) NOT NULL AUTO_INCREMENT,
  `access_name` varchar(100) NOT NULL,
  `access_users` char(1) NOT NULL DEFAULT 'N',
  `access_userpasswords` char(1) NOT NULL DEFAULT 'N',
  `access_useraccesslevel` char(1) NOT NULL DEFAULT 'N',
  `access_accessgroups` char(1) NOT NULL DEFAULT 'N',
  `access_cmssettings` char(1) NOT NULL DEFAULT 'N',
  `access_settings` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`access_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_accessgroups`
--

LOCK TABLES `cms_accessgroups` WRITE;
/*!40000 ALTER TABLE `cms_accessgroups` DISABLE KEYS */;
INSERT INTO `cms_accessgroups` VALUES (1,'Super Administrator','Y','Y','Y','Y','Y','Y'),(2,'General Editor','Y','Y','N','N','N','Y');
/*!40000 ALTER TABLE `cms_accessgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_blacklist_user`
--

DROP TABLE IF EXISTS `cms_blacklist_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_blacklist_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_failed_attempt_on` datetime DEFAULT NULL,
  `failed_login_attempt_count` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `disabled_on` datetime DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `recent_login_attempt_on` datetime DEFAULT NULL,
  `failed_hour_count` int(11) NOT NULL,
  `total_failed_attempt` int(11) NOT NULL,
  `is_notified` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_blacklist_user`
--

LOCK TABLES `cms_blacklist_user` WRITE;
/*!40000 ALTER TABLE `cms_blacklist_user` DISABLE KEYS */;
INSERT INTO `cms_blacklist_user` VALUES (7,'2018-05-10 21:06:15',1,'2018-05-10 21:06:15',0,NULL,'Bonnie','2018-05-10 21:06:15',0,1,0,'121.99.106.57');
/*!40000 ALTER TABLE `cms_blacklist_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_login_attempt`
--

DROP TABLE IF EXISTS `cms_login_attempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_login_attempt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` tinyblob NOT NULL,
  `access_key` tinyblob,
  `is_successful` enum('N','Y') NOT NULL DEFAULT 'N',
  `ip_address` varchar(255) NOT NULL,
  `record_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_login_attempt`
--

LOCK TABLES `cms_login_attempt` WRITE;
/*!40000 ALTER TABLE `cms_login_attempt` DISABLE KEYS */;
INSERT INTO `cms_login_attempt` VALUES (72,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','Û1≥˚>≠ë˝NÚ\‰N','N','127.0.0.1','2018-01-25 03:09:04'),(73,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-01-25 03:10:17'),(74,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-01-25 12:16:53'),(75,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-01-25 18:58:24'),(76,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-01-25 20:13:29'),(77,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-01-29 20:21:40'),(78,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-01-30 20:53:41'),(79,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-01-31 02:07:01'),(80,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-01-31 09:35:29'),(81,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-01-31 20:29:38'),(82,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-02-01 20:27:45'),(83,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-02-01 22:50:59'),(84,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-02-02 03:21:09'),(85,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','Û1≥˚>≠ë˝NÚ\‰N','N','127.0.0.1','2018-02-06 10:18:00'),(86,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-02-06 10:18:09'),(87,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-02-06 21:00:15'),(88,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-02-08 00:39:53'),(89,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-02-11 20:43:30'),(90,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-02-12 20:58:16'),(91,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-02-13 09:23:39'),(92,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-02-13 18:06:31'),(93,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-02-13 20:43:10'),(94,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-02-14 03:19:45'),(95,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-02-14 19:50:02'),(96,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-02-14 19:55:14'),(97,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-02-14 21:08:28'),(98,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-02-19 00:49:25'),(99,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-02-19 01:53:53'),(100,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-02-19 03:26:05'),(101,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','125.239.197.112','2018-02-19 10:54:22'),(102,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-02-19 20:15:33'),(103,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-02-19 20:51:11'),(104,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-02-19 22:31:23'),(105,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-02-19 23:48:10'),(106,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','Û1≥˚>≠ë˝NÚ\‰N','N','114.23.241.67','2018-02-21 02:15:40'),(107,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-02-21 02:15:59'),(108,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-02-21 20:39:13'),(109,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-02-21 22:51:41'),(110,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-02-22 20:18:48'),(111,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-02-22 20:28:11'),(112,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-02-27 22:04:10'),(113,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-01 20:38:02'),(114,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-01 21:02:26'),(115,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-02 00:04:38'),(116,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-05 23:04:33'),(117,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-07 22:35:58'),(118,'4•˘`§•[Ä\Áã_Ò¯Ø\”A\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','131.203.246.6','2018-03-11 23:06:23'),(119,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-12 02:24:50'),(120,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-12 02:38:44'),(121,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-14 20:08:51'),(122,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-14 21:38:17'),(123,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-03-18 21:11:20'),(124,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','Û1≥˚>≠ë˝NÚ\‰N','N','127.0.0.1','2018-03-21 01:15:04'),(125,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','Û1≥˚>≠ë˝NÚ\‰N','N','127.0.0.1','2018-03-21 01:37:25'),(126,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','Û1≥˚>≠ë˝NÚ\‰N','N','127.0.0.1','2018-03-21 01:41:19'),(127,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-03-21 01:42:11'),(128,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','Û1≥˚>≠ë˝NÚ\‰N','N','127.0.0.1','2018-03-21 20:04:03'),(129,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-03-21 20:04:12'),(130,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-03-25 20:53:49'),(131,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-03-26 22:58:35'),(132,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-03-27 20:34:08'),(133,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-03-28 20:51:13'),(134,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-04-03 04:23:46'),(135,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-04-03 21:17:30'),(136,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-04-03 22:26:31'),(137,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-04-04 00:31:32'),(138,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-04-04 01:22:59'),(139,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','103.43.207.11','2018-04-17 02:42:09'),(140,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-04-23 00:50:13'),(141,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-04-23 02:43:26'),(142,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-04-24 02:16:25'),(143,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-04-27 03:39:09'),(144,'y\Ÿp\Œp\Z.:˝∏$Aˇ\ÿe†Eªˆ-44_çLwò\–','ä\∆¯Ñ\Ì.Utz\Ë)n\nΩv\\','N','121.99.106.57','2018-04-27 22:02:16'),(145,'y\Ÿp\Œp\Z.:˝∏$Aˇ\ÿe†Eªˆ-44_çLwò\–','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','121.99.106.57','2018-04-27 22:02:51'),(146,'y\Ÿp\Œp\Z.:˝∏$Aˇ\ÿe†Eªˆ-44_çLwò\–','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','121.99.106.57','2018-04-29 00:13:19'),(147,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','103.43.207.11','2018-04-29 20:59:45'),(148,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','Û1≥˚>≠ë˝NÚ\‰N','N','103.43.207.11','2018-04-29 21:03:27'),(149,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','103.43.207.11','2018-04-29 21:03:31'),(150,'PgOÑ\Œæ\'@mÖÉ°ê¡—§\Œ–Ω\“˜\¬\‰/\¬\Ô•\÷”øØ\Á\ÿg«°Úª<Œú¶\√\⁄m','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','210.54.242.111','2018-04-30 00:38:02'),(151,'PgOÑ\Œæ\'@mÖÉ°ê¡—§\Œ–Ω\“˜\¬\‰/\¬\Ô•\÷”øØ\Á\ÿg«°Úª<Œú¶\√\⁄m','\‘?/\€F/_∫\ﬁ\»ˇE\r¡\ﬂ\–','N','210.54.242.111','2018-04-30 21:56:05'),(152,'PgOÑ\Œæ\'@mÖÉ°ê¡—§\Œ–Ω\“˜\¬\‰/\¬\Ô•\÷”øØ\Á\ÿg«°Úª<Œú¶\√\⁄m','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','210.54.242.111','2018-04-30 21:56:38'),(153,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-04-30 22:41:26'),(154,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-05-01 02:51:08'),(155,'y\Ÿp\Œp\Z.:˝∏$Aˇ\ÿe†Eªˆ-44_çLwò\–','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','121.99.106.57','2018-05-01 05:21:46'),(156,'y\Ÿp\Œp\Z.:˝∏$Aˇ\ÿe†Eªˆ-44_çLwò\–','ä\∆¯Ñ\Ì.Utz\Ë)n\nΩv\\','N','121.99.106.57','2018-05-01 08:00:38'),(157,'y\Ÿp\Œp\Z.:˝∏$Aˇ\ÿe†Eªˆ-44_çLwò\–','ä\∆¯Ñ\Ì.Utz\Ë)n\nΩv\\','N','121.99.106.57','2018-05-02 07:15:55'),(158,'y\Ÿp\Œp\Z.:˝∏$Aˇ\ÿe†Eªˆ-44_çLwò\–','ä\∆¯Ñ\Ì.Utz\Ë)n\nΩv\\','N','121.99.106.57','2018-05-02 07:16:06'),(159,'y\Ÿp\Œp\Z.:˝∏$Aˇ\ÿe†Eªˆ-44_çLwò\–','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','121.99.106.57','2018-05-02 07:16:17'),(160,'y\Ÿp\Œp\Z.:˝∏$Aˇ\ÿe†Eªˆ-44_çLwò\–','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','121.99.106.57','2018-05-02 21:50:11'),(161,'y\Ÿp\Œp\Z.:˝∏$Aˇ\ÿe†Eªˆ-44_çLwò\–','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','121.99.106.57','2018-05-04 05:20:26'),(162,'y\Ÿp\Œp\Z.:˝∏$Aˇ\ÿe†Eªˆ-44_çLwò\–','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','210.54.242.111','2018-05-04 22:45:35'),(163,'y\Ÿp\Œp\Z.:˝∏$Aˇ\ÿe†Eªˆ-44_çLwò\–','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','121.99.106.57','2018-05-06 00:46:38'),(164,'PgOÑ\Œæ\'@mÖÉ°ê¡—§\Œ–Ω\“˜\¬\‰/\¬\Ô•\÷”øØ\Á\ÿg«°Úª<Œú¶\√\⁄m','\‘?/\€F/_∫\ﬁ\»ˇE\r¡\ﬂ\–','N','121.99.106.57','2018-05-06 00:46:55'),(165,'PgOÑ\Œæ\'@mÖÉ°ê¡—§\Œ–Ω\“˜\¬\‰/\¬\Ô•\÷”øØ\Á\ÿg«°Úª<Œú¶\√\⁄m','\‘?/\€F/_∫\ﬁ\»ˇE\r¡\ﬂ\–','N','121.99.106.57','2018-05-06 00:47:22'),(166,'PgOÑ\Œæ\'@mÖÉ°ê¡—§\Œ–Ω\“˜\¬\‰/\¬\Ô•\÷”øØ\Á\ÿg«°Úª<Œú¶\√\⁄m','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','121.99.106.57','2018-05-06 00:47:57'),(167,'PgOÑ\Œæ\'@mÖÉ°ê¡—§\Œ–Ω\“˜\¬\‰/\¬\Ô•\÷”øØ\Á\ÿg«°Úª<Œú¶\√\⁄m','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','210.54.242.111','2018-05-06 02:16:28'),(168,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','103.43.207.11','2018-05-06 20:21:45'),(169,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','103.43.207.11','2018-05-07 21:34:43'),(170,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-05-09 03:50:18'),(171,'y\Ÿp\Œp\Z.:˝∏$Aˇ\ÿe†Eªˆ-44_çLwò\–','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','121.99.106.57','2018-05-09 07:30:52'),(172,'\ÏJ\–:%\ irSv\r˜ñú\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-05-09 22:32:23'),(173,'\ÏJ\–:%\ irSv\r˜ñú\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-05-10 03:55:20'),(174,'§\„¸Y1A*\Ì·é≤ôgó¿','yLãÉ]\Ÿ\‡eLñ˘\◊˝\·∏G','N','121.99.106.57','2018-05-10 21:06:15'),(175,'y\Ÿp\Œp\Z.:˝∏$Aˇ\ÿe†Eªˆ-44_çLwò\–','yLãÉ]\Ÿ\‡eLñ˘\◊˝\·∏G','N','121.99.106.57','2018-05-10 21:06:36'),(176,'y\Ÿp\Œp\Z.:˝∏$Aˇ\ÿe†Eªˆ-44_çLwò\–','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','121.99.106.57','2018-05-10 21:07:17'),(177,'\ÏJ\–:%\ irSv\r˜ñú\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-05-10 21:14:53'),(178,'\ÏJ\–:%\ irSv\r˜ñú\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-05-10 22:03:59'),(179,'\ÏJ\–:%\ irSv\r˜ñú\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-05-10 23:31:36'),(180,'\ÏJ\–:%\ irSv\r˜ñú\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-05-11 01:24:26'),(181,'\ÏJ\–:%\ irSv\r˜ñú\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-05-11 02:50:38'),(182,'\ÏJ\–:%\ irSv\r˜ñú\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-05-13 20:59:13'),(183,'\ÏJ\–:%\ irSv\r˜ñú\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-05-14 04:02:27'),(184,'PgOÑ\Œæ\'@mÖÉ°ê¡—§\Œ–Ω\“˜\¬\‰/\¬\Ô•\÷”øØ\Á\ÿg«°Úª<Œú¶\√\⁄m','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','115.189.95.26','2018-05-14 21:14:31'),(185,'y\Ÿp\Œp\Z.:˝∏$Aˇ\ÿe†Eªˆ-44_çLwò\–','ä\∆¯Ñ\Ì.Utz\Ë)n\nΩv\\','N','121.99.106.57','2018-05-25 23:19:33');
/*!40000 ALTER TABLE `cms_login_attempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_settings`
--

DROP TABLE IF EXISTS `cms_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_settings` (
  `cmsset_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmsset_name` varchar(100) NOT NULL,
  `cmsset_label` varchar(50) NOT NULL,
  `cmsset_explanation` varchar(255) NOT NULL,
  `cmsset_status` char(1) NOT NULL DEFAULT 'I',
  `cmsset_value` varchar(255) NOT NULL,
  PRIMARY KEY (`cmsset_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_settings`
--

LOCK TABLES `cms_settings` WRITE;
/*!40000 ALTER TABLE `cms_settings` DISABLE KEYS */;
INSERT INTO `cms_settings` VALUES (10,'pages_maximum','Page Limit','','I','12'),(2,'pages_generations','Page Generation Limit','The number of levels of children pages that are allowed to be made.','A','5');
/*!40000 ALTER TABLE `cms_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_users`
--

DROP TABLE IF EXISTS `cms_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for user',
  `user_fname` varchar(45) DEFAULT NULL COMMENT 'User''s firstname',
  `user_lname` varchar(45) DEFAULT NULL COMMENT 'User''s lastname',
  `user_pass` varchar(255) DEFAULT NULL COMMENT 'User''s password (recommended as being sha256)',
  `user_email` varchar(100) DEFAULT NULL COMMENT 'User''s email address',
  `user_photo_path` varchar(255) DEFAULT NULL,
  `user_thumb_path` varchar(255) DEFAULT NULL,
  `user_introduction` text,
  `social_links` text,
  `last_login_date` datetime DEFAULT NULL,
  `access_id` int(11) DEFAULT '1' COMMENT 'User''s rights - whether they are admin, banned, general user etc. This is totally customisable and is up to the programmer.',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_users`
--

LOCK TABLES `cms_users` WRITE;
/*!40000 ALTER TABLE `cms_users` DISABLE KEYS */;
INSERT INTO `cms_users` VALUES (1,'Website','Admin','00b452f7db6029195995e248af2ac4c00d334537','skydive@tomahawk.co.nz','/library/authors/dexter.jpg','/uploads/2015/11/img-563c1e061f186.jpg','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident nobis distinctio optio quam modi ipsa. Officia itaque tempore dignissimos, mollitia deserunt adipisci aspernatur voluptatem, assumenda a, alias voluptates ea reiciendis.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident nobis distinctio optio quam modi ipsa. Officia itaque tempore dignissimos, mollitia deserunt adipisci aspernatur voluptatem, assumenda a, alias voluptates ea reiciendis.</p>','a:3:{s:11:\"google_plus\";a:2:{s:5:\"value\";s:0:\"\";s:5:\"label\";s:7:\"Google+\";}s:8:\"facebook\";a:2:{s:5:\"value\";s:0:\"\";s:5:\"label\";s:8:\"Facebook\";}s:7:\"twitter\";a:2:{s:5:\"value\";s:0:\"\";s:5:\"label\";s:7:\"Twitter\";}}','2018-05-14 04:02:27',1),(9,'Bonnie','','3a9b4a5be0f935f8ce1600e79ed7204ebc09017d','bonniekozeluh@hotmail.com',NULL,NULL,NULL,NULL,'2018-05-29 07:51:14',2),(10,'Megan','','d7683e52af93b105a44fcef5bd668a77fafd49f9','marketing@skydivebayofislands.com',NULL,NULL,NULL,NULL,'2018-05-14 21:14:31',2),(11,'Andrew','Macmillan','97b011f1092b862bcc52b0a9d0a9dfecb2f81929','gm@gojump.com',NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `cms_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combos`
--

DROP TABLE IF EXISTS `combos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `combos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(255) DEFAULT NULL,
  `thumb_photo` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `featured` enum('Y','N') NOT NULL DEFAULT 'N',
  `booking_url` varchar(255) DEFAULT NULL,
  `page_meta_data_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combos`
--

LOCK TABLES `combos` WRITE;
/*!40000 ALTER TABLE `combos` DISABLE KEYS */;
INSERT INTO `combos` VALUES (1,'/library/photos/011518-11.jpg','/uploads/2018/05/img-5ae9775eb1925.jpg',80.00,'Y',NULL,30),(2,'/library/photos/011518-9.jpg','/uploads/2018/05/img-5ae96ef8b84b9.jpg',140.00,'Y',NULL,31),(3,'/library/bg2.jpg','/uploads/2018/04/img-5ac3fe9d3c11e.jpg',500.00,'N',NULL,50),(4,NULL,NULL,NULL,'N',NULL,51),(5,NULL,NULL,NULL,'N',NULL,52),(6,NULL,NULL,NULL,'N',NULL,53),(7,'/library/photos/011518-9.jpg','/uploads/2018/05/img-5ae971c07fe11.jpg',80.00,'N',NULL,68),(8,NULL,NULL,NULL,'N',NULL,70),(9,'','',0.00,'N',NULL,71);
/*!40000 ALTER TABLE `combos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_column`
--

DROP TABLE IF EXISTS `content_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_column` (
  `content` text NOT NULL,
  `css_class` varchar(255) NOT NULL,
  `span` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `content_row_id` int(11) NOT NULL,
  KEY `content_row_id` (`content_row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_column`
--

LOCK TABLES `content_column` WRITE;
/*!40000 ALTER TABLE `content_column` DISABLE KEYS */;
INSERT INTO `content_column` VALUES ('<p style=\"text-align: center;\">Please use the main site menu to get back on track!</p>','col-xs-12',0,1,2),('<p>Column 1</p>','col-xs-12',0,1,34),('<p>Column 1</p>','col-xs-12 col-sm-6 col-md-6',0,1,35),('<p>Column 2</p>','col-xs-12 col-sm-6 col-md-6',0,2,35),('<p>Column 1</p>','col-xs-12 col-sm-6 col-md-4',0,1,36),('<p>Column 2</p>','col-xs-12 col-sm-6 col-md-4',0,2,36),('<p>Column 3</p>','col-xs-12 col-sm-6 col-md-4',0,3,36),('<p><img alt=\"\" src=\"/library/bg1.jpg\" /></p>','col-xs-12 col-sm-6 col-md-3',0,1,37),('<p>Column 2</p>','col-xs-12 col-sm-6 col-md-3',0,2,37),('<p>Column 3</p>','col-xs-12 col-sm-6 col-md-3',0,3,37),('<p>Column 4</p>','col-xs-12 col-sm-6 col-md-3',0,4,37),('<p>Skydive&nbsp; Bay&nbsp; of&nbsp; Islands&nbsp; is&nbsp; committed&nbsp; to&nbsp; ensuring&nbsp; that&nbsp; your&nbsp; privacy&nbsp; is&nbsp; protected.&nbsp; Should&nbsp; we&nbsp; ask&nbsp; you&nbsp; to&nbsp; provide&nbsp; certain&nbsp; information&nbsp; by&nbsp; which&nbsp; you&nbsp; can&nbsp; be&nbsp; identified&nbsp; when&nbsp; using&nbsp; this&nbsp; website,&nbsp; then&nbsp; you&nbsp; can&nbsp; be&nbsp; assured&nbsp; that&nbsp; it&nbsp; will&nbsp; only&nbsp; be&nbsp; used&nbsp; in&nbsp; accordance&nbsp; with&nbsp; this&nbsp; privacy&nbsp; statement.&nbsp;</p>\r\n\r\n<p>Skydive&nbsp; Bay&nbsp; of&nbsp; Islands&nbsp; may&nbsp; change&nbsp; this&nbsp; policy&nbsp; from&nbsp; time&nbsp; to&nbsp; time&nbsp; by&nbsp; updating&nbsp; this&nbsp; page.&nbsp; You&nbsp; should&nbsp; check&nbsp; this&nbsp; page&nbsp; from&nbsp; time&nbsp; to&nbsp; time&nbsp; to&nbsp; ensure&nbsp; that&nbsp; you&nbsp; are&nbsp; happy&nbsp; with&nbsp; any&nbsp; changes.&nbsp; This&nbsp; policy&nbsp; is&nbsp; effective&nbsp; from&nbsp; 01&nbsp; February&nbsp; 2014.&nbsp;</p>\r\n\r\n<p><strong>We&nbsp; may&nbsp; collect&nbsp; the&nbsp; following&nbsp; information:</strong></p>\r\n\r\n<ul>\r\n	<li>name&nbsp; and&nbsp; job&nbsp; title&nbsp;</li>\r\n	<li>contact&nbsp; information&nbsp; including&nbsp; email&nbsp; address&nbsp;</li>\r\n	<li>demographic&nbsp; information&nbsp; such&nbsp; as&nbsp; postcode,&nbsp; preferences&nbsp; and&nbsp; interests&nbsp;</li>\r\n</ul>\r\n\r\n<p><strong>What&nbsp; we&nbsp; do&nbsp; with&nbsp; the&nbsp; information&nbsp; we&nbsp; gather</strong></p>\r\n\r\n<ul>\r\n	<li>We&nbsp; require&nbsp; this&nbsp; information&nbsp; to&nbsp; understand&nbsp; your&nbsp; needs&nbsp; and&nbsp; provide&nbsp; you&nbsp; with&nbsp; a&nbsp; better&nbsp; service,&nbsp; and&nbsp; in&nbsp; particular&nbsp; for&nbsp; the&nbsp; following&nbsp; reasons:&nbsp;</li>\r\n	<li>Internal&nbsp; record&nbsp; keeping.&nbsp;</li>\r\n	<li>We&nbsp; may&nbsp; use&nbsp; the&nbsp; information&nbsp; to&nbsp; improve&nbsp; our&nbsp; products&nbsp; and&nbsp; services.&nbsp;</li>\r\n	<li>We&nbsp; may&nbsp; periodically&nbsp; send&nbsp; promotional&nbsp; emails&nbsp; about&nbsp; new&nbsp; products,&nbsp; special&nbsp; offers&nbsp; or&nbsp; other&nbsp; information&nbsp; which&nbsp; we&nbsp; think&nbsp; you&nbsp; may&nbsp; find&nbsp; interesting&nbsp; using&nbsp; the&nbsp; email&nbsp; address&nbsp; which&nbsp; you&nbsp; have&nbsp; provided.&nbsp;</li>\r\n	<li>From&nbsp; time&nbsp; to&nbsp; time,&nbsp; we&nbsp; may&nbsp; also&nbsp; use&nbsp; your&nbsp; information&nbsp; to&nbsp; contact&nbsp; you&nbsp; for&nbsp; market&nbsp; research&nbsp; purposes.&nbsp; We&nbsp; may&nbsp; contact&nbsp; you&nbsp; by&nbsp; email,&nbsp; phone,&nbsp; fax&nbsp; or&nbsp; mail.&nbsp; We&nbsp; may&nbsp; use&nbsp; the&nbsp; information&nbsp; to&nbsp; customise&nbsp; the&nbsp; website&nbsp; according&nbsp; to&nbsp; your&nbsp; interests.&nbsp;</li>\r\n</ul>\r\n\r\n<p><strong>Security</strong></p>\r\n\r\n<p>We&nbsp; are&nbsp; committed&nbsp; to&nbsp; ensuring&nbsp; that&nbsp; your&nbsp; information&nbsp; is&nbsp; secure.&nbsp; In&nbsp; order&nbsp; to&nbsp; prevent&nbsp; unauthorised&nbsp; access&nbsp; or&nbsp; disclosure,&nbsp; we&nbsp; have&nbsp; put&nbsp; in&nbsp; place&nbsp; suitable&nbsp; physical,&nbsp; electronic&nbsp; and&nbsp; managerial&nbsp; procedures&nbsp; to&nbsp; safeguard&nbsp; and&nbsp; secure&nbsp; the&nbsp; information&nbsp; we&nbsp; collect&nbsp; online.&nbsp;</p>\r\n\r\n<p><strong>How&nbsp; we&nbsp; use&nbsp; cookies</strong></p>\r\n\r\n<p>A&nbsp; cookie&nbsp; is&nbsp; a&nbsp; small&nbsp; file&nbsp; which&nbsp; asks&nbsp; permission&nbsp; to&nbsp; be&nbsp; placed&nbsp; on&nbsp; your&nbsp; computer&rsquo;s&nbsp; hard&nbsp; drive.&nbsp; Once&nbsp; you&nbsp; agree,&nbsp; the&nbsp; file&nbsp; is&nbsp; added&nbsp; and&nbsp; the&nbsp; cookie&nbsp; helps&nbsp; analyse&nbsp; web&nbsp; traffic&nbsp; or&nbsp; lets&nbsp; you&nbsp; know&nbsp; when&nbsp; you&nbsp; visit&nbsp; a&nbsp; particular&nbsp; site.&nbsp; Cookies&nbsp; allow&nbsp; web&nbsp; applications&nbsp; to&nbsp; respond&nbsp; to&nbsp; you&nbsp; as&nbsp; an&nbsp; individual.&nbsp; The&nbsp; web&nbsp; application&nbsp; can&nbsp; tailor&nbsp; its&nbsp; operations&nbsp; to&nbsp; your&nbsp; needs,&nbsp; likes&nbsp; and&nbsp; dislikes&nbsp; by&nbsp; gathering&nbsp; and&nbsp; remembering&nbsp; information&nbsp; about&nbsp; your&nbsp; preferences.&nbsp;</p>\r\n\r\n<p>We&nbsp; use&nbsp; traffic&nbsp; log&nbsp; cookies&nbsp; to&nbsp; identify&nbsp; which&nbsp; pages&nbsp; are&nbsp; being&nbsp; used.&nbsp; This&nbsp; helps&nbsp; us&nbsp; analyse&nbsp; data&nbsp; about&nbsp; web&nbsp; page&nbsp; traffic&nbsp; and&nbsp; improve&nbsp; our&nbsp; website&nbsp; in&nbsp; order&nbsp; to&nbsp; tailor&nbsp; it&nbsp; to&nbsp; customer&nbsp; needs.&nbsp; We&nbsp; only&nbsp; use&nbsp; this&nbsp; information&nbsp; for&nbsp; statistical&nbsp; analysis&nbsp; purposes&nbsp; and&nbsp; then&nbsp; the&nbsp; data&nbsp; is&nbsp; removed&nbsp; from&nbsp; the&nbsp; system.&nbsp;</p>\r\n\r\n<p>Overall,&nbsp; cookies&nbsp; help&nbsp; us&nbsp; provide&nbsp; you&nbsp; with&nbsp; a&nbsp; better&nbsp; website,&nbsp; by&nbsp; enabling&nbsp; us&nbsp; to&nbsp; monitor&nbsp; which&nbsp; pages&nbsp; you&nbsp; find&nbsp; useful&nbsp; and&nbsp; which&nbsp; you&nbsp; do&nbsp; not.&nbsp; A&nbsp; cookie&nbsp; in&nbsp; no&nbsp; way&nbsp; gives&nbsp; us&nbsp; access&nbsp; to&nbsp; your&nbsp; computer&nbsp; or&nbsp; any&nbsp; information&nbsp; about&nbsp; you,&nbsp; other&nbsp; than&nbsp; the&nbsp; data&nbsp; you&nbsp; choose&nbsp; to&nbsp; share&nbsp; with&nbsp; us.&nbsp;</p>\r\n\r\n<p>You&nbsp; can&nbsp; choose&nbsp; to&nbsp; accept&nbsp; or&nbsp; decline&nbsp; cookies.&nbsp; Most&nbsp; web&nbsp; browsers&nbsp; automatically&nbsp; accept&nbsp; cookies,&nbsp; but&nbsp; you&nbsp; can&nbsp; usually&nbsp; modify&nbsp; your&nbsp; browser&nbsp; setting&nbsp; to&nbsp; decline&nbsp; cookies&nbsp; if&nbsp; you&nbsp; prefer.&nbsp; This&nbsp; may&nbsp; prevent&nbsp; you&nbsp; from&nbsp; taking&nbsp; full&nbsp; advantage&nbsp; of&nbsp; the&nbsp; website.&nbsp;</p>\r\n\r\n<p><strong>Links&nbsp; to&nbsp; other&nbsp; websites</strong></p>\r\n\r\n<p>Our&nbsp; website&nbsp; may&nbsp; contain&nbsp; links&nbsp; to&nbsp; other&nbsp; websites&nbsp; of&nbsp; interest.&nbsp; However,&nbsp; once&nbsp; you&nbsp; have&nbsp; used&nbsp; these&nbsp; links&nbsp; to&nbsp; leave&nbsp; our&nbsp; site,&nbsp; you&nbsp; should&nbsp; note&nbsp; that&nbsp; we&nbsp; do&nbsp; not&nbsp; have&nbsp; any&nbsp; control&nbsp; over&nbsp; that&nbsp; other&nbsp; website.&nbsp; Therefore,&nbsp; we&nbsp; cannot&nbsp; be&nbsp; responsible&nbsp; for&nbsp; the&nbsp; protection&nbsp; and&nbsp; privacy&nbsp; of&nbsp; any&nbsp; information&nbsp; which&nbsp; you&nbsp; provide&nbsp; whilst&nbsp; visiting&nbsp; such&nbsp; sites&nbsp; and&nbsp; such&nbsp; sites&nbsp; are&nbsp; not&nbsp; governed&nbsp; by&nbsp; this&nbsp; privacy&nbsp; statement.&nbsp; You&nbsp; should&nbsp; exercise&nbsp; caution&nbsp; and&nbsp; look&nbsp; at&nbsp; the&nbsp; privacy&nbsp; statement&nbsp; applicable&nbsp; to&nbsp; the&nbsp; website&nbsp; in&nbsp; question.&nbsp;</p>\r\n\r\n<p><strong>Controlling&nbsp; your&nbsp; personal&nbsp; information</strong></p>\r\n\r\n<p>You&nbsp; may&nbsp; choose&nbsp; to&nbsp; restrict&nbsp; the&nbsp; collection&nbsp; or&nbsp; use&nbsp; of&nbsp; your&nbsp; personal&nbsp; information&nbsp; in&nbsp; the&nbsp; following&nbsp; ways:&nbsp;</p>\r\n\r\n<p>Whenever&nbsp; you&nbsp; are&nbsp; asked&nbsp; to&nbsp; fill&nbsp; in&nbsp; a&nbsp; form&nbsp; on&nbsp; the&nbsp; website,&nbsp; look&nbsp; for&nbsp; the&nbsp; box&nbsp; that&nbsp; you&nbsp; can&nbsp; click&nbsp; to&nbsp; indicate&nbsp; that&nbsp; you&nbsp; do&nbsp; not&nbsp; want&nbsp; the&nbsp; information&nbsp; to&nbsp; be&nbsp; used&nbsp; by&nbsp; anybody&nbsp; for&nbsp; direct&nbsp; marketing&nbsp; purposes&nbsp;</p>\r\n\r\n<p>If&nbsp; you&nbsp; have&nbsp; previously&nbsp; agreed&nbsp; to&nbsp; us&nbsp; using&nbsp; your&nbsp; personal&nbsp; information&nbsp; for&nbsp; direct&nbsp; marketing&nbsp; purposes,&nbsp; you&nbsp; may&nbsp; change&nbsp; your&nbsp; mind&nbsp; at&nbsp; any&nbsp; time&nbsp; by&nbsp; writing&nbsp; to&nbsp; or&nbsp; emailing&nbsp; us&nbsp; at&nbsp; jump @skydivebayofislands.com.</p>\r\n\r\n<p>We&nbsp; will&nbsp; not&nbsp; sell,&nbsp; distribute&nbsp; or&nbsp; lease&nbsp; your&nbsp; personal&nbsp; information&nbsp; to&nbsp; third&nbsp; parties&nbsp; unless&nbsp; we&nbsp; have&nbsp; your&nbsp; permission&nbsp; or&nbsp; are&nbsp; required&nbsp; by&nbsp; law&nbsp; to&nbsp; do&nbsp; so.&nbsp; We&nbsp; may&nbsp; use&nbsp; your&nbsp; personal&nbsp; information&nbsp; to&nbsp; send&nbsp; you&nbsp; promotional&nbsp; information&nbsp; about&nbsp; third&nbsp; parties&nbsp; which&nbsp; we&nbsp; think&nbsp; you&nbsp; may&nbsp; find&nbsp; interesting&nbsp; if&nbsp; you&nbsp; tell&nbsp; us&nbsp; that&nbsp; you&nbsp; wish&nbsp; this&nbsp; to&nbsp; happen.&nbsp;</p>\r\n\r\n<p>You&nbsp; may&nbsp; request&nbsp; details&nbsp; of&nbsp; personal&nbsp; information&nbsp; which&nbsp; we&nbsp; hold&nbsp; about&nbsp; you&nbsp; at&nbsp; any&nbsp; time.&nbsp; If&nbsp; you&nbsp; would&nbsp; like&nbsp; a&nbsp; copy&nbsp; of&nbsp; the&nbsp; information&nbsp; held&nbsp; on&nbsp; you&nbsp; please&nbsp; email&nbsp; us&nbsp; at&nbsp; &nbsp; jump @skydivebayofislands.com.</p>\r\n\r\n<p>If&nbsp; you&nbsp; believe&nbsp; that&nbsp; any&nbsp; information&nbsp; we&nbsp; are&nbsp; holding&nbsp; on&nbsp; you&nbsp; is&nbsp; incorrect&nbsp; or&nbsp; incomplete,&nbsp; please&nbsp; email&nbsp; us&nbsp; as&nbsp; soon&nbsp; as&nbsp; possible,&nbsp; at&nbsp; the&nbsp; above&nbsp; address.&nbsp; We&nbsp; will&nbsp; promptly&nbsp; correct&nbsp; any&nbsp; information&nbsp; found&nbsp; to&nbsp; be&nbsp; incorrect.&nbsp;&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>','col-xs-12',0,1,119),('<p><strong>Skydive&nbsp; cancellation&nbsp; policy&nbsp; </strong></p>\r\n\r\n<p>Bookings&nbsp; online&nbsp; or&nbsp; telephone&nbsp; is&nbsp; considered&nbsp; a&nbsp; firm&nbsp; booking&nbsp; and&nbsp; so&nbsp; a&nbsp; 24-hour&nbsp; cancellation&nbsp; notice&nbsp; is&nbsp; required.&nbsp; If&nbsp; the&nbsp; weather&nbsp; conditions&nbsp; are&nbsp; not&nbsp; suitable&nbsp; for&nbsp; skydiving&nbsp; then&nbsp; we&nbsp; will&nbsp; offer&nbsp; you&nbsp; alternative&nbsp; times&nbsp; and&nbsp; days.&nbsp; If&nbsp; these&nbsp; times&nbsp; don&rsquo;t&nbsp; suit&nbsp; you&nbsp; then&nbsp; please&nbsp; let&nbsp; us&nbsp; know.&nbsp;</p>\r\n\r\n<p><strong>24&nbsp; Hour&nbsp; Policy&nbsp;</strong></p>\r\n\r\n<p>We&nbsp; ask&nbsp; that&nbsp; if&nbsp; you&nbsp; have&nbsp; to&nbsp; cancel&nbsp; or&nbsp; postpone&nbsp; your&nbsp; jump,&nbsp; please&nbsp; let&nbsp; us&nbsp; know&nbsp; 24&nbsp; hours&nbsp; before&nbsp; you&nbsp; are&nbsp; due&nbsp; to&nbsp; jump&nbsp; with&nbsp; us.&nbsp; This&nbsp; enables&nbsp; us&nbsp; to&nbsp; find&nbsp; a&nbsp; more&nbsp; suitable&nbsp; time&nbsp; for&nbsp; you&nbsp; to&nbsp; jump&nbsp; with&nbsp; us,&nbsp; and&nbsp; also&nbsp; opens&nbsp; up&nbsp; the&nbsp; booking&nbsp; should&nbsp; anyone&nbsp; else&nbsp; like&nbsp; to&nbsp; jump&nbsp; at&nbsp; that&nbsp; time.&nbsp;</p>\r\n\r\n<p><strong>Weather</strong></p>\r\n\r\n<p>Should&nbsp; the&nbsp; weather&nbsp; be&nbsp; unsuitable&nbsp; for&nbsp; jumping&nbsp; on&nbsp; the&nbsp; day&nbsp; it&nbsp; is&nbsp; your&nbsp; responsibility&nbsp; to&nbsp; return&nbsp; to&nbsp; the&nbsp; parachute&nbsp; centre&nbsp; on another&nbsp; occasion(s)&nbsp; if&nbsp; necessary,&nbsp; to&nbsp; complete&nbsp; your&nbsp; jump.&nbsp; You&nbsp; must&nbsp; rebook&nbsp; within&nbsp; 20&nbsp; days&nbsp; of&nbsp; each&nbsp; unsuccessful&nbsp; attempt.&nbsp;&nbsp;</p>\r\n\r\n<p><strong>Vouchers&nbsp; /&nbsp; Special&nbsp; Promotions&nbsp; </strong></p>\r\n\r\n<p>Gift&nbsp; Vouchers&nbsp; are&nbsp; valid&nbsp; for&nbsp; 6&nbsp; months&nbsp; from&nbsp; date&nbsp; of&nbsp; purchase.&nbsp; Gift&nbsp; vouchers&nbsp; are&nbsp; completely&nbsp; non-refundable&nbsp; but&nbsp; they&nbsp; are&nbsp; transferrable&nbsp; to&nbsp; another&nbsp; person.&nbsp; &nbsp; Gift&nbsp; vouchers&nbsp; that&nbsp; are&nbsp; due&nbsp; to&nbsp; expire,&nbsp; can&nbsp; be&nbsp; extended&nbsp; for&nbsp; up&nbsp; to&nbsp; 3&nbsp; months&nbsp; at&nbsp; a&nbsp; time&nbsp; for&nbsp; a&nbsp; small&nbsp; fee.&nbsp; &nbsp; Go&nbsp; to&nbsp; our&nbsp; Gift&nbsp; Voucher&nbsp; page&nbsp; to&nbsp; extend&nbsp; your&nbsp; voucher.&nbsp;</p>\r\n\r\n<p><strong>Pricing&nbsp; and&nbsp; GST</strong></p>\r\n\r\n<p>Prices&nbsp; are&nbsp; in&nbsp; New&nbsp; Zealand&nbsp; Dollars&nbsp; and&nbsp; include&nbsp; 15%&nbsp; GST&nbsp; (Goods&nbsp; and&nbsp; Service&nbsp; Tax).&nbsp; We&nbsp; do&nbsp; not&nbsp; accept&nbsp; payment&nbsp; in&nbsp; any&nbsp; other&nbsp; currency.&nbsp; Your&nbsp; card&nbsp; issuer&nbsp; may&nbsp; apply&nbsp; charges&nbsp; for&nbsp; currency&nbsp; conversion.&nbsp; These&nbsp; charges&nbsp; are&nbsp; applied&nbsp; by&nbsp; your&nbsp; card&nbsp; issuer,&nbsp; we&nbsp; accept&nbsp; no&nbsp; responsibility&nbsp; for&nbsp; these.&nbsp; We&nbsp; reserve&nbsp; the&nbsp; right&nbsp; to&nbsp; change&nbsp; our&nbsp; prices&nbsp; at&nbsp; any&nbsp; time.&nbsp; We&nbsp; will&nbsp; not&nbsp; change&nbsp; the&nbsp; price&nbsp; of&nbsp; a&nbsp; Skydive&nbsp; or&nbsp; order&nbsp; you&nbsp; have&nbsp; already&nbsp; made&nbsp; without&nbsp; prior&nbsp; notification.&nbsp; This&nbsp; may&nbsp; only&nbsp; happen&nbsp; in&nbsp; &nbsp;theunlikely&nbsp; event&nbsp; that&nbsp; the&nbsp; price&nbsp; has&nbsp; been&nbsp; displayed&nbsp; incorrectly.&nbsp; In&nbsp; this&nbsp; instance,&nbsp; we&nbsp; reserve&nbsp; the&nbsp; right&nbsp; to&nbsp; withdraw&nbsp; your&nbsp; order&nbsp; and&nbsp; offer&nbsp; at&nbsp; the&nbsp; correct&nbsp; price.&nbsp; Any&nbsp; unlikely&nbsp; occurrence&nbsp; will&nbsp; be&nbsp; dealt&nbsp; with&nbsp; the&nbsp; company&nbsp; discretion.&nbsp;</p>\r\n\r\n<p><strong>Payment&nbsp; </strong></p>\r\n\r\n<p>We&nbsp; accept&nbsp; Visa&nbsp; and&nbsp; Mastercard.&nbsp; To&nbsp; pay&nbsp; by&nbsp; Credit&nbsp; Card&nbsp; select&nbsp; the&nbsp; card&nbsp; type&nbsp; and&nbsp; fill&nbsp; in&nbsp; your&nbsp; card&nbsp; details;&nbsp; card&nbsp; number,&nbsp; expiry&nbsp; date&nbsp; and&nbsp; card&nbsp; holders&nbsp; full&nbsp; name.&nbsp; By&nbsp; giving&nbsp; us&nbsp; your&nbsp; Credit&nbsp; Card&nbsp; details&nbsp; you&nbsp; agree&nbsp; for&nbsp; us&nbsp; to&nbsp; take&nbsp; full&nbsp; payment&nbsp; from&nbsp; your&nbsp; credit&nbsp; card.&nbsp; Some&nbsp; credit&nbsp; cards&nbsp; may&nbsp; incur&nbsp; a&nbsp; 1.5%&nbsp; surcharge.&nbsp;</p>\r\n\r\n<p><strong>Online&nbsp; security&nbsp;</strong></p>\r\n\r\n<p>Shopping&nbsp; online&nbsp; is&nbsp; safe&nbsp; with&nbsp; us.&nbsp; Your&nbsp; credit&nbsp; card&nbsp; details&nbsp; do&nbsp; not&nbsp; get&nbsp; processed&nbsp; or&nbsp; transmitted&nbsp; through&nbsp; or&nbsp; via&nbsp; our&nbsp; website;&nbsp; all&nbsp; transactions&nbsp; are&nbsp; processed&nbsp; through&nbsp; a&nbsp; secure&nbsp; payment&nbsp; service&nbsp; provider.&nbsp; Your&nbsp; credit&nbsp; card&nbsp; details&nbsp; are&nbsp; not&nbsp; held&nbsp; by&nbsp; us&nbsp; and&nbsp; cannot&nbsp; be&nbsp; accessed&nbsp; by&nbsp; our&nbsp; staff.&nbsp; Credit&nbsp; card&nbsp; issuers&nbsp; usually&nbsp; cover&nbsp; their&nbsp; customers&nbsp; against&nbsp; fraud&nbsp; for&nbsp; online&nbsp; transactions.&nbsp; Check&nbsp; with&nbsp; your&nbsp; card&nbsp; issuer&nbsp; for&nbsp; details.&nbsp;</p>\r\n\r\n<p><strong>Delivery&nbsp; </strong></p>\r\n\r\n<p>Your&nbsp; goods&nbsp; will&nbsp; be&nbsp; delivered&nbsp; within&nbsp; New&nbsp; Zealand&nbsp; at&nbsp; a&nbsp; cost&nbsp; of&nbsp; $10&nbsp; and&nbsp; overseas&nbsp; at&nbsp; a&nbsp; cost&nbsp; of&nbsp; $20.&nbsp; Your&nbsp; merchandise&nbsp; will&nbsp; be&nbsp; dispatched&nbsp; within&nbsp; 2&nbsp; working&nbsp; days&nbsp; of&nbsp; your&nbsp; order.&nbsp; We&nbsp; aim&nbsp; to&nbsp; get&nbsp; your&nbsp; goods&nbsp; to&nbsp; you&nbsp; within&nbsp; 7&nbsp; working&nbsp; days&nbsp; of&nbsp; receivingyour&nbsp; order&nbsp; within&nbsp; New&nbsp; Zealand&nbsp; and&nbsp; 14&nbsp; days&nbsp; for&nbsp; overseas&nbsp; orders.&nbsp; We&nbsp; cannot&nbsp; be&nbsp; responsible&nbsp; for&nbsp; the&nbsp; New&nbsp; Zealand&nbsp; Postal&nbsp; Service.&nbsp; Gift&nbsp; vouchers&nbsp; can&nbsp; be&nbsp; emailed&nbsp; to&nbsp; you&nbsp; at&nbsp; no&nbsp; cost&nbsp; other&nbsp; wise&nbsp; its&nbsp; $2&nbsp; within&nbsp; NZ&nbsp; and&nbsp; $5&nbsp; worldwide.</p>\r\n\r\n<p><strong>Returns&nbsp; Policy&nbsp;</strong></p>\r\n\r\n<p>If&nbsp; you&nbsp; are&nbsp; dissatisfied&nbsp; with&nbsp; your&nbsp; order&nbsp; for&nbsp; any&nbsp; reason&nbsp; we&nbsp; will&nbsp; be&nbsp; happy&nbsp; to&nbsp; give&nbsp; you&nbsp; a&nbsp; full&nbsp; refund&nbsp; if&nbsp; you&nbsp; return&nbsp; the&nbsp; goods&nbsp; to&nbsp; us&nbsp; undamaged&nbsp; within&nbsp; 14&nbsp; days.&nbsp; Please&nbsp; notify&nbsp; us&nbsp; by&nbsp; email&nbsp; the&nbsp; reason&nbsp; why&nbsp; you&nbsp; are&nbsp; dissatisfied&nbsp; with&nbsp; the&nbsp; goods,&nbsp; before&nbsp; you&nbsp; return&nbsp; them.&nbsp; Goods&nbsp; returned&nbsp; without&nbsp; prior&nbsp; notification&nbsp; will&nbsp; not&nbsp; be&nbsp; accepted.&nbsp;</p>\r\n\r\n<p><strong>DVD&nbsp; &amp;&nbsp; Photo&nbsp; Policy&nbsp; </strong></p>\r\n\r\n<p>In&nbsp; the&nbsp; event&nbsp; that&nbsp; your&nbsp; DVD&nbsp; or&nbsp; photos&nbsp; malfunction,&nbsp; you&nbsp; will&nbsp; have&nbsp; the&nbsp; option&nbsp; to&nbsp; not&nbsp; purchase,&nbsp; and&nbsp; you&nbsp; will&nbsp; not&nbsp; be&nbsp; charged&nbsp; for&nbsp; it.&nbsp; However,&nbsp; should&nbsp; you&nbsp; choose&nbsp; to&nbsp; jump&nbsp; again&nbsp; then&nbsp; you&nbsp; must&nbsp; pay&nbsp; the&nbsp; full&nbsp; cost&nbsp; to&nbsp; repeat&nbsp; the&nbsp; tandem&nbsp; jump&nbsp; and&nbsp; for&nbsp; the&nbsp; recording.&nbsp; After&nbsp; you&nbsp; have&nbsp; left&nbsp; our&nbsp; premises,&nbsp; Skydive&nbsp; Bay&nbsp; of&nbsp; Islands&nbsp; take&nbsp; no&nbsp; responsibility&nbsp; if&nbsp; the&nbsp; item&nbsp; is&nbsp; stolen,&nbsp; misplaced&nbsp; or&nbsp; damaged.</p>\r\n\r\n<p><strong>Postponement&nbsp;</strong></p>\r\n\r\n<p>We&nbsp; do&nbsp; not&nbsp; accept&nbsp; liability&nbsp; for&nbsp; any&nbsp; costs&nbsp; or&nbsp; expenses&nbsp; incurredif&nbsp; we&nbsp; have&nbsp; to&nbsp; postpone&nbsp; your&nbsp; jump,&nbsp; where&nbsp; the&nbsp; reason&nbsp; for&nbsp; thepostponement&nbsp; is&nbsp; beyond&nbsp; our&nbsp; control.&nbsp;</p>\r\n\r\n<p><strong>Important&nbsp; notice</strong></p>\r\n\r\n<p>Parachuting&nbsp; is&nbsp; an&nbsp; adventure&nbsp; sport&nbsp; and&nbsp; participation&nbsp; in&nbsp; such&nbsp; sports&nbsp; necessarily&nbsp; involves&nbsp; a&nbsp; risk&nbsp; of&nbsp; injury&nbsp; or&nbsp; death&nbsp; regardless&nbsp; of&nbsp; the&nbsp; standard&nbsp; of&nbsp; training,&nbsp; supervision&nbsp; and&nbsp; equipment&nbsp; employed.</p>\r\n\r\n<p>&quot;By&nbsp; taking&nbsp; part&nbsp; in&nbsp; parachuting&nbsp; activities&nbsp; I&nbsp; voluntarily&nbsp; accept&nbsp; all&nbsp; the&nbsp; risks&nbsp; inherent&nbsp; in&nbsp; the&nbsp; sport&nbsp; and&nbsp; I&nbsp; agree&nbsp; for&nbsp; myself&nbsp; and&nbsp; my&nbsp; personal&nbsp; representatives&nbsp; to&nbsp; indemnify&nbsp; and&nbsp; hold&nbsp; harmless&nbsp; Skydive&nbsp; Bay&nbsp; of&nbsp; Islands&nbsp; against&nbsp; any&nbsp; claim&nbsp; or&nbsp; claims&nbsp; whether&nbsp; on&nbsp; my&nbsp; own&nbsp; account&nbsp; or&nbsp; from&nbsp; third&nbsp; parties&nbsp; arising&nbsp; out&nbsp; of&nbsp; any&nbsp; accident&nbsp; or&nbsp; incident&nbsp; resulting&nbsp; in&nbsp; any&nbsp; loss&nbsp; or&nbsp; damage&nbsp; (including&nbsp; bodily&nbsp; injury&nbsp; and&nbsp; death).&quot;</p>','col-xs-12',0,1,123),('<p><img alt=\"\" src=\"/library/photos/sboi-56.jpg\" /></p>','col-xs-12 col-sm-6 col-md-4',0,1,414),('<p><img alt=\"\" src=\"/library/photos/sboi-12.jpg\" /></p>','col-xs-12 col-sm-6 col-md-4',0,2,414),('<p><img alt=\"\" src=\"/library/photos/carolin-0328.jpg\" /></p>','col-xs-12 col-sm-6 col-md-4',0,3,414),('<h5><strong>Forget&nbsp; the&nbsp; hustle&nbsp; and&nbsp; bustle&nbsp; of&nbsp; Auckland&nbsp; City.&nbsp; Blue&nbsp; skies,&nbsp; clear&nbsp; waters,&nbsp; golden&nbsp; sands&nbsp; and&nbsp; sunshine&nbsp; is&nbsp; what&nbsp; we&#39;re&nbsp; about!</strong></h5>\r\n\r\n<p>Short&nbsp; distances&nbsp; and&nbsp; scenic&nbsp; routes&nbsp; make&nbsp; New&nbsp; Zealand&nbsp; the&nbsp; perfect&nbsp; destination&nbsp; for&nbsp; self-drive&nbsp; travel&nbsp; and&nbsp; there&nbsp; is&nbsp; no&nbsp; better place&nbsp; to&nbsp; start&nbsp; than&nbsp; in&nbsp; our&nbsp; beautiful&nbsp; Bay&nbsp; of&nbsp; Islands.&nbsp; Only&nbsp; 3&nbsp; hours&nbsp; north&nbsp; of&nbsp; Auckland&nbsp; golden&nbsp; sand&nbsp; and&nbsp; azure&nbsp; waters&nbsp; await!</p>\r\n\r\n<p>The&nbsp; Bay&nbsp; of&nbsp; Islands&nbsp; is&nbsp; a&nbsp; subtropical&nbsp; micro-region&nbsp; of&nbsp; New&nbsp; Zealand&nbsp; well&nbsp; known&nbsp; for&nbsp; its&nbsp; stunning&nbsp; beauty&nbsp; and&nbsp; historic&nbsp; significance.&nbsp; For&nbsp; those&nbsp; that&nbsp; love&nbsp; beaches&nbsp; and&nbsp; water&nbsp; activities,&nbsp; it&#39;s&nbsp; paradise.&nbsp; &nbsp; The&nbsp; 144&nbsp; islands&nbsp; that&nbsp; make&nbsp; up&nbsp; the&nbsp; Bay&nbsp; of&nbsp; Islands&nbsp; make&nbsp; for&nbsp; an&nbsp; idyllic&nbsp; aquatic&nbsp; playground.&nbsp; With&nbsp; wildlife&nbsp; including&nbsp; penguins,&nbsp; dolphins,&nbsp; marlin,&nbsp; whales,&nbsp; gannets&nbsp; and&nbsp; more.&nbsp; &nbsp;</p>\r\n\r\n<hr />','col-xs-12',0,1,415),('','col-xs-12 col-sm-6 col-md-6',0,1,416),('','col-xs-12 col-sm-6 col-md-6',0,2,416),('<p>The&nbsp; Bay&nbsp; of&nbsp; Islands&nbsp; is&nbsp; known&nbsp; as&nbsp; the&nbsp; birthplace&nbsp; of&nbsp; New&nbsp; Zealand.&nbsp; Visiting&nbsp; the&nbsp; historic&nbsp; town&nbsp; of&nbsp; Russell&nbsp; and&nbsp; the&nbsp; award-winning&nbsp; Waitangi&nbsp; Treaty&nbsp; Grounds&nbsp; and&nbsp; Museum&nbsp; of&nbsp; Waitangi&nbsp; are&nbsp; unquestionably&nbsp; one&nbsp; of&nbsp; New Zealand?s&nbsp; premier&nbsp; attractions.&nbsp;</p>\r\n\r\n<p>Visit&nbsp; the&nbsp; Hole&nbsp; in&nbsp; the&nbsp; Rock,&nbsp; the&nbsp; world-class&nbsp; bike&nbsp; trails,&nbsp; the&nbsp; gigantic&nbsp; Te&nbsp; Paki&nbsp; sand&nbsp; dunes&nbsp; and&nbsp; Cape&nbsp; Reinga&nbsp; at&nbsp; the&nbsp; top&nbsp; of&nbsp; the&nbsp; country,&nbsp; and&nbsp; Tane&nbsp; Mahuta&nbsp; in&nbsp; the&nbsp; west.&nbsp; The&nbsp; Far&nbsp; North&nbsp; is&nbsp; an&nbsp; absolute&nbsp; &#39;must-do&#39;&nbsp; for&nbsp; visitors&nbsp; and&nbsp; locals&nbsp; alike.&nbsp;&nbsp;</p>\r\n\r\n<p>There&nbsp; is&nbsp; such&nbsp; a&nbsp; huge&nbsp; range&nbsp; of&nbsp; things&nbsp; to&nbsp; see&nbsp; and&nbsp; do&nbsp; in&nbsp; the&nbsp; Bay&nbsp; of&nbsp; Islands.&nbsp; From&nbsp; indulgent,&nbsp; to&nbsp; the&nbsp; relaxed,&nbsp; to&nbsp; the&nbsp; more&nbsp; adrenalin&nbsp; pumping&nbsp; activities&nbsp; (like&nbsp; skydiving!), there?s&nbsp; something&nbsp; for&nbsp; everyone.</p>\r\n\r\n<p>The&nbsp; Bay&nbsp; of&nbsp; Islands&nbsp; is&nbsp; an&nbsp; easy&nbsp; 3&nbsp; hour&nbsp; drive&nbsp; North&nbsp; of&nbsp; Auckland&nbsp; via&nbsp; the&nbsp; east&nbsp; coast&nbsp; highway.&nbsp; Flights,&nbsp; tours&nbsp; and&nbsp; buses&nbsp; are&nbsp; also&nbsp; available&nbsp; from&nbsp; Auckland. <strong>Find&nbsp; us&nbsp; at:&nbsp; Bay&nbsp; of&nbsp; Islands&nbsp; Airport,&nbsp; 182&nbsp; Wiroa&nbsp; Road,&nbsp; Kerikeri.&nbsp;</strong></p>\r\n\r\n<hr />','col-xs-12',0,1,417),('<p>As&nbsp; one&nbsp; of&nbsp; New&nbsp; Zealand&#39;s&nbsp; most&nbsp; popular&nbsp; destinations,&nbsp; the&nbsp; unbelievable&nbsp; natural&nbsp; beauty&nbsp; is&nbsp; sure&nbsp; to&nbsp; take&nbsp; your&nbsp; breath&nbsp; away.&nbsp; &nbsp; Especially&nbsp; from&nbsp; the&nbsp; air!&nbsp; Cruise&nbsp; up&nbsp; to&nbsp; 16,500ft&nbsp; and&nbsp; soak&nbsp; up&nbsp; scenery&nbsp; of&nbsp; the&nbsp; beautiful&nbsp; Bay&nbsp; of&nbsp; Islands&nbsp; before&nbsp; experiencing&nbsp; the&nbsp; thrill&nbsp; of&nbsp; your&nbsp; life&nbsp; with&nbsp; the&nbsp; crew&nbsp; at&nbsp; Skydive&nbsp; Bay&nbsp; of&nbsp; Islands.&nbsp; &nbsp;</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>','col-xs-12',0,1,418),('','col-xs-12',0,1,456),('<p style=\"text-align: center;\">Fill out the form below or contact us by:<br />\r\n<strong>Free phone:</strong>&nbsp; 0800&nbsp; GOJUMP&nbsp; (0800&nbsp; 465867)<br />\r\n<strong>email</strong>: jump@skydivebayofislands.com<br />\r\n<strong>Address:</strong> Bay&nbsp; of&nbsp; Islands&nbsp; Airport,&nbsp; 182&nbsp; Wiroa&nbsp; Road,&nbsp; Kerikeri&nbsp;</p>','col-xs-12',0,1,465),('<p>Choose&nbsp; from&nbsp; our&nbsp; three&nbsp; skydive&nbsp; heights&nbsp; &ndash;&nbsp; 9,000ft,&nbsp; 12,000ft&nbsp; and&nbsp; 16,000ft&nbsp; then&nbsp; soak&nbsp; up&nbsp; scenery&nbsp; of&nbsp; all&nbsp; 144&nbsp; islands&nbsp; that&nbsp; make&nbsp; up&nbsp; the&nbsp; Bay&nbsp; of&nbsp; Islands.&nbsp; The&nbsp; view&nbsp; is&nbsp; <strong>guaranteed&nbsp; to&nbsp; take&nbsp; your&nbsp; breath</strong>&nbsp; away&nbsp; and&nbsp; the&nbsp; exhilarating&nbsp; free&nbsp; fall&nbsp; will&nbsp; have&nbsp; you&nbsp; buzzing&nbsp; long&nbsp; after&nbsp; your&nbsp; feet&nbsp; touch&nbsp; the&nbsp; ground!&nbsp;</p>\r\n\r\n<p>Throughout&nbsp; your&nbsp; unforgettable&nbsp; experience&nbsp; you&nbsp; will&nbsp; be&nbsp; harnessed&nbsp; to&nbsp; one&nbsp; of&nbsp; our&nbsp; highly&nbsp; trained&nbsp; instructors.&nbsp; &nbsp;</p>\r\n\r\n<p>So&nbsp; what&nbsp; are&nbsp; you&nbsp; waiting&nbsp; for?!&nbsp; Tandem&nbsp; skydive&nbsp; with&nbsp; the&nbsp; best:&nbsp; the&nbsp; best&nbsp; islands&nbsp; views,&nbsp; the&nbsp; best&nbsp; location,&nbsp; and&nbsp; the&nbsp; best&nbsp; crew&nbsp; and&nbsp; instructors.</p>','col-xs-12 col-sm-6 col-md-6',0,1,526),('','col-xs-12 col-sm-6 col-md-6',0,2,526),('<h3 style=\"text-align: center;\">Come&nbsp; fly&nbsp; with&nbsp; us&nbsp; at&nbsp; Skydive&nbsp; Bay&nbsp; of&nbsp; Islands</h3>','col-xs-12',0,1,527),('<h4>Our Aircraft</h4>\r\n\r\n<p>While it&rsquo;s well known that planes are not the most environmentally friendly things we can&rsquo;t eliminate the need for them just yet! However we are committed to selecting the most efficient aircraft for the job and we do our best to make sure that we operate it in the most environmentally friendly way possible. Skydive Bay of Islands uses a Cessna Caravan, which is both fast and fuel-efficient. We also carry out extensive engine monitoring to track engine performance, look for and implement further operational efficiencies.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4>Noise and the Environment</h4>\r\n\r\n<p>Aircrafts are typically quite loud and their operation can have a significant impact on the people in the vicinity of operations. We consider this with our aircraft selection and wherever possible, flights are kept away from noise sensitive areas.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4>Digital Photos and Videos</h4>\r\n\r\n<p>While your amazing memories are available to take away on a reusable USB stick, we have also incorporated an online media storage facility into our system which means your experience is available to share digitally with family and friends within a few moments of you landing, cutting down on the need to print copies and keep track of a USB or other storage device.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4>Waste Management and Recycling</h4>\r\n\r\n<p>At Skydive Bay of Islands, we have recycling facilities on site, which separate plastics, glass and paper. Our staff makes a conscious effort to recycle whatever they can, and we encourage all of our customers to use these facilities too. The recycled materials are then collected by the council and sent to a sorting centre.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4>Partners</h4>\r\n\r\n<p>When we partner with other local businesses in the area we make sure that they adopt the same environmental values and sustainable practices that we believe in. After all, looking after the environment is a group effort!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4>Every little bit&hellip;.</h4>\r\n\r\n<p>We are always looking for ways to improve Skydive Bay of Islands&rsquo; impact on the environment. In addition to the actions listed above, we are also proactively reducing our electricity and water consumption by purchasing efficient equipment and consumables as well as environmentally friendly cleaning products.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4>Giving back to our community</h4>\r\n\r\n<p>Skydive Bay of Islands believes very strongly in supporting our local community and welcomes any opportunity to be involved in giving back to our community. We support a number of charities.</p>\r\n\r\n<p>Some of the ways we give back to the community include donating prize sponsorships. A few we have contributed to in the last 12 months include:</p>\r\n\r\n<ul>\r\n	<li>Donated a 12000ft skydive to local a primary</li>\r\n	<li>Donating a 12000ft skydive to Hospice</li>\r\n	<li>Partnering with Alzheimer&rsquo;s Northland</li>\r\n	<li>Annual Donations to Project Islands Song</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Each and every one of our team love, respect and admire the incredible landscape we work in, which is why each and every one of our team is committed to protecting it. If you have any questions about our environmental impact and sustainability, please don&rsquo;t hesitate to ask!</p>','col-xs-12',0,1,535),('<h4>First &nbsp;we &nbsp;cruise &nbsp;up &nbsp;to &nbsp;9,000ft</h4>','col-xs-12',0,1,537),('<p>As you soak up the scenery of all 144 islands that make up the Bay of Islands, the &nbsp;spectacular &nbsp;views &nbsp;of &nbsp;turquoise &nbsp;water, &nbsp;golden &nbsp;beaches &nbsp;and &nbsp;lush &nbsp;countryside &nbsp;are &nbsp;guaranteed &nbsp;to &nbsp;take &nbsp;your &nbsp;breath &nbsp;away.</p>\r\n\r\n<p>You&rsquo;ll&nbsp; sit&nbsp; on&nbsp; the&nbsp; edge&nbsp; of&nbsp; the&nbsp; plane,&nbsp; the&nbsp; anticipation&nbsp; will&nbsp; build&nbsp; as&nbsp; you&nbsp; prepare&nbsp; to&nbsp; exit&nbsp; and&nbsp; then&nbsp; we&nbsp; jump!&nbsp; Reaching&nbsp; speeds&nbsp; of&nbsp; up&nbsp; to&nbsp; 200km&nbsp; per&nbsp; hour,&nbsp; experiencing&nbsp; the&nbsp; thrill&nbsp; of&nbsp; free&nbsp; fall&nbsp; is&nbsp; something&nbsp; you&rsquo;ll&nbsp; never&nbsp; forget.&nbsp; &nbsp; &nbsp;</p>\r\n\r\n<p>After&nbsp; an&nbsp; insane&nbsp; <strong>20&nbsp; seconds&nbsp; of&nbsp; freefall</strong>&nbsp; you&rsquo;ll&nbsp; then&nbsp; float&nbsp; under&nbsp; canopy&nbsp; before&nbsp; landing&nbsp; back&nbsp; at&nbsp; the&nbsp; dropzone,&nbsp; or&nbsp; one&nbsp; of&nbsp; our&nbsp; alternative&nbsp; landing&nbsp; areas.&nbsp;You&rsquo;ll&nbsp; be&nbsp; buzzing&nbsp; long&nbsp; after&nbsp; your&nbsp; feet&nbsp; touch&nbsp; the&nbsp; ground.&nbsp;</p>\r\n\r\n<p>Don&rsquo;t&nbsp; forget&nbsp; to&nbsp; capture&nbsp; the&nbsp; moment&nbsp; with&nbsp; one&nbsp; of&nbsp; our&nbsp; <a href=\"/skydive/photo-video-packages\">awesome camera&nbsp; packages!&nbsp;</a> &nbsp;</p>','col-xs-12',0,1,538),('<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><a class=\"btn btn_red\" href=\"http://www.skydivebayofislands.com/skydive/faqs\">FAQ&#39;s Page</a></p>','col-xs-12',0,1,539),('<h4>First&nbsp; we&nbsp; cruise&nbsp; up&nbsp; to&nbsp; 12,000ft</h4>','col-xs-12',0,1,540),('<p>As you soak up the scenery of all 144 islands that make up the Bay of Islands, the spectacular views of turquoise water, golden beaches and lush countryside are guaranteed to take your breath away.</p>\r\n\r\n<p>You&rsquo;ll&nbsp; sit&nbsp; on&nbsp; the&nbsp; edge&nbsp; of&nbsp; the&nbsp; plane,&nbsp; the&nbsp; anticipation&nbsp; will&nbsp; build&nbsp; as&nbsp; you&nbsp; prepare&nbsp; to&nbsp; exit&nbsp; and&nbsp; then&nbsp; we&nbsp; jump!&nbsp; Reaching&nbsp; speeds&nbsp; of&nbsp; up&nbsp; to&nbsp; 200km&nbsp; per&nbsp; hour,&nbsp; experiencing&nbsp; the&nbsp; thrill&nbsp; of&nbsp; free&nbsp; fall&nbsp; is&nbsp; something&nbsp; you&rsquo;ll&nbsp; never&nbsp; forget.&nbsp; &nbsp; &nbsp;</p>\r\n\r\n<p>After&nbsp; an&nbsp; insane&nbsp; <strong>45&nbsp; seconds&nbsp; of&nbsp; freefall</strong>&nbsp; you&rsquo;ll&nbsp; then&nbsp; float&nbsp; under&nbsp; canopy&nbsp; before&nbsp; landing&nbsp; back&nbsp; at&nbsp; the&nbsp; dropzone,&nbsp; or&nbsp; one&nbsp; of&nbsp; our&nbsp; alternative&nbsp; landing&nbsp; areas.&nbsp;You&rsquo;ll&nbsp; be&nbsp; buzzing&nbsp; long&nbsp; after&nbsp; your&nbsp; feet&nbsp; touch&nbsp; the&nbsp; ground.&nbsp;</p>\r\n\r\n<p>Don&rsquo;t&nbsp; forget&nbsp; to&nbsp; capture&nbsp; the&nbsp; moment&nbsp; with&nbsp; one&nbsp; of&nbsp; our&nbsp; <a href=\"/skydive/photo-video-packages\">awesome camera&nbsp; packages!&nbsp;</a></p>\r\n\r\n<p>&nbsp;</p>','col-xs-12',0,1,541),('<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><a class=\"btn btn_red\" href=\"http://skydivebayofislands.com/skydive/faqs\">FAQ&#39;s Page</a></p>','col-xs-12',0,1,542),('<h4>First&nbsp; we&nbsp; cruise&nbsp; up&nbsp; to&nbsp; 16,000ft</h4>','col-xs-12',0,1,543),('<p>As you soak up the scenery of all <strong>144 islands</strong> that make up the Bay of Islands, the spectacular views of turquoise water, golden beaches and lush countryside are guaranteed to take your breath away. &nbsp;</p>\r\n\r\n<p>You&rsquo;ll&nbsp; sit&nbsp; on&nbsp; the&nbsp; edge&nbsp; of&nbsp; the&nbsp; plane,&nbsp; the&nbsp; anticipation&nbsp; will&nbsp; build&nbsp; as&nbsp; you&nbsp; prepare&nbsp; to&nbsp; exit&nbsp; and&nbsp; then&nbsp; we&nbsp; jump!&nbsp; Reaching&nbsp; speeds&nbsp; of&nbsp; up&nbsp; to&nbsp; <strong>200km&nbsp; per&nbsp; hour,</strong>&nbsp; experiencing&nbsp; the&nbsp; thrill&nbsp; of&nbsp; free&nbsp; fall&nbsp; is&nbsp; something&nbsp; you&rsquo;ll&nbsp; never&nbsp; forget.&nbsp; &nbsp; &nbsp;</p>\r\n\r\n<p>After&nbsp; an&nbsp; insane&nbsp; <strong>70&nbsp; seconds&nbsp; of&nbsp; freefall</strong>&nbsp; you&rsquo;ll&nbsp; then&nbsp; float&nbsp; under&nbsp; canopy&nbsp; before&nbsp; landing&nbsp; back&nbsp; at&nbsp; the&nbsp; dropzone,&nbsp; or&nbsp; one&nbsp; of&nbsp; our&nbsp; alternative&nbsp; landing&nbsp; areas.&nbsp;You&rsquo;ll&nbsp; be&nbsp; buzzing&nbsp; long&nbsp; after&nbsp; your&nbsp; feet&nbsp; touch&nbsp; the&nbsp; ground.&nbsp;</p>\r\n\r\n<p>Don&rsquo;t&nbsp; forget&nbsp; to&nbsp; capture&nbsp; the&nbsp; moment&nbsp; with&nbsp; one&nbsp; of&nbsp; our&nbsp; <a href=\"/skydive/photo-video-packages\">awesome camera&nbsp; packages!</a>&nbsp; &nbsp;&nbsp;</p>','col-xs-12',0,1,544),('<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><a class=\"btn btn_red\" href=\"http://skydivebayofislands.com/skydive/faqs\">FAQ&#39;s Page</a></p>','col-xs-12',0,1,545),('<h4>Don&rsquo;t&nbsp; forget&nbsp; to&nbsp; capture&nbsp; the&nbsp; moment&nbsp; with&nbsp; one&nbsp; of&nbsp; our&nbsp; awesome&nbsp; camera&nbsp; packages.&nbsp;</h4>\r\n\r\n<p>Chose&nbsp; between&nbsp; our&nbsp; silver,&nbsp; gold&nbsp; and&nbsp; platinum&nbsp; packages.&nbsp; Using&nbsp; two&nbsp; wrist-mounted&nbsp; cameras,&nbsp; your&nbsp; tandem&nbsp; instructor&nbsp; will&nbsp; capture&nbsp; your&nbsp; entire&nbsp; skydive&nbsp; experience.&nbsp; One&nbsp; camera&nbsp; records&nbsp; your&nbsp; video,&nbsp; and&nbsp; the&nbsp; other&nbsp; takes&nbsp; high&nbsp; quality&nbsp; photos.&nbsp; With&nbsp; our&nbsp; platinum&nbsp; package&nbsp; not&nbsp; a&nbsp; single&nbsp; second&nbsp; is&nbsp; missed&nbsp; and&nbsp; you&rsquo;re&nbsp; provided&nbsp; with&nbsp; video&nbsp; and&nbsp; picture&nbsp; footage&nbsp; from&nbsp; a&nbsp; personal&nbsp; camera&nbsp; flyer&nbsp; and&nbsp; from&nbsp; your&nbsp; tandem&nbsp; instructor.&nbsp; &nbsp;</p>\r\n\r\n<p>The&nbsp; video&nbsp; and&nbsp; photos&nbsp; consist&nbsp; of&nbsp; professional&nbsp; footage&nbsp; on&nbsp; the&nbsp; ground,&nbsp; personal&nbsp; interview,&nbsp; flight&nbsp; to&nbsp; altitude&nbsp; in&nbsp; the&nbsp; aircraft,&nbsp; aircraft&nbsp; exit,&nbsp; skydive&nbsp; free&nbsp; fall,&nbsp; parachute&nbsp; ride&nbsp; and&nbsp; landing.&nbsp;</p>\r\n\r\n<p><strong>Not sure? Don&#39;t worry, you don&#39;t have to decide now, your camera package can be&nbsp; purchased&nbsp; on&nbsp; arrival.&nbsp;</strong></p>','col-xs-12',0,1,546),('<h4>Silver:&nbsp; $159</h4>\r\n\r\n<ul>\r\n	<li>Handy&nbsp; cam&nbsp;</li>\r\n	<li>Chose&nbsp; between&nbsp; either&nbsp; video&nbsp; or&nbsp; photos&nbsp;</li>\r\n	<li>4GB&nbsp;&nbsp;SBOI&nbsp; branded&nbsp; USB&nbsp; containing&nbsp; HD&nbsp; video&nbsp; or&nbsp; photos&nbsp;</li>\r\n</ul>','col-xs-12 col-sm-6 col-md-4',0,1,547),('<h4>Gold:&nbsp; $199</h4>\r\n\r\n<ul>\r\n	<li>Handy&nbsp; cam&nbsp;</li>\r\n	<li>Video&nbsp; and&nbsp; photos&nbsp;</li>\r\n	<li>4GB&nbsp;&nbsp;SBOI&nbsp; branded&nbsp; USB&nbsp; containing&nbsp; HD&nbsp; video&nbsp; and&nbsp; photos&nbsp;</li>\r\n</ul>','col-xs-12 col-sm-6 col-md-4',0,2,547),('<h4>Platinum:&nbsp; &nbsp; $298</h4>\r\n\r\n<ul>\r\n	<li>Handy&nbsp; cam&nbsp; and&nbsp; free&nbsp; fall&nbsp; camera&nbsp;</li>\r\n	<li>Personal&nbsp; camera&nbsp; flyer&nbsp; PLUS&nbsp; tandem&nbsp; instructor&nbsp; video&nbsp; and&nbsp; photos&nbsp;</li>\r\n	<li>4GB&nbsp;&nbsp;SBOI&nbsp; branded&nbsp; USB&nbsp; containing&nbsp; HD&nbsp; video&nbsp; and&nbsp; photos&nbsp; from&nbsp; a&nbsp; personal&nbsp; camera&nbsp; flyer&nbsp; and&nbsp; your&nbsp; tandem&nbsp; instructor&nbsp;</li>\r\n</ul>','col-xs-12 col-sm-6 col-md-4',0,3,547),('<p><img alt=\"\" src=\"/library/photos/011518-23.jpg\" /></p>','col-xs-12 col-sm-6 col-md-4',0,1,548),('<p><img alt=\"\" src=\"/library/photos/011518-15.jpg\" /></p>','col-xs-12 col-sm-6 col-md-4',0,2,548),('<p><img alt=\"\" src=\"/library/photos/011518-14.jpg\" /></p>','col-xs-12 col-sm-6 col-md-4',0,3,548),('<p><em>Prices&nbsp; are&nbsp; in&nbsp;&nbsp;NZD$&nbsp; and&nbsp; include&nbsp; GST.&nbsp; Prices&nbsp; maybe&nbsp; subject&nbsp; to&nbsp; change.</em></p>','col-xs-12',0,1,549),('<h4>Learn to skydive solo with the Accelerated Freefall (AFF) course at Skydive Bay of Islands</h4>','col-xs-12',0,1,550),('<p><img alt=\"\" src=\"/library/photos/aff.jpg\" /></p>','col-xs-12',0,1,551),('<hr />\r\n<h5>About this course</h5>\r\n\r\n<p>This training program is taught in the sunny Bay of Islands at the top of New Zealand. The Accelerated&nbsp;Freefall&nbsp;(AFF) Program is designed to teach you how to skydive solo efficiently and safely, with some of the most experienced instructors in New Zealand.&nbsp; We operate seven days per week, weather permitting.</p>\r\n\r\n<p>We are affiliated with the New Zealand Parachute Industry Association (NZPIA), meaning our training curriculum and instructors are all&nbsp;NZPIA&nbsp;approved. Our equipment is maintained to&nbsp;NZPIA&nbsp;standards and is of the latest designs. &nbsp;Read more&gt;</p>\r\n\r\n<hr />\r\n<h5>Brief course explanation and packages</h5>\r\n\r\n<p>Through a combination of theory and practical jumps, you will be taken through a progression program that will test your skills in a range of areas, in free fall and under your parachute.&nbsp;For a full course breakdown and prices you can download more information here or please contact us on 0800 GO JUMP or email us&nbsp;<a href=\"mailto:jump@skydivebayofislands.com?subject=AFF\">jump@skydivebayofislands.com</a></p>\r\n\r\n<hr />','col-xs-12',0,1,552),('<h5>SOLO SKYDIVE Package (AFF&nbsp;Levels 1- 8):</h5>\r\n\r\n<p>The SOLO SKYDIVE is the first 8 levels in your learning to skydive adventure. This course includes practical&nbsp;ground training, covering everything you need to know about&nbsp;your first solo free fall and parachute flight. Successful completion of these levels will see you being able to skydive unassisted.</p>','col-xs-12 col-sm-6 col-md-6',0,1,553),('<h5>SKYDIVE &ldquo;A&rdquo; LICENSE Package (jumps 9-25):</h5>\r\n\r\n<p>Completion of jumps 9-25 prepares you to sit the&nbsp;NZPIA&nbsp;&lsquo;A&rsquo; Certificate Exam online, and allows you then to apply for the&nbsp;NZPIA&nbsp;International &lsquo;A&rsquo; Certificate.</p>','col-xs-12 col-sm-6 col-md-6',0,2,553),('<hr />\r\n<h5>We hope to see you in the sky sometime soon!</h5>','col-xs-12',0,1,554),('<hr />\r\n<p><a id=\"AFF details\" name=\"AFF details\"></a>Our&nbsp;AFF&nbsp;Program is based on international standards. This means if you undertake this program while you are a visitor to New Zealand that the qualification you receive&nbsp;is transferable and&nbsp;recognised&nbsp;by&nbsp;your home, and other, countries.</p>\r\n\r\n<p>Our&nbsp;AFF&nbsp;skydive training program &nbsp;will teach you all the skills you require to be able to skydive solo, learning comprehensive skills for flying your body and piloting your parachute. Upon completion of our learn to skydive program you will be able to skydive on your own.</p>\r\n\r\n<p>Throughout the course we will use digital video as a tool to debrief your skydives . This is a great learning tool but also makes for a great souvenir &ndash; you can take your videos home with you once you complete the course.</p>\r\n\r\n<p>The Bay of Islands is an awesome place to hang out for a while. Known locally as the &lsquo;Winterless&nbsp;North&rsquo; the beaches are world class and there are plenty of activities for when&nbsp;your not skydiving. During summer especially there is a great social scene in&nbsp;Paihia&nbsp;with bars, restaurants, hotels and more.</p>\r\n\r\n<p>We are dedicated to your training and on our&nbsp;dropzone&nbsp;you will have access to some of the best resources and instructors in New Zealand.</p>\r\n\r\n<p>Please note: If you allow more than 30 days to lapse between jumps, you will have to undertake re-currency training. It is important for skydivers at all levels to stay current. Because we operate seven days a week, weather permitting, you will be able to quickly and effectively develop your new skills.</p>','col-xs-12',0,1,555),('<h4>At &nbsp;Skydive &nbsp;Bay &nbsp;of &nbsp;Islands &nbsp;we &nbsp;welcome &nbsp;sport &nbsp;skydivers. &nbsp;</h4>\r\n\r\n<p>No &nbsp;minimum &nbsp;license &nbsp;requirements &nbsp;and &nbsp;guaranteed &nbsp;slots &nbsp;for &nbsp;sports &nbsp;jumpers &nbsp;on &nbsp;every &nbsp;load. &nbsp;We &nbsp;operate &nbsp;7 &nbsp;days &nbsp;a &nbsp;week &nbsp;weather &nbsp;permitting. &nbsp; &nbsp;It &nbsp;doesn&rsquo;t &nbsp;get &nbsp;any &nbsp;better &nbsp;than &nbsp;the &nbsp;sunny &nbsp;Bay &nbsp;of &nbsp;Islands!</p>','col-xs-12',0,1,556),('<hr />\r\n<p>Requirements:</p>\r\n\r\n<ul>\r\n	<li>AAD&rsquo;s are mandatory</li>\r\n	<li>Reserve packs must be up to date</li>\r\n	<li>We operate under the&nbsp;NZPIA. Temporary or full membership can be obtained at the&nbsp;dropzone.</li>\r\n	<li>You must bring your log book and license to the&nbsp;dropzone.</li>\r\n</ul>\r\n\r\n<p><br />\r\nSkydive Bay of Islands has a <a href=\"https://www.facebook.com/groups/136558036947515/\">Facebook group</a> dedicated to sports jumpers. This group gives you an&nbsp;opportunity to check weather, stay in touch with the&nbsp;dropzone&nbsp;and each other. If you&rsquo;re&nbsp;travelling&nbsp;from Auckland or elsewhere please feel free to use this page to organize sharing lifts to and from the Bay of Islands.</p>\r\n\r\n<p>Call us on 0800 GO JUMP or email <a href=\"mailto:jump@skydivebayofislands?subject=Sports\">jump@skydivebayofislands</a>&nbsp;for more information</p>','col-xs-12',0,1,557),('<h4 style=\"text-align: center;\">So you&rsquo;ve&nbsp; chosen&nbsp; your&nbsp; skydive&nbsp; height&nbsp; and&nbsp; picked&nbsp; out&nbsp; your&nbsp; photo&nbsp; and&nbsp; video&nbsp; package...</h4>\r\n\r\n<p style=\"text-align: center;\">but&nbsp; you&rsquo;re&nbsp; still&nbsp; after&nbsp; something&nbsp; to&nbsp; make&nbsp; your&nbsp; skydive&nbsp; extra&nbsp; special&nbsp; and&nbsp; unlike&nbsp; any&nbsp; other&nbsp; skydive&nbsp; in&nbsp; the&nbsp; world?&nbsp; Read&nbsp; on!</p>','col-xs-12',0,1,558),('<h4 style=\"text-align: center;\">Check out our range of skydive and camera packages below and book online today.</h4>\r\n\r\n<p style=\"text-align: center;\">What are you waiting for? Tandem skydive with the best: the best islands views, the best location, and the best crew and instructors.</p>\r\n\r\n<p style=\"text-align: center;\"><strong>Not sure about your photo and video package? Don&#39;t worry, you don&#39;t have to decide now, your camera package can be purchased on arrival. </strong></p>','col-xs-12',0,1,559),('<h5>The spectacular views of clear turquoise water, long stretches of pristine golden beaches and lush countryside are guaranteed to take your breath away.</h5>\r\n\r\n<p>Reaching speeds of up to 200km per hour, experiencing the thrill of free fall is something you&rsquo;ll never forget. We fly up to 16,500ft &ndash; one of the highest skydive in the North Island!</p>\r\n\r\n<p>After an insane 70 seconds you&rsquo;ll then float under canopy before landing back at the dropzone, or one of our alternative landing areas. You&rsquo;ll be buzzing long after your feet touch the ground.</p>\r\n\r\n<p>Tandem skydive with the best: the best islands views, the best location, and the best crew and instructors.</p>\r\n\r\n<hr />\r\n<h2 style=\"text-align: center;\">So what are you waiting for?!&nbsp; Book your tandem jump today!</h2>','col-xs-12',0,1,560),('<p><img alt=\"\" src=\"/library/photos/sboi-1.jpg\" /></p>','col-xs-12 col-sm-6 col-md-4',0,1,561),('<p><img alt=\"\" src=\"/library/photos/sboi-10.jpg\" /></p>','col-xs-12 col-sm-6 col-md-4',0,2,561),('<p><img alt=\"\" src=\"/library/photos/sboi-56.jpg\" /></p>','col-xs-12 col-sm-6 col-md-4',0,3,561),('<p>The&nbsp; spectacular&nbsp; views&nbsp; of&nbsp; clear&nbsp; turquoise&nbsp; water,&nbsp; long&nbsp; stretches&nbsp; of&nbsp; pristine&nbsp; golden&nbsp; beaches&nbsp; and&nbsp; lush&nbsp; countryside&nbsp; are&nbsp; guaranteed&nbsp; to&nbsp; take&nbsp; your&nbsp; breath&nbsp; away.&nbsp; &nbsp;</p>\r\n\r\n<p>Reaching&nbsp; speeds&nbsp; of&nbsp; up&nbsp; to&nbsp; 200km&nbsp; per&nbsp; hour,&nbsp; experiencing&nbsp; the&nbsp; thrill&nbsp; of&nbsp; free&nbsp; fall&nbsp; is&nbsp; something&nbsp; you&rsquo;ll&nbsp; never&nbsp; forget.&nbsp; We&nbsp; fly&nbsp; up&nbsp; to&nbsp; 16,500ft&nbsp; &ndash;&nbsp; one&nbsp; of&nbsp; the&nbsp; highest&nbsp; skydive&nbsp; in&nbsp; the&nbsp; North&nbsp; Island!&nbsp; &nbsp; &nbsp;</p>\r\n\r\n<p>After&nbsp; an&nbsp; insane&nbsp; 70&nbsp; seconds&nbsp; you&rsquo;ll&nbsp; then&nbsp; float&nbsp; under&nbsp; canopy&nbsp; before&nbsp; landing&nbsp; back&nbsp; at&nbsp; the&nbsp; dropzone,&nbsp; or&nbsp; one&nbsp; of&nbsp; our&nbsp; alternative&nbsp; landing&nbsp; areas.&nbsp; &nbsp; <strong>You&rsquo;ll&nbsp; be&nbsp; buzzing&nbsp; long&nbsp; after&nbsp; your&nbsp; feet&nbsp; touch&nbsp; the&nbsp; ground.</strong></p>\r\n\r\n<hr />','col-xs-12',0,1,562),('<p>Throughout&nbsp; your&nbsp; unforgettable&nbsp; experience&nbsp; you&nbsp; will&nbsp; be&nbsp; harnessed&nbsp; to&nbsp; someone&nbsp; who&nbsp; has&nbsp; done&nbsp; this&nbsp; literally&nbsp; thousands&nbsp; of&nbsp; times&nbsp; before.&nbsp;</p>\r\n\r\n<p>Our&nbsp; tandem&nbsp; masters&nbsp; have&nbsp; over&nbsp; twenty&nbsp; thousand&nbsp; jumps&nbsp; and&nbsp; twenty&nbsp; years&nbsp; experience&nbsp; between&nbsp; them&nbsp; and&nbsp; are&nbsp; trained&nbsp; to&nbsp; the&nbsp; highest&nbsp; level.&nbsp; &nbsp; Skydive&nbsp; Bay&nbsp; of&nbsp; Islands&nbsp; is&nbsp; certified&nbsp; to&nbsp; the&nbsp; highest&nbsp; possible&nbsp; standard&nbsp; by&nbsp; New&nbsp; Zealand&rsquo;s&nbsp; Civil&nbsp; Aviation&nbsp; Authority,&nbsp; ensuring&nbsp; that&nbsp; your&nbsp; skydive&nbsp; will&nbsp; not&nbsp; only&nbsp; be&nbsp; the&nbsp; most&nbsp; exhilarating&nbsp; thing&nbsp; you&nbsp; do&nbsp; this&nbsp; year,&nbsp; but&nbsp; also&nbsp; one&nbsp; of&nbsp; the&nbsp; safest&nbsp; and&nbsp; most&nbsp; highly&nbsp; regulated.&nbsp; We&rsquo;re&nbsp; also&nbsp; Qualmark&nbsp; endorsed&nbsp; so&nbsp; you&nbsp; can&nbsp; trust&nbsp; in&nbsp; our&nbsp; entire&nbsp; operation&nbsp; from&nbsp; the&nbsp; airplane&nbsp; right&nbsp; down&nbsp; to&nbsp; the&nbsp; goggles!&nbsp;&nbsp;</p>\r\n\r\n<p>Our&nbsp; friendly&nbsp; ground&nbsp; staff&nbsp; will&nbsp; look&nbsp; after&nbsp; you&nbsp; before&nbsp; and&nbsp; after&nbsp; your&nbsp; jump,&nbsp; they&nbsp; will&nbsp; get&nbsp; you&nbsp; geared&nbsp; up&nbsp; and&nbsp; ready&nbsp; to&nbsp; go&nbsp; for&nbsp; your&nbsp; skydive,&nbsp; and&nbsp; they&rsquo;ll&nbsp; be&nbsp; there&nbsp; to&nbsp; help&nbsp; you&nbsp; take&nbsp; it&nbsp; all&nbsp; in&nbsp; when&nbsp; your&nbsp; feet&nbsp; finally&nbsp; touch&nbsp; down&nbsp; again.</p>\r\n\r\n<hr />','col-xs-12',0,1,563),('<p>Don&rsquo;t&nbsp; forget&nbsp; to&nbsp; capture&nbsp; the&nbsp; moment&nbsp; with&nbsp; one&nbsp; of&nbsp; our&nbsp; awesome camera&nbsp; packages.&nbsp; With&nbsp; our&nbsp; Platinum&nbsp; package&nbsp; not&nbsp; a&nbsp; single&nbsp; second&nbsp; is&nbsp; missed&nbsp; and&nbsp; you&rsquo;re&nbsp; provided&nbsp; with&nbsp; video&nbsp; and&nbsp; picture&nbsp; footage&nbsp; to&nbsp; make&nbsp; you&nbsp; the&nbsp; envy&nbsp; of&nbsp; your&nbsp; friends.&nbsp;</p>\r\n\r\n<p>So&nbsp; what&nbsp; are&nbsp; you&nbsp; waiting&nbsp; for?!&nbsp; Tandem&nbsp; skydive&nbsp; with&nbsp; the&nbsp; best:&nbsp; the&nbsp; best&nbsp; islands&nbsp; views,&nbsp; the&nbsp; best&nbsp; location,&nbsp; and&nbsp; the&nbsp; best&nbsp; crew&nbsp; and&nbsp; instructors.&nbsp;</p>\r\n\r\n<h4>&nbsp;</h4>\r\n\r\n<h4>Come&nbsp; fly&nbsp; with&nbsp; the&nbsp; crew&nbsp; at&nbsp; Skydive&nbsp; Bay&nbsp; of&nbsp; Islands.&nbsp;</h4>','col-xs-12',0,1,564);
/*!40000 ALTER TABLE `content_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_row`
--

DROP TABLE IF EXISTS `content_row`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_row` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL,
  `page_meta_data_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_meta_data_id` (`page_meta_data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=565 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_row`
--

LOCK TABLES `content_row` WRITE;
/*!40000 ALTER TABLE `content_row` DISABLE KEYS */;
INSERT INTO `content_row` VALUES (2,1,23),(34,1,54),(35,2,54),(36,3,54),(37,4,54),(119,1,8),(123,1,7),(414,1,32),(415,2,32),(416,5,32),(417,6,32),(418,6,32),(456,1,27),(465,1,6),(526,2,1),(527,2,1),(535,1,72),(537,1,33),(538,2,33),(539,3,33),(540,3,34),(541,4,34),(542,4,34),(543,3,35),(544,4,35),(545,4,35),(546,1,55),(547,2,55),(548,3,55),(549,4,55),(550,1,56),(551,2,56),(552,3,56),(553,4,56),(554,5,56),(555,6,56),(556,1,67),(557,2,67),(558,2,3),(559,1,4),(560,1,2),(561,1,5),(562,2,5),(563,4,5),(564,5,5);
/*!40000 ALTER TABLE `content_row` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enquiry`
--

DROP TABLE IF EXISTS `enquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enquiry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `contact_number` varchar(100) DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `comments` text,
  `status` enum('A','H','D') NOT NULL DEFAULT 'H',
  `date_of_enquiry` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enquiry`
--

LOCK TABLES `enquiry` WRITE;
/*!40000 ALTER TABLE `enquiry` DISABLE KEYS */;
INSERT INTO `enquiry` VALUES (1,'Pinal','Desai','pinal.j.desai@gmail.com','0273988446','Inquiry for Huka Free Fall','THIS IS TEST','A','2018-03-27 02:13:05','127.0.0.1'),(2,'Test','Test','alan@tomahawk.co.nz','1234','Enquiry about Huka Free Fall combo','Tomahawk testing. Please ignore.','A','2018-04-03 21:28:36','114.23.241.67'),(3,'Bonnie','Kozeluh','bonniekozeluh@hotmail.com','','Enquiry about We  love  our  locals specials','This is a test','A','2018-05-09 08:23:35','121.99.106.57'),(4,'Courtney','Wymer','Courtney@tomahawk.co.nz','test','test','test','A','2018-05-10 04:17:12','114.23.241.67'),(5,'Courtney','Wymer','Courtney@tomahawk.co.nz','test','test','test','A','2018-05-10 04:28:02','114.23.241.67'),(6,'Courtney','Wymer','Courtney@tomahawk.co.nz','test','test','test','A','2018-05-10 04:32:23','114.23.241.67'),(7,'Tash','Nikora','tashnicholas45@gmail.com','0211166796','12000','Kia ora! \r\nIs there a weight restriction -too heavy or too light?\r\nThanks\r\nTash','A','2018-05-10 21:18:44','111.69.153.229'),(8,'Paula','Wheeler','pmwbat@gmail.com','5127014669','Enquiry about Kikorangi  Package combo','Hi there! My best friend is moving to NZ from US in a month. I&rsquo;d like to get her a gift card/credit of sorts with y&rsquo;all. How can I go about this? Thank you!','A','2018-05-12 01:46:15','208.191.154.160'),(9,'Kirsten','Polglase','kirstentucker.nz@gmail.com','0226469949','Enquiry about Birthday Upgrade specials','Hello,\r\n\r\nMy brother, Matthew is soon to be celebrating his 30th Birthday and myself and sibblings want to surprise him with a skydive, since he\'s the oldest sibling yet the only one who hasn\'t done a skydive!.\r\n  We currently live scattered throughout NZ and overseas but have planned a trip to Whangarei to get the family together again. His birthday falls mid week on a Wednesday so we are celebrating the weekend prior. Is he able to do the jump, using the free birthday upgrade on Saturday the 14th July even though his birthday is on the 18th? \r\n\r\nLook forward to hearing back. \r\nKirsten ????','A','2018-05-13 05:52:23','103.9.43.182'),(10,'Hayley','Ellis','hayleyellis230@gmail.com','(07) 8473305','Enquiry about Birthday Upgrade specials','Hello my name is Hayley Ellis. I have a friend and her dream is to skydive. I would love to take her for her birthday and would be nice if it was cheaper haha but Im just wondering is it possible to book a time but pay by cash on the day ? And are we able to bring our own gopro with us ?','A','2018-05-14 22:35:26','115.188.139.94'),(11,'hedi','hedi','hdayhdday@gmail.com','','1','Hello\r\nI would like to have informations about the cost to become professional skydiver\r\nThank You','A','2018-05-15 12:21:58','197.30.75.109'),(12,'Adele','Woodward','fundraising@hospicemn.org.nz','094077799','Sponsorship','Hi Andrew\r\nHospice Mid-Northland is currently seeking sponsorship for items to auction at our biggest fundraiser to date.\r\nWe are hoping that you would be willing to sponsor a parachute jump as part of a prize package we would like to auction off at the interval.\r\nOur goal is to raise $6000 from auctioning 10 items on the evening. The auction items we are seeking are for accommodation and then we will be pairing this with a restaurant and local activity vouchers.\r\n\r\nI am aware that we have a large number of people attending from out of town, so we felt it was ideal to promote our Mid-North area. This is also the area that Hospice services too.\r\n\r\nThe date of this event is 23rd June, could you please let me know as soon as possible if this is something you would sponsor.\r\n\r\nI would be happy to come and see you and go through this with you. I have a sponsorship marketing proposal which would promote your business at the event and on an ongoing way through our Kerikeri Hospice Shop.','A','2018-05-23 22:46:06','43.243.61.202'),(13,'Emma','Cathro','emmaerc@gmail.com','02108139572','GrabOne Booking Error','Hi, \r\n\r\nI just purchased the 12,000 ft GrabOne &amp; would like to book my jump for July 7th at 2pm. I try to enter the code as stated &quot;GrabOne 535704732&quot; but I keep getting an error. Please let me know the best way to book this.\r\n\r\nThank you,\r\nEmma','A','2018-05-29 08:34:33','163.47.230.251');
/*!40000 ALTER TABLE `enquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL,
  `answer` text,
  `status` enum('A','D','H') DEFAULT 'H',
  `rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` VALUES (1,'Do  I  need  to  check  the  weather  before  my  skydive?','Skydiving  is  a  weather  dependent  activity.  On  the  day  of  your  skydive,  call  us  on  0800  GOJUMP  (0800  465867)  a  half  hour  before  your  reservation  time  to  reconfirm  your  booking.','A',1),(2,'How  long  will  my  skydive  take?','It  typically  takes  1.5  hours  to  complete  your  skydive,  but  please  allow  3  hours  just  in  case.  We  need  to  allow  for  changes  in  the  weather  and  because  we  are  an  aviation  business,  unexpected  operational  requirements  can  pop  up  from  time  to  time.','A',2),(3,'What  is  the  weight  limit?','There  is  a  100kg  weight  limit.','A',4),(4,'How  do  I  get  to  the  skydive  center?','Find  us  at  182  Wiroa  Road,  Kerikeri.  We  provide  free  local  pickups  from  around  the  Bay  of  Islands.    We  also  have  plenty  of parking  available.  Call  us  to  discuss  your  options.','A',3),(5,'Test','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam euismod massa id est elementum molestie. In id pellentesque sem, vitae eleifend velit. Praesent ac justo sagittis libero facilisis tincidunt. Morbi porta est ac auctor viverra. Fusce pharetra consectetur consectetur. Duis efficitur imperdiet est, eget dignissim magna congue quis. Curabitur sit amet ligula eget massa faucibus fringilla. Aliquam erat volutpat. Duis vel risus tristique, faucibus mi a, pulvinar odio. Etiam pharetra, nibh nec laoreet semper, orci nibh lacinia est, a iaculis metus quam ut leo. Maecenas vel ex condimentum, ultricies orci non, tincidunt leo. Suspendisse sit amet massa massa. Aliquam at ipsum nec diam ultricies consectetur in et tellus. Sed diam orci, finibus lobortis condimentum a, imperdiet at lectus. Nunc eu nisl vel ligula porta imperdiet. Donec sit amet pharetra nibh, et tempus purus.','D',10),(6,'Can  I  rent  skydiving  sports  gear?','We  have  very  limited  gear  available.  Please  check  with  us  before  arriving  at  the  drop  zone.','A',NULL),(7,'Can  I  sports  jump  at  Skydive  Bay  of  Islands?','Skydive  Bay  of  Islands  welcomes  sports  skydivers.','A',NULL),(8,'Can  I  learn  to  skydive?','Yes!  We  offer  a  comprehensive  Accelerated  Free  Fall  (AFF)  course.','A',NULL),(9,'Can  I  skydive  by  myself?','You  can‚Äôt  skydive  by  yourself  on  your  first  jump.  But  if  you‚Äôre  interested  in  skydiving  as  a  sport  we  offer  a  comprehensive  Accelerated  Free  Fall  (AFF)  course.','A',NULL),(10,'What  camera  options  have  you  got?','We  have  three  camera  options.  We  offer  free  fall  and  selfie  video  and  photos.  Everything  is  shot  in  HD  and  supplied  on  free  USBs.    Check  out  our Photo and Videos page  for  more  information.','A',NULL),(11,'Can  I  take  my  own  camera?','You  can  take  as  much  footage  as  you  like  on  the  ground  but  there  are  strict  rules  on  taking  extra  equipment  in  the  plane.  So  unfortunately  not,  sorry!  Our  own  camera  flyers  do  a  minimum  of  200  jumps  before  they  begin  training  for  camera,  and  since  we  are  working  with  lines  and  parachutes  there  are  too  many  safety  issues  with  bringing  your  GoPro  along.  We‚Äôll  take  some  amazing  footage  for  you  though!','A',NULL),(12,'Can  my  family/friends/significant  other  come  and  watch?','Definitely!  Spectators  are  very  welcome  and  can  watch  you  getting  geared  up  and  landing.','A',NULL),(13,'How  long  does  it  take  to  skydive  from  16,000  feet?','Our  16,000ft  skydive  is  approximately  70  seconds  of  freefall  and  a  five  minute  parachute  ride.','A',NULL),(14,'How  long  does  it  take  to  skydive  from  12,000  feet?','Our  12,000ft  skydive  is  approximately  45  seconds  of  freefall  and  a  five  minute  parachute  ride.','A',NULL),(15,'How  long  does  it  take  to  skydive  from  9,000  feet?','Our  9,000ft  skydive  is  approximately  20  seconds  of  freefall  and  a  five  minute  parachute  ride.','A',NULL),(16,'How  long  is  freefall  in  a  skydive?','Your  freefall  is  anywhere  from  30  seconds  to  70  seconds  depending  on  the  height  you  jump  from.','A',NULL),(17,'Do  I  need  to  choose  my  height  and  camera  now?','There  is  no  need  to  make  a  final  decision  on  your  packages  until  you  arrive  at  the  drop  zone  and  have  seen  everything  that  is  available!','A',NULL),(18,'What  is  the  age  limit?','There  is  no  age  limit  to  experience  a  skydive,  however  passengers  under  18  years  of  age  require  signed  consent  from  their  parent  or  guardian.  All  passengers  must  securely  fit  in  the  harness.','A',NULL),(19,'What  should  I  wear  for  my  jump?','Dress  warmly  (especially  in  winter)  and  wear  closed-toe  footwear.','A',NULL),(20,'Can  you  skydive  in  the  rain?','Skydiving  is  a  weather  dependent  activity.  On  the  day  of  your  skydive,  call  us  on  0800  GO JUMP  (0800  465867)  a  half  hour  before  your  reservation  time  to  reconfirm  your  booking','A',NULL),(21,'What  if  I  have  a  pre-existing  medical  condition?','If  you  have  any  pre-existing  medical  conditions  that  may  affect  your  ability  to  skydive,  please  seek  professional  medical  advice  prior  to  jumping!','A',NULL),(22,'What  equipment  do  I  need  to  being  for  my  tandem  skydive?','You  don‚Äôt  need  to  bring  any  equipment.  All  your  tandem  skydiving  gear  will  be  provided  for  you','A',NULL),(23,'When  is  the  best  time  to  skydive  in  New  Zealand?','Any  time  is  a  good  time  to  skydive  in  New  Zealand.  The  Bay  of  Islands  is  situated  in  \"The  Winterless  North\"  and  is  the  warmest  and  sunniest  drop  zone  in  New  Zealand.  You‚Äôll  still  need  warm  clothing  if  you‚Äôre  jumping  in  the  winter  months  however.','A',NULL),(24,'Can  you  skydive  with  epilepsy?','If  you  have  any  pre-existing  medical  conditions  that  may  affect  your  ability  to  skydive,  please  seek  professional  medical  advice  prior  to  jumping!','A',NULL),(25,'Can  you  skydive  while  pregnant?','No  sorry  but  you  cannot  skydive  while  pregnant.','A',NULL),(26,'Can  you  skydive  with  a  cold','It  is  not  recommended  that  you  skydive  with  a  cold.  But  we  are  not  doctors.  Please  seek  medical  advice.','A',NULL),(27,'Can  you  skydive  with  a  heart  condition?','If  you  have  any  pre-existing  medical  conditions  that  may  affect  your  ability  to  skydive,  please  seek  professional  medical  advice  prior  to  jumping.','A',NULL),(28,'Untitled',NULL,'H',NULL);
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_importantpages`
--

DROP TABLE IF EXISTS `general_importantpages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `general_importantpages` (
  `imppage_id` int(11) NOT NULL AUTO_INCREMENT,
  `imppage_name` varchar(150) NOT NULL,
  `page_id` int(11) NOT NULL,
  `imppage_showincms` enum('N','Y') NOT NULL DEFAULT 'Y',
  `is_mobile` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`imppage_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_importantpages`
--

LOCK TABLES `general_importantpages` WRITE;
/*!40000 ALTER TABLE `general_importantpages` DISABLE KEYS */;
INSERT INTO `general_importantpages` VALUES (1,'Home',1,'N',0),(2,'Contact',6,'Y',0),(3,'Blog',9,'Y',0),(4,'Reviews',10,'Y',0),(5,'Gallery',21,'Y',0),(6,'404',11,'Y',0),(7,'Specials',12,'Y',0),(8,'Combo Deals',3,'Y',0),(9,'Pricing',4,'Y',0),(10,'Chinese Page',18,'Y',0),(11,'Korean Page',19,'Y',0),(12,'Japanese Page',20,'Y',0);
/*!40000 ALTER TABLE `general_importantpages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_pages`
--

DROP TABLE IF EXISTS `general_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `general_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for pages',
  `access_level` enum('P','L') NOT NULL DEFAULT 'P' COMMENT 'P = Public, L = Private',
  `meta_cache` tinyint(1) NOT NULL DEFAULT '1',
  `slideshow_type` enum('C','D') NOT NULL DEFAULT 'D',
  `is_category` enum('Y','N') NOT NULL DEFAULT 'N',
  `parent_id` int(11) DEFAULT '0',
  `template_id` int(11) DEFAULT NULL,
  `page_meta_data_id` int(11) NOT NULL,
  `show_on_pages` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`),
  KEY `page_parent` (`parent_id`),
  KEY `page_meta_data_id` (`page_meta_data_id`),
  KEY `template_id` (`template_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_pages`
--

LOCK TABLES `general_pages` WRITE;
/*!40000 ALTER TABLE `general_pages` DISABLE KEYS */;
INSERT INTO `general_pages` VALUES (1,'P',1,'D','N',0,1,1,'Y'),(2,'P',1,'D','N',0,1,2,'Y'),(3,'P',1,'D','N',0,1,3,'Y'),(4,'P',1,'D','N',0,1,4,'Y'),(5,'P',1,'D','N',0,1,5,'Y'),(6,'P',1,'D','N',0,1,6,'Y'),(7,'P',1,'D','N',0,1,7,'Y'),(8,'P',1,'D','N',0,1,8,'Y'),(9,'P',1,'D','N',5,1,21,'Y'),(10,'P',1,'D','N',0,1,22,'Y'),(11,'P',1,'D','N',0,1,23,'Y'),(12,'P',1,'D','N',0,1,27,'Y'),(13,'P',1,'D','N',2,1,29,'Y'),(14,'P',1,'D','N',5,1,32,'Y'),(15,'P',1,'D','Y',2,1,33,'Y'),(16,'P',1,'D','Y',2,1,34,'Y'),(17,'P',1,'D','Y',2,1,35,'Y'),(18,'P',1,'D','N',0,1,42,'Y'),(19,'P',1,'D','N',0,1,43,'Y'),(20,'P',1,'D','N',0,1,44,'Y'),(21,'P',1,'D','N',5,1,45,'Y'),(22,'P',1,'D','Y',5,1,54,'Y'),(23,'P',1,'D','N',2,1,55,'Y'),(24,'P',1,'D','N',2,1,56,'Y'),(25,'P',1,'D','N',2,1,67,'Y'),(26,'P',1,'D','N',5,1,72,'Y');
/*!40000 ALTER TABLE `general_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_settings`
--

DROP TABLE IF EXISTS `general_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `general_settings` (
  `id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL COMMENT 'Company/Business/Website name	',
  `start_year` int(4) DEFAULT NULL,
  `email_address` text COMMENT 'Email Address',
  `phone_number` varchar(100) DEFAULT NULL,
  `free_phone_number` varchar(50) CHARACTER SET utf8 NOT NULL,
  `address` text,
  `second_address` text,
  `booking_url` varchar(255) DEFAULT NULL,
  `gift_voucher_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `js_code_head_close` text,
  `js_code_body_open` text,
  `js_code_body_close` text,
  `adwords_code` text,
  `mailchimp_api_key` varchar(100) DEFAULT NULL,
  `mailchimp_list_id` varchar(50) DEFAULT NULL,
  `map_latitude` float(10,6) DEFAULT NULL,
  `map_longitude` float(10,6) DEFAULT NULL,
  `map_address` text,
  `map_styles` longtext,
  `map_heading` varchar(255) DEFAULT NULL,
  `map_description` text,
  `map_zoom_level` smallint(6) NOT NULL,
  `map_marker_latitude` float(10,6) NOT NULL,
  `map_marker_longitude` float(10,6) NOT NULL,
  `slideshow_speed` int(11) DEFAULT '3000',
  `set_sitemapupdated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `set_sitemapstatus` char(1) DEFAULT NULL,
  `homepage_slideshow_caption` varchar(255) DEFAULT NULL,
  `tripadvisor_widget_code` text,
  `youtube_id` varchar(20) DEFAULT NULL,
  `homepage_caption` varchar(225) DEFAULT NULL,
  `instagram_username` varchar(100) DEFAULT NULL,
  `instagram_client_id` varchar(100) DEFAULT NULL,
  `instagram_access_token` varchar(100) DEFAULT NULL,
  `booking_terms_and_conditions` text CHARACTER SET utf8 NOT NULL,
  `plantrip_description` text,
  `review_background` text,
  `home_photo` varchar(255) DEFAULT NULL,
  `skydive_combo_title` varchar(255) DEFAULT NULL,
  `skydive_combo_description` varchar(255) DEFAULT NULL,
  `pricing_section_title` varchar(255) DEFAULT NULL,
  `pricing_section_description` text,
  `footer_explore_photo` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `footer_explore_caption` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `footer_explore_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `mobile_heroshot` text,
  `bg_skydive` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `bg_reviews` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `bg_activity` varchar(255) DEFAULT NULL,
  `activity_section_title` varchar(255) DEFAULT NULL,
  `activity_section_description` varchar(255) DEFAULT NULL,
  `home_secondary_video` varchar(45) DEFAULT NULL,
  `home_secondary_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_settings`
--

LOCK TABLES `general_settings` WRITE;
/*!40000 ALTER TABLE `general_settings` DISABLE KEYS */;
INSERT INTO `general_settings` VALUES (1,'Skydive Bay of Islands',2017,'jump@skydivebayofislands.com','0800 46 58 67','0800 10 10 24','Bay of Islands Airport\r\n182 Wiroa Road\r\nKerikeri 0293, New Zealand','Maritime Building (Paihia ‚Äì Bay of Islands)\r\nMarsden Road\r\nPaihia 2020, New Zealand','https://gojumpbayofislands.rezdy.com/','https://gojumpbayofislands.rezdy.com/','<script> (function(i,s,o,g,r,a,m){i[\'GoogleAnalyticsObject\']=r;i[r]=i[r]||function(){ (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o), m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m) })(window,document,\'script\',\'https://www.google-analytics.com/analytics.js\',\'ga\'); ga(\'create\', \'UA-45802431-1\', \'auto\'); ga(\'send\', \'pageview\');</script><!-- Facebook Pixel Code -->\r\n<script>\r\n  !function(f,b,e,v,n,t,s)\r\n  {if(f.fbq)return;n=f.fbq=function(){n.callMethod?\r\n  n.callMethod.apply(n,arguments):n.queue.push(arguments)};\r\n  if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version=\'2.0\';\r\n  n.queue=[];t=b.createElement(e);t.async=!0;\r\n  t.src=v;s=b.getElementsByTagName(e)[0];\r\n  s.parentNode.insertBefore(t,s)}(window, document,\'script\',\r\n  \'https://connect.facebook.net/en_US/fbevents.js\');\r\n  fbq(\'init\', \'269503066890753\');\r\n  fbq(\'track\', \'PageView\');\r\n</script>\r\n<noscript><img height=\"1\" width=\"1\" style=\"display:none\"\r\n  src=\"https://www.facebook.com/tr?id=269503066890753&ev=PageView&noscript=1\"\r\n/></noscript>\r\n<!-- End Facebook Pixel Code -->','','','','','',-35.262249,173.916122,'182 Wiroa Rd, Kerikeri 0293, New Zealand','[{\"featureType\":\"administrative\",\"elementType\":\"geometry\",\"stylers\":[{\"color\":\"#a7a7a7\"}]},{\"featureType\":\"administrative\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"visibility\":\"on\"},{\"color\":\"#737373\"}]},{\"featureType\":\"landscape\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"visibility\":\"on\"},{\"color\":\"#efefef\"}]},{\"featureType\":\"poi\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"visibility\":\"on\"},{\"color\":\"#dadada\"}]},{\"featureType\":\"poi\",\"elementType\":\"labels\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"poi\",\"elementType\":\"labels.icon\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"road\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#696969\"}]},{\"featureType\":\"road\",\"elementType\":\"labels.icon\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#ffffff\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"visibility\":\"on\"},{\"color\":\"#b3b3b3\"}]},{\"featureType\":\"road.arterial\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#ffffff\"}]},{\"featureType\":\"road.arterial\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"color\":\"#d6d6d6\"}]},{\"featureType\":\"road.local\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"visibility\":\"on\"},{\"color\":\"#ffffff\"},{\"weight\":1.8}]},{\"featureType\":\"road.local\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"color\":\"#d7d7d7\"}]},{\"featureType\":\"transit\",\"elementType\":\"all\",\"stylers\":[{\"color\":\"#808080\"},{\"visibility\":\"off\"}]},{\"featureType\":\"water\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#d3d3d3\"}]}]','Skydive Bay of Islands','',14,-35.262249,173.916122,3000,'2018-05-10 21:16:46','I','','','','','skydiveboi','1f4c738cd9c5409e89f007853d03128e','1911733576.1f4c738.a93bcc5a82834cf1b9ebe0025f34ef1a','','Lorem ipsum dolor sit amet, consectetur adipiscing elt, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad','/library/bg1.jpg','','Skydive Combos & Deals','So you\'re ready to throw youself out of a perfectly good plane but want to make it a little extra? Read on!','','Skydiving at its BEST from 9,000 to 16,000 feet with Skydive Bay of Islands!','/library/photos/sboi-30.jpg','Stop in at Taupo Tandem Skydiving!','http://www.taupotandemskydiving.com',NULL,'/library/taupobungy/bg1.jpg','/library/photos/sboi-18.jpg','/library/taupobungy/bg1.jpg','','','WuXthgjhKjc','/library/photos/011518-1.jpg');
/*!40000 ALTER TABLE `general_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_pages`
--

DROP TABLE IF EXISTS `module_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_pages` (
  `modpages_id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `modpages_rank` int(4) DEFAULT NULL,
  `mod_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`modpages_id`)
) ENGINE=MyISAM AUTO_INCREMENT=372 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_pages`
--

LOCK TABLES `module_pages` WRITE;
/*!40000 ALTER TABLE `module_pages` DISABLE KEYS */;
INSERT INTO `module_pages` VALUES (367,3,1,10),(356,1,4,10),(355,1,2,15),(288,12,1,10),(91,9,1,9),(300,6,1,2),(365,13,1,6),(287,12,2,13),(251,14,2,5),(354,1,5,4),(369,2,2,15),(368,4,2,15),(366,3,2,13),(361,16,2,7),(360,15,2,10),(359,15,1,13),(63,22,1,7),(90,21,1,8),(363,17,2,10),(362,17,1,7),(364,23,1,15),(371,5,2,10),(370,5,3,15),(358,15,1,7),(330,19,1,15),(329,18,1,15),(331,20,1,15);
/*!40000 ALTER TABLE `module_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_templates`
--

DROP TABLE IF EXISTS `module_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_templates` (
  `tmplmod_id` int(11) NOT NULL AUTO_INCREMENT,
  `tmpl_id` int(11) NOT NULL,
  `mod_id` int(11) NOT NULL,
  `tmplmod_rank` int(11) NOT NULL,
  PRIMARY KEY (`tmplmod_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_templates`
--

LOCK TABLES `module_templates` WRITE;
/*!40000 ALTER TABLE `module_templates` DISABLE KEYS */;
INSERT INTO `module_templates` VALUES (1,1,1,15),(3,1,8,3),(4,1,14,14),(5,1,3,13);
/*!40000 ALTER TABLE `module_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules` (
  `mod_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for include',
  `mod_name` varchar(255) DEFAULT NULL COMMENT 'Include name',
  `mod_path` varchar(255) DEFAULT NULL COMMENT 'Include URL/file path (exclude the extension)',
  `mod_showincms` enum('N','Y') NOT NULL DEFAULT 'Y',
  `mod_mobile` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`mod_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'Slideshow','slideshow','N',NULL),(2,'Contact','contact','Y',NULL),(3,'Quicklinks','quicklinks','N',NULL),(5,'Google Map','map','Y',NULL),(8,'Gallery','gallery','Y',NULL),(9,'Blog','blog','Y',NULL),(10,'Specials','specials','Y',NULL),(11,'Content','content','N',NULL),(12,'Booking','booking','N',NULL),(13,'Combos','combos','Y',NULL),(14,'Testimonial','testimonial','N',NULL),(7,'Activities','activities','Y',NULL),(6,'FAQs','faqs','Y',NULL),(4,'Instagram','instagram','Y',NULL),(15,'Pricing','pricing','Y',NULL);
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_has_quicklink`
--

DROP TABLE IF EXISTS `page_has_quicklink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_has_quicklink` (
  `page_id` int(11) NOT NULL,
  `quicklink_page_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_has_quicklink`
--

LOCK TABLES `page_has_quicklink` WRITE;
/*!40000 ALTER TABLE `page_has_quicklink` DISABLE KEYS */;
INSERT INTO `page_has_quicklink` VALUES (49,2),(49,3),(49,4),(50,2),(50,3),(50,4),(54,2),(54,3),(54,4),(30,2),(30,4),(69,3),(28,3),(27,3),(2,3),(2,4),(2,5),(5,2),(5,4);
/*!40000 ALTER TABLE `page_has_quicklink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_has_review`
--

DROP TABLE IF EXISTS `page_has_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_has_review` (
  `page_id` int(11) NOT NULL,
  `review_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_has_review`
--

LOCK TABLES `page_has_review` WRITE;
/*!40000 ALTER TABLE `page_has_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_has_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_has_special`
--

DROP TABLE IF EXISTS `page_has_special`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_has_special` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `special_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_has_special`
--

LOCK TABLES `page_has_special` WRITE;
/*!40000 ALTER TABLE `page_has_special` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_has_special` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_meta_data`
--

DROP TABLE IF EXISTS `page_meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_meta_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `menu_label` varchar(255) DEFAULT NULL,
  `footer_menu` varchar(255) DEFAULT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `sub_heading` varchar(255) DEFAULT NULL,
  `quicklink_heading` varchar(255) DEFAULT NULL,
  `quicklink_menu_label` varchar(255) DEFAULT NULL,
  `quicklink_photo` varchar(255) CHARACTER SET utf8 NOT NULL,
  `quicklink_thumb_photo` varchar(255) CHARACTER SET utf8 NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `full_url` varchar(255) DEFAULT NULL,
  `introduction` text,
  `short_description` varchar(255) DEFAULT NULL,
  `description` text,
  `photo` varchar(255) DEFAULT NULL,
  `thumb_photo` varchar(255) DEFAULT NULL,
  `photo_caption_heading` varchar(255) CHARACTER SET utf8 NOT NULL,
  `photo_caption` varchar(255) CHARACTER SET utf8 NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `meta_description` text,
  `og_title` varchar(255) DEFAULT NULL,
  `og_meta_description` text,
  `og_image` varchar(255) DEFAULT NULL,
  `time_based_publishing` enum('N','Y') NOT NULL DEFAULT 'N',
  `publish_on` datetime DEFAULT NULL,
  `hide_on` datetime DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('A','H','D') DEFAULT 'H',
  `rank` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `gallery_id` int(11) DEFAULT NULL,
  `slideshow_id` int(11) DEFAULT NULL,
  `jump_gallery_id` int(11) DEFAULT NULL,
  `is_top_position` enum('Y','N') NOT NULL DEFAULT 'N',
  `icon` varchar(255) DEFAULT NULL,
  `page_meta_index_id` int(11) DEFAULT '1',
  `page_youtube_id` varchar(255) DEFAULT NULL,
  `booking_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bsh_query_1` (`status`,`menu_label`,`heading`,`title`,`sub_heading`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_meta_data`
--

LOCK TABLES `page_meta_data` WRITE;
/*!40000 ALTER TABLE `page_meta_data` DISABLE KEYS */;
INSERT INTO `page_meta_data` VALUES (1,'Home','','','New  Zealand‚Äôs  number  one  destination  for  skydiving  at  the  beach','','','','','','home','/','Blue  skies,  blue  waters,  golden  sands  and  sunshine  is  what  we‚Äôre  all  about.','',NULL,'','','','','Home | Skydive Bay of Islands','','','','','N',NULL,NULL,1,'A',1,'2016-03-17 11:10:30','2018-05-17 04:15:19',NULL,1,9,0,1,0,'N','',1,'',''),(2,'Skydive','Skydive','','Jump with us - Skydive Bay of Islands','','Skydive','','','','skydive','/skydive','','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sollicitudin lectus sed diam ultricies, vitae sodales nibh consequat. Quisque vel quam rhoncus, ultrices justo vitae, congue orci.',NULL,'/library/photos/011518-9.jpg','/uploads/2018/05/img-5b0d0db3b31f0.jpg','','','Jump with Us | Skydive Bay of Islands','','','','','N',NULL,NULL,0,'A',2,'2018-03-20 20:40:34','2018-05-29 08:22:11',NULL,1,9,0,0,0,'N','',1,'',''),(3,'Combos & Deals','Combos & Deals','','Combos & Deals','','Combos & Deals','Explore','/library/photos/sboi-13.jpg','/uploads/2018/05/img-5b0d0d939137a.jpg','combos-and-deals','/combos-and-deals','','',NULL,'','','','','Combos & Deals | Skydive Bay of Islands','','','','','N',NULL,NULL,0,'A',3,'2018-03-20 20:40:52','2018-05-29 08:21:39',NULL,1,9,3,0,0,'N','',1,'',''),(4,'Prices','Prices','','Explore NZ\'s Best Skydive Packages!','','Prices','Explore','','','prices','/prices','','',NULL,'/library/photos/021518-1.jpg','/uploads/2018/05/img-5b0d0d9d41d45.jpg','','','Our Prices | Skydive Bay of Islands','','','','','N',NULL,NULL,0,'A',4,'2018-03-20 20:43:23','2018-05-29 08:21:49',NULL,1,9,0,0,0,'N','',1,'',''),(5,'About','About','','Welcome  to  Skydive  Bay  of  Islands','','About us','Explore','','','about','/about','New  Zealand‚Äôs  number  one  destination  for  skydiving  at  the  beach.\r\nBlue skies, blue waters, golden sands and sunshine is what we‚Äôre all about.','',NULL,'','','','','About Us | Skydive Bay of Islands','','','','','N',NULL,NULL,0,'A',5,'2018-03-20 20:43:33','2018-05-29 08:22:26',NULL,1,9,0,0,0,'N','',1,'',''),(6,'Contact','Contact','Contact','Contact','','','','','','contact','/contact','Our friendly ground staff would love to hear from you','',NULL,'','','','','Contact Us | Skydive Bay of Islands','','','','','N',NULL,NULL,0,'A',6,'2018-03-20 20:43:44','2018-05-04 05:50:37',NULL,1,9,0,0,0,'N','',1,'',''),(7,'Terms & Conditions','','Terms & Conditions','Terms & Conditions','','','','','','terms-conditions','/terms-conditions','','',NULL,'','','','','Terms & Conditions | Skydive Bay of Islands','','','','','N',NULL,NULL,0,'A',7,'2018-03-20 22:14:35','2018-04-24 03:58:25',NULL,1,1,0,0,0,'N','',1,'',''),(8,'Privacy Policy','','Privacy Policy','Privacy Policy','','','','','','privacy-policy','/privacy-policy','','',NULL,'','','','','Privacy Policy | Skydive Bay of Islands','','','','','N',NULL,NULL,0,'A',8,'2018-03-20 22:15:04','2018-04-24 03:49:07',NULL,1,1,0,0,0,'N','',1,'',''),(9,'Category 1','Category 1',NULL,'Category 1',NULL,NULL,NULL,'','','category-1','/category/category-1',NULL,NULL,NULL,'',NULL,'','','','','',NULL,'','N',NULL,NULL,0,'H',1,'2018-03-21 20:11:58','2018-03-21 20:12:17',NULL,1,1,NULL,NULL,NULL,'N',NULL,1,NULL,NULL),(10,'Category 2','Category 2',NULL,'Category 2',NULL,NULL,NULL,'','','category-2','/category/category-2',NULL,NULL,NULL,'',NULL,'','','','','',NULL,'','N',NULL,NULL,0,'H',2,'2018-03-21 20:12:19','2018-03-21 20:12:33',NULL,1,1,NULL,NULL,NULL,'N',NULL,1,NULL,NULL),(11,'Category 3','Category 3',NULL,'Category 3',NULL,NULL,NULL,'','','category-3','/category/category-3',NULL,NULL,NULL,'',NULL,'','','','','',NULL,'','N',NULL,NULL,0,'H',3,'2018-03-21 20:12:36','2018-03-21 20:12:47',NULL,1,1,NULL,NULL,NULL,'N',NULL,1,NULL,NULL),(12,'Category 4','Category 4',NULL,'Category 4',NULL,NULL,NULL,'','','category-4','/category/category-4',NULL,NULL,NULL,'',NULL,'','','','','',NULL,'','N',NULL,NULL,0,'H',4,'2018-03-21 20:12:50','2018-03-21 20:13:04',NULL,1,1,NULL,NULL,NULL,'N',NULL,1,NULL,NULL),(13,'Dare to Dive!',NULL,NULL,'Dare to Dive!',NULL,NULL,NULL,'','','2018-03-21-201325','/post/2018-03-21-201325',NULL,'Alzheimers Northland is offering a once in a lifetime experience to anyone brave enough to Dare to Dive!','<h3>In this unique experience participants receive a FREE tandem skydive when they raise over $600 for Alzheimers Northland.</h3>\r\n\r\n<p>The special Dare to Dive skydive day will be taking place on Saturday 21st July at Skydive Bay of Islands, Kerikeri. The day will see those bold enough take to the sky and do something amazing for the Northland charity in the special Skydive takeover day. Participants will experience 20 seconds of exhilarating freefall followed by a unique floating view of the Bay of Islands from the sky.<br />\r\n<br />\r\nHannah Hunter, fundraiser at Alzheimers Northland said, &ldquo;We are working closely with Skydive Bay of Islands who have given us a great discount so that we are able to give a skydive to anyone who raises $600 or more! Some participants may choose to cover the discounted cost of the jump themselves which will be even better - even more of the vital funds raised will come directly to Alzheimers Northland.&rdquo;<br />\r\n<br />\r\nEveryone who signs up will be given a fundraising pack with ideas, tips and hints of how to raise the funds and also details of how to collect sponsorship online. &ldquo;This is an opportunity for anyone who has always wanted to take the leap to sign up! The profits from this extraordinary event will go towards ensuring that we can fulfil our vision of supporting all families in Northland that are living with dementia. There are many ways to get involved with our skydive day&hellip; nominate a friend, support our participants fundraising efforts, organise an event to help raise funds, sign up a work team or a club team and do it together! Or we are keen to hear from companies who may sponsor the cost of a skydive.&rdquo; Said Hannah<br />\r\n<br />\r\nAlzheimers Northland helps families face their challenges and live without fear. We have over 600 active clients in Northland. By providing advice, support, respite and professional education we can help pave a positive journey for our families.</p>\r\n\r\n<p><strong>Anyone interested in this amazing event should get in touch with: </strong><br />\r\nHannah Hunter<br />\r\nPhone: 021 174 9760<br />\r\nEmail: <a href=\"mailto:hannah.hunter@alzheimers.org.nz\">hannah.hunter@alzheimers.org.nz</a></p>','/library/photos/blogeventcharity.jpg','/uploads/2018/05/img-5b089dd3c6ef8.jpg','','','Dare to Dive!','','Dare to Dive!',NULL,'','N',NULL,NULL,0,'A',NULL,'2018-03-21 20:13:25','2018-05-25 23:35:47',NULL,1,1,NULL,NULL,NULL,'N',NULL,1,NULL,NULL),(14,'Quisque consectetur nibh nec turpis',NULL,NULL,'Quisque consectetur nibh nec turpis',NULL,NULL,NULL,'','','2018-03-21-201429','/post/2018-03-21-201429',NULL,'Quisque consectetur nibh nec turpis condimentum tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus consequat, ligula eu dapibus convallis, odio ex rhoncus elit','<p>Quisque consectetur nibh nec turpis condimentum tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus consequat, ligula eu dapibus convallis, odio ex rhoncus elit, eget ullamcorper lacus dolor viverra libero. Sed commodo, felis et vehicula dignissim, nunc turpis auctor neque, nec fermentum felis nisi fermentum ligula. Proin tortor diam, aliquet quis varius at, tincidunt vitae ex. Quisque pretium, urna eget volutpat suscipit, tortor enim sagittis urna, non egestas ipsum ante eget turpis. Proin a orci faucibus, lacinia ligula cursus, accumsan nibh.</p>\r\n\r\n<p>Etiam porta vehicula mi nec tincidunt. Sed mattis mi a velit ultrices sollicitudin. Nam placerat mauris dolor, sed rutrum ex venenatis nec. Quisque sed neque arcu. Vivamus mollis volutpat malesuada. Morbi lacinia libero eget feugiat consequat. Aliquam id sollicitudin felis. Vivamus venenatis vitae ligula vitae consectetur. Nam eu mauris quis ante iaculis aliquet ac nec urna.</p>','/library/bungyandswing-pic.jpg','/uploads/2018/03/img-5ab2af4d0d212.jpg','','','','','',NULL,'','N',NULL,NULL,0,'D',NULL,'2018-03-21 20:14:29','2018-03-21 20:15:25','2018-05-04 06:30:50',1,1,NULL,NULL,NULL,'N',NULL,1,NULL,NULL),(15,'Etiam porta vehicula mi nec tincidunt',NULL,NULL,'Etiam porta vehicula mi nec tincidunt',NULL,NULL,NULL,'','','2018-03-21-201528','/post/2018-03-21-201528',NULL,'Etiam porta vehicula mi nec tincidunt. Sed mattis mi a velit ultrices sollicitudin. Nam placerat mauris dolor, sed rutrum ex venenatis nec. Quisque sed neque arcu. Vivamus mollis volutpat malesuada. Morbi lacinia libero eget feugiat consequat','<p>Etiam porta vehicula mi nec tincidunt. Sed mattis mi a velit ultrices sollicitudin. Nam placerat mauris dolor, sed rutrum ex venenatis nec. Quisque sed neque arcu. Vivamus mollis volutpat malesuada. Morbi lacinia libero eget feugiat consequat. Aliquam id sollicitudin felis. Vivamus venenatis vitae ligula vitae consectetur. Nam eu mauris quis ante iaculis aliquet ac nec urna.</p>\r\n\r\n<p>Curabitur diam leo, ornare quis enim vitae, cursus blandit risus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque dignissim diam accumsan, laoreet velit et, imperdiet arcu. Fusce mattis, elit vel scelerisque placerat, elit mauris volutpat nunc, et rhoncus erat arcu nec odio. Phasellus eget lectus vitae ipsum tincidunt accumsan tempor a orci. Nam scelerisque lectus a arcu tincidunt, ac luctus metus fermentum. Donec vestibulum neque id molestie molestie. Cras placerat magna ante, et finibus purus venenatis a. Morbi porttitor justo id quam consectetur fermentum. Ut sagittis id metus quis scelerisque. Quisque accumsan massa vitae justo facilisis, et varius metus condimentum. Cras auctor elit rutrum turpis malesuada dictum. Vivamus a nunc ut leo mollis congue id id ipsum.</p>','/library/flynraft_new-page-001.jpg','/uploads/2018/03/img-5ab2af8f9f852.jpg','','','','','',NULL,'','N',NULL,NULL,0,'D',NULL,'2018-03-21 20:15:28','2018-03-21 20:16:31','2018-05-04 06:30:50',1,1,NULL,NULL,NULL,'N',NULL,1,NULL,NULL),(16,'Ian Williams, 90 Years Old, Skydives To Prove Age Is Just A Number',NULL,NULL,'Ian Williams, 90 Years Old, Skydives To Prove Age Is Just A Number',NULL,NULL,NULL,'','','2018-03-21-201640','/post/2018-03-21-201640',NULL,'The lively and cantankerous 90 year old Ian Williams jumped with us recently ‚Äì proving once again, you‚Äôre never too old to indulge your inner adrenaline starved child.','<h5>The lively and cantankerous 90 year old Ian Williams jumped with us recently &ndash; proving once again, you&rsquo;re never too old to indulge your inner adrenalin starved child.</h5>\r\n\r\n<hr />\r\n<p><img alt=\"\" src=\"/library/photos/ian1.jpg\" />After a full briefing and gear up, Robyn, Ian, and their Instructors climbed aboard our plane, enjoyed a scenic flight over the bay of Islands, and mentally prepared for their individual jumps.</p>\r\n\r\n<p>Ian was first to go, securing himself in the Skydive Bay of Islands record books as their oldest passenger to date. Next up was Ian&rsquo;s 60 year old daughter Robyn, who admittedly squealed a little as she watched her father slip from the doorway and into the blue sky. Out the door and into a warm turquoise air surrounding the far north&hellip;</p>\r\n\r\n<hr />\r\n<p><img alt=\"\" src=\"/library/photos/ian3.jpg\" /></p>\r\n\r\n<p>Both Robyn and Ian enjoyed watching their video camera person flying around in front and coming in to say &lsquo;Hi&rsquo;.</p>\r\n\r\n<p>A few minutes under the parachute let them gather back up the full range of emotions and sensory overload that just occurred, and Robyn readily took control of the flying for a few minutes &ndash; enjoying the fast turns and spirals that even the younger generations find both exhilarating and scary.</p>\r\n\r\n<p>After their wild ride their instructors brought them back to the terra firma safely. Ian has been a fantastic example for anyone who assumes they&rsquo;re too old for skydiving!</p>\r\n\r\n<p>Age is just a number after all.</p>\r\n\r\n<hr />\r\n<p><img alt=\"\" src=\"/library/photos/ian2.jpg\" /></p>\r\n\r\n<hr />','/library/photos/ian1.jpg','/uploads/2018/05/img-5aebfe0d84ae2.jpg','','','Ian Williams, 90 Years Old, Skydives To Prove Age Is Just A Number','The lively and cantankerous 90 year old Ian Williams jumped with us recently ‚Äì proving once again, you‚Äôre never too old to indulge your inner adrenaline starved child.','Ian Williams, 90 Years Old, Skydives To Prove Age Is Just Number',NULL,'','N',NULL,NULL,0,'A',NULL,'2018-03-21 20:16:40','2018-05-04 06:30:37',NULL,1,1,NULL,NULL,NULL,'N',NULL,1,NULL,NULL),(17,'Duis faucibus commodo odio',NULL,NULL,'Duis faucibus commodo odio',NULL,NULL,NULL,'','','2018-03-21-201758','/post/2018-03-21-201758',NULL,'Duis faucibus commodo odio. Pellentesque ultrices ipsum convallis erat auctor, porta dictum eros dictum. Praesent et blandit odio, et ornare turpis. Proin vel lorem arcu. Sed nec efficitur magna.','<p>Curabitur diam leo, ornare quis enim vitae, cursus blandit risus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque dignissim diam accumsan, laoreet velit et, imperdiet arcu. Fusce mattis, elit vel scelerisque placerat, elit mauris volutpat nunc, et rhoncus erat arcu nec odio. Phasellus eget lectus vitae ipsum tincidunt accumsan tempor a orci. Nam scelerisque lectus a arcu tincidunt, ac luctus metus fermentum. Donec vestibulum neque id molestie molestie. Cras placerat magna ante, et finibus purus venenatis a. Morbi porttitor justo id quam consectetur fermentum. Ut sagittis id metus quis scelerisque. Quisque accumsan massa vitae justo facilisis, et varius metus condimentum. Cras auctor elit rutrum turpis malesuada dictum. Vivamus a nunc ut leo mollis congue id id ipsum.</p>\r\n\r\n<p>Duis faucibus commodo odio. Pellentesque ultrices ipsum convallis erat auctor, porta dictum eros dictum. Praesent et blandit odio, et ornare turpis. Proin vel lorem arcu. Sed nec efficitur magna. Suspendisse eget orci nec sapien lobortis euismod a id lorem. Maecenas condimentum accumsan felis, eu ultrices orci tristique sit amet. Donec eget nisl in justo fringilla accumsan. Cras id dui ut tortor feugiat porttitor id in justo. Aliquam a aliquet orci. Ut tincidunt, diam eget lacinia varius, purus purus viverra nunc, elementum efficitur dui odio ut velit. Ut in sapien sit amet mi commodo bibendum.</p>\r\n\r\n<p>Suspendisse potenti. Pellentesque vulputate pulvinar neque, ac viverra leo tempor in. Mauris sed tellus nec augue tempor imperdiet. Maecenas et bibendum est, ut tincidunt turpis. Phasellus faucibus nisi ex. Donec ultrices ex eu purus interdum eleifend. Vivamus suscipit mauris sed mi imperdiet tempor. Suspendisse at tincidunt orci. Aenean et justo egestas, pretium odio vitae, pharetra eros. Etiam ultrices ex sit amet elit pharetra, eu volutpat dui pulvinar. Donec vehicula ipsum quis enim porttitor egestas sit amet ut augue.</p>\r\n\r\n<p>Nunc vestibulum finibus vulputate. Nullam eget egestas dui, in maximus lectus. Vivamus maximus in mauris a aliquet. Sed ut tortor finibus nibh laoreet porttitor eu ut nulla. Sed ac fermentum augue. Donec rhoncus, tortor nec euismod congue, elit diam finibus nulla, ut lobortis velit nibh ut magna. Vestibulum sed eros est. Mauris lorem ex, ultricies nec orci sed, accumsan tempus eros. Sed porttitor leo semper ipsum consequat rutrum. Pellentesque ut ultrices turpis. Proin hendrerit rutrum pretium. Maecenas at iaculis dolor. Fusce ac nisi sed magna convallis suscipit. Maecenas rutrum rutrum mollis. Nulla dolor ipsum, porttitor eu lacus ac, elementum pharetra est. Suspendisse potenti.</p>','/library/taupobungy/couple.png','/uploads/2018/03/img-5ab2b00d36667.jpg','','','','','',NULL,'','N',NULL,NULL,0,'D',NULL,'2018-03-21 20:17:58','2018-03-21 20:18:37','2018-05-04 06:30:50',1,1,NULL,NULL,NULL,'N',NULL,1,NULL,NULL),(18,'Suspendisse potenti',NULL,NULL,'Suspendisse potenti',NULL,NULL,NULL,'','','2018-03-21-201841','/post/2018-03-21-201841',NULL,'Suspendisse potenti. Pellentesque vulputate pulvinar neque, ac viverra leo tempor in. Mauris sed tellus nec augue tempor imperdiet. Maecenas et bibendum est, ut tincidunt turpis.','<p>Suspendisse potenti. Pellentesque vulputate pulvinar neque, ac viverra leo tempor in. Mauris sed tellus nec augue tempor imperdiet. Maecenas et bibendum est, ut tincidunt turpis. Phasellus faucibus nisi ex. Donec ultrices ex eu purus interdum eleifend. Vivamus suscipit mauris sed mi imperdiet tempor. Suspendisse at tincidunt orci. Aenean et justo egestas, pretium odio vitae, pharetra eros. Etiam ultrices ex sit amet elit pharetra, eu volutpat dui pulvinar. Donec vehicula ipsum quis enim porttitor egestas sit amet ut augue.</p>\r\n\r\n<p>Nunc vestibulum finibus vulputate. Nullam eget egestas dui, in maximus lectus. Vivamus maximus in mauris a aliquet. Sed ut tortor finibus nibh laoreet porttitor eu ut nulla. Sed ac fermentum augue. Donec rhoncus, tortor nec euismod congue, elit diam finibus nulla, ut lobortis velit nibh ut magna. Vestibulum sed eros est. Mauris lorem ex, ultricies nec orci sed, accumsan tempus eros. Sed porttitor leo semper ipsum consequat rutrum. Pellentesque ut ultrices turpis. Proin hendrerit rutrum pretium. Maecenas at iaculis dolor. Fusce ac nisi sed magna convallis suscipit. Maecenas rutrum rutrum mollis. Nulla dolor ipsum, porttitor eu lacus ac, elementum pharetra est. Suspendisse potenti.</p>\r\n\r\n<p>Nunc varius venenatis molestie. Donec mattis cursus lacus, at fringilla urna viverra in. Nam auctor nunc vitae quam suscipit, nec malesuada metus bibendum. Suspendisse porttitor augue id nulla pretium feugiat. Fusce nibh massa, condimentum et hendrerit eu, lacinia quis nunc. Phasellus aliquam quis nunc ut placerat. Maecenas id ex nec sapien vulputate vulputate. Suspendisse sollicitudin elit augue, accumsan finibus augue tempus sed. Nullam in fringilla sem. Sed ut lacus sollicitudin, aliquet metus interdum, vulputate lectus. Pellentesque posuere, risus vitae mollis viverra, neque velit malesuada leo, a interdum lorem purus a ligula. Maecenas vitae lacinia neque, ut gravida augue. In hendrerit metus lectus. Cras commodo pharetra elementum.</p>','/library/bungy-combo/bungy-image-6.jpg','/uploads/2018/03/img-5ab2b04b14b3c.jpg','','','','','',NULL,'','N',NULL,NULL,0,'D',NULL,'2018-03-21 20:18:41','2018-03-21 20:19:39','2018-05-04 06:30:50',1,1,NULL,NULL,NULL,'N',NULL,1,NULL,NULL),(19,'Phasellus in orci luctus, tempus sem nec',NULL,NULL,'Phasellus in orci luctus, tempus sem nec',NULL,NULL,NULL,'','','2018-03-21-201956','/post/2018-03-21-201956',NULL,'Phasellus in orci luctus, tempus sem nec, vestibulum mauris. Suspendisse vitae nibh commodo, tincidunt sapien sodales, efficitur risus. Proin ut pellentesque ipsum. Praesent placerat rhoncus purus, id viverra justo porttitor quis.','<p>Nunc varius venenatis molestie. Donec mattis cursus lacus, at fringilla urna viverra in. Nam auctor nunc vitae quam suscipit, nec malesuada metus bibendum. Suspendisse porttitor augue id nulla pretium feugiat. Fusce nibh massa, condimentum et hendrerit eu, lacinia quis nunc. Phasellus aliquam quis nunc ut placerat. Maecenas id ex nec sapien vulputate vulputate. Suspendisse sollicitudin elit augue, accumsan finibus augue tempus sed. Nullam in fringilla sem. Sed ut lacus sollicitudin, aliquet metus interdum, vulputate lectus. Pellentesque posuere, risus vitae mollis viverra, neque velit malesuada leo, a interdum lorem purus a ligula. Maecenas vitae lacinia neque, ut gravida augue. In hendrerit metus lectus. Cras commodo pharetra elementum.</p>\r\n\r\n<p>Phasellus in orci luctus, tempus sem nec, vestibulum mauris. Suspendisse vitae nibh commodo, tincidunt sapien sodales, efficitur risus. Proin ut pellentesque ipsum. Praesent placerat rhoncus purus, id viverra justo porttitor quis. Nulla gravida arcu eu turpis consequat eleifend. Phasellus pulvinar tortor nibh, ut feugiat elit laoreet in. Fusce ipsum justo, aliquam sit amet ex eget, tincidunt placerat nulla.</p>\r\n\r\n<p>Nam vel hendrerit sem, ut sollicitudin metus. Nullam rhoncus odio non consectetur aliquet. Ut ultrices nisi non nisi gravida, quis egestas magna placerat. Aliquam eget turpis ac tortor commodo posuere. Nunc a sagittis risus. Mauris interdum turpis ipsum, at aliquam lorem ultrices eu. Ut vel purus pulvinar orci auctor hendrerit in non mauris. Maecenas viverra ipsum vitae velit finibus consequat. Maecenas ac dictum urna. Nunc pulvinar iaculis gravida. Etiam vitae neque a neque venenatis scelerisque.</p>\r\n\r\n<p>Mauris eu eros ut nulla rutrum congue. Nullam velit nulla, convallis at quam ac, vestibulum laoreet enim. Nam imperdiet placerat lorem, non fringilla nibh dignissim a. Sed at felis a arcu eleifend iaculis. Duis maximus tempor dolor at pharetra. Suspendisse vitae mauris varius, ultricies risus eget, placerat dolor. Fusce sed ultrices leo. Vivamus interdum lacus sed mauris sollicitudin posuere. Proin porta gravida sapien at dictum. Maecenas lobortis, augue non dapibus mollis, arcu nunc malesuada neque, tincidunt ultrices metus urna pulvinar risus. Nam ornare imperdiet mi. Vivamus est elit, euismod non dolor faucibus, vulputate gravida velit. Phasellus at leo a nisi mattis ornare. Curabitur eget vulputate leo, id pellentesque urna. Suspendisse nunc justo, mollis eget lorem quis, tincidunt ultricies urna. Vivamus hendrerit a eros in convallis.</p>','/library/combo-pics/tts1.jpg','/uploads/2018/03/img-5ab2b08dc97d3.jpg','','','','','',NULL,'','N',NULL,NULL,0,'D',NULL,'2018-03-21 20:19:56','2018-03-21 20:20:45','2018-05-04 06:30:50',1,1,NULL,NULL,NULL,'N',NULL,1,NULL,NULL),(20,'Nam vel hendrerit sem, ut sollicitudin metus',NULL,NULL,'Nam vel hendrerit sem, ut sollicitudin metus',NULL,NULL,NULL,'','','2018-03-21-202110','/post/2018-03-21-202110',NULL,'Nam vel hendrerit sem, ut sollicitudin metus. Nullam rhoncus odio non consectetur aliquet. Ut ultrices nisi non nisi gravida, quis egestas magna placerat. Aliquam eget turpis ac tortor commodo posuere.','<p>Nam vel hendrerit sem, ut sollicitudin metus. Nullam rhoncus odio non consectetur aliquet. Ut ultrices nisi non nisi gravida, quis egestas magna placerat. Aliquam eget turpis ac tortor commodo posuere. Nunc a sagittis risus. Mauris interdum turpis ipsum, at aliquam lorem ultrices eu. Ut vel purus pulvinar orci auctor hendrerit in non mauris. Maecenas viverra ipsum vitae velit finibus consequat. Maecenas ac dictum urna. Nunc pulvinar iaculis gravida. Etiam vitae neque a neque venenatis scelerisque.</p>\r\n\r\n<p>Mauris eu eros ut nulla rutrum congue. Nullam velit nulla, convallis at quam ac, vestibulum laoreet enim. Nam imperdiet placerat lorem, non fringilla nibh dignissim a. Sed at felis a arcu eleifend iaculis. Duis maximus tempor dolor at pharetra. Suspendisse vitae mauris varius, ultricies risus eget, placerat dolor. Fusce sed ultrices leo. Vivamus interdum lacus sed mauris sollicitudin posuere. Proin porta gravida sapien at dictum. Maecenas lobortis, augue non dapibus mollis, arcu nunc malesuada neque, tincidunt ultrices metus urna pulvinar risus. Nam ornare imperdiet mi. Vivamus est elit, euismod non dolor faucibus, vulputate gravida velit. Phasellus at leo a nisi mattis ornare. Curabitur eget vulputate leo, id pellentesque urna. Suspendisse nunc justo, mollis eget lorem quis, tincidunt ultricies urna. Vivamus hendrerit a eros in convallis.</p>\r\n\r\n<p>Vivamus pulvinar a eros in commodo. Aliquam fringilla semper justo ac maximus. Cras vulputate, diam at vehicula blandit, augue massa condimentum neque, et consectetur dolor ligula vel ante. Phasellus maximus aliquet purus, quis dictum justo imperdiet sit amet. Suspendisse rhoncus ipsum justo, ac euismod mi pellentesque ut. Integer fermentum, felis a ornare lacinia, massa magna facilisis ligula, sodales consectetur turpis sem quis ex. Praesent at tortor et ligula molestie dignissim. Maecenas interdum massa ligula, ac sollicitudin ligula auctor ut. Integer blandit dolor ut nisl tincidunt convallis non nec lacus. Praesent luctus suscipit erat at sollicitudin. Nunc in euismod nibh. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse sit amet enim quam. Nam maximus finibus purus, pharetra posuere ipsum. Cras semper, felis in suscipit vestibulum, lorem ipsum tincidunt risus, venenatis porttitor erat nisi ut nulla. Cras non cursus eros.</p>','/library/combo-pics/tts3.jpg','/uploads/2018/03/img-5ab2b0e326c9f.jpg','','','','','',NULL,'','N',NULL,NULL,0,'D',NULL,'2018-03-21 20:21:10','2018-03-21 20:22:11','2018-05-04 06:30:50',1,8,NULL,NULL,NULL,'N',NULL,1,NULL,NULL),(21,'Blog','Blog','Blog','Blog','','','','','','blog','/about/blog','','',NULL,'','','','','News & Blog | Skydive Bay of Islands','','','','','N',NULL,NULL,0,'A',3,'2018-03-21 20:22:26','2018-04-03 23:23:30',NULL,1,1,0,0,0,'N','',1,'',''),(22,'Reviews','','','What our customers say','','','','/library/photos/021518-4.jpg','/uploads/2018/05/img-5afd01b0413e2.jpg','reviews','/reviews','','',NULL,'','','','','What our customers say | Skydive Bay of Islands','','','','','N',NULL,NULL,0,'A',9,'2018-03-21 20:37:59','2018-05-17 04:14:40',NULL,1,9,0,0,0,'N','',1,'',''),(23,'404','','','Oops. Something went wrong...','','','','','','404','/404','You may have mis-typed a URL or followed an old link.','',NULL,'','','','','','','','','','N',NULL,NULL,0,'A',10,'2018-03-21 20:41:27','2018-03-21 20:42:38',NULL,1,1,0,0,0,'N','',1,'',''),(24,'Birthday Upgrade',NULL,NULL,'Birthday Upgrade',NULL,NULL,NULL,'','','birthday-upgrade','/birthday-upgrade','&amp;lt;h5&amp;gt;Birthday jumps are a blast!&amp;lt;/h5&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;Treat yourself, or someone special, to a birthday skydive and we&amp;amp;#39;ll give you a free upgrade from 12,000 ft to 16,000ft&amp;amp;ndash; that&amp;amp;#39;s a massive saving of $70! What better way to celebrate your special day than freefalling from 16,000ft above beautiful Bay of Islands! Just book online with the code &amp;amp;lsquo;BIRTHDAY&amp;amp;lsquo; and bring proof of your date of birth with you (sorry but your cake doesn&amp;amp;#39;t count).&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;Booking a birthday present? No worries, just book the lucky person in with the &amp;amp;#39;BIRTHDAY&amp;amp;#39; code and make sure they bring ID along on the day! We also do gift vouchers.&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;What are you waiting for? Click here to BOOK NOW!&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;lt;em&amp;gt;Prices are in NZD$ and include GST. Prices maybe subject to change. Please note that only the birthday girl or boy will receive the free upgrade.&amp;lt;/em&amp;gt;&amp;lt;/p&amp;gt;',NULL,'&amp;lt;h5&amp;gt;Birthday jumps are a blast!&amp;lt;/h5&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;Treat yourself, or someone special, to a birthday skydive and we&amp;amp;#39;ll give you a free upgrade from 12,000 ft to 16,000ft&amp;amp;ndash; that&amp;amp;#39;s a massive saving of $70! What better way to celebrate your special day than freefalling from 16,000ft above beautiful Bay of Islands! Just book online with the code &amp;amp;lsquo;BIRTHDAY&amp;amp;lsquo; and bring proof of your date of birth with you (sorry but your cake doesn&amp;amp;#39;t count).&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;Booking a birthday present? No worries, just book the lucky person in with the &amp;amp;#39;BIRTHDAY&amp;amp;#39; code and make sure they bring ID along on the day! We also do gift vouchers.&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;What are you waiting for? Click here to BOOK NOW!&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;lt;em&amp;gt;Prices are in NZD$ and include GST. Prices maybe subject to change. Please note that only the birthday girl or boy will receive the free upgrade.&amp;lt;/em&amp;gt;&amp;lt;/p&amp;gt;','/library/photos/sboi-3.jpg','/uploads/2018/05/img-5ae9801d33b80.jpg','','','Birthday Upgrade | Skydive Bay of Islands','','Birthday Upgrade',NULL,'','N',NULL,NULL,0,'A',3,'2018-03-21 22:20:59','2018-05-02 09:08:45',NULL,1,9,2,NULL,NULL,'N',NULL,1,NULL,NULL),(25,'Selfie Special',NULL,NULL,'Selfie Special',NULL,NULL,NULL,'','','selfie-special','/selfie-special','&amp;lt;p&amp;gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur venenatis feugiat sodales.&amp;lt;/p&amp;gt;',NULL,'&amp;lt;p&amp;gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur venenatis feugiat sodales.&amp;lt;/p&amp;gt;','/library/bungyandswing-pic.jpg','/uploads/2018/04/img-5ac2e5d995df4.jpg','','','','','',NULL,'','N',NULL,NULL,0,'H',7,'2018-03-21 23:21:46','2018-04-03 04:24:25',NULL,1,1,0,NULL,NULL,'N',NULL,1,NULL,NULL),(26,'Special Prices',NULL,NULL,'Special Prices',NULL,NULL,NULL,'','','special-prices','/special-prices','&amp;lt;p&amp;gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur venenatis feugiat sodales. Sed ultricies elit neque, et venenatis justo commodo malesuada. In quam odio, eleifend id elit ut, ornare cursus ante. Suspendisse lacinia cursus libero eu vestibulum. Morbi dui metus, pellentesque vitae iaculis ut, mollis sed felis. Donec sagittis dolor finibus enim hendrerit, ac congue leo suscipit. Cras volutpat malesuada nunc, in fermentum est dictum sed. Quisque et vulputate mi. Sed venenatis ante erat, eu interdum magna tempus ut. Proin quis mi congue nunc commodo elementum. Aliquam magna sapien, condimentum non sollicitudin at, pharetra consequat dui. Morbi condimentum, nibh ac dapibus max&amp;lt;/p&amp;gt;',NULL,'&amp;lt;p&amp;gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur venenatis feugiat sodales. Sed ultricies elit neque, et venenatis justo commodo malesuada. In quam odio, eleifend id elit ut, ornare cursus ante. Suspendisse lacinia cursus libero eu vestibulum. Morbi dui metus, pellentesque vitae iaculis ut, mollis sed felis. Donec sagittis dolor finibus enim hendrerit, ac congue leo suscipit. Cras volutpat malesuada nunc, in fermentum est dictum sed. Quisque et vulputate mi. Sed venenatis ante erat, eu interdum magna tempus ut. Proin quis mi congue nunc commodo elementum. Aliquam magna sapien, condimentum non sollicitudin at, pharetra consequat dui. Morbi condimentum, nibh ac dapibus max&amp;lt;/p&amp;gt;','/library/bg2.jpg','/uploads/2018/04/img-5ac3fc7c271d8.jpg','','','','','',NULL,'','N',NULL,NULL,0,'H',6,'2018-03-21 23:22:46','2018-04-03 22:13:16',NULL,1,1,0,NULL,NULL,'N',NULL,1,NULL,NULL),(27,'Specials','','','Specials','','','','','','specials','/specials','','',NULL,'','','','','Hot Deals & Specials | Skydive Bay of Islands','','','','','N',NULL,NULL,0,'A',0,'2018-03-21 23:43:59','2018-05-04 05:39:44',NULL,1,9,0,1,0,'N','',1,'',''),(28,'We  love  our  locals',NULL,NULL,'We  love  our  locals',NULL,NULL,NULL,'','','we-love-our-locals','/we-love-our-locals','&amp;lt;p&amp;gt;So you also call the beautiful Bay of Islands home? You lucky thing!&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;At Skydive Bay of Islands we love our locals and we want to show you the love by giving you $50 off your jump! That&amp;amp;rsquo;s right, when you BOOK through our website we will give you $50 off your skydive! Just use the promo code &amp;amp;#39;LOCAL&amp;amp;#39; when you BOOK your jump. Remember to bring in proof of address.&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;Living in Whangarei? Yes, you qualify too! Anyone living in Northland is considered a local.&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;lt;em&amp;gt;Prices are in NZD$ and include GST. Prices maybe subject to change. Please note that we will need to see evidence of your current residential address.&amp;lt;/em&amp;gt;&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;',NULL,'&amp;lt;p&amp;gt;So you also call the beautiful Bay of Islands home? You lucky thing!&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;At Skydive Bay of Islands we love our locals and we want to show you the love by giving you $50 off your jump! That&amp;amp;rsquo;s right, when you BOOK through our website we will give you $50 off your skydive! Just use the promo code &amp;amp;#39;LOCAL&amp;amp;#39; when you BOOK your jump. Remember to bring in proof of address.&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;Living in Whangarei? Yes, you qualify too! Anyone living in Northland is considered a local.&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;lt;em&amp;gt;Prices are in NZD$ and include GST. Prices maybe subject to change. Please note that we will need to see evidence of your current residential address.&amp;lt;/em&amp;gt;&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;','/library/photos/sboi-13.jpg','/uploads/2018/05/img-5ae97cfc01187.jpg','','','We  love  our  locals  | Skydive Bay of Islands','','',NULL,'','N',NULL,NULL,0,'A',1,'2018-03-22 00:52:29','2018-05-02 08:55:24',NULL,1,9,2,NULL,NULL,'N',NULL,1,NULL,NULL),(29,'FAQ\'s','FAQ\'s','FAQ\'s','FAQ\'s','','','','','','faqs','/skydive/faqs','','',NULL,'','','','','FAQ\'s | Skydive Bay of Islands','','','','','N',NULL,NULL,0,'A',5,'2018-03-22 03:03:42','2018-05-29 08:21:11',NULL,1,9,0,0,0,'N','',1,'',''),(30,'Moana  Package',NULL,NULL,'Moana  Package',NULL,NULL,NULL,'','','moana-package-80-upgrade','/moana-package-80-upgrade',NULL,NULL,'&amp;lt;p&amp;gt;Upgrade your skydive to our Moana package for just $80 and receive:&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;ul&amp;gt;\r\n	&amp;lt;li&amp;gt;Skydive into the Waitangi Treaty Grounds&amp;lt;/li&amp;gt;\r\n	&amp;lt;li&amp;gt;Waitangi Treaty Grounds Day Pass&amp;lt;/li&amp;gt;\r\n	&amp;lt;li&amp;gt;Whare Waka Cafe drink (beer, wine, hot or cold non-alcoholic drink)&amp;lt;/li&amp;gt;\r\n&amp;lt;/ul&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;lt;em&amp;gt;Prices are in NZD$ and include GST. Prices maybe subject to change.&amp;lt;/em&amp;gt;&amp;lt;/p&amp;gt;','/library/photos/011518-11.jpg',NULL,'','','Moana Package | Skydive Bay of Islands','','',NULL,'','N',NULL,NULL,0,'A',1,'2018-03-22 04:20:39','2018-05-02 08:31:26',NULL,1,9,4,NULL,NULL,'N',NULL,1,NULL,''),(31,'Kikorangi  Package',NULL,NULL,'Kikorangi  Package',NULL,NULL,NULL,'','','kikorangi-package-140-upgrade','/kikorangi-package-140-upgrade',NULL,NULL,'&amp;lt;p&amp;gt;Upgrade your skydive to our Kikorangi package for just $140 and receive:&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;ul&amp;gt;\r\n	&amp;lt;li&amp;gt;Skydive into the Waitangi Treaty Grounds&amp;lt;/li&amp;gt;\r\n	&amp;lt;li&amp;gt;Waitangi Treaty Grounds Day Pass&amp;lt;/li&amp;gt;\r\n	&amp;lt;li&amp;gt;Waitangi h&amp;amp;auml;ngi and concert&amp;lt;/li&amp;gt;\r\n	&amp;lt;li&amp;gt;Whare Waka Cafe drink (beer, wine, hot or cold non-alcoholic drink)&amp;lt;/li&amp;gt;\r\n&amp;lt;/ul&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;lt;em&amp;gt;Prices are in NZD$ and include GST. Prices maybe subject to change.&amp;lt;/em&amp;gt;&amp;lt;/p&amp;gt;','/library/photos/011518-9.jpg',NULL,'','','Kikorangi  Package:  $140  upgrade','','',NULL,'','N',NULL,NULL,0,'A',2,'2018-03-22 04:35:05','2018-05-02 07:55:36',NULL,1,9,4,NULL,NULL,'N',NULL,1,NULL,''),(32,'Our Location','Our Location','','Our Location','','','','','','our-location','/about/our-location','The  stunning  Bay  of  Islands  is  just  a  short  drive  from  Auckland  but  it  feels  like  a  million  miles  away','',NULL,'','','','','Our Location | Skydive Bay of Islands','','','','','N',NULL,NULL,0,'A',1,'2018-03-23 00:12:04','2018-05-01 08:45:44',NULL,1,9,0,0,0,'N','',1,'',''),(33,'9,000 ft Jump','9,000 ft Jump','','9,000ft Jump - What a buzz!','','','','','','9000-ft-jump','/skydive/9000-ft-jump','','20 seconds of freefall ‚Äì What a buzz!',NULL,'/library/photos/sboi-8.jpg','/uploads/2018/05/img-5b0d0d4195be9.jpg','','','9000 Ft Jump - The Adrenalin Buzz! | Skydive Bay of Islands','','','','','N',NULL,NULL,0,'A',1,'2018-03-23 00:59:33','2018-05-29 08:20:17',NULL,1,9,2,0,0,'N','',1,'',''),(34,'12,000 ft Jump','12,000 ft Jump','','12,000ft Jump ‚Äì What a rush!','','','','','','12000-ft-jump','/skydive/12000-ft-jump','','45 seconds of freefall - What a rush!',NULL,'/library/photos/sboi-43.jpg','/uploads/2018/05/img-5b0d0d4fe148d.jpg','','','12,000 Ft Jump - The Adrenalin Rush! | Skydive Bay of Islands','','','','','N',NULL,NULL,0,'A',2,'2018-03-23 01:01:03','2018-05-29 08:20:31',NULL,1,9,2,0,0,'N','',1,'',''),(35,'16,000 ft Jump','16,000 ft Jump','','16,000ft Jump - What a blast!','','','','','','16000-ft-jump','/skydive/16000-ft-jump','','70 seconds of freefall - What a blast!',NULL,'/library/photos/sboi-25.jpg','/uploads/2018/05/img-5b0d0d5cb8963.jpg','','','16,000 Ft Jump - The Adrenalin Blast! | Skydive Bay of Islands','','','','','N',NULL,NULL,0,'A',3,'2018-03-23 01:12:55','2018-05-29 08:20:44',NULL,1,9,2,0,0,'N','',1,'',''),(36,'Jump Only - 9000 ft','Jump Only',NULL,'Jump Only',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'<ul>\r\n	<li>9000 ft Jump</li>\r\n	<li>\r\n	<p>20 seconds of free fall</p>\r\n	</li>\r\n</ul>','/library/photos/sboi-12.jpg','/uploads/2018/05/img-5af2a8b52b8c9.jpg','','',NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'A',1,'2018-03-23 01:14:31','2018-05-09 07:52:21',NULL,1,9,NULL,NULL,NULL,'N',NULL,1,NULL,'https://gojumpbayofislands.rezdy.com/235220/9-000-ft-adrenaline-buzz'),(37,'Silver Package - 9000 Ft','Jump & Silver Package',NULL,'Jump & Silver Package',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'<ul>\r\n	<li>9,000 Ft Jump</li>\r\n	<li>Handycam - choose between either video or photos</li>\r\n	<li>2GB USB Flash Drive</li>\r\n</ul>','/library/photos/sboi-18.jpg','/uploads/2018/05/img-5af3cb94cfb09.jpg','','',NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'A',2,'2018-03-23 01:16:34','2018-05-10 04:33:24',NULL,1,1,NULL,NULL,NULL,'N',NULL,1,NULL,'https://gojumpbayofislands.rezdy.com/240649/9-000ft-silver-package'),(38,'Jump Only -12000 Ft','Jump Only',NULL,'Jump Only',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'<ul>\r\n	<li>12,000 Ft Jump</li>\r\n	<li>\r\n	<p>45 seconds of free fall</p>\r\n	<br />\r\n	&nbsp;</li>\r\n</ul>','/library/photos/sboi-14.jpg','/uploads/2018/05/img-5af0c73b65199.jpg','','',NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'A',5,'2018-03-23 01:24:21','2018-05-07 21:38:03',NULL,1,1,NULL,NULL,NULL,'N',NULL,1,NULL,'https://gojumpbayofislands.rezdy.com/234755/12-000-ft-adrenaline-rush'),(39,'Ace Package - 12000 Ft','Ace Package',NULL,'Ace Package',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'<ul>\r\n	<li>Mauris porttitor arcu ut ligula.</li>\r\n	<li>Nam accumsan purus vel nibh dapibus.</li>\r\n	<li>Etiam ac quam non est blandit tempor.</li>\r\n	<li>Praesent eu lorem quis mauris.</li>\r\n	<li>Nunc iaculis ligula vitae leo placerat porttitor.</li>\r\n	<li>In accumsan eros nec erat posuere.</li>\r\n</ul>','/library/taupobungy/bg1.jpg','/uploads/2018/03/img-5ab81fa71c56c.jpg','','',NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'D',6,'2018-03-23 01:26:19','2018-03-26 00:16:07',NULL,1,1,NULL,NULL,NULL,'N',NULL,1,NULL,'http://www.example.com/'),(40,'Jump Only -16000 Ft','Jump Only',NULL,'Jump Only',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'<ul>\r\n	<li><span id=\"cke_bm_67C\" style=\"display: none;\">&nbsp;</span><span id=\"cke_bm_66C\" style=\"display: none;\">&nbsp;</span><span id=\"cke_bm_68C\" style=\"display: none;\"> </span>16,000 Ft Jump</li>\r\n	<li>\r\n	<p>70 seconds of free fall</p>\r\n	<br />\r\n	&nbsp;</li>\r\n</ul>','/library/photos/sboi-23.jpg','/uploads/2018/05/img-5af0c75607e46.jpg','','',NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'A',9,'2018-03-23 01:28:03','2018-05-07 21:38:30',NULL,1,1,NULL,NULL,NULL,'N',NULL,1,NULL,'https://gojumpbayofislands.rezdy.com/219458/16-000-ft-adrenaline-blast'),(41,'Ace Package - 15000 Ft','Ace Package',NULL,'Ace Package',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'<ul>\r\n	<li>Mauris porttitor arcu ut ligula</li>\r\n	<li>Nam accumsan purus vel nibh dapibus</li>\r\n	<li>Etiam ac quam non est blandit tempor.</li>\r\n	<li>Praesent eu lorem quis mauris</li>\r\n	<li>Nunc iaculis ligula vitae leo placerat</li>\r\n</ul>','/library/taupobungy/cliff.jpg','/uploads/2018/04/img-5ac3ffb885d3e.jpg','','',NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'D',6,'2018-03-23 01:29:09','2018-04-03 22:27:04',NULL,1,1,NULL,NULL,NULL,'N',NULL,1,NULL,'http://www.example.com/'),(42,'Chinese Page','','','Chinese Language','','','','','','chinese-page','/chinese-page','','',NULL,'','','','','','','','','','N',NULL,NULL,0,'A',12,'2018-03-26 23:17:10','2018-05-09 08:49:45',NULL,1,9,0,0,0,'N','',1,'',''),(43,'Korean Page','','','Korean Language','','','','','','korean-page','/korean-page','','',NULL,'','','','','','','','','','N',NULL,NULL,0,'A',13,'2018-03-26 23:17:47','2018-05-09 08:49:54',NULL,1,9,0,0,0,'N','',1,'',''),(44,'Japanese Page','','','Japanese Language','','','','','','japanese','/japanese','','',NULL,'','','','','','','','','','N',NULL,NULL,0,'A',14,'2018-03-26 23:18:20','2018-05-09 08:50:08',NULL,1,9,0,0,0,'N','',1,'',''),(45,'Our Gallery','Our Gallery','','Our Gallery','','','','','','our-gallery','/about/our-gallery','','',NULL,'','','','Vestibulum a eleifend tellus, nec tempus leo','Gallery | Skydive Bay of Islands','','','','','N',NULL,NULL,0,'A',2,'2018-03-28 02:19:37','2018-04-03 23:23:16',NULL,1,1,0,0,0,'N','',1,'',''),(46,'Testing Category 01','Testing Category 01',NULL,'Testing Category 01',NULL,NULL,NULL,'','','testing-category-01','/category/testing-category-01',NULL,NULL,NULL,'',NULL,'','','Testing Category 01','Testing Category 01','Testing Category 01',NULL,'/library/bg2.jpg','N',NULL,NULL,0,'D',10,'2018-04-03 21:57:12','2018-04-03 21:57:31','2018-04-03 22:00:03',1,1,NULL,NULL,NULL,'N',NULL,1,NULL,NULL),(47,'Testing Blog Post 01',NULL,NULL,'Testing Blog Post 01',NULL,NULL,NULL,'','','testing-blog-post-01','/post/testing-blog-post-01',NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eu nisi sem. Curabitur ut ligula neque. Aenean libero tortor, rutrum quis aliquam ut, molestie sed ligula. Nunc tortor ligula, venenatis sed pharetra vel, feugiat nec odio. Maecenas','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eu nisi sem. Curabitur ut ligula neque. Aenean libero tortor, rutrum quis aliquam ut, molestie sed ligula. Nunc tortor ligula, venenatis sed pharetra vel, feugiat nec odio. Maecenas in semper mi. Etiam metus quam, egestas tincidunt magna quis, tincidunt sollicitudin lorem. Phasellus in purus a dolor scelerisque bibendum eget non leo. Nullam aliquam urna non convallis lobortis. Donec dictum commodo purus cursus bibendum. Curabitur dictum venenatis tortor, in mollis arcu pulvinar at. Morbi sit amet vulputate erat. Vestibulum tincidunt ligula non leo consequat, nec interdum lacus rutrum. Aenean lobortis sodales lobortis. Morbi felis orci, condimentum eget ultricies vitae, imperdiet a ante. Quisque nec mauris mauris.</p>\r\n\r\n<p>Duis aliquam tempor felis, vitae faucibus lectus pretium eget. Integer ac odio quis ex luctus aliquam sit amet vel nibh. Proin congue erat quis pharetra placerat. Cras dui justo, aliquam sed lectus faucibus, varius laoreet mi. Maecenas nec turpis in tortor finibus consequat. Cras fringilla, ante eget tempus malesuada, tellus odio pellentesque dolor, vel pretium neque enim et diam. Fusce finibus odio ultrices eros lobortis, at congue lectus condimentum. Nam at eleifend sem, in pellentesque ligula. Proin et eleifend purus. Ut eu tristique tellus, ac suscipit diam. Nullam sed nisl in dolor cursus elementum et sed elit. Ut imperdiet egestas purus, mollis mollis dui molestie ac. Fusce ullamcorper, metus id tristique commodo, augue sem vulputate tellus, id auctor tortor felis et mi. Quisque venenatis ex sapien, tincidunt facilisis nulla fringilla ac. Suspendisse sed libero posuere, bibendum felis nec, tempus sapien.</p>','/library/bg2.jpg','/uploads/2018/04/img-5ac3f91e9f78f.jpg','','','Testing Blog Post 01','Testing Blog Post 01','Testing Blog Post 01',NULL,'/library/bg2.jpg','N',NULL,NULL,0,'D',NULL,'2018-04-03 21:58:11','2018-04-03 21:58:54','2018-04-03 21:59:49',1,1,NULL,NULL,NULL,'N',NULL,1,NULL,NULL),(48,'Testing Activity Pricing 01','Testing Activity Pricing 01',NULL,'Testing Activity Pricing 01',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eu nisi sem. Curabitur ut ligula neque. Aenean libero tortor, rutrum quis aliquam ut, molestie sed ligula. Nunc tortor ligula, venenatis sed pharetra vel, feugiat nec odio. Maecenas in semper mi. Etiam metus quam, egestas tincidunt magna quis, tincidunt sollicitudin lorem. Phasellus in purus a dolor scelerisque bibendum eget non leo. Nullam aliquam urna non convallis lobortis. Donec dictum commodo purus cursus bibendum. Curabitur dictum venenatis tortor, in mollis arcu pulvinar at. Morbi sit amet vulputate erat. Vestibulum tincidunt ligula non leo consequat, nec interdum lacus rutrum. Aenean lobortis sodales lobortis. Morbi felis orci, condimentum eget ultricies vitae, imperdiet a ante. Quisque nec mauris mauris.</p>\r\n\r\n<p>Duis aliquam tempor felis, vitae faucibus lectus pretium eget. Integer ac odio quis ex luctus aliquam sit amet vel nibh. Proin congue erat quis pharetra placerat. Cras dui justo, aliquam sed lectus faucibus, varius laoreet mi. Maecenas nec turpis in tortor finibus consequat. Cras fringilla, ante eget tempus malesuada, tellus odio pellentesque dolor, vel pretium neque enim et diam. Fusce finibus odio ultrices eros lobortis, at congue lectus condimentum. Nam at eleifend sem, in pellentesque ligula. Proin et eleifend purus. Ut eu tristique tellus, ac suscipit diam. Nullam sed nisl in dolor cursus elementum et sed elit. Ut imperdiet egestas purus, mollis mollis dui molestie ac. Fusce ullamcorper, metus id tristique commodo, augue sem vulputate tellus, id auctor tortor felis et mi. Quisque venenatis ex sapien, tincidunt facilisis nulla fringilla ac. Suspendisse sed libero posuere, bibendum felis nec, tempus sapien.</p>','/library/bg2.jpg','/uploads/2018/04/img-5ac3fbe15cd69.jpg','','',NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'D',10,'2018-04-03 22:06:45','2018-04-03 22:10:41',NULL,1,1,NULL,NULL,NULL,'N',NULL,1,NULL,'http://www.example.com/'),(49,'Testing Special 01',NULL,NULL,'Testing Special 01',NULL,NULL,NULL,'','','testing-special-01','/testing-special-01','&amp;lt;p&amp;gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eu nisi sem. Curabitur ut ligula neque. Aenean libero tortor, rutrum quis aliquam ut, molestie sed ligula. Nunc tortor ligula, venenatis sed pharetra vel, feugiat nec odio. Maecenas in semper mi. Etiam metus quam, egestas tincidunt magna quis, tincidunt sollicitudin lorem. Phasellus in purus a dolor scelerisque bibendum eget non leo. Nullam aliquam urna non convallis lobortis. Donec dictum commodo purus cursus bibendum. Curabitur dictum venenatis tortor, in mollis arcu pulvinar at. Morbi sit amet vulputate erat. Vestibulum tincidunt ligula non leo consequat, nec interdum lacus rutrum. Aenean lobortis sodales lobortis. Morbi felis orci, condimentum eget ultricies vitae, imperdiet a ante. Quisque nec mauris mauris.&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;Duis aliquam tempor felis, vitae faucibus lectus pretium eget. Integer ac odio quis ex luctus aliquam sit amet vel nibh. Proin congue erat quis pharetra placerat. Cras dui justo, aliquam sed lectus faucibus, varius laoreet mi. Maecenas nec turpis in tortor finibus consequat. Cras fringilla, ante eget tempus malesuada, tellus odio pellentesque dolor, vel pretium neque enim et diam. Fusce finibus odio ultrices eros lobortis, at congue lectus condimentum. Nam at eleifend sem, in pellentesque ligula. Proin et eleifend purus. Ut eu tristique tellus, ac suscipit diam. Nullam sed nisl in dolor cursus elementum et sed elit. Ut imperdiet egestas purus, mollis mollis dui molestie ac. Fusce ullamcorper, metus id tristique commodo, augue sem vulputate tellus, id auctor tortor felis et mi. Quisque venenatis ex sapien, tincidunt facilisis nulla fringilla ac. Suspendisse sed libero posuere, bibendum felis nec, tempus sapien.&amp;lt;/p&amp;gt;',NULL,'&amp;lt;p&amp;gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eu nisi sem. Curabitur ut ligula neque. Aenean libero tortor, rutrum quis aliquam ut, molestie sed ligula. Nunc tortor ligula, venenatis sed pharetra vel, feugiat nec odio. Maecenas in semper mi. Etiam metus quam, egestas tincidunt magna quis, tincidunt sollicitudin lorem. Phasellus in purus a dolor scelerisque bibendum eget non leo. Nullam aliquam urna non convallis lobortis. Donec dictum commodo purus cursus bibendum. Curabitur dictum venenatis tortor, in mollis arcu pulvinar at. Morbi sit amet vulputate erat. Vestibulum tincidunt ligula non leo consequat, nec interdum lacus rutrum. Aenean lobortis sodales lobortis. Morbi felis orci, condimentum eget ultricies vitae, imperdiet a ante. Quisque nec mauris mauris.&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;Duis aliquam tempor felis, vitae faucibus lectus pretium eget. Integer ac odio quis ex luctus aliquam sit amet vel nibh. Proin congue erat quis pharetra placerat. Cras dui justo, aliquam sed lectus faucibus, varius laoreet mi. Maecenas nec turpis in tortor finibus consequat. Cras fringilla, ante eget tempus malesuada, tellus odio pellentesque dolor, vel pretium neque enim et diam. Fusce finibus odio ultrices eros lobortis, at congue lectus condimentum. Nam at eleifend sem, in pellentesque ligula. Proin et eleifend purus. Ut eu tristique tellus, ac suscipit diam. Nullam sed nisl in dolor cursus elementum et sed elit. Ut imperdiet egestas purus, mollis mollis dui molestie ac. Fusce ullamcorper, metus id tristique commodo, augue sem vulputate tellus, id auctor tortor felis et mi. Quisque venenatis ex sapien, tincidunt facilisis nulla fringilla ac. Suspendisse sed libero posuere, bibendum felis nec, tempus sapien.&amp;lt;/p&amp;gt;','/library/bg2.jpg','/uploads/2018/04/img-5ac3fc580759f.jpg','','','Testing Special 01','Testing Special 01','Testing Special 01',NULL,'/library/bg2.jpg','N',NULL,NULL,0,'D',10,'2018-04-03 22:11:22','2018-04-03 22:12:40',NULL,1,1,2,NULL,NULL,'N',NULL,1,NULL,NULL),(50,'Testing Combo 01',NULL,NULL,'Testing Combo 01',NULL,NULL,NULL,'','','testing-combo-01','/testing-combo-01',NULL,NULL,'&amp;lt;p&amp;gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eu nisi sem. Curabitur ut ligula neque. Aenean libero tortor, rutrum quis aliquam ut, molestie sed ligula. Nunc tortor ligula, venenatis sed pharetra vel, feugiat nec odio. Maecenas in semper mi. Etiam metus quam, egestas tincidunt magna quis, tincidunt sollicitudin lorem. Phasellus in purus a dolor scelerisque bibendum eget non leo. Nullam aliquam urna non convallis lobortis. Donec dictum commodo purus cursus bibendum. Curabitur dictum venenatis tortor, in mollis arcu pulvinar at. Morbi sit amet vulputate erat. Vestibulum tincidunt ligula non leo consequat, nec interdum lacus rutrum. Aenean lobortis sodales lobortis. Morbi felis orci, condimentum eget ultricies vitae, imperdiet a ante. Quisque nec mauris mauris.&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;Duis aliquam tempor felis, vitae faucibus lectus pretium eget. Integer ac odio quis ex luctus aliquam sit amet vel nibh. Proin congue erat quis pharetra placerat. Cras dui justo, aliquam sed lectus faucibus, varius laoreet mi. Maecenas nec turpis in tortor finibus consequat. Cras fringilla, ante eget tempus malesuada, tellus odio pellentesque dolor, vel pretium neque enim et diam. Fusce finibus odio ultrices eros lobortis, at congue lectus condimentum. Nam at eleifend sem, in pellentesque ligula. Proin et eleifend purus. Ut eu tristique tellus, ac suscipit diam. Nullam sed nisl in dolor cursus elementum et sed elit. Ut imperdiet egestas purus, mollis mollis dui molestie ac. Fusce ullamcorper, metus id tristique commodo, augue sem vulputate tellus, id auctor tortor felis et mi. Quisque venenatis ex sapien, tincidunt facilisis nulla fringilla ac. Suspendisse sed libero posuere, bibendum felis nec, tempus sapien.&amp;lt;/p&amp;gt;','/library/bg2.jpg',NULL,'','','Testing Combo 01','Testing Combo 01','Testing Combo 01',NULL,'/library/bg2.jpg','N',NULL,NULL,0,'D',10,'2018-04-03 22:17:52','2018-04-03 22:22:21',NULL,1,1,2,NULL,NULL,'N',NULL,1,NULL,''),(51,'Untitled',NULL,NULL,NULL,NULL,NULL,NULL,'','','2018-04-03 22:18:45',NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'D',NULL,'2018-04-03 22:18:45','2018-04-03 22:18:45',NULL,1,NULL,NULL,NULL,NULL,'N',NULL,1,NULL,NULL),(52,'Untitled',NULL,NULL,NULL,NULL,NULL,NULL,'','','2018-04-03 22:18:56',NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'D',NULL,'2018-04-03 22:18:56','2018-04-03 22:18:56',NULL,1,NULL,NULL,NULL,NULL,'N',NULL,1,NULL,NULL),(53,'Untitled',NULL,NULL,NULL,NULL,NULL,NULL,'','','2018-04-03 22:19:18',NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'D',NULL,'2018-04-03 22:19:18','2018-04-03 22:19:18',NULL,1,NULL,NULL,NULL,NULL,'N',NULL,1,NULL,NULL),(54,'Testing Page','Testing Page','Testing Page','Testing Page','','Testing Page','Testing Page','/library/bungyandswing-pic.jpg','/uploads/2018/04/img-5ac3ffda29f9c.jpg','testing-page','/about/testing-page','','Testing Page',NULL,'/library/bungyandswing-pic.jpg','/uploads/2018/04/img-5ac3ffd9d38e8.jpg','','Testing Hero Caption','Testing Page','Testing Page','Testing Page','','/library/bungyandswing-pic.jpg','N',NULL,NULL,0,'D',50,'2018-04-03 22:23:37','2018-04-03 22:27:38','2018-04-03 22:27:50',1,1,2,0,0,'N','',1,'',''),(55,'Photo & Video Packages','Photo & Video Packages','','Photo & Video Packages','','','','','','photo-video-packages','/skydive/photo-video-packages','','',NULL,'','','','','Photo & Video Packages | Skydive Bay of Islands','','','','','N',NULL,NULL,0,'A',4,'2018-04-03 22:27:24','2018-05-29 08:20:57',NULL,1,9,0,0,0,'N','',1,'',''),(56,'Learn to Skydive','Learn to Skydive','','Jump in to a world of adventure!','','','','','','learn-to-sky-dive','/skydive/learn-to-sky-dive','','',NULL,'','','','','Learn to Sky Dive | Skydive Bay of Islands','','','','','N',NULL,NULL,0,'A',6,'2018-04-03 22:27:59','2018-05-29 08:21:23',NULL,1,9,0,0,0,'N','',1,'',''),(57,'Gold Package - 9,000 Ft','Jump & Gold Package',NULL,'Jump & Gold Package',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'<ul>\r\n	<li>9,000 Ft Jump</li>\r\n	<li>\r\n	<p>Handycam Video and Photos</p>\r\n	</li>\r\n	<li>\r\n	<p>2GB USB Flash Drive</p>\r\n	</li>\r\n</ul>','/library/photos/sboi-2.jpg','/uploads/2018/05/img-5af3c48e35f30.jpg','','',NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'A',3,'2018-04-03 23:52:12','2018-05-10 04:03:26',NULL,1,1,NULL,NULL,NULL,'N',NULL,1,NULL,'https://gojumpbayofislands.rezdy.com/240651/9-000ft-gold-package'),(58,'Platinum Package - 9,000ft','Jump & Platinum Package',NULL,'Jump & Platinum Package',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'<ul>\r\n	<li>9,000 Ft Jump</li>\r\n	<li>Handycam Video and Photos</li>\r\n	<li>Personal camera flyer with helmet cam photos and videos</li>\r\n	<li>2GB USB Flash Drive</li>\r\n	<li>Free T-Shirt</li>\r\n</ul>','/library/photos/sboi-19.jpg','/uploads/2018/05/img-5af3c49b49fbf.jpg','','',NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'A',4,'2018-04-03 23:53:30','2018-05-10 04:03:39',NULL,1,1,NULL,NULL,NULL,'N',NULL,1,NULL,'https://gojumpbayofislands.rezdy.com/240654/9-000ft-platinum-package'),(59,'Silver Package - 12,000Ft','Jump & Silver Package',NULL,'Jump & Silver Package',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'<ul>\r\n	<li>12,000 Ft Jump</li>\r\n	<li>Handycam - choose between either video or photos</li>\r\n	<li>2GB USB Flash Drive</li>\r\n</ul>','/library/photos/sboi-17.jpg','/uploads/2018/05/img-5af3c4b1779fe.jpg','','',NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'A',6,'2018-04-04 00:47:07','2018-05-10 04:04:01',NULL,1,1,NULL,NULL,NULL,'N',NULL,1,NULL,'https://gojumpbayofislands.rezdy.com/240617/12-000ft-silver-package'),(60,'Gold Package - 12,000 Ft','Jump & Gold Package',NULL,'Jump & Gold Package',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'<ul>\r\n	<li>12,000 Ft Jump</li>\r\n	<li>Handycam Video and Photos</li>\r\n	<li>2GB USB Flash Drive</li>\r\n</ul>','/library/photos/sboi-53.jpg','/uploads/2018/05/img-5af3c4c338d26.jpg','','',NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'A',7,'2018-04-04 00:48:03','2018-05-10 04:04:19',NULL,1,1,NULL,NULL,NULL,'N',NULL,1,NULL,'https://gojumpbayofislands.rezdy.com/240635/12-000ft-gold-package'),(61,'Platinum Package - 12,000ft','Jump & Platinum Package',NULL,'Jump & Platinum Package',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'<ul>\r\n	<li>12,000 Ft Jump</li>\r\n	<li>Handycam Video and Photos</li>\r\n	<li>Personal camera flyer with helmet cam photos and videos</li>\r\n	<li>2GB USB Flash Drive</li>\r\n	<li>Free T-Shirt</li>\r\n</ul>','/library/photos/sboi-57.jpg','/uploads/2018/05/img-5af3c4d221546.jpg','','',NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'A',8,'2018-04-04 00:48:38','2018-05-10 04:04:34',NULL,1,1,NULL,NULL,NULL,'N',NULL,1,NULL,'https://gojumpbayofislands.rezdy.com/240637/12-000ft-platinum-package'),(62,'Silver Package - 16,000Ft','Jump & Silver Package',NULL,'Jump & Silver Package',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'<ul>\r\n	<li>16,000 Ft Jump</li>\r\n	<li>Handycam - choose between either video or photos</li>\r\n	<li>2GB USB Flash Drive</li>\r\n</ul>','/library/photos/sboi-52.jpg','/uploads/2018/05/img-5af3c4ea97bcc.jpg','','',NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'A',10,'2018-04-04 00:51:15','2018-05-10 04:04:58',NULL,1,1,NULL,NULL,NULL,'N',NULL,1,NULL,'https://gojumpbayofislands.rezdy.com/240407/16-000ft-silver-package'),(63,'Gold Package - 16,000 Ft','Jump & Gold Package',NULL,'Jump & Gold Package',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'<ul>\r\n	<li>16,000 Ft Jump</li>\r\n	<li>Handycam Video and Photos</li>\r\n	<li>2GB USB Flash Drive</li>\r\n</ul>','/library/photos/sboi-9.jpg','/uploads/2018/05/img-5af3c4fa14c4b.jpg','','',NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'A',11,'2018-04-04 00:56:06','2018-05-10 04:05:14',NULL,1,1,NULL,NULL,NULL,'N',NULL,1,NULL,'https://gojumpbayofislands.rezdy.com/240406/16-000ft-gold-package'),(64,'Platinum Package - 16,000ft','Jump & Platinum Package',NULL,'Jump & Platinum Package',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'<ul>\r\n	<li>16,000 Ft Jump</li>\r\n	<li>Handycam Video and Photos</li>\r\n	<li>Personal camera flyer with helmet cam photos and videos</li>\r\n	<li>2GB USB Flash Drive</li>\r\n	<li>Free T-Shirt</li>\r\n</ul>','/library/photos/sboi-21.jpg','/uploads/2018/05/img-5af3c507a86db.jpg','','',NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'A',12,'2018-04-04 00:56:48','2018-05-10 04:05:27',NULL,1,1,NULL,NULL,NULL,'N',NULL,1,NULL,'https://gojumpbayofislands.rezdy.com/240421/16-000ft-platinum-package'),(65,'Take 10% off your camera package',NULL,NULL,'Take 10% off your camera package',NULL,NULL,NULL,'','','10-off-your-camera-package','/10-off-your-camera-package','&amp;lt;p&amp;gt;So, you&amp;amp;rsquo;ve decided to skydive at the warmest and sunniest drop zone in New Zealand. It&amp;amp;rsquo;s a once in a lifetime experience and you want to capture every single second of it. Take the memories home with 10% off your camera package.&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;That&amp;amp;rsquo;s right, when you BOOK through our website we will give you 10% off your freefall camera package! Just mention this discount when you come in to our dropzone to redeem the offer.&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;lt;em&amp;gt;Prices are in NZD$ and include GST. Prices maybe subject to change. &amp;lt;/em&amp;gt;&amp;lt;/p&amp;gt;',NULL,'&amp;lt;p&amp;gt;So, you&amp;amp;rsquo;ve decided to skydive at the warmest and sunniest drop zone in New Zealand. It&amp;amp;rsquo;s a once in a lifetime experience and you want to capture every single second of it. Take the memories home with 10% off your camera package.&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;That&amp;amp;rsquo;s right, when you BOOK through our website we will give you 10% off your freefall camera package! Just mention this discount when you come in to our dropzone to redeem the offer.&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;lt;em&amp;gt;Prices are in NZD$ and include GST. Prices maybe subject to change. &amp;lt;/em&amp;gt;&amp;lt;/p&amp;gt;','/library/photos/sboi-57.jpg','/uploads/2018/05/img-5ae97a84b9f59.jpg','','','10%  off  your  camera  package  | Skydive Bay of Islands','','',NULL,'','N',NULL,NULL,0,'H',2,'2018-04-24 02:46:25','2018-05-02 08:44:52',NULL,1,9,2,NULL,NULL,'N',NULL,1,NULL,NULL),(66,'Group  discounts',NULL,NULL,'Group  discounts',NULL,NULL,NULL,'','','group-discounts','/group-discounts','&amp;lt;p&amp;gt;Have you got a large group of people keen to skydive? At Skydive Bay of Islands we welcome large groups and offer a wicked discount when you book direct for groups of more than 10 people.&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;That&amp;amp;rsquo;s right, when you BOOK for more than ten people through our website we will give you ....................!&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;Just use the promo code Dz10+dz when you BOOK your jump.&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;lt;em&amp;gt;Prices are in NZD$ and include GST. Prices maybe subject to change. &amp;lt;/em&amp;gt;&amp;lt;/p&amp;gt;',NULL,'&amp;lt;p&amp;gt;Have you got a large group of people keen to skydive? At Skydive Bay of Islands we welcome large groups and offer a wicked discount when you book direct for groups of more than 10 people.&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;That&amp;amp;rsquo;s right, when you BOOK for more than ten people through our website we will give you ....................!&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;Just use the promo code Dz10+dz when you BOOK your jump.&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;lt;em&amp;gt;Prices are in NZD$ and include GST. Prices maybe subject to change. &amp;lt;/em&amp;gt;&amp;lt;/p&amp;gt;','/library/photos/sboi-65.jpg','/uploads/2018/04/img-5ade9d1773326.jpg','','','Group  discounts  | Skydive Bay of Islands','','',NULL,'','N',NULL,NULL,0,'H',5,'2018-04-24 02:54:55','2018-04-24 02:57:27',NULL,1,1,0,NULL,NULL,'N',NULL,1,NULL,NULL),(67,'Sports Skydiving','Sports Skydiving','','Sports Skydivers Welcome','','','','','','sports-skydiving','/skydive/sports-skydiving','','',NULL,'','','','','Sports Skydivers Welcome | Skydive Bay of Islands','','','','','N',NULL,NULL,0,'A',7,'2018-04-24 03:52:32','2018-05-29 08:21:29',NULL,1,9,0,0,0,'N','',1,'',''),(68,'Waitangi packages',NULL,NULL,'Waitangi packages',NULL,NULL,NULL,'','','2018-05-02-075601','/2018-05-02-075601',NULL,NULL,'&amp;lt;h4&amp;gt;Take a once in a lifetime opportunity to skydive into a piece of New Zealand&amp;amp;#39;s history - the Waitangi Treaty Grounds.&amp;lt;/h4&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;Our Waitangi Packages will see you fly out over the stunning Bay of Islands, you&amp;amp;rsquo;ll exit the plane at 16,500ft and after 70 seconds of free fall your parachute will land on the expansive Waitangi Treaty Grounds.&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;These packages offer spectacular views over the Bay of Islands during your flight, your free fall and your canopy ride. These packages include a day pass to the state-of-the-art Museum of Waitangi, fascinating guided tours and spellbinding cultural performances.&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;Choose from our &amp;lt;a href=&amp;quot;https://skydivebayofislands.netzone.nz/combos-and-deals/moana-package-80-upgrade&amp;quot;&amp;gt;Moana&amp;lt;/a&amp;gt; or &amp;lt;a href=&amp;quot;https://skydivebayofislands.netzone.nz/combos-and-deals/kikorangi-package-140-upgrade&amp;quot;&amp;gt;Kikorangi&amp;lt;/a&amp;gt; upgrade&amp;lt;/p&amp;gt;','/library/photos/011518-9.jpg',NULL,'','','Waitangi packages','Take a once in a lifetime opportunity to skydive into a piece of New Zealand\'s history - the Waitangi Treaty Grounds.','',NULL,'','N',NULL,NULL,0,'D',NULL,'2018-05-02 07:56:01','2018-05-02 08:07:28',NULL,9,9,4,NULL,NULL,'N',NULL,1,NULL,''),(69,'Waitangi packages',NULL,NULL,'Waitangi packages',NULL,NULL,NULL,'','','2018-05-02-081544','/2018-05-02-081544','&amp;lt;h4&amp;gt;Take a once in a lifetime opportunity to skydive into a piece of New Zealand&amp;amp;#39;s history - the Waitangi Treaty Grounds.&amp;lt;/h4&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;Our Waitangi Packages will see you fly out over the stunning Bay of Islands, you&amp;amp;rsquo;ll exit the plane at 16,500ft and after 70 seconds of free fall your parachute will land on the expansive Waitangi Treaty Grounds.&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;These packages offer spectacular views over the Bay of Islands during your flight, your free fall and your canopy ride. These packages include a day pass to the state-of-the-art Museum of Waitangi, fascinating guided tours and spellbinding cultural performances.&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;Choose from our &amp;lt;a href=&amp;quot;https://skydivebayofislands.netzone.nz/combos-and-deals/moana-package-80-upgrade&amp;quot;&amp;gt;Moana&amp;lt;/a&amp;gt; or &amp;lt;a href=&amp;quot;https://skydivebayofislands.netzone.nz/combos-and-deals/kikorangi-package-140-upgrade&amp;quot;&amp;gt;Kikorangi&amp;lt;/a&amp;gt; upgrade&amp;lt;/p&amp;gt;',NULL,'&amp;lt;h4&amp;gt;Take a once in a lifetime opportunity to skydive into a piece of New Zealand&amp;amp;#39;s history - the Waitangi Treaty Grounds.&amp;lt;/h4&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;Our Waitangi Packages will see you fly out over the stunning Bay of Islands, you&amp;amp;rsquo;ll exit the plane at 16,500ft and after 70 seconds of free fall your parachute will land on the expansive Waitangi Treaty Grounds.&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;These packages offer spectacular views over the Bay of Islands during your flight, your free fall and your canopy ride. These packages include a day pass to the state-of-the-art Museum of Waitangi, fascinating guided tours and spellbinding cultural performances.&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;Choose from our &amp;lt;a href=&amp;quot;https://skydivebayofislands.netzone.nz/combos-and-deals/moana-package-80-upgrade&amp;quot;&amp;gt;Moana&amp;lt;/a&amp;gt; or &amp;lt;a href=&amp;quot;https://skydivebayofislands.netzone.nz/combos-and-deals/kikorangi-package-140-upgrade&amp;quot;&amp;gt;Kikorangi&amp;lt;/a&amp;gt; upgrade&amp;lt;/p&amp;gt;','/library/photos/011518-9.jpg','/uploads/2018/05/img-5ae9795c1f470.jpg','','','Waitangi packages','Take a once in a lifetime opportunity to skydive into a piece of New Zealand\'s history - the Waitangi Treaty Grounds.','',NULL,'','N',NULL,NULL,0,'A',4,'2018-05-02 08:15:44','2018-05-02 08:39:56',NULL,9,9,4,NULL,NULL,'N',NULL,1,NULL,NULL),(70,'Untitled',NULL,NULL,NULL,NULL,NULL,NULL,'','','2018-05-02 08:49:33',NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'D',NULL,'2018-05-02 08:49:33','2018-05-02 08:49:33',NULL,9,NULL,NULL,NULL,NULL,'N',NULL,1,NULL,NULL),(71,'Birthday upgrade',NULL,NULL,'Birthday upgrade',NULL,NULL,NULL,'','','2018-05-02-090347','/2018-05-02-090347',NULL,NULL,'&amp;lt;h5&amp;gt;Birthday jumps are a blast!&amp;lt;/h5&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Treat yourself, or someone special, to a birthday skydive and we&amp;amp;#39;ll give you a free upgrade from 12,000 ft to 16,000ft&amp;amp;ndash; that&amp;amp;#39;s a massive saving of $70!&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;What better way to celebrate your special day than freefalling from 16,000ft above beautiful Bay of Islands! Just book online with the code &amp;amp;lsquo;BIRTHDAY&amp;amp;lsquo; and bring proof of your date of birth with you (sorry but your cake doesn&amp;amp;#39;t count).&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;Booking a birthday present? No worries, just book the lucky person in with the &amp;amp;#39;BIRTHDAY&amp;amp;#39; code and make sure they bring ID along on the day! We also do gift vouchers.&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;What are you waiting for? Click here to BOOK NOW!&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;\r\n\r\n&amp;lt;p&amp;gt;&amp;lt;em&amp;gt;Prices are in NZD$ and include GST. Prices maybe subject to change. Please note that only the birthday girl or boy will receive the free upgrade.&amp;lt;/em&amp;gt;&amp;lt;/p&amp;gt;','',NULL,'','','','','',NULL,'','N',NULL,NULL,0,'D',3,'2018-05-02 09:03:47','2018-05-02 09:05:55',NULL,9,9,0,NULL,NULL,'N',NULL,1,NULL,''),(72,'Environment','Environment','Environment','Environment','','','','','','protecting-the-environment','/about/protecting-the-environment','At Skydive Bay of Islands, we are extremely lucky to have the stunning Bay of Islands and it‚Äôs surroundings as our office. It‚Äôs a beautiful place to work and we want to keep it that way for decades to come. That‚Äôs why we are committed to doing our bit to protect the environment we operate out of.','',NULL,'','','','','Protecting the Environment','We are committed to doing our bit to protect the environment we operate out of.','','','','N',NULL,NULL,0,'A',4,'2018-05-29 07:00:48','2018-05-29 08:18:45',NULL,9,9,0,0,0,'N','',1,'','');
/*!40000 ALTER TABLE `page_meta_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_meta_index`
--

DROP TABLE IF EXISTS `page_meta_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_meta_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_meta_index`
--

LOCK TABLES `page_meta_index` WRITE;
/*!40000 ALTER TABLE `page_meta_index` DISABLE KEYS */;
INSERT INTO `page_meta_index` VALUES (1,'Index and Follow (Default)','all','Use this if you want to let search engines do their normal job.'),(2,'Do not Index or Follow','none','This is for sections of a site that shouldn\'t be indexed and shouldn\'t have links followed.'),(3,'Follow, but do not Index','noindex, follow','Search engine robots can follow any links on this page but will not include this page.'),(4,'Index but do not Follow','index, nofollow','Search engine robots should include this page but not follow any links on this page.'),(5,'Do not archive','noarchive','Useful if the content changes frequently: headlines, auctions, etc. The search engine still archives the information, but won\'t show it in the results.');
/*!40000 ALTER TABLE `page_meta_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_path` varchar(255) DEFAULT NULL COMMENT 'URL to the slide-image relative to the public_html folder (recommended). ',
  `thumb_path` varchar(255) DEFAULT NULL,
  `caption_heading` varchar(255) DEFAULT NULL,
  `caption` mediumtext,
  `alt_text` varchar(255) DEFAULT NULL,
  `button_label` varchar(30) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `video_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `width` smallint(6) NOT NULL,
  `height` smallint(6) NOT NULL,
  `type` enum('N','P') NOT NULL DEFAULT 'N',
  `rank` int(11) DEFAULT NULL COMMENT 'Heirarchy/Order for the slides (lower is greater)',
  `photo_group_id` int(11) DEFAULT NULL COMMENT 'Foreign Key to the slideshow group for this slide',
  PRIMARY KEY (`id`),
  KEY `is_group` (`photo_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=255 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (241,'/library/photos/sboi-60.jpg','/uploads/2018/05/img-5ae9782bd9c13.jpg',NULL,'','Skydive Bay of Islands',NULL,NULL,'',1440,1080,'N',0,2),(242,'/library/photos/sboi-2.jpg','/uploads/2018/05/img-5ae9782c0df3b.jpg',NULL,'','Skydive Bay of Islands',NULL,NULL,'',720,1080,'N',0,2),(216,'/library/photos/sboi-59.jpg',NULL,'','','',NULL,NULL,NULL,1620,1080,'N',3,1),(237,'/library/photos/sboi-41.jpg','/uploads/2018/05/img-5ae9782b30344.jpg',NULL,'','Skydive Bay of Islands',NULL,NULL,'',1440,1080,'N',0,2),(238,'/library/photos/sboi-19.jpg','/uploads/2018/05/img-5ae9782b5804f.jpg',NULL,'','Skydive Bay of Islands',NULL,NULL,'',1440,1080,'N',0,2),(239,'/library/photos/sboi-17.jpg','/uploads/2018/05/img-5ae9782b82e40.jpg',NULL,'','Skydive Bay of Islands',NULL,NULL,'',1440,1080,'N',0,2),(232,'/library/photos/011518-14.jpg','/uploads/2018/05/img-5ae9781a4b83d.jpg',NULL,'','Skydiving at the beach in Paihia',NULL,NULL,'',1140,640,'N',7,3),(230,'/library/photos/011518-12.jpg','/uploads/2018/05/img-5ae9781a0115f.jpg',NULL,'','Skydiving at the beach in Paihia',NULL,NULL,'',1140,640,'N',5,3),(231,'/library/photos/011518-1.jpg','/uploads/2018/05/img-5ae9781a25c23.jpg',NULL,'','Skydiving at the beach in Paihia',NULL,NULL,'',1140,640,'N',6,3),(240,'/library/photos/sboi-11.jpg','/uploads/2018/05/img-5ae9782bab3b8.jpg',NULL,'','Skydive Bay of Islands',NULL,NULL,'',1620,1080,'N',0,2),(246,'/library/photos/sboi-1.jpg','/uploads/2018/05/img-5ae97843948d6.jpg',NULL,'','Skydiving at Waitangi',NULL,NULL,'',1620,1080,'N',0,4),(236,'/library/photos/sboi-10.jpg','/uploads/2018/05/img-5ae9782aeadf6.jpg',NULL,'','Skydive Bay of Islands',NULL,NULL,'',1620,1080,'N',0,2),(91,'/library/photos/sboi-2.jpg',NULL,'','','sjkdnfjsdnf;sd',NULL,NULL,NULL,720,1080,'N',2,9),(215,'/library/photos/sboi-52.jpg',NULL,'','','',NULL,NULL,NULL,1440,1080,'N',2,1),(92,'/library/photos/sboi-3.jpg',NULL,'','','',NULL,NULL,NULL,1440,1080,'N',1,9),(213,'/library/photos/011518-9.jpg',NULL,'','','',NULL,NULL,NULL,1140,640,'N',0,1),(245,'/library/photos/011518-10.jpg','/uploads/2018/05/img-5ae9784371057.jpg',NULL,'','Skydiving at Waitangi',NULL,NULL,'',1140,640,'N',0,4),(244,'/library/photos/011518-4.jpg','/uploads/2018/05/img-5ae978434f0b9.jpg',NULL,'','Skydiving at Waitangi',NULL,NULL,'',1140,640,'N',0,4),(243,'/library/photos/011518-7.jpg','/uploads/2018/05/img-5ae9784329592.jpg',NULL,'','Skydiving at Waitangi',NULL,NULL,'',1140,640,'N',0,4),(229,'/library/photos/011518-2.jpg','/uploads/2018/05/img-5ae97819d26ca.jpg',NULL,'','Skydiving at the beach in Paihia',NULL,NULL,'',1140,640,'N',4,3),(228,'/library/photos/011518-11.jpg','/uploads/2018/05/img-5ae97819ae472.jpg',NULL,'','Skydiving at the beach in Paihia',NULL,NULL,'',1140,640,'N',3,3),(227,'/library/photos/011518-13.jpg','/uploads/2018/05/img-5ae97819898c6.jpg',NULL,'','Skydiving at the beach in Paihia',NULL,NULL,'',1140,640,'N',2,3),(226,'/library/photos/011518-3.jpg','/uploads/2018/05/img-5ae9781967966.jpg',NULL,'','Skydiving at the beach in Paihia',NULL,NULL,'',1140,640,'N',1,3),(254,'/library/photos/011518-23.jpg','/uploads/2018/05/img-5ae97853c5c1e.jpg',NULL,'','The Skydive Bay of Islands crew',NULL,NULL,'',1140,640,'N',0,10),(253,'/library/photos/011518-21.jpg','/uploads/2018/05/img-5ae97853a19aa.jpg',NULL,'','The Skydive Bay of Islands crew',NULL,NULL,'',1140,640,'N',0,10),(252,'/library/photos/011518-18.jpg','/uploads/2018/05/img-5ae978537d47f.jpg',NULL,'','The Skydive Bay of Islands crew',NULL,NULL,'',1140,640,'N',0,10),(251,'/library/photos/011518-16.jpg','/uploads/2018/05/img-5ae978535a851.jpg',NULL,'','The Skydive Bay of Islands crew',NULL,NULL,'',1140,640,'N',0,10),(250,'/library/photos/011518-17.jpg','/uploads/2018/05/img-5ae9785336e5a.jpg',NULL,'','The Skydive Bay of Islands crew',NULL,NULL,'',1140,640,'N',0,10),(249,'/library/photos/011518-19.jpg','/uploads/2018/05/img-5ae9785314734.jpg',NULL,'','The Skydive Bay of Islands crew',NULL,NULL,'',1140,640,'N',0,10),(248,'/library/photos/011518-20.jpg','/uploads/2018/05/img-5ae97852e489f.jpg',NULL,'','The Skydive Bay of Islands crew',NULL,NULL,'',1140,640,'N',0,10),(235,'/library/photos/sboi-13.jpg','/uploads/2018/05/img-5ae9782ac0914.jpg',NULL,'','Skydive Bay of Islands',NULL,NULL,'',1440,1080,'N',0,2),(234,'/library/photos/sboi-43.jpg','/uploads/2018/05/img-5ae9782a96a99.jpg',NULL,'','Skydive Bay of Islands',NULL,NULL,'',1440,1080,'N',0,2),(247,'/library/photos/011518-22.jpg','/uploads/2018/05/img-5ae97852bebee.jpg',NULL,'','The Skydive Bay of Islands crew',NULL,NULL,'',1140,640,'N',0,10),(214,'/library/photos/021518-7.jpg',NULL,'','','',NULL,NULL,NULL,1140,640,'N',0,1),(212,'/library/photos/011518-3.jpg',NULL,'','','',NULL,NULL,NULL,1140,640,'N',0,1),(211,'/library/photos/011518-16.jpg',NULL,'','','',NULL,NULL,NULL,1140,640,'N',0,1),(210,'/library/photos/021518-3.jpg',NULL,'','','',NULL,NULL,NULL,1140,640,'N',0,1),(209,'/library/photos/021518-1.jpg',NULL,'','','',NULL,NULL,NULL,1140,640,'N',0,1),(208,'/library/photos/021518-2.jpg',NULL,'','','',NULL,NULL,NULL,1140,640,'N',0,1),(233,'/library/photos/011518-15.jpg','/uploads/2018/05/img-5ae9781a6eefa.jpg',NULL,'','Skydiving at the beach in Paihia',NULL,NULL,'',1140,640,'N',8,3);
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_group`
--

DROP TABLE IF EXISTS `photo_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for the slideshow/gallery group',
  `name` varchar(255) NOT NULL,
  `menu_label` varchar(255) DEFAULT NULL,
  `type` enum('C','G','S') NOT NULL DEFAULT 'S' COMMENT 'C - Carousel, G - Gallery, S - Slideshow(Default)',
  `show_in_cms` enum('N','Y') NOT NULL DEFAULT 'Y',
  `show_on_gallery_page` enum('N','Y') NOT NULL DEFAULT 'N',
  `rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_group`
--

LOCK TABLES `photo_group` WRITE;
/*!40000 ALTER TABLE `photo_group` DISABLE KEYS */;
INSERT INTO `photo_group` VALUES (1,'Home Page Slideshow',NULL,'S','Y','N',NULL),(2,'General','SBOI','G','Y','Y',NULL),(3,'Beach','Skydiving at the beach','G','Y','Y',NULL),(4,'Waitangi','Skydiving at Waitangi','G','Y','Y',NULL),(9,'Skydive Slideshow',NULL,'S','Y','N',NULL),(10,'Crew','The crew','G','Y','Y',NULL);
/*!40000 ALTER TABLE `photo_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirect`
--

DROP TABLE IF EXISTS `redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redirect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_url` mediumtext NOT NULL,
  `new_url` mediumtext NOT NULL,
  `status_code` int(11) NOT NULL,
  `status` enum('A','H','D') NOT NULL DEFAULT 'H',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redirect`
--

LOCK TABLES `redirect` WRITE;
/*!40000 ALTER TABLE `redirect` DISABLE KEYS */;
INSERT INTO `redirect` VALUES (4,'/cancelation-policy','https://www.skydivebayofislands.com/skydive',301,'A'),(5,'/jump-with-us/tandem','https://www.skydivebayofislands.com/skydive',301,'A'),(6,'/about-us/cancelation-policy','https://www.skydivebayofislands.com/terms-conditions',301,'A'),(7,'/about-us/hours-of-operation','https://www.skydivebayofislands.com/skydive/faqs',301,'A'),(8,'/faq','https://www.skydivebayofislands.com/skydive/faqs',301,'A'),(9,'/jump-with-us/learn-to-skydive','https://www.skydivebayofislands.com/skydive/learn-to-sky-dive',301,'A'),(10,'/jump-with-us/sport-skydiving','https://www.skydivebayofislands.com/skydive/sports-skydiving',301,'A'),(11,'/prices','https://www.skydivebayofislands.com/prices',301,'D'),(12,'/photos','https://www.skydivebayofislands.com/about/our-gallery',301,'A'),(13,'/jump-with-us','https://www.skydivebayofislands.com/skydive',301,'A'),(14,'/why-choose-us','https://www.skydivebayofislands.com/skydive',301,'A'),(15,'/photos/handy-cam','https://www.skydivebayofislands.com/skydive/photo-video-packages',301,'A'),(16,'/why-choose-us/testimonials','https://www.skydivebayofislands.com/reviews',301,'A'),(17,'/photos/video-gallery','https://www.skydivebayofislands.com/about/our-gallery',301,'A'),(18,'/about-us/careers','https://www.skydivebayofislands.com/about',301,'A'),(19,'/news','https://www.skydivebayofislands.com/about/blog',301,'A'),(20,'/category/news','https://www.skydivebayofislands.com/about/blog',301,'A'),(21,'/why-choose-us/skydive-bay-of-islands','https://www.skydivebayofislands.com',301,'A'),(22,'/photos/photo-gallery','https://www.skydivebayofislands.com/about/our-gallery',301,'A'),(23,'/events/gift-vouchers','https://www.skydivebayofislands.com',301,'A'),(24,'/category/news','https://www.skydivebayofislands.com/about/blog',301,'A'),(25,'/events/extend-gift-vouchers','https://www.skydivebayofislands.com',301,'A'),(26,'/about-us/privacy-policy','https://www.skydivebayofislands.com/privacy-policy',301,'A'),(27,'/events/gift-vouchers-terms-and-conditions','https://www.skydivebayofislands.com/terms-conditions',301,'A'),(28,'/events/specials','https://www.skydivebayofislands.com/combos-and-deals',301,'A'),(29,'/make-a-booking/gift-vouchers','https://www.skydivebayofislands.com',301,'A'),(30,'/why-choose-us/what-you-need-to-know','https://www.skydivebayofislands.com/skydive/faqs',301,'A'),(31,'/ian-williams-90-skydives-to-prove-age-is-just-a-number','https://www.skydivebayofislands.com/about/blog',301,'A'),(32,'/events','https://www.skydivebayofislands.com',301,'A'),(33,'/about-us/contact','https://www.skydivebayofislands.com/contact',301,'A'),(34,'/photos/beach-landings','https://www.skydivebayofislands.com/about/our-gallery',301,'A'),(35,'/about-us/location','https://www.skydivebayofislands.com/about/our-location',301,'A'),(36,'/about-us/our-team','https://www.skydivebayofislands.com/about',301,'A'),(37,'/links','https://www.skydivebayofislands.com',301,'A'),(38,'/sitemap','https://www.skydivebayofislands.com',301,'A'),(39,'/photos/beach-landings/nggallery/slideshow','https://www.skydivebayofislands.com/about/our-gallery',301,'A'),(40,'/photos/beach-landings/nggallery/thumbnails','https://www.skydivebayofislands.com/about/our-gallery',301,'A'),(41,'/prices-temp','https://www.skydivebayofislands.com/prices',301,'A'),(42,'/news/win-a-weekend','https://www.skydivebayofislands.com',301,'A'),(43,'http://www.skydivebayofislands.com/cn','https://www.skydivebayofislands.com',301,'A'),(44,'/hamish','https://www.skydivebayofislands.com',301,'A'),(45,'http://www.skydivebayofislands.com/cn','https://www.skydivebayofislands.com',301,'A'),(46,'/about-us','https://www.skydivebayofislands.com/about',301,'A'),(47,'/photos/photo-gallery/nggallery/slideshow','https://www.skydivebayofislands.com/about/our-gallery',301,'A'),(48,'/photos/photo-gallery/nggallery/page/2','https://www.skydivebayofislands.com/about/our-gallery',301,'A'),(49,'/photos/photo-gallery/nggallery/thumbnails','https://www.skydivebayofislands.com/about/our-gallery',301,'A'),(50,'/photos/photo-gallery/nggallery/page/2/slideshow','https://www.skydivebayofislands.com/about/our-gallery',301,'A'),(51,'/photos/photo-gallery/nggallery/page/2/thumbnails','https://www.skydivebayofislands.com/about/our-gallery',301,'A'),(52,'/photos/photo-gallery/nggallery/thumbnails/page/2','https://www.skydivebayofislands.com/about/our-gallery',301,'A'),(53,'/photos/photo-gallery/nggallery/page/1','https://www.skydivebayofislands.com/about/our-gallery',301,'A'),(54,'/photos/photo-gallery/nggallery/thumbnails/page/1','https://www.skydivebayofislands.com/about/our-gallery',301,'A'),(55,'/photos/photo-gallery/nggallery/page/1/slideshow','https://www.skydivebayofislands.com/about/our-gallery',301,'A'),(56,'/photos/photo-gallery/nggallery/page/1/thumbnails','https://www.skydivebayofislands.com/about/our-gallery',301,'A');
/*!40000 ALTER TABLE `redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_name` varchar(150) DEFAULT NULL,
  `person_location` varchar(150) DEFAULT NULL,
  `photo_path` varchar(225) DEFAULT NULL,
  `description` text,
  `date_posted` date DEFAULT NULL,
  `type` enum('P','A') DEFAULT 'P',
  `status` enum('A','D','H') NOT NULL DEFAULT 'H',
  `rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'Dan Kam','','','WHAT  A  RUSH!  Best  place  in  the  WORLD  to  go  Skydiving!    Profession  and  patient!!    Very  Trusted!  let\'s  go  again!','2018-03-22','P','A',1),(2,'Testing review','','','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam euismod massa id est elementum molestie. In id pellentesque sem, vitae eleifend velit. Praesent ac justo sagittis libero facilisis tincidunt. Morbi porta est ac auctor viverra. Fusce pharetra consectetur consectetur. Duis efficitur imperdiet est, eget dignissim magna congue quis. Curabitur sit amet ligula eget massa faucibus fringilla. Aliquam erat volutpat. Duis vel risus tristique, faucibus mi a, pulvinar odio. Etiam pharetra, nibh nec laoreet semper, orci nibh lacinia est, a iaculis metus quam ut leo. Maecenas vel ex condimentum, ultricies orci non, tincidunt leo. Suspendisse sit amet massa massa. Aliquam at ipsum nec diam ultricies consectetur in et tellus. Sed diam orci, finibus lobortis condimentum a, imperdiet at lectus. Nunc eu nisl vel ligula porta imperdiet. Donec sit amet pharetra nibh, et tempus purus.','2018-05-01','P','D',10),(3,'Daniel Young','','','Awesome  experience  and  a  great  team  -  70  sec  of  freefall  over  the  Bay  of  Islands  is  unforgettable  The  laid  back  and  friendly  (albeit  competent)  team  made  the  whole  experience  a  breeze  and  something  that  i  would  totally  recommend.  Special  thanks  to  Jana  for  making  the  jump  itself  a  very  exciting  and  memorable  experience  that  was  definitely  the  best  of  my  3  jumps.','0000-00-00','P','A',5),(4,'Luke Saltzer','','','I\'ve  always  wanted  to  do  sky  diving  and  this  place  was  the  best  place  to  do  it.  The  views  are  amazing  and  breathtaking.','0000-00-00','P','A',7),(5,'Anthony Gattari','','','No  real  way  to  describe  this...  you  just  have  to  do  it  for  yourself.  If  you\'re  going  to  jump  out  of  a  plane,  what  better  location.  The  team  were  really  professional  and  a  big  thanks  to  Jana  who  helped  keep  my  anxiety  levels  low.  HIGHLY  RECOMMENDED!','0000-00-00','P','A',6),(6,'Susannah Reekie','','','Pretty  much  the  best  thing  I‚Äôve  done  in  NZ.  Lovely  staff,  awesome  instructor  and  would  recommend  to  anyone  wanting  an  awesome  skydive.  Compared  to  other  places,  not  a  bad  price  either.','0000-00-00','P','A',8),(7,'Anna Wood','','','Amazing  experience  with  the  Legendary  Dan  Tothill.  I\'ve  done  a  few  tandems  in  NZ  and  abroad,  and  Dan\'s  enthusiasm  and  humor  made  it  my  best  jump  yet.  Cant  recommend  a  better  way  to  see  the  beautiful  Bay  Of  Islands.','0000-00-00','P','A',9),(8,'Katharina Schaetzle','','','What  an  amazing  team  at  Skydive  Bay  of  Islands,  a  must  do  while  your  here  in  the  far  north.  The  team  here  makes  it  that  much  better.  thank  you,  we  will  be  back!  Daniel  my  instructor  is  the  Man.','0000-00-00','P','A',2),(9,'Patricia Wentworth','','','One  of  the  most    thrilling  things  I\'ve  done,  there\'s  no  other  feeling  like  it.  Thanks  to  my  instructor  Dan,  who  made  me  laugh  the  whole  time  which  helped  with  the  nerves.','0000-00-00','P','A',12),(10,'Natasha McFadden','','','This  was  my  second  skydive  and  I  did  it  mostly  because  I  wanted  to  admire  the  view  over  the  beautiful  bay  of  islands.  And  what  a  view  it  was.  We  had  perfect  weather  conditions  and  I  could  see  up  to  the  east  and  the  west  coast.  So  brilliant!  The  free  fall  leaves  you  speechless,  you\'re  just  constantly  grinning  and  the  flying  part  with  the  parachute  gives  you  the  opportunity  to  admire  the  view  again.  My  tandem  partner  Daniel  was  brilliant!  Thanks  for  the  great  experience.  It  was  by  far  better  than  my  first  skydive.','0000-00-00','P','A',3),(11,'Trish B','','','The  jump  was  incredible  -  words  can‚Äôt  describe  the  feeling.  I‚Äôm  not  really  one  for  thrill  seeking  but  I  am  so  glad  I  did  the  16,000  ft  drop!','0000-00-00','P','A',11),(12,'Sophie Enstrom','','','Incredible  experience,  the  staff  made  me  feel  at  ease  and  totally  safe  the  whole  time.  would  recommend  to  any  adrenaline  junkies  out  there!!!  Jimmy  was  my  tandem  master  and  he  couldn\'t  have  been  any  better!!!  Leeanne  was  especially  lovely,  as  she  was  driving  she  talked  us  through  everything  and  kept  everyone  relaxed','0000-00-00','P','A',10),(13,'Untitled',NULL,NULL,NULL,NULL,'P','D',NULL),(14,'Igor Radosevic','','','Jumping  from  a  plane  was  great,  but  the  people  who  work  there  make  the  whole  experience  even  better.  Highly  recommended  activity  in  stunning  bay  of  islands.  Also,  don\'t  make  a  mistake  and  grab  a  video  package  from  this  guys,  it\'s  so  worth  it.  Best  of  luck  team.','0000-00-00','P','A',4),(15,'Untitled',NULL,NULL,NULL,NULL,'P','H',0);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_links`
--

DROP TABLE IF EXISTS `social_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `icon_path` varchar(255) DEFAULT NULL,
  `second_icon_path` varchar(255) DEFAULT NULL,
  `icon_alt` varchar(255) DEFAULT NULL,
  `widget_blob` text,
  `placement` enum('L','R') DEFAULT 'L',
  `use_icon` enum('0','1') DEFAULT '0',
  `icon_cls` varchar(255) DEFAULT NULL,
  `element_class` varchar(100) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `has_widget` enum('0','1') DEFAULT '0',
  `is_external` enum('0','1') DEFAULT '0',
  `is_active` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_links`
--

LOCK TABLES `social_links` WRITE;
/*!40000 ALTER TABLE `social_links` DISABLE KEYS */;
INSERT INTO `social_links` VALUES (1,'Facebook URL','https://www.facebook.com/pg/skydivebayofislands/posts/','Join us on Facebook',NULL,NULL,'Join us on Facebook',NULL,'L','1','fab fa-facebook-f',NULL,1,'0','1','1'),(2,'Twitter URL','','Follow us on Twitter',NULL,NULL,'Follow us on Twitter',NULL,'L','1','fab fa-twitter',NULL,4,'0','1','1'),(3,'Instagram URL','https://www.instagram.com/skydiveboi/','Follow us on Instagram',NULL,NULL,'Follow us on Instagram',NULL,'L','1','fab fa-instagram',NULL,2,'0','1','1'),(4,'Pinterest URL','','Follow us on social Pinterest',NULL,NULL,'Follow us on social Pinterest',NULL,'L','1','fab fa-pinterest',NULL,3,'0','1','1'),(5,'Google+ URL','','Follow us on Google+',NULL,NULL,'Follow us on Google+',NULL,'L','1','fab fa-google-plus-g',NULL,5,'0','1','1'),(6,'Youtube URL','','Follow us on Youtube',NULL,NULL,'Follow us on Youtube',NULL,'L','1','fab fa-youtube',NULL,6,'0','1','1'),(7,'Tripadvisor URL','https://www.tripadvisor.co.nz/Attraction_Review-g255110-d5011960-Reviews-Skydive_Bay_of_Islands-Paihia_Bay_of_Islands_Northland_Region_North_Island.html','View our photos on Tripadvisor',NULL,NULL,'View our photos on Tripadvisor',NULL,'L','1','fab fa-tripadvisor',NULL,7,'0','1','1');
/*!40000 ALTER TABLE `social_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specials`
--

DROP TABLE IF EXISTS `specials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` varchar(255) DEFAULT NULL,
  `featured` enum('Y','N') NOT NULL DEFAULT 'N',
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `page_meta_data_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specials`
--

LOCK TABLES `specials` WRITE;
/*!40000 ALTER TABLE `specials` DISABLE KEYS */;
INSERT INTO `specials` VALUES (1,'Free Upgrade','Y','2018-03-21','2018-05-31',24),(2,'256','Y','2018-03-07','2018-05-31',25),(3,'52','Y','2018-03-08','2018-05-31',26),(4,'50 dollars off your jump','Y','2018-03-13','2018-05-31',28),(5,'500','Y','2018-04-01','2018-04-30',49),(6,'10% off','Y','2018-05-01','2019-03-31',65),(7,'$$','Y','2018-04-24','2018-09-07',66),(8,'80.00','Y','2018-05-01','2019-03-31',69);
/*!40000 ALTER TABLE `specials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templates_normal`
--

DROP TABLE IF EXISTS `templates_normal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templates_normal` (
  `tmpl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for template',
  `tmpl_name` varchar(100) DEFAULT NULL COMMENT 'Template name',
  `tmpl_path` varchar(100) DEFAULT NULL COMMENT 'Template URL (i.e. ''default'', ''shop'', ''googlemap'' etc). It is recommended that you leave the extension up to the application/code.',
  `tmpl_previewimg` varchar(100) DEFAULT NULL,
  `tmpl_nummoduletags` int(11) NOT NULL DEFAULT '0',
  `tmpl_showincms` varchar(1) NOT NULL DEFAULT 'Y',
  `tmpl_mobile` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`tmpl_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templates_normal`
--

LOCK TABLES `templates_normal` WRITE;
/*!40000 ALTER TABLE `templates_normal` DISABLE KEYS */;
INSERT INTO `templates_normal` VALUES (1,'Default','index.html',NULL,0,'Y',NULL);
/*!40000 ALTER TABLE `templates_normal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonial`
--

DROP TABLE IF EXISTS `testimonial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testimonial` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for the testimonial',
  `person` varchar(100) DEFAULT NULL COMMENT 'Who represents this testimonial',
  `company` varchar(100) NOT NULL,
  `detail` mediumtext COMMENT 'The testimonial itself',
  `status` enum('A','D','H') DEFAULT 'H' COMMENT 'Boolean for whether or not the current testimonial should be displayed. (0 = off, 1=on)',
  `rank` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonial`
--

LOCK TABLES `testimonial` WRITE;
/*!40000 ALTER TABLE `testimonial` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonial` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-30 15:49:23
