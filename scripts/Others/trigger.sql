select * from acc_temp;

select * from transaction;

select * from account;

update transaction set amount=1000
where account_account_number=1596;

DELIMITER //
CREATE TRIGGER trial
After UPDATE ON transaction
For each row
BEGIN
declare acc_bal int;

	select account_balance
    into acc_bal
    from account
    where account_number=new.account_account_number;
	
    update account set account_balance=acc_bal+new.amount
    where account_number=new.account_account_number;
	
end //
delimiter ;    

drop trigger trial;


DELIMITER //
CREATE TRIGGER update_accbalance_trg
After UPDATE ON transaction
For each row
BEGIN
declare acc_bal int;

	SELECT 
    account_balance
INTO acc_bal FROM
    account
WHERE
    account_number = new.account_account_number;
	
    UPDATE account 
SET 
    account_balance = acc_bal + new.amount
WHERE
    account_number = new.account_account_number;
	
end //
delimiter ;  