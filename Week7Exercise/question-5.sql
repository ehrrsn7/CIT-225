/*
Construct a query that displays the following results from a query against the film, inventory, rental, and customer tables where the film's title starts with 'C' and the film has been rented at least twice; and order the results by ascending order of title and then customer name.
+---------------------+--------+----------+
| title               | rating | COUNT(*) |
+---------------------+--------+----------+
| CHINATOWN GLADIATOR | PG     |       10 |
| COAST RAINBOW       | PG     |       10 |
| CONEHEADS SMOOCHY   | NC-17  |        9 |
| CROW GREASE         | PG     |       10 |
| CRUSADE HONEY       | R      |        9 |
+---------------------+--------+----------+
5 rows in set (0.16 sec)
*/

USE sakila;
SELECT f.title, f.rating, COUNT(*) FROM film f
INNER JOIN inventory i  ON f.film_id = i.film_id
INNER JOIN rental r	    ON r.inventory_id = i.inventory_id
INNER JOIN customer c	ON c.customer_id = r.customer_id
WHERE f.title LIKE 'C%' AND f.rating IN ("G", "PG", "PG-13")
GROUP BY f.title, f.rating
HAVING COUNT(*) BETWEEN 10 AND 12
ORDER BY f.title;
