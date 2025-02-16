# Learnings In Database Training
## Module - 1 : Introduction To Databases
- First I studied about how the databases have evolved over the years.
- After that I took a deep dive into the differeces between Relational and Non-Relational databases. Key takeaway was that the Relational databases are used for mostly structured data and on the other hand the Non-Relational databases are used for un-structured data. And also how Relational databases supports vertical-scaling and Non-Relational databases supports vertical scaling. Schema's for Relational Databased are very rigid on the other hand for the Non-Relational databased the Schema is flexile making it an ideal choice for un-structured data. But when we want out database to follow ACID properties and Normalization, then we must choose Relational Databases and when the focus is not that much on ACID properties and Normalization we can use Non-Relational Databases.
- After that I studied about DBMS and how it has simplified the whole eco-system. It acts as an interface between the user and the database, helping them perform the CRUD operation simply.
- At last I researched about SQL and NoSQL databases. And read a little about types of NoSql databases like MongoDb, Cassandra, Redis etc.

## Module - 2 : Relational Database Fundamentals
- In this I studied about the Entity-Relationship Model or the ER model. 
- Along with that I also revised the Primary and Foreign keys.
- Then I revised about Normalization and its form and how we can go from one form to another sequentially using rules of each form.
- At last I studied about denormalization and how it can help in faster query.

## Module - 3 : Basic SQL Commands
- There are 4 types of SQL Languages, and each and every command lies in one of four Languages.
- Namely DDL, DML, DCL and TCL.
- DDL or Data Definition Language consists of keywords like Create, Alter And Drop.
- DML or Data Manipulation Language consists of keywords like Select, Insert, Update and Delete which are mostly after the creation of the databases and tables.
- DCL or Data Control Language consists of keywords like Grant and Revoke which are used to secure out database and to prevent any un-authorized person from reading or writing on our data.
- TCL or Transactions Control Language consists of keywords like Begin, Commit, Saved Points and Rollbacks, which are used to using Transactions.

## Module - 4 : Advanced SQL Queries
- Revised Joins and All of its types. 
- Practiced some sub-queries as it was heavly used in the first task.
- Revised about all the types of operators present in the SQL, namely UNION, UNION ALL, INTERSECT. EXCEPT was the new one that I had to study from youtube.
- Revised all the window functions present in SQL. And how DENSE_RANK() and RANK() differ from each other and their specific use cases while ranking of the data. NTILE() was a new window functiom that I was not aware of so it took me some time to study about it, I took help from youtube and online resources.
- Then I studied about recursive CTE's, got used to its syntax.
- At last learnt about pivoting and unpivoting data, and how they are heavily used in analytics. Pivoting is used to covert rows into columns and similarly Un-Pivoting is used covert columns into rows. Also studied about some other ways to do the same without using the PIVOT keyword that is present in SQL, i.e. using CASE statements and aggregate functions.

## Module - 5 : Database Design And Optimization
- Queries are generally resolved using table scan in which to find a specific row in the database, it checks each row one by one from start to end. This is a very time taking process as in case the number of rows is very much in the table then it would take a lot of time. So, to perform faster queries the concept of index is used. In which a B+ tree is constructed which reduces the time taken to find some row to as low as O(log(n)) where n is the total number of enteries. Then there are two types of index, clustered and non-clustered index. There can be only one clustered index on the other hand there can be more than one non-clustered index.
-  Indexing is a query Optimization technique as it reduce the time complexity of search from O(n) to as low as O(log(n)).
- Sharding : It is the process of horizonatal scaling, in which more server are added along with the exiting servers. All the present servers are called shards.
- Partitioning : It is the process of dividing the existing dataset into multiple smaller portions, and then each portion is assigned to one shard. This way if there is a request of some data (x) present in shard-2, then this only be handled by shard-2 only.
- Concurreny Control : It is a technique used in DBMS to manage simultaneous execution of transactions while maintaining data consistency and integrity. If it not handled correctly then problems like Dirty Read,  Non-Repeatable Read and Phantom Read can exist. There are four Isolation Levels Read Uncomitted, Read Comitted, Repeatable Read and then Serializable. Each of these helps in isolation of transactions. 
- Deadlock : A deadlock is a condition in which two or more processes are waiting for each other to release locks, creating an indefinite wait condition in which neither is able to move forward.
- There are two ways to handle deadlocks, first prevent deadlock from taking place or let it happen and then recover from it.

