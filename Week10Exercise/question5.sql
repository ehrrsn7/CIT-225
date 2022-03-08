/*
Write a query that returns the alphabetized first letter of the customer's last name and the count of active and inactive customers for only those letters where the count of active customers is greater than 30.

Label the columns as follows:

starts_with is the first column and the first letter of the customer's last_name.
active_count is the second column and the count of active customers (as defined in the textbook examples of Chapter 11).
inactive_count is the third column and the count of inactive customers (as defined in the textbook examples of Chapter 11).
The output should look like the following:

+-------------+--------------+----------------+
| starts_with | active_count | inactive_count |
+-------------+--------------+----------------+
| B           |           55 |              0 |
| C           |           49 |              3 |
| G           |           42 |              1 |
| H           |           49 |              0 |
| M           |           57 |              2 |
| R           |           38 |              2 |
| S           |           54 |              0 |
| W           |           37 |              1 |
+-------------+--------------+----------------+
8 rows in set (0.00 sec)
*/

USE sakila;

SELECT  SUBSTRING(last_name, 1, 1) starts_with,
        COUNT(CASE WHEN active = 1 then 1 ELSE NULL END) active_count
FROM customer
GROUP BY starts_with
HAVING active_count > 30
ORDER BY starts_with;
