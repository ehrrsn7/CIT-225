/*
Construct a query that displays the following results from a query against the film, film_actor, and actor tables where the film's rating is either 'G', 'PG', or 'PG-13' with a row count between 9 and 12 rows and order the results by ascending order of title and then name.
+------------------------+--------+----------+
| title                  | rating | COUNT(*) |
+------------------------+--------+----------+
| ACADEMY DINOSAUR       | PG     |       10 |
| ALABAMA DEVIL          | PG-13  |        9 |
| ANGELS LIFE            | G      |        9 |
| ANONYMOUS HUMAN        | NC-17  |        9 |
| ARABIA DOGMA           | NC-17  |       12 |
| ATLANTIS CAUSE         | G      |        9 |
| BERETS AGENT           | PG-13  |       10 |
| BONNIE HOLOCAUST       | G      |        9 |
...
| VELVET TERMINATOR      | R      |        9 |
| WAIT CIDER             | PG-13  |        9 |
| WAR NOTTING            | G      |        9 |
| WEDDING APOLLO         | PG     |       10 |
| WEEKEND PERSONAL       | R      |       10 |
| WEST LION              | G      |        9 |
| WIZARD COLDBLOODED     | PG     |        9 |
| WORKER TARZAN          | R      |        9 |
| WRONG BEHAVIOR         | PG-13  |        9 |
+------------------------+--------+----------+
90 rows in set (0.12 sec)
*/

USE sakila;
SELECT f.title, f.rating, COUNT(*) FROM film f
JOIN film_actor fa  ON f.film_id = fa.film_id
JOIN actor a	    ON fa.actor_id = a.actor_id
WHERE rating IN ('G','PG', 'PG-13')
GROUP BY f.title
HAVING COUNT(*) BETWEEN 9 AND 12
ORDER BY f.title;