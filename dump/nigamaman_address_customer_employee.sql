-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: nigamaman
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address_customer_employee`
--

DROP TABLE IF EXISTS `address_customer_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `address_customer_employee` (
  `Add_ID` int(11) NOT NULL,
  `Add_Line1` varchar(45) NOT NULL,
  `Add_Line2` varchar(45) DEFAULT NULL,
  `Town_City` varchar(45) NOT NULL,
  `State` varchar(45) NOT NULL,
  `Country` varchar(45) NOT NULL,
  `Other_Details` varchar(45) NOT NULL,
  PRIMARY KEY (`Add_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_customer_employee`
--

LOCK TABLES `address_customer_employee` WRITE;
/*!40000 ALTER TABLE `address_customer_employee` DISABLE KEYS */;
INSERT INTO `address_customer_employee` VALUES (401,'1012 Huntington Avenue',NULL,'Boston','MA','USA','Employee address'),(402,'115 Mission Main',NULL,'Boston','MA','USA','Employee address'),(403,'410 Boylston Street',NULL,'Boston','MA','USA','Employee address'),(404,'479 Boylston Street',NULL,'Boston','MA','USA','Customer address'),(405,'40 Parker Hill',NULL,'Boston','MA','USA','Customer address'),(406,'1196 St Alphonsus Street',NULL,'Boston','MA','USA','Customer address'),(407,'1140 Huntington Ave',NULL,'Boston','MA','USA','Customer address'),(408,'853 Mission Hill',NULL,'Boston','MA','USA','Customer address');
/*!40000 ALTER TABLE `address_customer_employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-12 18:38:53
