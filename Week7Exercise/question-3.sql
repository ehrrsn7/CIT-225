/*
Modify your query from Exercise 8-2 to include only those customers who have at least 40 payments.
+-------------+----------+-------------+
| customer_id | COUNT(*) | SUM(amount) |
+-------------+----------+-------------+
|          75 |       41 |      155.59 |
|         144 |       42 |      195.58 |
|         148 |       46 |      216.54 |
|         197 |       40 |      154.60 |
|         236 |       42 |      175.58 |
|         469 |       40 |      177.60 |
|         526 |       45 |      221.55 |
+-------------+----------+-------------+
7 rows in set (0.25 sec)
*/

USE sakila;
SELECT  p.customer_id, COUNT(*), SUM(p.amount) FROM payment p
GROUP BY p.customer_id
HAVING COUNT(*) >= 40;