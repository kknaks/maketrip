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
-- Table structure for table `boardlike`
--

DROP TABLE IF EXISTS `boardlike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boardlike` (
  `board_no` int NOT NULL COMMENT '게시판번호',
  `user_no` bigint NOT NULL COMMENT '유저번호',
  `like_add_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '추가일자',
  PRIMARY KEY (`board_no`,`user_no`),
  KEY `FK_user_TO_boardlike` (`user_no`),
  CONSTRAINT `FK_board_TO_boardlike` FOREIGN KEY (`board_no`) REFERENCES `board` (`board_no`) ON DELETE CASCADE,
  CONSTRAINT `FK_user_TO_boardlike` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='좋아요';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boardlike`
--

LOCK TABLES `boardlike` WRITE;
/*!40000 ALTER TABLE `boardlike` DISABLE KEYS */;
INSERT INTO `boardlike` VALUES (160,7,'2024-11-28 12:00:27'),(165,3,'2024-11-28 13:48:31'),(165,7,'2024-12-01 19:10:21'),(165,8,'2024-11-28 12:55:24'),(165,9,'2024-11-28 18:10:20'),(165,11,'2024-11-28 14:10:52'),(167,7,'2024-11-28 13:44:05'),(170,9,'2024-11-28 13:36:35'),(172,5,'2024-11-28 12:57:13'),(172,8,'2024-11-28 12:55:16'),(172,9,'2024-11-28 13:32:45'),(174,7,'2024-11-28 13:43:50'),(174,8,'2024-11-28 13:38:40'),(174,9,'2024-11-28 13:32:22'),(177,7,'2024-11-28 13:44:00'),(177,8,'2024-11-28 12:55:08'),(179,5,'2024-11-28 12:57:08'),(179,8,'2024-11-28 12:55:11'),(180,8,'2024-11-28 12:55:01'),(181,3,'2024-11-28 13:48:49'),(181,5,'2024-11-28 12:57:03'),(181,8,'2024-11-28 13:38:22'),(181,9,'2024-11-28 13:31:17'),(185,9,'2024-11-28 13:31:09'),(186,7,'2024-11-28 13:44:09'),(186,8,'2024-11-28 13:38:15'),(186,9,'2024-11-28 13:30:11'),(187,3,'2024-11-28 13:49:12'),(191,3,'2024-11-28 13:48:26'),(191,8,'2024-11-28 13:38:10'),(191,9,'2024-11-28 13:30:44'),(192,7,'2024-11-28 13:44:14'),(192,9,'2024-11-28 13:37:48'),(193,3,'2024-11-28 13:48:19'),(193,8,'2024-11-28 13:38:28'),(193,9,'2024-11-28 13:33:05'),(195,9,'2024-11-28 13:33:09'),(196,8,'2024-11-28 13:38:03'),(196,9,'2024-11-28 13:25:17'),(197,8,'2024-11-28 13:37:59'),(206,11,'2024-11-28 14:10:32'),(213,7,'2024-11-28 15:34:49'),(213,9,'2024-11-28 14:50:57'),(213,11,'2024-11-28 14:50:41'),(213,36,'2024-11-28 14:52:34');
/*!40000 ALTER TABLE `boardlike` ENABLE KEYS */;
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

-- Dump completed on 2024-12-06 12:59:35
