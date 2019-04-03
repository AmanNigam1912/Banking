DELIMITER //
CREATE FUNCTION loan_check(loan_amount int,amount_paid int)
RETURNS text
BEGIN
	set @cal=loan_amount*(50/100);
	IF amount_paid>@cal then
		return 'You are eligible to apply for another loan';
	else
		return 'First!Please pay atleast 50% of previous loan';
	end if;
END //
DELIMITER ;

drop function loan_check;

SELECT LOAN_CHECK(15000, 903, 10000);

SET GLOBAL log_bin_trust_function_creators = 1;
        