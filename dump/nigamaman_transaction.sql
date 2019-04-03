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
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `transaction` (
  `Transaction_ID` int(11) NOT NULL,
  `Amount` int(11) DEFAULT NULL,
  `Transaction_Date_Time` datetime NOT NULL,
  `Other_Details` varchar(45) NOT NULL,
  `TRANSACTION_TYPES_Transaction_Type_Code` int(11) NOT NULL,
  `ACCOUNT_Account_Number` int(11) NOT NULL,
  `Message` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Transaction_ID`),
  KEY `fk_TRANSACTION_TRANSACTION_TYPES1_idx` (`TRANSACTION_TYPES_Transaction_Type_Code`),
  KEY `fk_TRANSACTION_ACCOUNT1_idx` (`ACCOUNT_Account_Number`),
  CONSTRAINT `fk_TRANSACTION_ACCOUNT1` FOREIGN KEY (`ACCOUNT_Account_Number`) REFERENCES `account` (`account_number`),
  CONSTRAINT `fk_TRANSACTION_TRANSACTION_TYPES1` FOREIGN KEY (`TRANSACTION_TYPES_Transaction_Type_Code`) REFERENCES `transaction_types` (`transaction_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (3001,1000,'2018-12-04 15:16:54','Transaction done at ATM',2001,1596,NULL),(3002,450,'2018-12-11 15:11:54','Transaction done at Internet Banking',2001,9995,NULL),(3003,500,'2018-12-11 17:17:17','Transaction done at ATM',2001,9995,NULL),(3004,200,'2018-12-11 17:42:17','Debit of $200',2002,9995,NULL),(3005,600,'2018-12-11 21:52:24','Transaction done at ATM',2001,9995,'Transaction greater than 400 are not allowed'),(3006,400,'2018-12-12 16:49:17','Transaction done at ATM',2001,5000,NULL),(3007,400,'2018-12-12 16:51:34','Transaction done at ATM',2001,6000,NULL);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Bal_upd` AFTER INSERT ON `transaction` FOR EACH ROW BEGIN
	declare type int;
    declare amount int;
    declare account_num int;
    declare type_desc varchar(45);
    declare balance int;

	SELECT tt.Transaction_Type_Code, t.Amount, acc.Account_Number,tt.Transaction_Type_Description,acc.account_balance
    into type,amount,account_num,type_desc,balance
    from TRANSACTION_TYPES tt, Account acc, transaction t
    where t.TRANSACTION_TYPES_Transaction_Type_Code=tt.Transaction_Type_Code
    and t.ACCOUNT_Account_Number=acc.Account_Number
    AND acc.Account_Number=6000;
    
        
    IF type = 2001 then
		     
        Update acc_temp set balance=balance+amount
        where acc_num=account_num;
        
        
    else
		
        Update acc_temp set balance=amount-balance
        where acc_num=account_num;
        
	end if;	
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trial` AFTER UPDATE ON `transaction` FOR EACH ROW BEGIN
	Insert into acc_temp
    values(null,old.amount+new.amount,old.amount,new.amount,new.account_account_number,new.amount);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_accbalance_trg` AFTER UPDATE ON `transaction` FOR EACH ROW BEGIN
declare acc_bal int;

	select account_balance
    into acc_bal
    from account
    where account_number=new.account_account_number;
	
    update account set account_balance=acc_bal+new.amount
    where account_number=new.account_account_number;
	
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-12 18:38:54
