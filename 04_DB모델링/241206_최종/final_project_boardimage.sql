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
-- Table structure for table `boardimage`
--

DROP TABLE IF EXISTS `boardimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boardimage` (
  `boardimage_no` int NOT NULL AUTO_INCREMENT,
  `board_no` int NOT NULL,
  `boardimage_name` varchar(255) NOT NULL,
  `boardimage_default_name` varchar(50) NOT NULL,
  PRIMARY KEY (`boardimage_no`),
  KEY `FK_board_TO_boardimage` (`board_no`),
  CONSTRAINT `FK_board_TO_boardimage` FOREIGN KEY (`board_no`) REFERENCES `board` (`board_no`)
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boardimage`
--

LOCK TABLES `boardimage` WRITE;
/*!40000 ALTER TABLE `boardimage` DISABLE KEYS */;
INSERT INTO `boardimage` VALUES (251,160,'c9a6fad9-1edf-4a64-91b6-c52ba186ee31','default5.jpg'),(252,160,'a6459b4e-fe9e-4048-ac3c-6b09be58cd31','강원도 횡성 풍수원성당.jpg'),(253,173,'bd9f6656-3e92-4c67-a5d4-cfc92eecc3ee','제주 노을.jpg'),(254,173,'fe7fd7fb-a4f0-4290-9ff5-572e2ccc695e','충북제찬비봉산.jpg'),(255,175,'0ce2dc29-4d0e-4131-b36a-e384102b698d','울산고래.jpg'),(256,178,'e01d5fa5-ecb5-47db-ab80-1f6f7504925c','서울인사동 공예.jpg'),(257,180,'ca1f503c-4901-41ee-89a8-71eebe1b60a5','서울 종로삼해소주.jpg'),(258,182,'845f95ef-c749-4a9a-b9c7-678f8c3627ff','서울인사동공예길.jpg'),(259,184,'02d64632-63a4-4835-8f26-038b89572c26','빠지.jpg'),(260,187,'529c49e0-be03-4c62-b7e5-a3abdbf099d1','절.jpg'),(261,189,'533395a9-063a-4ba5-b2a3-a7d369a5cd8a','고등어회.jpg'),(262,198,'3b34ee89-2b83-493e-8848-d36aa86cb315','양평묵호항.jpg'),(263,199,'0f5673b3-1d10-44aa-b433-9aa1ffcfa1dc','서울 종로삼해소주.jpg'),(264,200,'fa01737d-d240-4ee7-91f6-d3b8b6141afc','제주귤.jpg'),(265,201,'e286531d-eb65-4b14-9b93-7d3676742d91','튀소조지기.jpg'),(266,202,'d3403cce-f310-4076-9d05-fb1fa446a63d','거제뭉돌.jpg'),(267,203,'f504ed09-e8a8-4d9e-837d-355b9faddd4d','홍대.jpg'),(269,204,'79725f88-51e1-462c-a7c7-351bb9128e5a','서울인사동공예길.jpg'),(270,205,'3b5baad9-f7ff-4fda-b2e5-003d9fc7dc7d','default6.jpg'),(271,207,'3bac6dee-50fb-4c1e-87bb-a042bd2d696b','해돋이.jpg'),(275,209,'58f2c768-62e2-4dc1-b821-3e2c81c419c2','강원도철원 가을.jpg'),(276,210,'8be44967-2830-42bb-9e05-8d12f980f845','울산고래.jpg'),(281,211,'735d341c-7f92-400a-bc1f-02e3afab3ee6','전주 경기전.jpg'),(282,211,'4298ca8a-a4a7-4b45-b3b7-fd93e65f032c','전주 고현당.jpg'),(283,211,'d83284c3-635f-48db-b35e-7e0bf9420dc1','전주경기전.jpg'),(292,213,'b7896312-3f17-4a1f-a2ed-351b7760808e','1.반포공원.jpg'),(293,213,'ad159aed-c64e-447e-999b-250d7cc10c69','2.페스티벌.jpg'),(294,213,'4742f4ec-a826-4c34-a52e-ace3e27e3c29','3.길상도예.png'),(295,213,'99b0bc58-7091-4245-8c07-b420f6625d35','4.에비뉴.jpg'),(302,208,'92455914-16d1-415c-a35c-8e7df6a1b7a3','서원안길.jpg'),(303,208,'c72b96a3-d794-4212-930c-309aeafb5c0a','카페마루.jpg'),(304,208,'eccb9aee-53a9-4dd6-9551-61e7a41c1f9d','cafe.png'),(305,234,'0f190e5e-8e92-4a47-97d4-e244ade90ea1','ㅇㄷ (5).jpg'),(324,244,'9baeb5bb-a189-4db2-8513-b8f1686e6b15','야경 1.jpg'),(325,244,'7f4441ad-6751-44dc-9d00-e7e8dfb44e48','야경.jpg'),(326,244,'4cc17068-5197-4cc8-99d5-ab30a2a30f0c','한강.jpg');
/*!40000 ALTER TABLE `boardimage` ENABLE KEYS */;
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

-- Dump completed on 2024-12-06 12:59:31
