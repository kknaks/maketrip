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
-- Table structure for table `thirdclass`
--

DROP TABLE IF EXISTS `thirdclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thirdclass` (
  `thirdclass_code` varchar(50) NOT NULL COMMENT '소분류코드',
  `thirdclass_name` varchar(50) NOT NULL COMMENT '소분류명',
  `secondclass_code` varchar(50) DEFAULT NULL COMMENT '중분류코드',
  PRIMARY KEY (`thirdclass_code`),
  UNIQUE KEY `UIX_thirdclass` (`thirdclass_code`),
  KEY `FK_secondclass_TO_thirdclass` (`secondclass_code`),
  CONSTRAINT `FK_secondclass_TO_thirdclass` FOREIGN KEY (`secondclass_code`) REFERENCES `secondclass` (`secondclass_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='여행지유형소분류';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thirdclass`
--

LOCK TABLES `thirdclass` WRITE;
/*!40000 ALTER TABLE `thirdclass` DISABLE KEYS */;
INSERT INTO `thirdclass` VALUES ('A01010100','국립공원','A0101'),('A01010200','도립공원','A0101'),('A01010300','군립공원','A0101'),('A01010400','산','A0101'),('A01010500','자연생태관광지','A0101'),('A01010600','자연휴양림','A0101'),('A01010700','수목원','A0101'),('A01010800','폭포','A0101'),('A01010900','계곡','A0101'),('A01011000','약수터','A0101'),('A01011100','해안절경','A0101'),('A01011200','해수욕장','A0101'),('A01011300','섬','A0101'),('A01011400','항구/포구','A0101'),('A01011600','등대','A0101'),('A01011700','호수','A0101'),('A01011800','강','A0101'),('A01011900','동굴','A0101'),('A01020100','희귀동.식물','A0102'),('A01020200','기암괴석','A0102'),('A02010100','고궁','A0201'),('A02010200','성','A0201'),('A02010300','문','A0201'),('A02010400','고택','A0201'),('A02010500','생가','A0201'),('A02010600','민속마을','A0201'),('A02010700','유적지/사적지','A0201'),('A02010800','사찰','A0201'),('A02010900','종교성지','A0201'),('A02011000','안보관광','A0201'),('A02020200','관광단지','A0202'),('A02020300','온천/욕장/스파','A0202'),('A02020400','이색찜질방','A0202'),('A02020500','헬스투어','A0202'),('A02020600','테마공원','A0202'),('A02020700','공원','A0202'),('A02020800','유람선/잠수함관광','A0202'),('A02030100','농.산.어촌 체험','A0203'),('A02030200','전통체험','A0203'),('A02030300','산사체험','A0203'),('A02030400','이색체험','A0203'),('A02030600','이색거리','A0203'),('A02040400','발전소','A0204'),('A02040600','식음료','A0204'),('A02040800','기타','A0204'),('A02040900','전자-반도체','A0204'),('A02041000','자동차','A0204'),('A02050100','다리/대교','A0205'),('A02050200','기념탑/기념비/전망대','A0205'),('A02050300','분수','A0205'),('A02050400','동상','A0205'),('A02050500','터널','A0205'),('A02050600','유명건물','A0205'),('A02060100','박물관','A0206'),('A02060200','기념관','A0206'),('A02060300','전시관','A0206'),('A02060400','컨벤션센터','A0206'),('A02060500','미술관/화랑','A0206'),('A02060600','공연장','A0206'),('A02060700','문화원','A0206'),('A02060800','외국문화원','A0206'),('A02060900','도서관','A0206'),('A02061000','대형서점','A0206'),('A02061100','문화전수시설','A0206'),('A02061200','영화관','A0206'),('A02061300','어학당','A0206'),('A02061400','학교','A0206'),('A02070100','문화관광축제','A0207'),('A02070200','일반축제','A0207'),('A02080100','전통공연','A0208'),('A02080200','연극','A0208'),('A02080300','뮤지컬','A0208'),('A02080400','오페라','A0208'),('A02080500','전시회','A0208'),('A02080600','박람회','A0208'),('A02080800','무용','A0208'),('A02080900','클래식음악회','A0208'),('A02081000','대중콘서트','A0208'),('A02081100','영화','A0208'),('A02081200','스포츠경기','A0208'),('A02081300','기타행사','A0208'),('A03010200','수상레포츠','A0301'),('A03010300','항공레포츠','A0301'),('A03020200','수련시설','A0302'),('A03020300','경기장','A0302'),('A03020400','인라인(실내 인라인 포함)','A0302'),('A03020500','자전거하이킹','A0302'),('A03020600','카트','A0302'),('A03020700','골프','A0302'),('A03020800','경마','A0302'),('A03020900','경륜','A0302'),('A03021000','카지노','A0302'),('A03021100','승마','A0302'),('A03021200','스키/스노보드','A0302'),('A03021300','스케이트','A0302'),('A03021400','썰매장','A0302'),('A03021500','수렵장','A0302'),('A03021600','사격장','A0302'),('A03021700','야영장,오토캠핑장','A0302'),('A03021800','암벽등반','A0302'),('A03022000','서바이벌게임','A0302'),('A03022100','ATV','A0302'),('A03022200','MTB','A0302'),('A03022300','오프로드','A0302'),('A03022400','번지점프','A0302'),('A03022600','스키(보드 렌탈샵)','A0302'),('A03022700','트래킹','A0302'),('A03030100','윈드서핑/제트스키','A0303'),('A03030200','카약/카누','A0303'),('A03030300','요트','A0303'),('A03030400','스노쿨링/스킨스쿠버다이빙','A0303'),('A03030500','민물낚시','A0303'),('A03030600','바다낚시','A0303'),('A03030700','수영','A0303'),('A03030800','래프팅','A0303'),('A03040100','스카이다이빙','A0304'),('A03040200','초경량비행','A0304'),('A03040300','헹글라이딩/패러글라이딩','A0304'),('A03040400','열기구','A0304'),('A03050100','복합 레포츠','A0305'),('A04010100','5일장','A0401'),('A04010200','상설시장','A0401'),('A04010300','백화점','A0401'),('A04010400','면세점','A0401'),('A04010500','대형마트','A0401'),('A04010600','전문매장/상가','A0401'),('A04010700','공예/공방','A0401'),('A04010900','특산물판매점','A0401'),('A04011000','사후면세점','A0401'),('A05020100','한식','A0502'),('A05020200','서양식','A0502'),('A05020300','일식','A0502'),('A05020400','중식','A0502'),('A05020700','이색음식점','A0502'),('A05020900','카페/전통찻집','A0502'),('A05021000','클럽','A0502'),('B02010100','관광호텔','B0201'),('B02010500','콘도미니엄','B0201'),('B02010600','유스호스텔','B0201'),('B02010700','펜션','B0201'),('B02010900','모텔','B0201'),('B02011000','민박','B0201'),('B02011100','게스트하우스','B0201'),('B02011200','홈스테이','B0201'),('B02011300','서비스드레지던스','B0201'),('B02011600','한옥','B0201'),('C01120001','가족코스','C0112'),('C01130001','나홀로코스','C0113'),('C01140001','힐링코스','C0114'),('C01150001','도보코스','C0115'),('C01160001','캠핑코스','C0116'),('C01170001','맛코스','C0117');
/*!40000 ALTER TABLE `thirdclass` ENABLE KEYS */;
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

-- Dump completed on 2024-12-06 12:59:33
