use sakila;

-- DROP TABLE IF EXISTS account;
CREATE TABLE account (
    account_id int unsigned NOT NULL auto_increment,
    avail_balance double NOT NULL,
    last_activity_date datetime NOT NULL,
    primary key(account_id)
);

desc account;

DROP TABLE IF EXISTS transaction;

CREATE TABLE transaction (
    txn_id int unsigned auto_increment,
    txn_date datetime NULL,
    account_id int unsigned NULL,
    txn_type_cd varchar(1) NOT NULL,
    amount double NULL,
    primary key(txn_id)
);

desc transaction;

drop procedure test;

SET AUTOCOMMIT=0

delimiter //

CREATE procedure test()
begin
declare sql_error tinyint default false;

declare continue handler for sqlexception
set sql_error = true;

START TRANSACTION;

SAVEPOINT before_updates;

INSERT INTO account(account_id, avail_balance, last_activity_date)
VALUES(123, 500, "2019-07-10 20:53:27");
INSERT INTO account(account_id, avail_balance, last_activity_date)
VALUES(789, 75, "2019-06-22 15:18:35");
INSERT INTO transaction(txn_id, txn_date, account_id, txn_type_cd, amount)
VALUES(1003, "2020-11-29 15:02:35", 123, "D", 50);
INSERT INTO transaction(txn_id, txn_date, account_id, txn_type_cd, amount)
VALUES(1004, "2020-11-29 15:03:04", 789, "C", 50); 

-- ROLLBACK TO SAVEPOINT before_update;

INSERT INTO transaction(txn_id, txn_date, account_id, txn_type_cd, amount)
SELECT 1001, a.last_activity_date, a.account_id, 'C', a.avail_balance
FROM account a
WHERE a.account_id = 123;

INSERT INTO transaction(txn_id, txn_date, account_id, txn_type_cd, amount)
SELECT 1002, a.last_activity_date, a.account_id, 'C', a.avail_balance
FROM account a
WHERE a.account_id = 789;

UPDATE account
SET last_activity_date = (select txn_date from transaction where account_id = 123 and amount = 50),
	avail_balance = avail_balance - 
     (select (case when txn_type_cd = 'C' 
     then amount * -1 
     else amount end)
     from transaction where account_id = 123 and amount =50)
WHERE account_id = 123;

UPDATE account
SET last_activity_date = (select txn_date from transaction where account_id = 789 and amount =50),
	avail_balance = avail_balance - 
    (select (case when txn_type_cd = 'C' 
    then amount * -1 
    else amount end)
    from transaction where account_id = 789 and amount =50)
WHERE account_id = 789;
 
if sql_error = false then
commit;
select "Transaction completed";
else
  ROLLBACK;
  select "Unable to complete transaction";
END IF;
end //

call test();

-- Validate the aggregated results in transaction table.
SELECT   account_id
,        SUM(
           CASE
             WHEN txn_type_cd = 'C' THEN amount
             WHEN txn_type_cd = 'D' THEN amount * -1
           END) AS account_balance
FROM     transaction
WHERE    account_id IN (123,789)
GROUP BY account_id;

Select * from transaction;
Select * from account;