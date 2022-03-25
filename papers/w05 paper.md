### Write a report that clearly explains what you learned about join operators and set operators while mastering command line semantics. This paper should qualify what you learned by experimenting with the technology.

---

The idea of a `join` is simple. Append columns from different tables to a query. **This is actually very useful because it allows you to divvy up all your information into separate tables, allowing for more coherent relationship representations.**

There are different types of joins. They are:
- `inner join`
- `left join`
- `right join`
- `full outer join`
- (a "simple" outer join can be used by removing the inner join from a full outer join selection)

The type of join that you use can vary. Generally, with databases that have simple tables, an inner join is only ever needed. However, upon closer inspection it can easily be necessary to choose a left, right or full outer join instead. Try it out! It's fairly intuitive and not that hard so long as you involve the decision in the planning stage of creating a query. 
