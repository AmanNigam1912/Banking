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
-- Temporary view structure for view `auto_loan_details_customer`
--

DROP TABLE IF EXISTS `auto_loan_details_customer`;
/*!50001 DROP VIEW IF EXISTS `auto_loan_details_customer`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `auto_loan_details_customer` AS SELECT 
 1 AS `Branch Name`,
 1 AS `A/C Number`,
 1 AS `Customer Name`,
 1 AS `Contact`,
 1 AS `Loan Number`,
 1 AS `Loan Type`,
 1 AS `Interest Rate`,
 1 AS `Loan Amount`,
 1 AS `Loan Type Code`,
 1 AS `Employee Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `auto_loan_details_customer`
--

/*!50001 DROP VIEW IF EXISTS `auto_loan_details_customer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `auto_loan_details_customer` AS select `b`.`Branch_Name` AS `Branch Name`,`a`.`Account_Number` AS `A/C Number`,concat_ws(' ',`c`.`Cust_First_Name`,`c`.`Cust_Last_Name`) AS `Customer Name`,`c`.`Cust_Contact` AS `Contact`,`l3`.`Loan_Number` AS `Loan Number`,`l2`.`Loan_Type_Description` AS `Loan Type`,`l2`.`Interest_Rate` AS `Interest Rate`,`l3`.`Loan_Amount` AS `Loan Amount`,`l2`.`Loan_Type_Code` AS `Loan Type Code`,`e`.`Employee_Name` AS `Employee Name` from (((((((`employee` `e` join `branch` `b`) join `loan_types_by_branch` `l1`) join `loan_type` `l2`) join `loan` `l3`) join `customer` `c`) join `customer_account_details` `cad`) join `account` `a`) where ((`l3`.`CUSTOMER_Customer_Id` = `c`.`Customer_Id`) and (`c`.`Customer_Id` = `cad`.`CUSTOMER_Customer_Id`) and (`cad`.`ACCOUNT_Account_Number` = `a`.`Account_Number`) and (`l2`.`EMPLOYEE_Employee_ID` = `e`.`Employee_ID`) and (`b`.`Branch_ID` = `l1`.`BRANCH_Branch_ID`) and (`l1`.`LOAN_TYPE_Loan_Type_Code` = `l2`.`Loan_Type_Code`) and (`l2`.`Loan_Type_Code` = `l3`.`LOAN_TYPE_Loan_Type_Code`) and (`b`.`Branch_ID` = 201) and (`l2`.`Loan_Type_Description` = 'Auto Loans')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'nigamaman'
--

--
-- Dumping routines for database 'nigamaman'
--
/*!50003 DROP FUNCTION IF EXISTS `loan_check` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `loan_check`(loan_amount int,amount_paid int) RETURNS text CHARSET utf8mb4
BEGIN
	set @cal=loan_amount*(50/100);
	IF amount_paid>@cal then
		return 'You are eligible to apply for another loan';
	else
		return 'First!Please pay atleast 50% of previous loan';
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Customer_Transaction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Customer_Transaction`(IN acc_num INT)
BEGIN

select d.CUSTOMER_Customer_Id as "Customer ID", concat_ws(' ',e.Cust_First_Name, e.Cust_Last_Name) as "Customer Name",  c.Account_Number As "A/C Number", f.Transaction_Type_Description as "Transaction Type", b.Transaction_Id as "Transaction ID",b.Amount, b. Transaction_Date_Time As "Date", b.Other_Details as "Type" 
from TRANSACTION b, account c, customer_account_details d,customer e,TRANSACTION_TYPES f
where b.TRANSACTION_TYPES_Transaction_Type_Code=f.Transaction_Type_Code 
and b.ACCOUNT_Account_number=c.Account_Number
and c.Account_Number=d.ACCOUNT_Account_Number
and d.CUSTOMER_Customer_Id=e.customer_id
and d.CUSTOMER_Customer_Id=e.customer_id
and c.Account_Number=@acc_num;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Customer_Transaction_new` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Customer_Transaction_new`(IN acc_num INT)
BEGIN

select d.CUSTOMER_Customer_Id as "Customer ID", concat_ws(' ',e.Cust_First_Name, e.Cust_Last_Name) as "Customer Name",  @acc_num:=c.Account_Number As "A/C Number", f.Transaction_Type_Description as "Transaction Type", @trx_id:= b.Transaction_Id as "Transaction ID",@amount:=b.Amount, b. Transaction_Date_Time As "Date", b.Other_Details as "Type" 
from TRANSACTION b, account c, customer_account_details d,customer e,TRANSACTION_TYPES f
where b.TRANSACTION_TYPES_Transaction_Type_Code=f.Transaction_Type_Code 
and b.ACCOUNT_Account_number=c.Account_Number
and c.Account_Number=d.ACCOUNT_Account_Number
and d.CUSTOMER_Customer_Id=e.customer_id
and d.CUSTOMER_Customer_Id=e.customer_id
and b.Transaction_Date_Time<='2018-12-11 21:52:24' and b.Transaction_Date_Time>'2018-12-11 17:42:17'
and c.Account_Number=acc_num;

If @amount > 400 then
	update TRANSACTION set message='Transaction greater than 400 are not allowed'
    where Transaction_Id=@trx_id;
else    
	update account set message='Your recent transaction was successful'
    where Transaction_Id=@trx_id;
end if;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `loan_amt_paid_func` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `loan_amt_paid_func`(IN cust_id INT,IN pay_amt INT)
BEGIN
	select l.loan_number, @loan_amount:=l.loan_amount, c.customer_id, @amt_paid:=l.amount_paid  
	from customer c, loan l
	where c.customer_id=l.CUSTOMER_Customer_id
	and l.CUSTOMER_Customer_id=cust_id;
    
    update loan set amount_paid=(pay_amt+@amt_paid)
    where CUSTOMER_Customer_id=cust_id;
    
    select @new_amt_paid:=l.amount_paid  
	from customer c, loan l
	where c.customer_id=l.CUSTOMER_Customer_id
	and l.CUSTOMER_Customer_id=cust_id;
    
    select @notification:=loan_check(@loan_amount,@new_amt_paid);
    
    update loan set Notification=@notification
    where CUSTOMER_Customer_id=cust_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_loan_amt_paid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_loan_amt_paid`(IN cust_id INT,IN pay_amt INT)
BEGIN
	select l.loan_number, l.loan_amount, c.customer_id, @amt_paid:=l.amount_paid  
	from customer c, loan l
	where c.customer_id=l.CUSTOMER_Customer_id
	and l.CUSTOMER_Customer_id=cust_id;
    
    update loan set amount_paid=(pay_amt+@amt_paid)
    where CUSTOMER_Customer_id=cust_id;
    
END ;;
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

-- Dump completed on 2018-12-12 18:38:57
