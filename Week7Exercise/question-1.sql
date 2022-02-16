/*
Question 1.

Construct a query that counts the number of rows in the payment table.

+----------+
| COUNT(*) |
+----------+
|    16049 |
+----------+
1 row in set (0.09 sec)
*/

USE sakila;
SELECT COUNT(*)
FROM payment;