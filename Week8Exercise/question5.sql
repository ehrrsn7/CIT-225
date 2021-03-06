/*
Rewrite the following query with two subqueries into one with two correlated subqueries. Both of the subqueries should return null values.

SELECT   fa.actor_id
,        fa.film_id
FROM     film_actor fa
WHERE    fa.actor_id IN
           (SELECT actor_id FROM actor WHERE last_name = 'MONROE')
AND      fa.film_id IN
           (SELECT film_id FROM film WHERE rating = 'PG');
The foregoing query returns the following result set, and so should the new query:

+----------+---------+
| actor_id | film_id |
+----------+---------+
|      120 |      63 |
|      120 |     144 |
|      120 |     414 |
|      120 |     590 |
|      120 |     715 |
|      120 |     894 |
|      178 |     164 |
|      178 |     194 |
|      178 |     273 |
|      178 |     311 |
|      178 |     983 |
+----------+---------+
11 rows in set (0.09 sec)
*/

USE sakila;

SELECT fa.actor_id, fa.film_id
FROM film_actor fa
WHERE EXISTS (
    SELECT NULL FROM actor a
    WHERE fa.actor_id = a.actor_id AND a.last_name = "MONROE")
AND EXISTS (
    SELECT NULL FROM film f
    WHERE fa.film_id = f.film_id AND f.rating = "PG");
