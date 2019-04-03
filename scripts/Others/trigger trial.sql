CREATE TABLE acc_temp (
    trx_desc VARCHAR(45),
    balance INT,
    old_balance INT,
    new_balance INT,
    acc_num INT,
    amount INT
);

select * from transaction;

select * from TRANSACTION_TYPES;


select * from acc_temp;

select * from ACCOUNT;

insert into ACCOUNT
values(6000,700,curdate(),301);

insert into acc_temp
values(null,null,null,null,6000,null);

insert into TRANSACTION
values(3008,2000,now(),"Transaction done at ATM",2001,6000,null);

DELIMITER //
CREATE TRIGGER Bal_upd
After INSERT ON transaction
For each row
BEGIN
	declare type int;
    declare amount int;
    declare account_num int;
    declare type_desc varchar(45);
    declare balance int;

	SELECT 
    tt.Transaction_Type_Code,
    t.Amount,
    acc.Account_Number,
    tt.Transaction_Type_Description,
    acc.account_balance
INTO type , amount , account_num , type_desc , balance FROM
    TRANSACTION_TYPES tt,
    Account acc,
    transaction t
WHERE
    t.TRANSACTION_TYPES_Transaction_Type_Code = tt.Transaction_Type_Code
        AND t.ACCOUNT_Account_Number = acc.Account_Number
        AND acc.Account_Number = 6000;
    
        
    IF type = 2001 then
		     
        Update acc_temp set balance=balance+amount
        where acc_num=account_num;
        
        
    else
		
        Update acc_temp set balance=amount-balance
        where acc_num=account_num;
        
	end if;	
    
END //
DELIMITER ;    

DROP trigger Bal_upd;


SELECT tt.Transaction_Type_Code,  acc.Account_Number,tt.Transaction_Type_Description,acc.account_balance, t.Amount
    from TRANSACTION_TYPES tt, Account acc, transaction t
    where t.TRANSACTION_TYPES_Transaction_Type_Code=tt.Transaction_Type_Code
    and t.ACCOUNT_Account_Number=acc.Account_Number
    And acc.Account_Number=9995;
    
    
   
    