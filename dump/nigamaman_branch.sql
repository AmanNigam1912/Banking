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
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `branch` (
  `Branch_ID` int(11) NOT NULL,
  `Branch_Name` varchar(45) NOT NULL,
  `Branch_Code` varchar(45) NOT NULL,
  `Address_ID` int(11) NOT NULL,
  `BANK_Bank_Name` varchar(30) NOT NULL,
  `INTERNET_BANKING_Internet_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Branch_ID`),
  KEY `fk_BRANCH_ADDRESS_ATM_BRANCH1_idx` (`Address_ID`) /*!80000 INVISIBLE */,
  KEY `fk_BRANCH_BANK1_idx` (`BANK_Bank_Name`),
  KEY `fk_BRANCH_INTERNET_BANKING1_idx` (`INTERNET_BANKING_Internet_ID`),
  CONSTRAINT `fk_ADDRESS_ID` FOREIGN KEY (`Address_ID`) REFERENCES `address_atm_and_branch` (`address_id`),
  CONSTRAINT `fk_BRANCH_BANK1` FOREIGN KEY (`BANK_Bank_Name`) REFERENCES `bank` (`bank_name`),
  CONSTRAINT `fk_BRANCH_INTERNET_BANKING1` FOREIGN KEY (`INTERNET_BANKING_Internet_ID`) REFERENCES `internet_banking` (`internet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (201,'Tremont Street branch','A201',101,'State Bank of Massachusetts',NULL),(202,'Cambridge Park branch','A202',102,'State Bank of Massachusetts',NULL),(208,'Boylston Street branch','A208',108,'State Bank of Massachusetts',NULL);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-12 18:38:56
