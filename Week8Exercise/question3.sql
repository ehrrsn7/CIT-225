/*
Join the following query to a subquery against the film_actor table to show the level of each actor:

SELECT 'Hollywood Star' AS level
,       30 AS min_roles
,       99999 AS max_roles
UNION ALL
SELECT 'Prolific Actor' AS level
,       20 AS min_roles
,       29 AS max_roles
UNION ALL
SELECT 'Newcomer' AS level
,        1 AS min_roles
,       19 AS max_roles;

The subquery against the film_actor table should count the number of rows for each actor using group by actor_id, and the count should be compared to the min_roles/max_roles columns to determine which level each actor belongs to.

It should return 200 rows, like:

+----------+----------------+
| actor_id | level          |
+----------+----------------+
|        1 | Newcomer       |
|        2 | Prolific Actor |
|        3 | Prolific Actor |
|        4 | Prolific Actor |
|        5 | Prolific Actor |
|        6 | Prolific Actor |
|        7 | Hollywwod Star |
|        8 | Prolific Actor |
...
|      195 | Prolific Actor |
|      196 | Hollywwod Star |
|      197 | Hollywwod Star |
|      198 | Hollywwod Star |
|      199 | Newcomer       |
|      200 | Prolific Actor |
+----------+----------------+
200 rows in set (0.08 sec)
*/

USE sakila;

SELECT actor.actor_id, actor_levels.level
FROM (
    SELECT fa.actor_id, COUNT(*) num_roles
    FROM film_actor fa
    GROUP BY fa.actor_id
) actor
CROSS JOIN (
    SELECT 'Hollywood Star' AS level,
        30 AS min_roles,
        99999 AS max_roles
    UNION ALL
    SELECT 'Prolific Actor' AS level,
        20 AS min_roles,
        29 AS max_roles
    UNION ALL
    SELECT 'Newcomer' AS level,
        1 AS min_roles,
        19 AS max_roles
) actor_levels
WHERE actor.num_roles BETWEEN actor_levels.min_roles AND actor_levels.max_roles;