USE sakila;

SELECT   f.film_id, f.title, i.inventory_id
FROM     inventory i RIGHT JOIN film f
ON       f.film_id = i.film_id
WHERE    f.title REGEXP '^RA(I|N).*$'
ORDER BY f.film_id, f.title, i.inventory_id;