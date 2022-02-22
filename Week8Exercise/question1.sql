/*
Construct a query against the film table that uses a filter condition with a non correlated subquery against the category table to find all action films (category.name = 'Action').

It should return 64 rows, like:

+-------------------------+
| title                   |
+-------------------------+
| AMADEUS HOLY            |
| AMERICAN CIRCUS         |
| ANTITRUST TOMATOES      |
| ARK RIDGEMONT           |
| BAREFOOT MANCHURIAN     |
| BERETS AGENT            |
...
| TRUMAN CRAZY            |
| UPRISING UPTOWN         |
| WATERFRONT DELIVERANCE  |
| WEREWOLF LOLA           |
| WOMEN DORADO            |
| WORST BANGER            |
+-------------------------+
64 rows in set (0.25 sec)
*/

USE sakila;

