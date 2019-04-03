select * from nigamaman.user

create user 'cust@localhost' identified by '123456';

show grants for 'cust@localhost';

grant all on nigamaman.* to 'cust@localhost';

revoke all privileges, grant option from 'cust@localhost';

grant insert (add_id,add_line1,add_line2,town_city,state,country,other_details) 
on nigamaman.ADDRESS_CUSTOMER_EMPLOYEE 
to 'cust@localhost';

grant insert (Customer_id,cust_first_name,cust_last_name,cust_dob,add_id,cust_contact,login_id,internet_banking_internet_id) 
on nigamaman.customer 
to 'cust@localhost';

grant insert (login_id,username,password) 
on nigamaman.login 
to 'cust@localhost';

grant update (add_id,add_line1,add_line2,town_city,state,country,other_details) 
on nigamaman.ADDRESS_CUSTOMER_EMPLOYEE 
to 'cust@localhost';

grant update (Customer_id,cust_first_name,cust_last_name,cust_dob,add_id,cust_contact,login_id,internet_banking_internet_id) 
on nigamaman.customer 
to 'cust@localhost';

grant update (login_id,username,password) 
on nigamaman.login 
to 'cust@localhost';

grant select (transaction_id,amount,transaction_date_time,other_details,transaction_types_transaction_type_code,account_account_number) 
on nigamaman.transaction 
to 'cust@localhost';

select * from ADDRESS_CUSTOMER_EMPLOYEE;

select * from customer;

select * from login;

select * from transaction;

select * from mysql.user;

