/*
Using the following table definitions and data, write a query that returns each customer name along with their total payments (these names differ from the textbook because they're the ones in the sakila database):
customer Table:
+-------------+---------------+
| customer_id | name          |
+-------------+---------------+
|           1 | MARY SMITH    |
|           4 | BARBARA JONES |
|         210 | ELLA OLIVER   |
+-------------+---------------+
3 rows in set (0.30 sec)
payment Table:
+------------+-------------+--------+
| payment_id | customer_id | amount |
+------------+-------------+--------+
|          1 |          32 | 118.68 |
|          4 |          22 |  81.78 |
|        210 |          31 | 137.69 |
+------------+-------------+--------+
3 rows in set (0.02 sec)
Before you delete the rows from the payment table for those related to Ella Oliver, you should backup the rows. That way you can recover the rows after the query without refreshing the sakila database.
You need to create a payment_backup table, which can be done with the following two commands:

-- Conditionally drop the payment table.
DROP TABLE IF EXISTS payment_backup;

-- Create the payment_backup table.
CREATE TABLE payment_backup AS
  SELECT payment_id
  ,      customer_id
  ,      staff_id
  ,      rental_id
  ,      amount
  ,      payment_date
  ,      last_update
  FROM   payment
  WHERE  customer_id = 
          (SELECT customer_id
           FROM   customer
           WHERE  first_name = 'ELLA'
           AND    last_name = 'OLIVER');

-- Delete all rows for Ella Oliver in the payment table with the following statement:
DELETE FROM payment
WHERE customer_id = (SELECT customer_id
                     FROM   customer 
                     WHERE  first_name = 'ELLA' 
                     AND    last_name = 'OLIVER');

-- Include all the three customers identified (Mary Smith, Barbara Jones, and Ella Oliver) by using a LEFT OUTER JOIN between the customer and payment tables. Dispaly first_name, a white space, and last_name and the total of payments made by each customer while ordering the return set in ascending order. 

You should display the following:
+---------------+---------------+
| name          | sum(p.amount) |
+---------------+---------------+
| BARBARA JONES |         81.78 |
| ELLA OLIVER   |          NULL |
| MARY SMITH    |        118.68 |
+---------------+---------------+
3 rows in set (0.00 sec)

After writing your script to generate the foregoing result set (derived table), you can recover the rows from the payment_backup table by inserting them into the payment table with this script:
INSERT INTO payment
( payment_id
, customer_id
, staff_id
, rental_id
, amount
, payment_date
, last_update )
( SELECT *
  FROM   payment_backup
  WHERE  customer_id = (SELECT customer_id
                        FROM   customer 
                        WHERE  first_name = 'ELLA' 
                        AND    last_name = 'OLIVER'));
*/

USE sakila;

-- Conditionally drop the payment table.
DROP TABLE IF EXISTS payment_backup;

-- Create the payment_backup table.
CREATE TABLE payment_backup AS
  SELECT payment_id
  ,      customer_id
  ,      staff_id
  ,      rental_id
  ,      amount
  ,      payment_date
  ,      last_update
  FROM   payment
  WHERE  customer_id = 
          (SELECT customer_id
           FROM   customer
           WHERE  first_name = 'ELLA'
           AND    last_name = 'OLIVER');

-- Delete all rows for Ella Oliver in the payment table with the following statement:
DELETE FROM payment_backup
WHERE customer_id = (SELECT customer_id
                     FROM   customer 
                     WHERE  first_name = 'ELLA' 
                     AND    last_name = 'OLIVER');

-- Delete all rows for Ella Oliver in the payment table with the following statement:
DELETE FROM payment
WHERE customer_id = (SELECT customer_id
                     FROM   customer 
                     WHERE  first_name = 'ELLA' 
                     AND    last_name = 'OLIVER');

-- Include all the three customers identified (Mary Smith, Barbara Jones, and Ella Oliver) by using a LEFT OUTER JOIN between the customer and payment tables. Dispaly first_name, a white space, and last_name and the total of payments made by each customer while ordering the return set in ascending order.
SELECT CONCAT(c.first_name, ' ', c.last_name) full_name, sum(p.amount) FROM customer c
LEFT OUTER JOIN payment p ON c.customer_id = p.customer_id
WHERE c.customer_id IN (1, 4, 210)
GROUP BY full_name;

-- After writing your script to generate the foregoing result set (derived table), you can recover the rows from the payment_backup table by inserting them into the payment table with this script:
INSERT INTO payment
( payment_id
, customer_id
, staff_id
, rental_id
, amount
, payment_date
, last_update )
( SELECT *
  FROM   payment_backup
  WHERE  customer_id = (SELECT customer_id
                        FROM   customer 
                        WHERE  first_name = 'ELLA' 
                        AND    last_name = 'OLIVER'));
