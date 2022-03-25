### Write a report that clearly explains what you learned about the various comparison operators in the WHERE clause. This paper should qualify what you learned by experimenting with the technology.

---

There are lots of different operators which are compatible with the `where` clause, allowing for filtering. These conditionals come in a variety of forms for a variety of different applications. 

The basic operators which are usually used in conditions are obviously the 
greater than `>`
less than `<`, 
greater than or equal to `>=`
less than or equal to `<=`
equals `=` (note this is only one '=' and not two '==')
not `!=`, `<>` and `not`
operators.

Their use with the `where` statement could be as follows:
```
SELECT * FROM <table_name> t
WHERE t.column_name > 5;
```

Moreover, there is a variety of other conditions that don't follow the simple case of `>` or `<`, etc. These are sql's suite of built-in functions and keywords (an example of the keyword is the `not` keyword we listed aboove, used as an operator instead of with the generic "function() call")

Some of these examples are:
- `IN`
- `AND`/`OR`
