-- MySQL dump 10.16  Distrib 10.1.30-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: fyp
-- ------------------------------------------------------
-- Server version	10.1.30-MariaDB

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
  `CO_level` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`co_id`),
  UNIQUE KEY `course_id` (`course_id`,`co`),
  CONSTRAINT `co_to_bt_mapping_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_to_bt_mapping`
--

LOCK TABLES `co_to_bt_mapping` WRITE;
/*!40000 ALTER TABLE `co_to_bt_mapping` DISABLE KEYS */;
INSERT INTO `co_to_bt_mapping` VALUES (4,'IT1111','Basic logics learnt','application','CO-0');
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
INSERT INTO `course` VALUES ('IT1111','Algo','3',50,'321321',50,50,45,3,'2015-2019'),('IT1234','TQM','3',50,'123123',50,50,45,5,'2015-2019'),('IT2314','Embedded System','3',50,'123123',50,50,45,3,'2015-2019'),('IT2323','Soft Computing','3',50,'23232',50,50,45,3,'2016-2020'),('IT7401','ALGORITHMICS','3',50,'2015103636',50,50,45,4,'2015-2019');
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
  `course_outcome` text,
  `BTlevel` text,
  `marks` text,
  `mode` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`paper_id`),
  UNIQUE KEY `course_id` (`course_id`,`paper_id`),
  CONSTRAINT `course_to_question_mapping_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_to_question_mapping`
--

