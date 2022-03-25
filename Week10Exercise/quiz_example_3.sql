USE sakila;
SELECT CONCAT(c.last_name,', ',c.first_name) AS actor_name
,      CASE
         WHEN c.active = 1 THEN 'ACTIVE'
         ELSE 'INACTIVE'
       END AS activity_type
FROM   customer c
ORDER BY actor_name;