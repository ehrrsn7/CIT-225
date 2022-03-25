### Write a report that clearly explains about `group by`.

---

This week we explored the `group by` clause. When grouping a query by a specific column name, we now have to live life according to the grouping of that column. Things like row values are no longer available to us, only things like COUNT(column_2) or other aggregated information is available. 

### Address the following points:

---
- Implicit versus explicit groups
  - Implicit groups involve conditions using the `join`/`on` syntax, whereas explicit involve conditions using `from table1, table2 where 'condition'` syntax. 
- The difference in results when counting only distinct values
  - the `distinct` keyword filters out all values except for the first value of every unique value in the desired column. 
- The nuances and power of using expressions inside aggregation functions
  - This is more subjective. Something that's made available to us when using expressions *inside* the `group by` is just another nuanced yet intuitive way to move expressions from a possible `where` clause, etc. 
- The differences when counting sets of numbers with or without null values 
  - involving `NULL` is kind of a matter of design. Maybe you want to `group by` parents and `count()` children and any null values wouldn't make sense. Perhaps we're missing a name for a given user while the year they joined is included, and you want to count how many users were born in a given year. You may include it, you may not. Regardless, you'll have to put `where val=desired_val AND val!=NULL` or vice versa to specify. 
- The differences between single and multiple column grouping
  - add a comma and then the next columns' names in the group by statment. 
