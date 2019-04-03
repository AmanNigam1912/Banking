select * from INTERNET_BANKING;

select * from TRANSACTION;

select * from CUSTOMER;

select * from LOGIN;

select * from ACCOUNT;

select * from CUSTOMER_ACCOUNT_DETAILS;

select * from ACCOUNT_TYPES_BY_BRANCH;

select * from TRANSACTION_TYPES;

insert into ACCOUNT
values(9995,0.0,'2018-12-11',301);

insert into CUSTOMER_ACCOUNT_DETAILS
values(902,9995);

update LOGIN set Username='casey456', Password='casey@456'
where LOGIN_ID = 801;

insert into TRANSACTION
values(3005,600,now(),"Transaction done at ATM",2001,9995);

update INTERNET_BANKING set Transaction_ID=30002 
where Internet_ID=702;

delete from INTERNET_BANKING
where Internet_ID=702;

insert into INTERNET_BANKING
values(702,801,3002);

ALTER TABLE INTERNET_BANKING 
DROP FOREIGN KEY fk_INTERNET_BANKING_TRANSACTION1;

ALTER TABLE INTERNET_BANKING
DROP Transaction_ID;

CREATE TABLE IF NOT EXISTS `nigamaman`.`TRANSACTION_INTERNET_BANKING` (
	`Trx_Internet_ID` INT NOT NULL,
    `INTERNET_BANKING_Internet_ID` INT NULL,
	`TRANSACTION_Transaction_ID` INT NULL,
    CONSTRAINT `fk_TRANSACTION_INTERNET_BANKING_INTERNET_BANKING1`
    FOREIGN KEY (`INTERNET_BANKING_Internet_ID`)
    REFERENCES `nigamaman`.`INTERNET_BANKING` (`Internet_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_TRANSACTION_INTERNET_BANKING_TRANSACTION1`
    FOREIGN KEY (`TRANSACTION_Transaction_ID`)
    REFERENCES `nigamaman`.`TRANSACTION` (`Transaction_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;    

insert into TRANSACTION_INTERNET_BANKING
values(4001,702,3002);

update TRANSACTION set Other_Details='Transaction done at Internet Banking'
where Transaction_ID=3002;

select d.CUSTOMER_Customer_Id as "Customer ID", concat_ws(' ',e.Cust_First_Name, e.Cust_Last_Name) as "Customer Name",  c.Account_Number As "A/C Number", b.Transaction_Id as "Transaction ID",b.Amount, b. Transaction_Date_Time As "Date", b.Other_Details as "Type"
from  TRANSACTION_INTERNET_BANKING a, TRANSACTION b, account c, customer_account_details d,customer e
where a.TRANSACTION_Transaction_ID=b.transaction_Id
and b.ACCOUNT_Account_Number=c.Account_Number
and c.Account_Number=d.ACCOUNT_Account_Number
and d.CUSTOMER_Customer_Id=e.customer_id
and c.Account_Number=9995;

and e.customer_id=902;

select d.* 
from customer_account_details d
where d.CUSTOMER_Customer_Id=902;

select * from customer_account_details;

select * from customer
where Customer_id=902;

select c.* from account c, customer_account_details d
where c.Account_Number=d.ACCOUNT_Account_Number;


select b.* 
from TRANSACTION b, account c, customer_account_details d,customer e
where b.ACCOUNT_Account_number=c.Account_Number
and c.Account_Number=d.ACCOUNT_Account_Number
and d.CUSTOMER_Customer_Id=e.customer_id
and c.Account_Number=1596;


select d.CUSTOMER_Customer_Id as "Customer ID", concat_ws(' ',e.Cust_First_Name, e.Cust_Last_Name) as "Customer Name",  c.Account_Number As "A/C Number", f.Transaction_Type_Description as "Transaction Type", b.Transaction_Id as "Transaction ID",b.Amount, b. Transaction_Date_Time As "Date", b.Other_Details as "Type" 
from TRANSACTION b, account c, customer_account_details d,customer e,TRANSACTION_TYPES f
where b.TRANSACTION_TYPES_Transaction_Type_Code=f.Transaction_Type_Code 
and b.ACCOUNT_Account_number=c.Account_Number
and c.Account_Number=d.ACCOUNT_Account_Number
and d.CUSTOMER_Customer_Id=e.customer_id
and d.CUSTOMER_Customer_Id=e.customer_id
and c.Account_Number=9995
and b.Transaction_Date_Time<='2018-12-11 21:52:24' and b.Transaction_Date_Time>'2018-12-11 17:42:17'
order by amount asc;



DELIMITER //
CREATE PROCEDURE Customer_Transaction_new
(IN acc_num INT)
BEGIN

SELECT 
    d.CUSTOMER_Customer_Id AS 'Customer ID',
    CONCAT_WS(' ', e.Cust_First_Name, e.Cust_Last_Name) AS 'Customer Name',
    c.Account_Number AS 'A/C Number',
    f.Transaction_Type_Description AS 'Transaction Type',
    b.Transaction_Id AS 'Transaction ID',
    b.Amount,
    b.Transaction_Date_Time AS 'Date',
    b.Other_Details AS 'Type'
FROM
    TRANSACTION b,
    account c,
    customer_account_details d,
    customer e,
    TRANSACTION_TYPES f
WHERE
    b.TRANSACTION_TYPES_Transaction_Type_Code = f.Transaction_Type_Code
        AND b.ACCOUNT_Account_number = c.Account_Number
        AND c.Account_Number = d.ACCOUNT_Account_Number
        AND d.CUSTOMER_Customer_Id = e.customer_id
        AND d.CUSTOMER_Customer_Id = e.customer_id
        AND c.Account_Number = 9995;
		and b.Transaction_Date_Time<='2018-12-11 21:52:24' 
        and b.Transaction_Date_Time>'2018-12-11 17:42:17'

If @amount > 400 then
	update TRANSACTION set message='Transaction greater than 400 are not allowed'
    where Transaction_Id=@trx_id;
else    
	update account set message='Your recent transaction was successful'
    where Transaction_Id=@trx_id;
end if;    
END //
DELIMITER ;


CALL Customer_Transaction_new(9995);


drop procedure Customer_Transaction_new;

select * from account;


ALTER TABLE account
ADD COLUMN Message varchar(45);

ALTER TABLE TRANSACTION
ADD COLUMN Message varchar(45);

ALTER TABLE account
DROP message;

select * from TRANSACTION;