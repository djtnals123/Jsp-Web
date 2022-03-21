-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbname
-- ------------------------------------------------------
-- Server version	8.0.23

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

--
-- Table structure for table `attachfile`
--

DROP TABLE IF EXISTS `attachfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachfile` (
  `NEW_NAME` varchar(50) NOT NULL,
  `OLD_NAME` varchar(50) NOT NULL,
  `DATE` date NOT NULL,
  `NO` int NOT NULL,
  PRIMARY KEY (`NEW_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachfile`
--

LOCK TABLES `attachfile` WRITE;
/*!40000 ALTER TABLE `attachfile` DISABLE KEYS */;
INSERT INTO `attachfile` VALUES ('1.project','.project','2021-11-10',9),('2.project','.project','2021-11-10',10),('3.classpath','.classpath','2021-11-10',11),('3.project','.project','2021-11-10',12),('aaaaa3.txt','aaaaa.txt','2021-12-17',17),('aaaaa4.txt','aaaaa.txt','2021-12-17',16);
/*!40000 ALTER TABLE `attachfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `NO` int NOT NULL,
  `TITLE` varchar(45) NOT NULL,
  `WRITER` varchar(20) NOT NULL,
  `CONTENTS` varchar(1000) NOT NULL,
  `CREATE_DATE` date NOT NULL,
  `ATTACH_FILE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`NO`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'1','1','1','2021-11-10',''),(2,'null','1','null','2021-11-10','null'),(3,'2','1','2','2021-11-10','kr.ac.sumin.webprograming.AttachFile@624eb3b6'),(4,'3','1','3','2021-11-10','kr.ac.sumin.webprograming.AttachFile@75e1a2a4'),(5,'33','1','3','2021-11-10','kr.ac.sumin.webprograming.AttachFile@406187f9'),(6,'42','1','24t24','2021-11-10','kr.ac.sumin.webprograming.AttachFile@7df5358d'),(7,'3','1','4','2021-11-10','kr.ac.sumin.webprograming.AttachFile@54dba496'),(8,'3','1','5','2021-11-10','kr.ac.sumin.webprograming.AttachFile@4cd9cc27'),(9,'3','1','3','2021-11-10','kr.ac.sumin.webprograming.AttachFile@7a7d38f0'),(10,'null','1','null','2021-11-10','null'),(11,'null','1','null','2021-11-10','null'),(12,'4','1','4','2021-11-10','kr.ac.sumin.webprograming.AttachFile@6cb2564a'),(13,'6','1','2','2021-11-10','kr.ac.sumin.webprograming.AttachFile@9f01d99'),(14,'3','1','33','2021-11-10','kr.ac.sumin.webprograming.AttachFile@2cd32463'),(15,'y','1','u','2021-11-10','kr.ac.sumin.webprograming.AttachFile@6e7a9889'),(16,'nulldwdwqwqd','1','w232','2021-12-16','kr.ac.sumin.computereng.dto.AttachFile@7bd46d14'),(17,'wex','1','xwsxsxsxwsws','2021-12-17','kr.ac.sumin.computereng.dto.AttachFile@192775f1');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `USER_ID` varchar(20) NOT NULL,
  `PASS` varchar(20) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `HOSPITAL` varchar(16) NOT NULL,
  `ROLE` varchar(20) NOT NULL,
  `DATE` date DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1','1','1','1','S','3,2',NULL),('12','1','1','1','K','2',NULL),('2','2','2','2','K','3','2021-11-10'),('3','1','1','1','K','3,2','2021-11-10'),('admin','1234','admin@admin.com','관리자','관리자','1',NULL),('Q','Q','Q','Q','S','2','2021-11-10');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-21  9:40:35
