/*
Modify your query from Exercise 8-1 to count the number of payments made by each customer. Show the customer_id and the total amount paid for each customer.

+-------------+----------+-------------+
| customer_id | COUNT(*) | SUM(amount) |
+-------------+----------+-------------+
|           1 |       32 |      118.68 |
|           2 |       27 |      128.73 |
|           3 |       26 |      135.74 |
|           4 |       22 |       81.78 |
|           5 |       38 |      144.62 |
|           6 |       28 |       93.72 |
...
|         594 |       27 |      130.73 |
|         595 |       30 |      117.70 |
|         596 |       28 |       96.72 |
|         597 |       25 |       99.75 |
|         598 |       22 |       83.78 |
|         599 |       19 |       83.81 |
+-------------+----------+-------------+
598 rows in set (0.01 sec)
*/

USE sakila;
SELECT p.customer_id, COUNT(*), SUM(p.amount) FROM payment p
GROUP BY p.customer_id;
