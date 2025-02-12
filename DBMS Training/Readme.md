# Learnings In Database Training
## Introduction To Databases
- First I studied about how the databases have evolved over the years.
- After that I took a deep dive into the differeces between Relational and Non-Relational databases. Key takeaway was that the Relational databases are used for mostly structured data and on the other hand the Non-Relational databases are used for un-structured data. And also how Relational databases supports vertical-scaling and Non-Relational databases supports vertical scaling.
- After that I studied about DBMS and how it has simplified the whole eco-system. It acts as an interface between the user and the database, helping them perform the CRUD operation simply.
- At last I researched about SQL and NoSQL databases. And read a little about types of NoSql databases like MongoDb, Cassandra, Redis etc.

## Relational Database Fundamentals
- In this I studied about the Entity-Relationship Model or the ER model. 
- Along with that I also revised the Primary and Foreign keys.
- Then I revised about Normalization and its form and how we can go from one form to another sequentially using rules of each form.
- At last I studied about denormalization and how it can help in faster query.

## Basic SQL Commands
- There are 4 types of SQL Languages, and each and every command lies in one of four Languages.
- Namely DDL, DML, DCL and TCL.
- DDL or Data Definition Language consists of keywords like Create, Alter And Drop.
- DML or Data Manipulation Language consists of keywords like Select, Insert, Update and Delete which are mostly after the creation of the databases and tables.
- DCL or Data Control Language consists of keywords like Grant and Revoke which are used to secure out database and to prevent any un-authorized person from reading or writing on our data.
- TCL or Transactions Control Language consists of keywords like Begin, Commit, Saved Points and Rollbacks, which are used to using Transactions.

## Advanced SQL Queries
- Revised Joins and All of its types. 
- Practiced some sub-queries as it was heavly used in the first task.
- Revised about all the types of operators present in the SQL, namely UNION, UNION ALL, INTERSECT. EXCEPT was the new one that I had to study from youtube.
- Revised all the window functions present in SQL. And how DENSE_RANK() and RANK() differ from each other and their specific use cases while ranking of the data. NTILE() was a new window functiom that I was not aware of so it took me some time to study about it, I took help from youtube and online resources.
- Then I studied about recursive CTE's, got used to its syntax.
- At last learnt about pivoting and unpivoting data, and how they are heavily used in analytics. Pivoting is used to covert rows into columns and similarly Un-Pivoting is used covert columns into rows. Also studied about some other ways to do the same without using the PIVOT keyword that is present in SQL, i.e. using CASE statements and aggregate functions.