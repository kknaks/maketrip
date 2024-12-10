CREATE DATABASE  IF NOT EXISTS `final_project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `final_project`;
-- MySQL dump 10.13  Distrib 8.0.40, for macos14 (arm64)
--
-- Host: db-2vl2kg-kr.vpc-pub-cdb.ntruss.com    Database: final_project
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

-- SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'cc2f6008-9b28-11ef-a161-f220afbbeb6d:1-22689';

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notification_no` bigint NOT NULL AUTO_INCREMENT,
  `user_no` bigint NOT NULL,
  `message` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notification_no`),
  KEY `user_no` (`user_no`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,3,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=107',1,'2024-11-19 10:23:21'),(2,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=108',1,'2024-11-19 10:23:50'),(3,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=108',1,'2024-11-19 10:26:12'),(4,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=100',1,'2024-11-19 10:30:23'),(5,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=100',1,'2024-11-19 10:32:10'),(6,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=100',1,'2024-11-19 10:32:33'),(7,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=100',1,'2024-11-19 10:35:13'),(8,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=100',1,'2024-11-19 10:37:14'),(9,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=100',1,'2024-11-19 10:39:22'),(10,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=100',1,'2024-11-19 10:39:37'),(11,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=100',1,'2024-11-19 10:41:51'),(13,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=112',1,'2024-11-20 06:19:37'),(14,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=100',1,'2024-11-20 06:20:01'),(15,3,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=22',1,'2024-11-20 06:21:04'),(16,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=112',1,'2024-11-20 06:42:58'),(17,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=100',1,'2024-11-20 06:43:56'),(18,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=100',1,'2024-11-20 06:44:58'),(19,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=112',1,'2024-11-20 06:45:05'),(20,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=100',1,'2024-11-20 07:18:49'),(21,3,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=22',1,'2024-11-20 07:19:15'),(22,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=112',1,'2024-11-20 07:57:46'),(23,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=100',1,'2024-11-20 07:57:53'),(24,3,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=116',1,'2024-11-20 07:59:39'),(25,3,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=115',1,'2024-11-20 07:59:50'),(26,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=120',1,'2024-11-20 14:35:59'),(27,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=119',1,'2024-11-20 14:36:36'),(28,3,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=124',1,'2024-11-20 14:53:34'),(29,3,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=123',1,'2024-11-20 14:53:48'),(30,3,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=123',1,'2024-11-20 15:02:39'),(31,3,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=123',1,'2024-11-20 15:04:31'),(32,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=120',1,'2024-11-20 15:09:17'),(33,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=120',1,'2024-11-20 15:09:20'),(34,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=120',1,'2024-11-21 00:36:44'),(35,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=120',1,'2024-11-21 00:36:50'),(36,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=119',1,'2024-11-21 00:37:09'),(37,3,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=124',1,'2024-11-21 00:57:27'),(38,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=120',1,'2024-11-21 01:37:26'),(39,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=120',1,'2024-11-21 02:46:24'),(40,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=142',1,'2024-11-25 06:26:36'),(41,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=147',1,'2024-11-26 06:42:04'),(42,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=134',1,'2024-11-26 06:42:23'),(43,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=134',1,'2024-11-26 06:46:50'),(44,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=134',1,'2024-11-26 06:52:37'),(45,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=160',1,'2024-11-27 09:09:17'),(46,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=160',1,'2024-11-27 09:09:26'),(47,7,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=167',1,'2024-11-28 04:24:46'),(48,7,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=167',1,'2024-11-28 04:24:50'),(49,7,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=167',1,'2024-11-28 04:24:52'),(50,7,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=167',1,'2024-11-28 04:24:56'),(51,5,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=181',0,'2024-11-28 04:25:07'),(52,7,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=195',1,'2024-11-28 04:25:29'),(53,7,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=195',1,'2024-11-28 04:25:32'),(54,7,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=195',1,'2024-11-28 04:25:34'),(55,36,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=194',0,'2024-11-28 04:25:42'),(56,36,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=192',0,'2024-11-28 04:25:47'),(57,36,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=192',0,'2024-11-28 04:25:50'),(58,11,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=191',0,'2024-11-28 04:25:55'),(59,3,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=185',0,'2024-11-28 04:26:06'),(60,3,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=185',0,'2024-11-28 04:26:09'),(61,3,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=185',0,'2024-11-28 04:26:12'),(62,11,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=190',0,'2024-11-28 04:26:20'),(63,36,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=193',0,'2024-11-28 04:26:26'),(64,11,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=191',0,'2024-11-28 04:26:31'),(65,11,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=191',0,'2024-11-28 04:26:34'),(66,5,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=183',0,'2024-11-28 04:26:48'),(67,5,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=183',0,'2024-11-28 04:26:53'),(68,5,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=183',0,'2024-11-28 04:26:56'),(69,11,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=190',0,'2024-11-28 04:30:01'),(70,3,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=186',0,'2024-11-28 04:30:13'),(71,36,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=194',0,'2024-11-28 04:31:31'),(72,4,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=177',0,'2024-11-28 04:31:46'),(73,4,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=177',0,'2024-11-28 04:31:50'),(74,8,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=176',0,'2024-11-28 04:32:06'),(75,8,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=176',0,'2024-11-28 04:32:08'),(76,8,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=176',0,'2024-11-28 04:32:10'),(77,8,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=172',0,'2024-11-28 04:32:47'),(78,8,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=172',0,'2024-11-28 04:32:50'),(79,8,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=172',0,'2024-11-28 04:32:53'),(80,8,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=172',0,'2024-11-28 04:32:56'),(81,7,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=165',1,'2024-11-28 04:33:34'),(82,7,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=170',1,'2024-11-28 04:36:37'),(83,7,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=170',1,'2024-11-28 04:36:39'),(84,7,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=167',1,'2024-11-28 04:36:50'),(85,7,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=167',1,'2024-11-28 04:36:53'),(86,4,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=177',0,'2024-11-28 04:37:02'),(87,4,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=177',0,'2024-11-28 04:37:05'),(88,4,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=177',0,'2024-11-28 04:37:07'),(89,11,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=191',0,'2024-11-28 04:37:19'),(90,11,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=191',0,'2024-11-28 04:37:21'),(91,7,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=165',1,'2024-11-28 04:39:35'),(92,7,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=165',1,'2024-11-28 04:47:22'),(93,7,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=165',1,'2024-11-28 04:47:58'),(94,8,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=210',0,'2024-11-28 05:26:26'),(95,35,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=208',0,'2024-11-28 05:26:44'),(96,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=213',1,'2024-11-28 05:47:37'),(97,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=213',1,'2024-11-28 05:48:21'),(98,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=213',1,'2024-11-28 05:48:48'),(99,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=213',1,'2024-11-28 05:49:21'),(100,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=213',1,'2024-11-28 05:50:27'),(101,11,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=191',0,'2024-11-28 09:12:58'),(102,7,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=165',1,'2024-11-28 09:17:41'),(103,35,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=208',0,'2024-11-29 02:24:45'),(104,35,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=208',0,'2024-11-29 02:25:32'),(105,9,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=196',1,'2024-11-29 06:30:22'),(106,2,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=213',0,'2024-11-29 06:30:39'),(107,5,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=183',0,'2024-11-29 06:31:00'),(108,8,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=210',0,'2024-11-29 06:31:26'),(109,11,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=211',0,'2024-11-29 09:18:03'),(110,11,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=205',0,'2024-11-29 09:18:15'),(111,11,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=206',0,'2024-11-29 09:18:34'),(112,7,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/review/view?boardNo=180',1,'2024-11-29 09:18:55'),(113,7,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=165',0,'2024-12-01 14:47:43'),(114,7,'회원님이 작성한 게시글에 댓글이 달렸습니다.','/question/view?boardNo=165',1,'2024-12-01 14:47:49');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-06 12:59:30
