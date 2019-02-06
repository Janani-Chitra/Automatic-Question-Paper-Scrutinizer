-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: fyp_selva
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.10.2

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
-- Table structure for table `co_to_bt_mapping`
--

DROP TABLE IF EXISTS `co_to_bt_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_to_bt_mapping` (
  `co_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(20) DEFAULT NULL,
  `co` varchar(300) DEFAULT NULL,
  `bt` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`co_id`),
  UNIQUE KEY `course_id` (`course_id`,`co`),
  CONSTRAINT `co_to_bt_mapping_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_to_bt_mapping`
--

LOCK TABLES `co_to_bt_mapping` WRITE;
/*!40000 ALTER TABLE `co_to_bt_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_to_bt_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `course_id` varchar(20) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `credits` varchar(60) DEFAULT NULL,
  `min_pass_mark` int(11) DEFAULT NULL,
  `co_owner` varchar(10) NOT NULL,
  `internals` int(11) DEFAULT NULL,
  `externals` int(11) DEFAULT NULL,
  `tot_no_periods` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `cur_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('IT1111','Algo','3',50,'321321',50,50,45,3,'2015-2019'),('IT1234','TQM','3',50,'123123',50,50,45,5,'2015-2019'),('IT2323','Soft Computing','3',50,'23232',50,50,45,3,'2016-2020');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_to_question_mapping`
--

DROP TABLE IF EXISTS `course_to_question_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_to_question_mapping` (
  `paper_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(20) DEFAULT NULL,
  `questions` text,
  PRIMARY KEY (`paper_id`),
  UNIQUE KEY `course_id` (`course_id`,`paper_id`),
  CONSTRAINT `course_to_question_mapping_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_to_question_mapping`
--

LOCK TABLES `course_to_question_mapping` WRITE;
/*!40000 ALTER TABLE `course_to_question_mapping` DISABLE KEYS */;
INSERT INTO `course_to_question_mapping` VALUES (14,'IT1234','[\"what\",\"\",\"\"]'),(15,'IT1234','[\"how\",\"\",\"\"]'),(16,'IT1111','[\"whats your name?\"]');
/*!40000 ALTER TABLE `course_to_question_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_to_staff_mapping`
--

DROP TABLE IF EXISTS `course_to_staff_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_to_staff_mapping` (
  `course_id` varchar(20) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  PRIMARY KEY (`course_id`,`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_to_staff_mapping`
--

LOCK TABLES `course_to_staff_mapping` WRITE;
/*!40000 ALTER TABLE `course_to_staff_mapping` DISABLE KEYS */;
INSERT INTO `course_to_staff_mapping` VALUES ('IT1111','2015103636'),('IT1234','123123'),('IT1234','321321');
/*!40000 ALTER TABLE `course_to_staff_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curriculum`
--

DROP TABLE IF EXISTS `curriculum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curriculum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curriculum` varchar(40) NOT NULL,
  `student_list` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curriculum`
--

LOCK TABLES `curriculum` WRITE;
/*!40000 ALTER TABLE `curriculum` DISABLE KEYS */;
INSERT INTO `curriculum` VALUES (1,'2015-2019','Data.csv'),(2,'2016-2020','Data.csv'),(3,'2015-2019','B.Tech in IST  2016-2020_IT7202_A_Assessment1.csv'),(4,'2015-2019','B.Tech in IST  2016-2020_IT7202_A_Assessment1.csv');
/*!40000 ALTER TABLE `curriculum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managetopics`
--

DROP TABLE IF EXISTS `managetopics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `managetopics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topicTitle` varchar(60) DEFAULT NULL,
  `topicContent` varchar(200) DEFAULT NULL,
  `topicHour` varchar(10) DEFAULT NULL,
  `topicUnits` varchar(20) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `Cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managetopics`
--

LOCK TABLES `managetopics` WRITE;
/*!40000 ALTER TABLE `managetopics` DISABLE KEYS */;
/*!40000 ALTER TABLE `managetopics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `staff_id` varchar(10) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('123123','Janani','jan@12.com','jan@123'),('2015103636','Selva','jo@c.com','12345678'),('23232','Venki','venkat@v.c','kongu'),('321321','Selva','sel@sel.com','sel@123');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-07  2:38:37
