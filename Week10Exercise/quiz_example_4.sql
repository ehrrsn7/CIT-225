USE sakila;
SELECT CASE
         WHEN last_name LIKE 'DA%' THEN
           CONCAT(last_name,', ',first_name)
         ELSE
           CONCAT(last_name,', ',SUBSTR(first_name,1,1))
       END AS full_name
FROM   customer
WHERE  last_name LIKE 'D%';