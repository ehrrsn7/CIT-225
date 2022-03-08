/*
Write a query that returns the alphabetized first letter of the customer's last name and the count of active and inactive customers. Limit the results to only those first letters that occur in the last_name colum of the customer table.

Label the columns as follows:

starts_with is the first column and the first letter of the customer's last_name.
active_count is the second column and the count of active customers (as defined in the textbook examples of Chapter 11).
inactive_count is the third column and the count of inactive customers (as defined in the textbook examples of Chapter 11).
The output should look like the following:

+-------------+--------------+----------------+
| starts_with | active_count | inactive_count |
+-------------+--------------+----------------+
| A           |           18 |              2 |
| B           |           55 |              0 |
| C           |           49 |              3 |
| D           |           17 |              0 |
| E           |           11 |              2 |
| F           |           25 |              0 |
| G           |           42 |              1 |
| H           |           49 |              0 |
| I           |            3 |              0 |
| J           |           13 |              1 |
| K           |           13 |              0 |
| L           |           21 |              1 |
| M           |           57 |              2 |
| N           |           10 |              1 |
| O           |           10 |              0 |
| P           |           28 |              0 |
| Q           |            3 |              0 |
| R           |           38 |              2 |
| S           |           54 |              0 |
| T           |           20 |              0 |
| V           |            7 |              0 |
| W           |           37 |              1 |
| Y           |            3 |              0 |
+-------------+--------------+----------------+
23 rows in set (0.00 sec)
*/

USE sakila;

SELECT  SUBSTRING(last_name, 1, 1) starts_with,
        COUNT(CASE WHEN active = 1 then 1 ELSE NULL END) active_count,
        COUNT(CASE WHEN active = 0 then 1 ELSE NULL END) inactive_count
FROM customer
GROUP BY starts_with
ORDER BY starts_with;