LOCK TABLES `course_to_question_mapping` WRITE;
/*!40000 ALTER TABLE `course_to_question_mapping` DISABLE KEYS */;
INSERT INTO `course_to_question_mapping` VALUES (28,'IT1111','[\"Apply the concept here.\",\"Application of this technology\",\"apply this  and check\",\"apply that\"]','[\"CO-0\",\"CO-1\",\"CO-2\",\"CO-0\"]','[\"application\",\"evaluation\",\"evaluation\",\"knowledge\"]','[\"3\",\"5\",\"2\",\"10\"]','Assessment-1');
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
INSERT INTO `course_to_staff_mapping` VALUES ('IT1111','2015103636'),('IT1234','123123'),('IT1234','321321'),('IT2314','123123'),('IT7401','2015103636');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curriculum`
--

LOCK TABLES `curriculum` WRITE;
/*!40000 ALTER TABLE `curriculum` DISABLE KEYS */;
INSERT INTO `curriculum` VALUES (5,'2015-2019','B.Tech in IST  2016-2020_IT7202_A_Assessment1.csv');
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
  `Cid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managetopics`
--

LOCK TABLES `managetopics` WRITE;
/*!40000 ALTER TABLE `managetopics` DISABLE KEYS */;
INSERT INTO `managetopics` VALUES (7,'introduction','definitation of algorithm','3','Unit 1','Classroom Delivery','IT1111'),(8,'napsac problem','introduction napsac problem','1','Unit 2','Classroom Delivery','IT1111'),(9,'FIFO problem','introduction to FIFO problem','3','Unit 3','Classroom Delivery','IT1111'),(10,'FIFEA DPROFNDA','BOUNCE BOUNCE BOUNCE BOUNCE','1','Unit 4','Demonstration','IT1111'),(11,'ABOUT ALGORITHM','5 6 78 1 AND 2 AND 3 AND 4 AND 5 AND 6 AND','1','Unit 5','CaseStudy','IT1111'),(13,'qawsedrftg','qwerty','2','Unit 2','Flipped Class Room Delivery','IT1111'),(14,'qawsedrftg','qwerty','2','Unit 2','Flipped Class Room Delivery','IT1111'),(15,'fdghj','esrdfghjk dfghnj cvbnm,','3','Unit 1','Classroom Delivery','IT1111'),(16,'afjdjl','fdsasfjanannanan','1','Unit 3','Classroom Delivery','IT1111'),(17,'wasedrftg','zsdxdfc fdxcv fgcv','2','Unit 1','Classroom Delivery','IT1111'),(18,'The Role of Algorithms in Computing , Algorithms','An algorithm any well-defined computational procedure that takes some value, or set of values, as input and produces some value, or set of values, as output. An algorithm is thus a sequence of computa','1','Unit 1','Classroom Delivery','IT7401'),(19,'Insertion Sort','This is an in-place comparison-based sorting algorithm. Here, a sub-list is maintained which is always sorted. For example, the lower part of an array is maintained to be sorted. An element which is t','1','Unit 1','Classroom Delivery','IT7401'),(20,'Analyzing algorithms ,Designing algorithms','This is an in-place comparison-based sorting algorithm. Here, a sub-list is maintained which is always sorted. For example, the lower part of an array is maintained to be sorted. An element which is t','1','Unit 1','Classroom Delivery','IT7401'),(21,'Analyzing algorithms ,Designing algorithms','An Algorithm is a sequence of steps to solve a problem. Design and Analysis of Algorithm is very important for designing algorithm to solve different types of problems in the branch of computer scienc','1','Unit 1','Classroom Delivery','IT7401'),(22,'Growth of Functions ,Asymptotic Notations','To characterize the time cost of algorithms, we focus on functions that map\ninput size to (typically, worst-case) running time. (Similarly for space costs.)\nWe are interested in precise notation for c','1','Unit 1','Classroom Delivery','IT7401'),(23,'Recurrence equations, Substitution Method','In this method, we draw a recurrence tree and calculate the time taken by every level of tree. Finally, we sum the work done at all levels. To draw the recurrence tree, we start from the given recurre','1','Unit 1','Classroom Delivery','IT7401'),(24,'Recursion Tree method,Master Method','Master Method is a direct way to get the solution. The master method works only for following type of recurrences or for recurrences that can be transformed to following type.\n1. If f(n) = ?(nc) where','1','Unit 1','Classroom Delivery','IT7401'),(25,'Divide-and-Conquer','In computer science, divide and conquer is an algorithm design paradigm based on multi-branched recursion. A divide-and-conquer algorithm works by recursively breaking down a problem into two or more ','1','Unit 2','Classroom Delivery','IT7401'),(26,'Merge Sort','Like QuickSort, Merge Sort is a Divide and Conquer algorithm. It divides input array in two halves, calls itself for the two halves and then merges the two sorted halves. The merge() function is used ','1','Unit 2','Classroom Delivery','IT7401'),(27,'Dynamic Programming','Dynamic Programming is a method for solving a complex problem by breaking it down into a collection of simpler subproblems, solving each of those subproblems just once, and storing their solutions usi','1','Unit 2','Classroom Delivery','IT7401'),(28,'Matrix chain multiplication','Given a sequence of matrices, find the most efficient way to multiply these matrices together. The problem is not actually to perform the multiplications, but merely to decide in which order to perfor','1','Unit 2','Classroom Delivery','IT7401'),(29,'Elements of Dynamic programming','Elements of Dynamic Programming\nWe have done an example of dynamic programming: the matrix chain multiply problem, but what can be said, in general, to guide us to choosing DP?\nOptimal Substructure\nOv','1','Unit 2','Classroom Delivery','IT7401'),(30,'Longest common subsequence','LCS Problem Statement: Given two sequences, find the length of longest subsequence present in both of them. A subsequence is a sequence that appears in the same relative order, but not necessarily con','1','Unit 2','Classroom Delivery','IT7401'),(31,'Greedy Algorithms','A greedy algorithm is an algorithmic paradigm that follows the problem solving heuristic of making the locally optimal choice at each stage[1] with the intent of finding a global optimum. In many prob','1','Unit 2','Classroom Delivery','IT7401'),(32,'Activity selection problem','Greedy is an algorithmic paradigm that builds up a solution piece by piece, always choosing the next piece that offers the most obvious and immediate benefit. Greedy algorithms are used for optimizati','1','Unit 2','Classroom Delivery','IT7401'),(33,'Activity selection problem','Optimal Substructure:\n\nAn optimal solution to the  problem contains within it optimal solutions to sub-problems. A\' = A - {1} (greedy choice) A\' can be solved again with the greedy algorithm. S\' = { i','1','Unit 2','Classroom Delivery','IT7401'),(34,'Huffman code , Task scheduling problem','Huffman coding is a lossless data compression algorithm. The idea is to assign variable-length codes to input characters, lengths of the assigned codes are based on the frequencies of corresponding ch','2','Unit 2','Classroom Delivery','IT7401'),(35,'Probabilistic Analysis and Randomized Algorithms -The Hiring','Consider the problem of hiring an office assistant. We interview candidates on a rolling basis,\nand at any given point we want to hire the best candidate we’ve seen so far. If a better\ncandidate comes','1','Unit 2','Classroom Delivery','IT7401'),(36,'The Hiring Problem','Consider the problem of hiring an office assistant. We interview candidates on a rolling basis,\nand at any given point we want to hire the best candidate we’ve seen so far. If a better\ncandidate comes','1','Unit 2','Classroom Delivery','IT7401'),(37,'Randomized Algorithms - Amortized Analysis','Amortized Analysis is used for algorithms where an occasional operation is very slow, but most of the other operations are faster. In Amortized Analysis, we analyze a sequence of operations and guaran','2','Unit 2','Classroom Delivery','IT7401');
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

-- Dump completed on 2019-03-07 11:27:23
