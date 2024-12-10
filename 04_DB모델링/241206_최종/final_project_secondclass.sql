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
-- Table structure for table `secondclass`
--

DROP TABLE IF EXISTS `secondclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secondclass` (
  `secondclass_code` varchar(50) NOT NULL COMMENT '중분류코드',
  `firstclass_code` varchar(50) DEFAULT NULL COMMENT '대분류코드',
  `secondclass_name` varchar(50) NOT NULL COMMENT '중분류명',
  PRIMARY KEY (`secondclass_code`),
  UNIQUE KEY `UIX_secondclass` (`secondclass_code`),
  KEY `FK_firstclass_TO_secondclass` (`firstclass_code`),
  CONSTRAINT `FK_firstclass_TO_secondclass` FOREIGN KEY (`firstclass_code`) REFERENCES `firstclass` (`firstclass_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='여행지유형중분류';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secondclass`
--

LOCK TABLES `secondclass` WRITE;
/*!40000 ALTER TABLE `secondclass` DISABLE KEYS */;
INSERT INTO `secondclass` VALUES ('A0101','A01','자연관광지'),('A0102','A01','관광자원'),('A0201','A02','역사관광지'),('A0202','A02','휴양관광지'),('A0203','A02','체험관광지'),('A0204','A02','산업관광지'),('A0205','A02','건축/조형물'),('A0206','A02','문화시설'),('A0207','A02','축제'),('A0208','A02','공연/행사'),('A0301','A03','레포츠소개'),('A0302','A03','육상 레포츠'),('A0303','A03','수상 레포츠'),('A0304','A03','항공 레포츠'),('A0305','A03','복합 레포츠'),('A0401','A04','쇼핑'),('A0502','A05','음식점'),('B0201','B02','숙박시설'),('C0112','C01','가족코스'),('C0113','C01','나홀로코스'),('C0114','C01','힐링코스'),('C0115','C01','도보코스'),('C0116','C01','캠핑코스'),('C0117','C01','맛코스');
/*!40000 ALTER TABLE `secondclass` ENABLE KEYS */;
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

-- Dump completed on 2024-12-06 12:59:34
