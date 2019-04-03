insert into bank
values("State Bank of Massachusetts");

insert into ADDRESS_ATM_AND_BRANCH
values(108,"305 Boylston Street",null,"Boston","MA","USA","Branch Address");

insert into BRANCH
values(208,"Boylston Street branch","A208",108,"State Bank of Massachusetts",null);

insert into ACCOUNT_TYPES
values(302,"Checkings Account");

insert into ACCOUNT_TYPES_BY_BRANCH
values(208,302);

insert into ADDRESS_CUSTOMER_EMPLOYEE
values(403,"410 Boylston Street",null,"Boston","MA","USA","Employee address");

insert into EMPLOYEE
values(503,"Peter Parker",'1987-05-19',"Internet Banking Department","parker.peter@sbm.com",201,403);

ALTER TABLE EMPLOYEE
MODIFY COLUMN Employee_DOB DATE; 

ALTER TABLE LOAN_TYPE 
DROP FOREIGN KEY fk_LOAN_TYPE_CUSTOMER1;

ALTER TABLE LOAN_TYPE
DROP COLUMN CUSTOMER_Customer_Id;

insert into LOAN_TYPE
values(603,"Home Loans",4.4,null);

insert into LOAN_TYPES_BY_BRANCH
values(208,603);

insert into INTERNET_BANKING
values(702,801,null);

insert into LOGIN
values(801,"sam123","sam@123");

insert into ADDRESS_CUSTOMER_EMPLOYEE
values(405,"40 Parker Hill",null,"Boston","MA","USA","Customer address");

ALTER TABLE CUSTOMER
MODIFY COLUMN Cust_DOB DATE; 

insert into CUSTOMER
values(902,"Casey","Williams",'1994-10-29',405,"8567411896",801,702);

ALTER TABLE ACCOUNT
MODIFY COLUMN Account_Balance DOUBLE;

insert into ACCOUNT
values(1596,0.0,'2018-12-04',301);

insert into CUSTOMER_ACCOUNT_DETAILS
values(901,1596);

insert into ADDRESS_ATM_AND_BRANCH
values(110,"309 Boylston Street",null,"Boston","MA","USA","ATM Address");

insert into ACCOUNTS_AT_ATM
values(1596);

insert into ATM
values(1002,110,1596);

insert into CUSTOMER_DETAILS_AT_ATM
values(1002,901);

insert into TRANSACTION_TYPES
values(2002,"DEBIT");

ALTER TABLE TRANSACTION
MODIFY COLUMN Amount INT;

insert into TRANSACTION
values(3001,250,'2018-12-04 15:16:54',"$250 transferred successfully",2001,1596);

update transaction set other_details="Transaction done at bank branch"
where transaction_id=3001;

insert into TRANSACTIONS_AT_ATM
values(1002,3001);

insert into TRANSACTION_INTERNET_BANKING
values(4001,702,3002);

ALTER TABLE LOAN
ADD COLUMN LOAN INT;

ALTER TABLE LOAN 
CHANGE `LOAN` `CUSTOMER_Customer_Id` INT;