/*
Reformulate your query from Exercise 10-1 to use the other outer join type (e.g., if you used a LEFT outer join in Exercise 10-1, use a RIGHT outer join this time) such that the results are identitcal to Exercise 10-1 minus the row without a sum of amounts.
It should return the following data:
+---------------+---------------+
| name          | sum(p.amount) |
+---------------+---------------+
| BARBARA JONES |         81.78 |
| MARY SMITH    |        118.68 |
+---------------+---------------+
2 rows in set (0.00 sec)
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
RIGHT OUTER JOIN payment p ON c.customer_id = p.customer_id
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
