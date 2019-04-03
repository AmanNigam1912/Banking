-- MySQL Workbench Forward Engineering


SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- -----------------------------------------------------
-- Table `nigamaman`.`BANK`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nigamaman`.`BANK` (
  `Bank_Name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`Bank_Name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nigamaman`.`ADDRESS_ATM_AND_BRANCH`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nigamaman`.`ADDRESS_ATM_AND_BRANCH` (
  `Address_Id` INT(11) NOT NULL,
  `Add_Line1` VARCHAR(45) NOT NULL,
  `Add_Line2` VARCHAR(45) NULL,
  `Town_City` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `Other_Details` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Address_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nigamaman`.`LOGIN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nigamaman`.`LOGIN` (
  `Login_ID` INT NOT NULL,
  `Username` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Login_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nigamaman`.`TRANSACTION_TYPES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nigamaman`.`TRANSACTION_TYPES` (
  `Transaction_Type_Code` INT NOT NULL,
  `Transaction_Type_Description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Transaction_Type_Code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nigamaman`.`ACCOUNT_TYPES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nigamaman`.`ACCOUNT_TYPES` (
  `Account_Type_Code` INT NOT NULL,
  `Account_Type_Description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Account_Type_Code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nigamaman`.`ACCOUNT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nigamaman`.`ACCOUNT` (
  `Account_Number` INT NOT NULL,
  `Account_Balance` INT NOT NULL,
  `Account_Open_Date` DATE NOT NULL,
  `Account_Type_Code` INT NOT NULL,
  PRIMARY KEY (`Account_Number`),
  INDEX `fk_ACCOUNT_ACCOUNT_TYPES1_idx` (`Account_Type_Code` ASC) VISIBLE,
  CONSTRAINT `fk_ACCOUNT_ACCOUNT_TYPES1`
    FOREIGN KEY (`Account_Type_Code`)
    REFERENCES `nigamaman`.`ACCOUNT_TYPES` (`Account_Type_Code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nigamaman`.`TRANSACTION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nigamaman`.`TRANSACTION` (
  `Transaction_ID` INT NOT NULL,
  `Amount` VARCHAR(45) NOT NULL,
  `Transaction_Date_Time` DATETIME NOT NULL,
  `Other_Details` VARCHAR(45) NOT NULL,
  `TRANSACTION_TYPES_Transaction_Type_Code` INT NOT NULL,
  `ACCOUNT_Account_Number` INT NOT NULL,
  PRIMARY KEY (`Transaction_ID`),
  INDEX `fk_TRANSACTION_TRANSACTION_TYPES1_idx` (`TRANSACTION_TYPES_Transaction_Type_Code` ASC) VISIBLE,
  INDEX `fk_TRANSACTION_ACCOUNT1_idx` (`ACCOUNT_Account_Number` ASC) VISIBLE,
  CONSTRAINT `fk_TRANSACTION_TRANSACTION_TYPES1`
    FOREIGN KEY (`TRANSACTION_TYPES_Transaction_Type_Code`)
    REFERENCES `nigamaman`.`TRANSACTION_TYPES` (`Transaction_Type_Code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TRANSACTION_ACCOUNT1`
    FOREIGN KEY (`ACCOUNT_Account_Number`)
    REFERENCES `nigamaman`.`ACCOUNT` (`Account_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nigamaman`.`INTERNET_BANKING`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nigamaman`.`INTERNET_BANKING` (
  `Internet_ID` INT(11) NOT NULL,
  `Login_ID` INT(11) NULL,
  `Transaction_ID` INT(11) NULL,
  PRIMARY KEY (`Internet_ID`),
  INDEX `fk_INTERNET_BANKING_LOGIN1_idx` (`Login_ID` ASC) VISIBLE,
  INDEX `fk_INTERNET_BANKING_TRANSACTION1_idx` (`Transaction_ID` ASC) VISIBLE,
  CONSTRAINT `fk_INTERNET_BANKING_LOGIN1`
    FOREIGN KEY (`Login_ID`)
    REFERENCES `nigamaman`.`LOGIN` (`Login_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_INTERNET_BANKING_TRANSACTION1`
    FOREIGN KEY (`Transaction_ID`)
    REFERENCES `nigamaman`.`TRANSACTION` (`Transaction_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nigamaman`.`BRANCH`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nigamaman`.`BRANCH` (
  `Branch_ID` INT(11) NOT NULL,
  `Branch_Name` VARCHAR(45) NOT NULL,
  `Branch_Code` VARCHAR(45) NOT NULL,
  `Address_ID` INT(11) NOT NULL,
  `BANK_Bank_Name` VARCHAR(30) NOT NULL,
  `INTERNET_BANKING_Internet_ID` INT(11) NULL,
  PRIMARY KEY (`Branch_ID`),
  INDEX `fk_BRANCH_ADDRESS_ATM_BRANCH1_idx` (`Address_ID` ASC) INVISIBLE,
  INDEX `fk_BRANCH_BANK1_idx` (`BANK_Bank_Name` ASC) VISIBLE,
  INDEX `fk_BRANCH_INTERNET_BANKING1_idx` (`INTERNET_BANKING_Internet_ID` ASC) VISIBLE,
  CONSTRAINT `fk_ADDRESS_ID`
    FOREIGN KEY (`Address_ID`)
    REFERENCES `nigamaman`.`ADDRESS_ATM_AND_BRANCH` (`Address_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BRANCH_BANK1`
    FOREIGN KEY (`BANK_Bank_Name`)
    REFERENCES `nigamaman`.`BANK` (`Bank_Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BRANCH_INTERNET_BANKING1`
    FOREIGN KEY (`INTERNET_BANKING_Internet_ID`)
    REFERENCES `nigamaman`.`INTERNET_BANKING` (`Internet_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nigamaman`.`ADDRESS_CUSTOMER_EMPLOYEE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nigamaman`.`ADDRESS_CUSTOMER_EMPLOYEE` (
  `Add_ID` INT NOT NULL,
  `Add_Line1` VARCHAR(45) NOT NULL,
  `Add_Line2` VARCHAR(45) NULL,
  `Town_City` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `Other_Details` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Add_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nigamaman`.`CUSTOMER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nigamaman`.`CUSTOMER` (
  `Customer_Id` INT NOT NULL,
  `Cust_First_Name` VARCHAR(45) NOT NULL,
  `Cust_Last_Name` VARCHAR(45) NOT NULL,
  `Cust_DOB` VARCHAR(45) NOT NULL,
  `Add_ID` INT NOT NULL,
  `Cust_Contact` VARCHAR(45) NOT NULL,
  `Login_ID` INT NULL,
  `INTERNET_BANKING_Internet_ID` INT NULL,
  PRIMARY KEY (`Customer_Id`),
  INDEX `fk_CUSTOMER_ADDRESS_CUSTOMER1_idx` (`Add_ID` ASC) VISIBLE,
  INDEX `fk_LOGIN_ID_idx` (`Login_ID` ASC) VISIBLE,
  INDEX `fk_CUSTOMER_INTERNET_BANKING1_idx` (`INTERNET_BANKING_Internet_ID` ASC) VISIBLE,
  CONSTRAINT `fk_CUSTOMER_ADDRESS_CUSTOMER1`
    FOREIGN KEY (`Add_ID`)
    REFERENCES `nigamaman`.`ADDRESS_CUSTOMER_EMPLOYEE` (`Add_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LOGIN_ID`
    FOREIGN KEY (`Login_ID`)
    REFERENCES `nigamaman`.`LOGIN` (`Login_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CUSTOMER_INTERNET_BANKING1`
    FOREIGN KEY (`INTERNET_BANKING_Internet_ID`)
    REFERENCES `nigamaman`.`INTERNET_BANKING` (`Internet_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nigamaman`.`ACCOUNTS_AT_ATM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nigamaman`.`ACCOUNTS_AT_ATM` (
  `ACCOUNT_Account_Number` INT NOT NULL,
  INDEX `fk_ACCOUNT_has_ATM_ACCOUNT1_idx` (`ACCOUNT_Account_Number` ASC) VISIBLE,
  CONSTRAINT `fk_ACCOUNT_has_ATM_ACCOUNT1`
    FOREIGN KEY (`ACCOUNT_Account_Number`)
    REFERENCES `nigamaman`.`ACCOUNT` (`Account_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nigamaman`.`ATM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nigamaman`.`ATM` (
  `ATM_ID` INT NOT NULL,
  `Address_ID` INT NOT NULL,
  `Account_Number` INT NULL,
  PRIMARY KEY (`ATM_ID`),
  INDEX `fk_Address_ID_idx` (`Address_ID` ASC) VISIBLE,
  INDEX `fk_Account_Number_idx` (`Account_Number` ASC) VISIBLE,
  CONSTRAINT `fk_Address_ID_ATM`
    FOREIGN KEY (`Address_ID`)
    REFERENCES `nigamaman`.`ADDRESS_ATM_AND_BRANCH` (`Address_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Account_Number`
    FOREIGN KEY (`Account_Number`)
    REFERENCES `nigamaman`.`ACCOUNTS_AT_ATM` (`ACCOUNT_Account_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nigamaman`.`LOAN_TYPE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nigamaman`.`LOAN_TYPE` (
  `Loan_Type_Code` INT NOT NULL,
  `Loan_Type_Description` VARCHAR(45) NOT NULL,
  `Interest_Rate` DOUBLE NOT NULL,
  `CUSTOMER_Customer_Id` INT NULL,
  PRIMARY KEY (`Loan_Type_Code`),
  INDEX `fk_LOAN_TYPE_CUSTOMER1_idx` (`CUSTOMER_Customer_Id` ASC) VISIBLE,
  CONSTRAINT `fk_LOAN_TYPE_CUSTOMER1`
    FOREIGN KEY (`CUSTOMER_Customer_Id`)
    REFERENCES `nigamaman`.`CUSTOMER` (`Customer_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nigamaman`.`LOAN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nigamaman`.`LOAN` (
  `Loan_Number` INT NOT NULL,
  `Loan_Amount` INT NOT NULL,
  `LOAN_TYPE_Loan_Type_Code` INT NOT NULL,
  PRIMARY KEY (`Loan_Number`),
  INDEX `fk_LOAN_LOAN_TYPE1_idx` (`LOAN_TYPE_Loan_Type_Code` ASC) VISIBLE,
  CONSTRAINT `fk_LOAN_LOAN_TYPE1`
    FOREIGN KEY (`LOAN_TYPE_Loan_Type_Code`)
    REFERENCES `nigamaman`.`LOAN_TYPE` (`Loan_Type_Code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nigamaman`.`ACCOUNT_TYPES_BY_BRANCH`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nigamaman`.`ACCOUNT_TYPES_BY_BRANCH` (
  `BRANCH_Branch_ID` INT NOT NULL,
  `ACCOUNT_TYPES_Account_Type_Code` INT NOT NULL,
  INDEX `fk_BRANCH_has_ACCOUNT_TYPES_ACCOUNT_TYPES1_idx` (`ACCOUNT_TYPES_Account_Type_Code` ASC) VISIBLE,
  INDEX `fk_BRANCH_has_ACCOUNT_TYPES_BRANCH1_idx` (`BRANCH_Branch_ID` ASC) VISIBLE,
  CONSTRAINT `fk_BRANCH_has_ACCOUNT_TYPES_BRANCH1`
    FOREIGN KEY (`BRANCH_Branch_ID`)
    REFERENCES `nigamaman`.`BRANCH` (`Branch_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BRANCH_has_ACCOUNT_TYPES_ACCOUNT_TYPES1`
    FOREIGN KEY (`ACCOUNT_TYPES_Account_Type_Code`)
    REFERENCES `nigamaman`.`ACCOUNT_TYPES` (`Account_Type_Code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nigamaman`.`CUSTOMER_ACCOUNT_DETAILS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nigamaman`.`CUSTOMER_ACCOUNT_DETAILS` (
  `CUSTOMER_Customer_Id` INT NOT NULL,
  `ACCOUNT_Account_Number` INT NOT NULL,
  INDEX `fk_CUSTOMER_has_ACCOUNT_ACCOUNT1_idx` (`ACCOUNT_Account_Number` ASC) VISIBLE,
  INDEX `fk_CUSTOMER_has_ACCOUNT_CUSTOMER1_idx` (`CUSTOMER_Customer_Id` ASC) VISIBLE,
  CONSTRAINT `fk_CUSTOMER_has_ACCOUNT_CUSTOMER1`
    FOREIGN KEY (`CUSTOMER_Customer_Id`)
    REFERENCES `nigamaman`.`CUSTOMER` (`Customer_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CUSTOMER_has_ACCOUNT_ACCOUNT1`
    FOREIGN KEY (`ACCOUNT_Account_Number`)
    REFERENCES `nigamaman`.`ACCOUNT` (`Account_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nigamaman`.`LOAN_TYPES_BY_BRANCH`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nigamaman`.`LOAN_TYPES_BY_BRANCH` (
  `BRANCH_Branch_ID` INT NOT NULL,
  `LOAN_TYPE_Loan_Type_Code` INT NOT NULL,
  INDEX `fk_BRANCH_has_LOAN_TYPE_LOAN_TYPE1_idx` (`LOAN_TYPE_Loan_Type_Code` ASC) VISIBLE,
  INDEX `fk_BRANCH_has_LOAN_TYPE_BRANCH1_idx` (`BRANCH_Branch_ID` ASC) VISIBLE,
  CONSTRAINT `fk_BRANCH_has_LOAN_TYPE_BRANCH1`
    FOREIGN KEY (`BRANCH_Branch_ID`)
    REFERENCES `nigamaman`.`BRANCH` (`Branch_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BRANCH_has_LOAN_TYPE_LOAN_TYPE1`
    FOREIGN KEY (`LOAN_TYPE_Loan_Type_Code`)
    REFERENCES `nigamaman`.`LOAN_TYPE` (`Loan_Type_Code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nigamaman`.`EMPLOYEE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nigamaman`.`EMPLOYEE` (
  `Employee_ID` INT NOT NULL,
  `Employee_Name` VARCHAR(45) NOT NULL,
  `Employee_DOB` INT NOT NULL,
  `Employee_Dept` VARCHAR(45) NOT NULL,
  `Employee_EMAIL` VARCHAR(45) NOT NULL,
  `BRANCH_Branch_ID` INT NOT NULL,
  `ADDRESS_CUSTOMER_Add_ID` INT NOT NULL,
  PRIMARY KEY (`Employee_ID`),
  INDEX `fk_EMPLOYEE_BRANCH1_idx` (`BRANCH_Branch_ID` ASC) VISIBLE,
  INDEX `fk_EMPLOYEE_ADDRESS_CUSTOMER1_idx` (`ADDRESS_CUSTOMER_Add_ID` ASC) VISIBLE,
  CONSTRAINT `fk_EMPLOYEE_BRANCH1`
    FOREIGN KEY (`BRANCH_Branch_ID`)
    REFERENCES `nigamaman`.`BRANCH` (`Branch_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLOYEE_ADDRESS_CUSTOMER1`
    FOREIGN KEY (`ADDRESS_CUSTOMER_Add_ID`)
    REFERENCES `nigamaman`.`ADDRESS_CUSTOMER_EMPLOYEE` (`Add_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nigamaman`.`TRANSACTIONS_AT_ATM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nigamaman`.`TRANSACTIONS_AT_ATM` (
  `ATM_ATM_ID` INT NOT NULL,
  `TRANSACTION_Transaction_ID` INT NOT NULL,
  INDEX `fk_ATM_has_TRANSACTION_TRANSACTION1_idx` (`TRANSACTION_Transaction_ID` ASC) VISIBLE,
  INDEX `fk_ATM_has_TRANSACTION_ATM1_idx` (`ATM_ATM_ID` ASC) VISIBLE,
  CONSTRAINT `fk_ATM_has_TRANSACTION_ATM1`
    FOREIGN KEY (`ATM_ATM_ID`)
    REFERENCES `nigamaman`.`ATM` (`ATM_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ATM_has_TRANSACTION_TRANSACTION1`
    FOREIGN KEY (`TRANSACTION_Transaction_ID`)
    REFERENCES `nigamaman`.`TRANSACTION` (`Transaction_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nigamaman`.`CUSTOMER_DETAILS_AT_ATM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nigamaman`.`CUSTOMER_DETAILS_AT_ATM` (
  `ATM_ATM_ID` INT NOT NULL,
  `CUSTOMER_Customer_Id` INT NOT NULL,
  INDEX `fk_ATM_has_CUSTOMER_CUSTOMER1_idx` (`CUSTOMER_Customer_Id` ASC) VISIBLE,
  INDEX `fk_ATM_has_CUSTOMER_ATM1_idx` (`ATM_ATM_ID` ASC) VISIBLE,
  CONSTRAINT `fk_ATM_has_CUSTOMER_ATM1`
    FOREIGN KEY (`ATM_ATM_ID`)
    REFERENCES `nigamaman`.`ATM` (`ATM_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ATM_has_CUSTOMER_CUSTOMER1`
    FOREIGN KEY (`CUSTOMER_Customer_Id`)
    REFERENCES `nigamaman`.`CUSTOMER` (`Customer_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


ALTER TABLE LOAN
ADD COLUMN LOAN INT;

ALTER TABLE LOAN 
CHANGE `LOAN` `CUSTOMER_Customer_Id` INT;


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


ALTER TABLE LOAN_TYPE
ADD COLUMN EMPLOYEE_Employee_ID INT not null;

ALTER TABLE LOAN_TYPE
ADD FOREIGN KEY fk_Employee_ID(EMPLOYEE_Employee_ID)
REFERENCES EMPLOYEE(Employee_ID)
ON DELETE NO action
ON UPDATE NO action;

ALTER TABLE TRANSACTION
ADD COLUMN Message varchar(45);

ALTER TABLE TRANSACTION
MODIFY COLUMN Amount INT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
