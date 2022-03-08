/*
Rewrite the following query, which uses a simple CASE expression, so that the same results are achieved using a searched CASE expression. Try to use as few WHEN clauses as possible.

mysql> SELECT name
    -> ,      CASE name
    ->          WHEN 'English'  THEN 'latin1'
    ->          WHEN 'Italian'  THEN 'latin1'
    ->          WHEN 'French'   THEN 'latin1'
    ->          WHEN 'German'   THEN 'latin1'
    ->          WHEN 'Japanese' THEN 'utf8'
    ->          WHEN 'Mandarin' THEN 'utf8'
    ->          ELSE 'UNKNOWN'
    ->        END AS character_set
    -> FROM   language;
It should return:

+----------+---------------+
| name     | character_set |
+----------+---------------+
| English  | latin1        |
| Italian  | latin1        |
| Japanese | utf8          |
| Mandarin | utf8          |
| French   | latin1        |
| German   | latin1        |
+----------+---------------+
6 rows in set (0.38 sec)
*/

USE sakila;

SELECT  
    name,
    CASE
        WHEN language.name IN ('English','Italian','French','German')
        THEN 'latin1'
        
        WHEN language.name IN ('Japanese','Mandarin')
        THEN 'utf8'
        
        ELSE 'UNKNOWN'
    END AS character_set

FROM language;
