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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_no` bigint NOT NULL AUTO_INCREMENT COMMENT '유저번호',
  `user_photo` varchar(255) DEFAULT NULL COMMENT '프로필사진',
  `user_lastest_login` datetime NOT NULL COMMENT '마지막로그인날짜',
  `user_email` varchar(40) NOT NULL COMMENT '이메일',
  `user_password` varchar(255) NOT NULL COMMENT '비밀번호',
  `user_tel` varchar(30) NOT NULL COMMENT '연락처',
  `user_created_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '가입일',
  `user_nickname` varchar(50) NOT NULL COMMENT '닉네임',
  `user_role` varchar(20) NOT NULL DEFAULT 'ROLE_USER' COMMENT '권한여부',
  `user_block` tinyint NOT NULL DEFAULT '0' COMMENT '차단여부',
  `sns_no` int DEFAULT NULL COMMENT 'SNS번호',
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_no`),
  UNIQUE KEY `UIX_user` (`user_email`),
  UNIQUE KEY `UIX_user2` (`user_nickname`),
  KEY `FK_sns_TO_user` (`sns_no`),
  CONSTRAINT `FK_sns_TO_user` FOREIGN KEY (`sns_no`) REFERENCES `sns` (`sns_no`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='유저';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'98355b51-8970-417d-8b48-5281499dbefd','2024-12-02 00:34:40','admin@everytrip.com','$2a$10$FVRfGpKHg1rMCVlz6lULmuIHOWZkC9G0D91B5tV0xREKhl6kOn7ye','010-7546-6487','2024-11-11 16:13:17','관리자1','ROLE_ADMIN',0,NULL,NULL),(2,'b5cb400b-f341-4780-820a-d9cb00a7249d','2024-12-02 00:32:14','bovob@naver.com','$2a$10$NveUDGBiDC4mySzlGq7d8Ou.9eAhuXxWiWIejYAG./xyNDEUuXbQ2','010-0377-9988','2024-11-11 16:13:17','여행모코코','ROLE_USER',0,NULL,NULL),(3,'18611aac-a14f-4b50-8151-d91accdd6582','2024-11-29 18:27:10','wowjd6724@naver.com','$2a$10$wJrNcsYzep91d2ZDhwnPbO99wqjvlGnFyvRfJDfNQ3onnp/0etBbC','010-8487-5937','2024-11-11 16:13:17','축신호날두','ROLE_USER',0,NULL,NULL),(4,'0f9603af-5066-4dba-bb9b-98e66b026a46','2024-12-01 15:52:34','goodlife6yr@naver.com','$2a$10$BtiZ6S9o9POqWU6c4xjXcuRgwD7mgJwxHXV5M58aEMJWTzErQOawy','010-4677-5680','2024-11-11 16:13:17','여행나로크','ROLE_USER',0,NULL,NULL),(5,'9266aa4a-781e-4290-adf7-725760f988a8','2024-11-29 15:26:51','kknaks@naver.com','$2a$10$X4ARaX0yemiZjD3fNhR.5eFO11a3QzbZCo6EEwVaHWo6sc7YehfGa','010-5766-5681','2024-11-11 16:13:17','이건진짜못참지','ROLE_USER',0,NULL,NULL),(7,'157db19b-1187-4fb9-ab1a-663cdb76c817','2024-12-03 12:26:00','badgirl@google.com','$2a$10$Ea8zaW8Wml0G7AesIPiZPOcqCvo.6NZofNnwLsFEoao4yCdD4Q3lq','010-2234-5678','2024-11-11 16:13:17','jijae42','ROLE_USER',0,1,NULL),(8,'3d16051a-bddb-4567-93b8-512e91b4e5a2','2024-12-02 00:31:50','goodboy@google.com','$2a$10$ypswcLAUlL7JOAkpYU2fl.1UeUUGSPBLnsChdAn/fjVn3ehJmkVuy','010-2694-5679','2024-11-11 16:13:17','옆집뽀삐','ROLE_USER',0,1,NULL),(9,'ff26f97e-2ad9-4f92-85ca-ddf152cfe590','2024-12-01 15:37:47','dockeral@naver.com','$2a$10$8Pai21OsWONVcLQLL4vfx.g5ZEDwPZ7zVXEJ8WHa88O2ckVv4k6DO','010-3234-5679','2024-11-11 16:13:17','거낙이의하루','ROLE_USER',0,2,NULL),(11,'ab554e5a-db74-44fb-9bb6-1a22f4df61d3','2024-12-01 23:47:23','vhxm8156@kakao.com','$2a$10$YZsU6VeMUj1ubfTpkSajPuYYwTr2ZL4jUwLUfH/HiI9YcVyFS0OyS','010-4234-5680','2024-11-11 16:13:17','재욱이의아침','ROLE_USER',0,3,NULL),(15,NULL,'2024-11-21 06:44:51','adwordshin@gmail.com','$2a$10$57EbHKegsvKqewHst8L0xuxshmZqPiN5fjXhrZ7pPQvFodA2G50vy','010-9814-3415','2024-11-21 06:44:51','adwordshin','ROLE_USER',0,NULL,NULL),(26,NULL,'2024-11-25 16:00:07','dh221009@khu.ac.kr','$2a$10$ixmTGIfojB7jyYUARGifzeorHeguuIHzGqi.KVBSJPQiw2wWHfNSW','010-5511-3764','2024-11-25 16:00:07','‍이건학[학생](공과대학 사회기반시스템공학과)','ROLE_USER',0,1,NULL),(27,NULL,'2024-11-26 18:28:02','kknaks@kakao.com','$2a$10$Yk7Ph2UymItzZz6864BbCeWy/5I8hcP/RNLAePmSyzlZfA6FiSkrG','소셜로그인','2024-11-26 18:28:02','이건학','ROLE_USER',0,3,NULL),(28,NULL,'2024-11-27 19:00:36','lsj8558@gmail.com','$2a$10$CeJkeb79HoyMbUp18iAqw.VSrpXoPaZZs1bS7M/Uichzuc6VPYb52','010-9405-1344','2024-11-27 19:00:36','이세종','ROLE_USER',0,1,NULL),(29,NULL,'2024-11-27 19:01:08','gangdonghwan980@gmail.com','$2a$10$gLmcVWrhRncJvEI2CRmZu.rQgs4CzxD2nDkgVKkFGAy2oIrAPtZFS','010-4599-6614','2024-11-27 19:01:08','강동환','ROLE_USER',0,1,NULL),(35,'63ee784b-2e4b-47ad-a02f-47f2a492709f','2024-11-29 11:25:47','sixax75700@confmin.com','$2a$10$swNuTGR.5KytEcSue6yvouPmLYtsFb/OxXxQnuGe3M1EH3asXq8ta','010-7534-0605','2024-11-28 13:13:36','상냥펀치','ROLE_USER',0,NULL,NULL),(36,'2e111e2a-bd42-4dd5-bf64-2758c0c7e721','2024-11-29 18:27:43','radil92887@kindomd.com','$2a$10$76k1WVnMNTs8alUy2UQ7O.Jp2UdvN3Durc0aoLmn5YMZ5bUcIPa06','010-7977-0813','2024-11-28 13:15:01','여행왕','ROLE_USER',0,NULL,NULL),(47,NULL,'2024-11-29 15:11:48','탈퇴한 유저_1732860742428','$2a$10$ugpfvSL6aRXK6QFKFheLl.lYP2/StjEIdo7R08ZyfEfcln75JANQO','탈퇴한 사용자','2024-11-29 15:10:12','알수없음_1732860742430','ROLE_USER',3,NULL,'2024-11-29 15:12:21'),(48,NULL,'2024-11-29 15:32:16','탈퇴한 유저_1733066072834','$2a$10$wcgvvSCWW8WQ5EppLe4NPO3sxyJXq1M.be.SSPq8QYSVBXfVq6HW2','탈퇴한 사용자','2024-11-29 15:32:16','알수없음_1733066072836','ROLE_USER',3,NULL,'2024-12-02 00:14:32'),(49,NULL,'2024-12-02 00:28:00','탈퇴한 유저_1733066884588','$2a$10$Y2kpdsdUqQTg5SGeN5VmGu6ajvv0LAqK2nmD.dadIGh0bup2XXOyy','탈퇴한 사용자','2024-12-02 00:17:03','알수없음_1733066884588','ROLE_USER',3,NULL,'2024-12-02 00:28:04'),(50,NULL,'2024-12-02 00:26:38','탈퇴한 유저_1733067081274','$2a$10$N2/MszJFyJFaC0GdyIU1yOTT3JzPR9t6JIWeyT0LBSWju.p6dxz4a','탈퇴한 사용자','2024-12-02 00:26:38','알수없음_1733067081274','ROLE_USER',3,NULL,'2024-12-02 00:31:21');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
