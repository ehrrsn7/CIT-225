### Write a report that clearly explains:

---

- How left and right joins return result sets.
  - First, let's think of what a set is, essentially. The way I think of it is a data structure with specific COLUMNS. 
  - Let's say 
    - table1 has columns ID1, NAME, DATE, FK_ID2 and
    - table2 has columns ID2, ISLIT
  - Then, with 
  ```
  select t1.ID1, t1.NAME, t1.DATE, t2.ISLIT from table1 t1
  JOIN table2 t2 ON t1.FK_ID2 = t2.ID2;
  ```
  The resultant `set` would then be described as a query result with the columns `[ID1, NAME, DATE, ISLIT]`. (note the difference between these column names and the original tables' column names)

- How combining outer join tables requires using a series of only left joins unless you rely on the foreign key values of an association table in a three table join.
  - idek

- How cross joins let you fabricate result sets.
  - take the example from this week's exercise:
  ```
  SELECT ones.num + tens.num + 1 counter
  FROM (
      SELECT 0 num UNION ALL    
      SELECT 1 num UNION ALL
      SELECT 2 num UNION ALL
      SELECT 3 num UNION ALL
      SELECT 4 num UNION ALL
      SELECT 5 num UNION ALL
      SELECT 6 num UNION ALL
      SELECT 7 num UNION ALL
      SELECT 8 num UNION ALL
      SELECT 9 num) ones    
  CROSS JOIN (
      SELECT 0 num UNION ALL
      SELECT 10 num UNION ALL
      SELECT 20 num UNION ALL
      SELECT 30 num UNION ALL
      SELECT 40 num UNION ALL
      SELECT 50 num UNION ALL
      SELECT 60 num UNION ALL
      SELECT 70 num UNION ALL
      SELECT 80 num UNION ALL
      SELECT 90 num) tens
  ORDER BY counter;
  ```
  - We only fed the query digits from 0-9 and then tens from 00-90, but using a cross join we get the resultant set 'counter' which contains all integer values from 1 to 100.

- How natural joins rely on existing column names.
  - first, let's point out that the syntax of NATURAL joins includes the 'natural' keyword before the 'join' keyword variant. 
  - a natural join is a join operation that creates an implicit join clause based on the common columns in the two tables being joined. 
  - That being said, if table1 has column names [id1, name] and table2 has column names [id2, quality] the natural join will fail to return any rows, because it relies on the existence of a common id column or other unique column. if both tables were to have id rather than id1/id2, it would succeed. 
