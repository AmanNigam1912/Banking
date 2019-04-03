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
-- Table structure for table `loan_types_by_branch`
--

DROP TABLE IF EXISTS `loan_types_by_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `loan_types_by_branch` (
  `BRANCH_Branch_ID` int(11) NOT NULL,
  `LOAN_TYPE_Loan_Type_Code` int(11) NOT NULL,
  KEY `fk_BRANCH_has_LOAN_TYPE_LOAN_TYPE1_idx` (`LOAN_TYPE_Loan_Type_Code`),
  KEY `fk_BRANCH_has_LOAN_TYPE_BRANCH1_idx` (`BRANCH_Branch_ID`),
  CONSTRAINT `fk_BRANCH_has_LOAN_TYPE_BRANCH1` FOREIGN KEY (`BRANCH_Branch_ID`) REFERENCES `branch` (`branch_id`),
  CONSTRAINT `fk_BRANCH_has_LOAN_TYPE_LOAN_TYPE1` FOREIGN KEY (`LOAN_TYPE_Loan_Type_Code`) REFERENCES `loan_type` (`loan_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_types_by_branch`
--

LOCK TABLES `loan_types_by_branch` WRITE;
/*!40000 ALTER TABLE `loan_types_by_branch` DISABLE KEYS */;
INSERT INTO `loan_types_by_branch` VALUES (201,601),(201,602),(201,603),(202,601),(202,602),(202,603),(208,601),(208,602),(208,603);
/*!40000 ALTER TABLE `loan_types_by_branch` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-12 18:38:50
