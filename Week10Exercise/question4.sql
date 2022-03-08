/*
Write a query that returns the alphabetized first letter of the customer's last name and the count of active and inactive customers. Do not limit the results to only those first letters that occur in the last_name colum of the customer table but return results that include any missing letters from the data set. (HINT: You will need to fabricate a table composed of the 26 letters of the alphabet and use an outer join to resolve this problem.)

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
| U           |            0 |              0 |
| V           |            7 |              0 |
| W           |           37 |              1 |
| X           |            0 |              0 |
| Y           |            3 |              0 |
| Z           |            0 |              0 |
+-------------+--------------+----------------+
26 rows in set (0.00 sec)
*/

USE sakila;


