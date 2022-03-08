/*
Rewrite the following query so that the result set contains a single row with five columns (one for each rating). Name the five columns (G, PG, PG_13, R, and NC_17).

mysql> SELECT   rating
    -> ,        COUNT(*)
    -> FROM     film
    -> GROUP BY rating;
It retrieves:

+--------+----------+
| rating | COUNT(*) |
+--------+----------+
| PG     |      209 |
| G      |      178 |
| NC-17  |      210 |
| PG-13  |      232 |
| R      |      195 |
+--------+----------+
5 rows in set (0.54 sec)
*/

USE sakila;


SELECT 
    COUNT(CASE
        WHEN film.rating = 'G'
        THEN film.rating = 'G'
        END) AS 'G',

    COUNT(CASE
        WHEN film.rating = 'PG'
        THEN film.rating = 'PG'
        END) AS 'PG',

    COUNT(CASE
        WHEN film.rating = 'PG-13'
        THEN film.rating = 'PG-13'
        END) AS 'PG-13',
    
    COUNT(CASE
        WHEN film.rating = 'R'
        THEN film.rating = 'R'
        END) AS 'R',

    COUNT(CASE
        WHEN film.rating = 'NC-17'
        THEN film.rating = 'NC-17'
        END) AS 'NC-17'

FROM film;
