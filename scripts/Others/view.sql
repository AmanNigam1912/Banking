select * from CUSTOMER;

select * from ADDRESS_CUSTOMER_EMPLOYEE;

select * from ACCOUNT;

select * from ACCOUNT_TYPES;

select * from LOAN_TYPE;

select * from LOAN;

select * from LOAN_TYPE;

select * from EMPLOYEE;

select * from BRANCH;

select * from LOAN_TYPES_BY_BRANCH;

insert into ADDRESS_CUSTOMER_EMPLOYEE
values(406,"1196 St Alphonsus Street",null,"Boston","MA","USA","Customer address");

insert into CUSTOMER
values(903,"Fredrick","D'Souza",'1989-10-19',406,"8159711896",null,null);

insert into ACCOUNT
values(5555,0.0,curdate(),301);

delete from ACCOUNT
where account_number=5555;

select * from CUSTOMER_ACCOUNT_DETAILS;

insert into CUSTOMER_ACCOUNT_DETAILS
values(903,5555);

insert into LOAN
values(10001,15000,602,903);


select b.Branch_Name as "Branch Name",a.account_number as "A/C Number",concat_ws(' ',c.Cust_First_Name, c.Cust_Last_Name) as "Customer Name", c.Cust_Contact "Contact", l3.loan_number as "Loan Number",l2.loan_type_description as "Loan Type",l2.interest_rate as "Interest Rate",l3.Loan_Amount as "Loan Amount",l2.loan_type_code As "Loan Type Code",e.employee_name as "Employee Name" 
from EMPLOYEE e, branch b, LOAN_TYPES_BY_BRANCH l1, LOAN_TYPE l2, LOAN l3, CUSTOMER c, CUSTOMER_ACCOUNT_DETAILS cad, ACCOUNT a
where b.branch_id=e.branch_branch_id
and b.branch_id=l1.branch_branch_id
and l1.loan_type_loan_type_code=l2.loan_type_code
and l2.loan_type_code=l3.loan_type_loan_type_code
and l3.customer_customer_id=c.customer_id
and c.customer_id=cad.customer_customer_id
and cad.account_account_number=a.account_number
and l2.EMPLOYEE_Employee_ID=e.Employee_ID;


ALTER TABLE LOAN_TYPE
ADD COLUMN EMPLOYEE_Employee_ID INT not null;

ALTER TABLE LOAN_TYPE
ADD FOREIGN KEY fk_Employee_ID(EMPLOYEE_Employee_ID)
REFERENCES EMPLOYEE(Employee_ID)
ON DELETE NO action
ON UPDATE NO action;



update LOAN_TYPE set EMPLOYEE_Employee_ID=502
where loan_type_code=601;

update LOAN_TYPE set EMPLOYEE_Employee_ID=502
where loan_type_code=602;

update LOAN_TYPE set EMPLOYEE_Employee_ID=502
where loan_type_code=603;

select * from LOAN_TYPE;

select * from EMPLOYEE;

CREATE VIEW Auto_Loan_Details_Customer AS
    SELECT 
        b.Branch_Name AS 'Branch Name',
        a.account_number AS 'A/C Number',
        CONCAT_WS(' ', c.Cust_First_Name, c.Cust_Last_Name) AS 'Customer Name',
        c.Cust_Contact 'Contact',
        l3.loan_number AS 'Loan Number',
        l2.loan_type_description AS 'Loan Type',
        l2.interest_rate AS 'Interest Rate',
        l3.Loan_Amount AS 'Loan Amount',
        l2.loan_type_code AS 'Loan Type Code',
        e.employee_name AS 'Employee Name'
    FROM
        EMPLOYEE e,
        branch b,
        LOAN_TYPES_BY_BRANCH l1,
        LOAN_TYPE l2,
        LOAN l3,
        CUSTOMER c,
        CUSTOMER_ACCOUNT_DETAILS cad,
        ACCOUNT a
    WHERE
        l3.customer_customer_id = c.customer_id
            AND c.customer_id = cad.customer_customer_id
            AND cad.account_account_number = a.account_number
            AND l2.EMPLOYEE_Employee_ID = e.Employee_ID
            AND b.branch_id = l1.branch_branch_id
            AND l1.loan_type_loan_type_code = l2.loan_type_code
            AND l2.loan_type_code = l3.loan_type_loan_type_code
            AND b.branch_id = 201
            AND l2.loan_type_description = 'Auto Loans';


drop view Loan_Details_Customer;


SELECT 
    *
FROM
    Auto_Loan_Details_Customer;



select b.Branch_Name as "Branch Name",a.account_number as "A/C Number",concat_ws(' ',c.Cust_First_Name, c.Cust_Last_Name) as "Customer Name", c.Cust_Contact "Contact", l3.loan_number as "Loan Number",l2.loan_type_description as "Loan Type",l2.interest_rate as "Interest Rate",l3.Loan_Amount as "Loan Amount",l2.loan_type_code As "Loan Type Code",e.employee_name as "Employee Name" 
from EMPLOYEE e, branch b, LOAN_TYPES_BY_BRANCH l1, LOAN_TYPE l2, LOAN l3, CUSTOMER c, CUSTOMER_ACCOUNT_DETAILS cad, ACCOUNT a
where l3.customer_customer_id=c.customer_id
and c.customer_id=cad.customer_customer_id
and cad.account_account_number=a.account_number
and l2.EMPLOYEE_Employee_ID=e.Employee_ID
and b.branch_id=l1.branch_branch_id
and l1.loan_type_loan_type_code=l2.loan_type_code
and l2.loan_type_code=l3.loan_type_loan_type_code
and b.branch_id=201
and l2.loan_type_description='Auto Loans';


insert into ADDRESS_CUSTOMER_EMPLOYEE
values(407,"1140 Huntington Ave",null,"Boston","MA","USA","Customer address");

insert into CUSTOMER
values(904,"Dion","Nash",'1985-11-25',407,"8156489657",null,null);

insert into ACCOUNT
values(6587,0.0,curdate(),301);

insert into CUSTOMER_ACCOUNT_DETAILS
values(904,6587);

insert into LOAN
values(10002,90000,603,904);



insert into ADDRESS_CUSTOMER_EMPLOYEE
values(408,"853 Mission Hill",null,"Boston","MA","USA","Customer address");

insert into CUSTOMER
values(905,"Shane","Bond",'1984-12-21',407,"8156159632",null,null);

insert into ACCOUNT
values(7415,0.0,curdate(),301);

insert into CUSTOMER_ACCOUNT_DETAILS
values(905,7415);

insert into LOAN
values(10003,5000,601,905);