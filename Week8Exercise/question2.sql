/*
Rework the query from Exercise 9-1 using a correlated subquery against the category and film_category tables to achieve the same results.

It should return 64 rows, like:

+-------------------------+
| title                   |
+-------------------------+
| AMADEUS HOLY            |
| AMERICAN CIRCUS         |
| ANTITRUST TOMATOES      |
| ARK RIDGEMONT           |
| BAREFOOT MANCHURIAN     |
| BERETS AGENT            |
...
| TRUMAN CRAZY            |
| UPRISING UPTOWN         |
| WATERFRONT DELIVERANCE  |
| WEREWOLF LOLA           |
| WOMEN DORADO            |
| WORST BANGER            |
+-------------------------+
64 rows in set (0.25 sec)
*/

USE sakila;

SELECT f.title FROM film f
WHERE EXISTS (
    SELECT NULL
    FROM film_category fc
    INNER JOIN category c 
    ON fc.category_id = c.category_id
    WHERE c.name = "Action" AND fc.film_id = f.film_id
);
