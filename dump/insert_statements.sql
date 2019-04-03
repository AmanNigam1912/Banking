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
-- Dumping data for table `acc_temp`
--

LOCK TABLES `acc_temp` WRITE;
/*!40000 ALTER TABLE `acc_temp` DISABLE KEYS */;
INSERT INTO `acc_temp` VALUES (NULL,NULL,NULL,NULL,1596,NULL),(NULL,NULL,NULL,NULL,5000,NULL),(NULL,1700,NULL,NULL,6000,NULL),(NULL,1200,1000,200,6000,200),(NULL,600,200,400,6000,400),(NULL,1200,800,400,5000,400),(NULL,1250,250,1000,1596,1000);
/*!40000 ALTER TABLE `acc_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1596,1000,'2018-12-04',301),(5000,920,'2018-12-12',301),(5555,0,'2018-12-11',301),(6000,1100,'2018-12-12',301),(6587,0,'2018-12-11',301),(7415,0,'2018-12-11',301),(9995,0,'2018-12-11',301);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `account_types`
--

LOCK TABLES `account_types` WRITE;
/*!40000 ALTER TABLE `account_types` DISABLE KEYS */;
INSERT INTO `account_types` VALUES (301,'Savings Account'),(302,'Checkings Account');
/*!40000 ALTER TABLE `account_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `account_types_by_branch`
--

LOCK TABLES `account_types_by_branch` WRITE;
/*!40000 ALTER TABLE `account_types_by_branch` DISABLE KEYS */;
INSERT INTO `account_types_by_branch` VALUES (201,301),(201,302),(202,301),(202,302),(208,301),(208,302);
/*!40000 ALTER TABLE `account_types_by_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `accounts_at_atm`
--

LOCK TABLES `accounts_at_atm` WRITE;
/*!40000 ALTER TABLE `accounts_at_atm` DISABLE KEYS */;
INSERT INTO `accounts_at_atm` VALUES (1596),(9995);
/*!40000 ALTER TABLE `accounts_at_atm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `address_atm_and_branch`
--

LOCK TABLES `address_atm_and_branch` WRITE;
/*!40000 ALTER TABLE `address_atm_and_branch` DISABLE KEYS */;
INSERT INTO `address_atm_and_branch` VALUES (101,'30 Tremont Street',NULL,'Boston','MA','USA','Branch Address'),(102,'35 Cambridgepark Dr',NULL,'Boston','MA','USA','Branch Address'),(108,'305 Boylston Street',NULL,'Boston','MA','USA','Branch Address'),(110,'309 Boylston Street',NULL,'Boston','MA','USA','ATM Address');
/*!40000 ALTER TABLE `address_atm_and_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `address_customer_employee`
--

LOCK TABLES `address_customer_employee` WRITE;
/*!40000 ALTER TABLE `address_customer_employee` DISABLE KEYS */;
INSERT INTO `address_customer_employee` VALUES (401,'1012 Huntington Avenue',NULL,'Boston','MA','USA','Employee address'),(402,'115 Mission Main',NULL,'Boston','MA','USA','Employee address'),(403,'410 Boylston Street',NULL,'Boston','MA','USA','Employee address'),(404,'479 Boylston Street',NULL,'Boston','MA','USA','Customer address'),(405,'40 Parker Hill',NULL,'Boston','MA','USA','Customer address'),(406,'1196 St Alphonsus Street',NULL,'Boston','MA','USA','Customer address'),(407,'1140 Huntington Ave',NULL,'Boston','MA','USA','Customer address'),(408,'853 Mission Hill',NULL,'Boston','MA','USA','Customer address');
/*!40000 ALTER TABLE `address_customer_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `atm`
--

LOCK TABLES `atm` WRITE;
/*!40000 ALTER TABLE `atm` DISABLE KEYS */;
INSERT INTO `atm` VALUES (1001,110,NULL),(1002,110,1596),(1003,110,9995),(1004,110,9995);
/*!40000 ALTER TABLE `atm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
INSERT INTO `bank` VALUES ('State Bank of Massachusetts');
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (201,'Tremont Street branch','A201',101,'State Bank of Massachusetts',NULL),(202,'Cambridge Park branch','A202',102,'State Bank of Massachusetts',NULL),(208,'Boylston Street branch','A208',108,'State Bank of Massachusetts',NULL);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (901,'Samuel','Fernandez','1990-12-19',404,'2017417896',NULL,701),(902,'Casey','Williams','1994-10-29',405,'8567411896',801,702),(903,'Fredrick','D\'Souza','1989-10-19',406,'8159711896',NULL,NULL),(904,'Dion','Nash','1985-11-25',407,'8156489657',NULL,NULL),(905,'Shane','Bond','1984-12-21',407,'8156159632',NULL,NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer_account_details`
--

LOCK TABLES `customer_account_details` WRITE;
/*!40000 ALTER TABLE `customer_account_details` DISABLE KEYS */;
INSERT INTO `customer_account_details` VALUES (901,1596),(902,9995),(903,5555),(904,6587),(905,7415);
/*!40000 ALTER TABLE `customer_account_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer_details_at_atm`
--

LOCK TABLES `customer_details_at_atm` WRITE;
/*!40000 ALTER TABLE `customer_details_at_atm` DISABLE KEYS */;
INSERT INTO `customer_details_at_atm` VALUES (1002,901);
/*!40000 ALTER TABLE `customer_details_at_atm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (501,'John Johnson','1985-10-24','Accounts Department','joohnson.john@sbm.com',201,401),(502,'Ricky Martin','1983-08-21','Loans Department','martin.ricky@sbm.com',201,402),(503,'Peter Parker','1987-05-19','Internet Banking Department','parker.peter@sbm.com',201,403);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `internet_banking`
--

LOCK TABLES `internet_banking` WRITE;
/*!40000 ALTER TABLE `internet_banking` DISABLE KEYS */;
INSERT INTO `internet_banking` VALUES (701,NULL),(702,801);
/*!40000 ALTER TABLE `internet_banking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (10001,15000,602,903,10000,'You are eligible to apply for another loan'),(10002,90000,603,904,NULL,NULL),(10003,5000,601,905,NULL,NULL);
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `loan_type`
--

LOCK TABLES `loan_type` WRITE;
/*!40000 ALTER TABLE `loan_type` DISABLE KEYS */;
INSERT INTO `loan_type` VALUES (601,'Auto Loans',4.9,502),(602,'Education Loans',6.6,502),(603,'Home Loans',4.4,502);
/*!40000 ALTER TABLE `loan_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `loan_types_by_branch`
--

LOCK TABLES `loan_types_by_branch` WRITE;
/*!40000 ALTER TABLE `loan_types_by_branch` DISABLE KEYS */;
INSERT INTO `loan_types_by_branch` VALUES (201,601),(201,602),(201,603),(202,601),(202,602),(202,603),(208,601),(208,602),(208,603);
/*!40000 ALTER TABLE `loan_types_by_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (801,'casey456','casey@456');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (3001,1000,'2018-12-04 15:16:54','Transaction done at ATM',2001,1596,NULL),(3002,450,'2018-12-11 15:11:54','Transaction done at Internet Banking',2001,9995,NULL),(3003,500,'2018-12-11 17:17:17','Transaction done at ATM',2001,9995,NULL),(3004,200,'2018-12-11 17:42:17','Debit of $200',2002,9995,NULL),(3005,600,'2018-12-11 21:52:24','Transaction done at ATM',2001,9995,'Transaction greater than 400 are not allowed'),(3006,400,'2018-12-12 16:49:17','Transaction done at ATM',2001,5000,NULL),(3007,400,'2018-12-12 16:51:34','Transaction done at ATM',2001,6000,NULL);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `transaction_internet_banking`
--

LOCK TABLES `transaction_internet_banking` WRITE;
/*!40000 ALTER TABLE `transaction_internet_banking` DISABLE KEYS */;
INSERT INTO `transaction_internet_banking` VALUES (4001,702,3002);
/*!40000 ALTER TABLE `transaction_internet_banking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `transaction_types`
--

LOCK TABLES `transaction_types` WRITE;
/*!40000 ALTER TABLE `transaction_types` DISABLE KEYS */;
INSERT INTO `transaction_types` VALUES (2001,'CREDIT'),(2002,'DEBIT');
/*!40000 ALTER TABLE `transaction_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `transactions_at_atm`
--

LOCK TABLES `transactions_at_atm` WRITE;
/*!40000 ALTER TABLE `transactions_at_atm` DISABLE KEYS */;
INSERT INTO `transactions_at_atm` VALUES (1002,3001),(1003,3003),(1004,3004);
/*!40000 ALTER TABLE `transactions_at_atm` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-12 22:55:14
