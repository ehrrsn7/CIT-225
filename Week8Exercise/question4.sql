/*
Rewrite the following query with two subqueries into multicolumn subquery. The subquery should use a filtered cross join between the film and actor tables.

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

