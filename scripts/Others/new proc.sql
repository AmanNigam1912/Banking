ALTER TABLE LOAN
ADD COLUMN Amount_Paid INT;

ALTER TABLE LOAN
ADD COLUMN Notification varchar(45);

select * from  loan;

DELIMITER //
CREATE PROCEDURE loan_amt_paid_func
(IN cust_id INT,IN pay_amt INT)
BEGIN
	SELECT 
    l.loan_number,
    @loan_amount:=l.loan_amount,
    c.customer_id,
    @amt_paid:=l.amount_paid
FROM
    customer c,
    loan l
WHERE
    c.customer_id = l.CUSTOMER_Customer_id
        AND l.CUSTOMER_Customer_id = cust_id;
    
   UPDATE loan 
SET 
    amount_paid = (pay_amt + @amt_paid)
WHERE
    CUSTOMER_Customer_id = cust_id;
    
    SELECT 
    @new_amt_paid:=l.amount_paid
FROM
    customer c,
    loan l
WHERE
    c.customer_id = l.CUSTOMER_Customer_id
        AND l.CUSTOMER_Customer_id = cust_id;
    
    SELECT @notification:=LOAN_CHECK(@loan_amount, @new_amt_paid);
    
    UPDATE loan 
SET 
    Notification = @notification
WHERE
    CUSTOMER_Customer_id = cust_id;
    
END //
DELIMITER ;

CALL loan_amt_paid_func(903,5000);

SET SQL_SAFE_UPDATES = 0;

drop procedure loan_amt_paid_func;

select l.loan_number, l.loan_amount, c.customer_id, l.amount_paid  
from customer c, loan l
where c.customer_id=l.CUSTOMER_Customer_id
and l.CUSTOMER_Customer_id=903;

update loan set loan_amount=15000
where CUSTOMER_Customer_id=903;

update loan set amount_paid=0
where CUSTOMER_Customer_id=903;

select * from loan;

rollback;