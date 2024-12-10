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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_no` int NOT NULL AUTO_INCREMENT COMMENT '댓글번호',
  `board_no` int NOT NULL COMMENT '게시판번호',
  `user_no` bigint NOT NULL COMMENT '유저번호',
  `comment_content` text NOT NULL COMMENT '댓글내용',
  `comment_created_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '댓글작성시간',
  PRIMARY KEY (`comment_no`),
  KEY `FK_user_TO_comment` (`user_no`),
  KEY `FK_board_TO_comment` (`board_no`),
  CONSTRAINT `FK_board_TO_comment` FOREIGN KEY (`board_no`) REFERENCES `board` (`board_no`) ON DELETE CASCADE,
  CONSTRAINT `FK_user_TO_comment` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='댓글';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (192,167,9,'123','2024-11-28 13:24:46'),(193,167,9,'11','2024-11-28 13:24:50'),(194,167,9,'22','2024-11-28 13:24:52'),(195,167,9,'44','2024-11-28 13:24:56'),(196,181,9,'123','2024-11-28 13:25:07'),(197,196,9,'44','2024-11-28 13:25:14'),(198,195,9,'213','2024-11-28 13:25:29'),(199,195,9,'234','2024-11-28 13:25:32'),(200,195,9,'234','2024-11-28 13:25:34'),(201,194,9,'44444444444','2024-11-28 13:25:42'),(202,192,9,'111111111111111','2024-11-28 13:25:47'),(203,192,9,'11111111111111111111','2024-11-28 13:25:50'),(204,191,9,'123','2024-11-28 13:25:55'),(205,185,9,'1','2024-11-28 13:26:06'),(206,185,9,'55555555555','2024-11-28 13:26:09'),(207,185,9,'5555555555555','2024-11-28 13:26:12'),(209,193,9,'123','2024-11-28 13:26:26'),(210,191,9,'123','2024-11-28 13:26:31'),(211,191,9,'123','2024-11-28 13:26:34'),(212,183,9,'123123','2024-11-28 13:26:48'),(213,183,9,'33333333333333333333333333','2024-11-28 13:26:53'),(214,183,9,'2222222222222222','2024-11-28 13:26:56'),(215,179,9,'55555555555555555555','2024-11-28 13:27:06'),(216,179,9,'555555555555555555','2024-11-28 13:27:09'),(218,186,9,'','2024-11-28 13:30:13'),(219,194,9,'','2024-11-28 13:31:31'),(220,177,9,'','2024-11-28 13:31:46'),(221,177,9,'','2024-11-28 13:31:50'),(222,176,9,'','2024-11-28 13:32:06'),(223,176,9,'','2024-11-28 13:32:08'),(224,176,9,'','2024-11-28 13:32:10'),(225,172,9,'','2024-11-28 13:32:47'),(226,172,9,'','2024-11-28 13:32:50'),(227,172,9,'','2024-11-28 13:32:53'),(228,172,9,'','2024-11-28 13:32:56'),(229,165,9,'일정 괜찮은데요','2024-11-28 13:33:34'),(230,170,9,'','2024-11-28 13:36:37'),(231,170,9,'','2024-11-28 13:36:39'),(232,167,9,'','2024-11-28 13:36:50'),(233,167,9,'','2024-11-28 13:36:53'),(234,177,9,'','2024-11-28 13:37:02'),(235,177,9,'','2024-11-28 13:37:05'),(236,177,9,'','2024-11-28 13:37:07'),(237,191,9,'','2024-11-28 13:37:19'),(238,191,9,'','2024-11-28 13:37:21'),(239,165,8,'뽀삐 왔다 가요','2024-11-28 13:39:35'),(241,165,3,'고운 가봤는데 깔끔하고 한옥 느낌 너무 좋았어요!!','2024-11-28 13:47:58'),(242,187,3,'','2024-11-28 13:49:15'),(243,210,11,'와 울산 진짜 좋네요\r\n고래 동상 너무 귀여워요 ㅋㅋㅋ','2024-11-28 14:26:26'),(244,208,11,'사진만 봐도 커피 향이 느껴지네요','2024-11-28 14:26:44'),(245,213,4,'야경이 진짜 너무 이쁘네요..\r\n저도 가고싶어요!!','2024-11-28 14:47:37'),(246,213,7,'구룡산.. 좋죠..\r\n딱 단풍질때 가면 진짜 너무 이뻐요','2024-11-28 14:48:21'),(248,213,9,'ㅋㅋㅋ 저도 페스티벌 갔다왔는데 \r\n옆에 계셨을 수도 있겠네요!!','2024-11-28 14:49:21'),(249,213,11,'근린 공원 근처에 \"빠스타\" 라고 파스타집 있는데\r\n거기가 진짜 맛집이에요 다음에 한번 가보세요!','2024-11-28 14:50:27'),(254,191,9,'좋은데요?','2024-11-28 18:12:58'),(255,165,2,'경복궁 야간 개장도 한다는데 찾아보세요! 야경 예쁨','2024-11-28 18:17:41'),(258,208,2,'여러 고원에 가서 힐링하고 오셨네요\r\n저도 가고싶어요','2024-11-29 11:24:45'),(259,208,4,'광덕산 주변 카페에 풍경이 이쁜 곳이 많죠 !!','2024-11-29 11:25:32'),(260,196,7,'서울 재미있게 즐기고 오셨네요!!','2024-11-29 15:30:22'),(261,213,7,'진짜 한강 야경만 한 게 없죠','2024-11-29 15:30:39'),(262,183,7,'맞아요 ㅋㅋㅋㅋ','2024-11-29 15:31:00'),(263,210,7,'이제 날도 추워져서 슬슬 방어회 먹으러 가야되는데','2024-11-29 15:31:26'),(265,165,7,'댓글 등록','2024-11-29 17:25:59'),(266,211,2,'나들이 하기 좋은 날씨에 잘 다녀오셨네요','2024-11-29 18:18:03'),(267,205,2,'즐겨찾기 추가했다가 다음에 다시 보러와야겠다','2024-11-29 18:18:15'),(268,206,2,'귤 익는 시기에 가시면 한봉지 그냥 주시고 그래요!','2024-11-29 18:18:33'),(269,180,2,'서울에도 생각보다 한옥호텔 같은게 많네요','2024-11-29 18:18:55'),(271,165,11,'일정 너무 좋은데요!!','2024-12-01 23:47:43'),(272,165,11,'저도 가보고 싶어요!!','2024-12-01 23:47:49');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
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

-- Dump completed on 2024-12-06 12:59:32
