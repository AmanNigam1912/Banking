select * from ACCOUNTS_AT_ATM;

select * from ATM;

select * from ADDRESS_ATM_AND_BRANCH;

select * from TRANSACTIONS_AT_ATM;

select * from TRANSACTION;

select * from TRANSACTION_TYPES;

update TRANSACTION set other_details='Transaction done at ATM'
where transaction_id=3003;

insert into ATM
values(1004,110,9995);

insert into ACCOUNTS_AT_ATM
values(9995);

insert into TRANSACTION
values(3003,500,NOW(),"$500 transferred successfully",2001,9995);

insert into TRANSACTIONS_AT_ATM
values(1004,3004);

select d.CUSTOMER_Customer_Id as "Customer ID", concat_ws(' ',e.Cust_First_Name, e.Cust_Last_Name) as "Customer Name",  c.Account_Number As "A/C Number", f.Transaction_Type_Description as "Transaction Type", b.Transaction_Id as "Transaction ID",b.Amount, b. Transaction_Date_Time As "Date", b.Other_Details as "Type" 
from TRANSACTION b, account c, customer_account_details d,customer e,TRANSACTION_TYPES f
where b.TRANSACTION_TYPES_Transaction_Type_Code=f.Transaction_Type_Code 
and b.ACCOUNT_Account_number=c.Account_Number
and c.Account_Number=d.ACCOUNT_Account_Number
and d.CUSTOMER_Customer_Id=e.customer_id
and d.CUSTOMER_Customer_Id=e.customer_id
and c.Account_Number=9995;

insert into TRANSACTION
values(3004,200,NOW(),"Debit of $200",2001,9995);

update TRANSACTION set TRANSACTION_TYPES_Transaction_Type_Code=2002
where transaction_id=3004;
