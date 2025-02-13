# Task - 3 : 
In this task we were given the schema's of a MMORPG game which is under development. To be specific we were given three tables "accounts", "items" and "accounts_items". 
- accounts Table : This table contained information about the users of this name , mainly there username and a unique-id that can be used to identify each user.
- items Table : This table contained information about the weapons present in this game. There were mainly 3 types of weapons named sword, shield and armor. This table contained id, type and name of each item present in this game.
- accounts_item Table : This table acted as a junction table between user and items as this contained information about which user is having which all item.Along with the basic information it also contained the quality of item that a particular user has, each item lies in any one of these quality i.e. 'common', 'rare' and 'epic'. So, this table contained account_id of the user, item_id of item that this user has and the quality of this item which this user has.

So for these tables we had to give a query which will tell best quality items present in the inventory for each user.

# Concepts Used : 
- Common Table Expressions (CTE)
- Aggregate Functions - Group_Concat(), Max()
- Joins

# Approach : 
- 



# Steps To Run The Code : 

### First Create A New Database And Select It
```sql
create database task3;
use task3;
```

### Create Accounts Table
```sql
create table accounts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL UNIQUE
);
```

### Create Items Table
```sql
create table items (
	id INT PRIMARY KEY AUTO_INCREMENT,
    type ENUM('sword','shield','armor') NOT NULL,
    name VARCHAR(255) NOT NULL
);
```

### Create Accounts_Items Table
```sql
create table accounts_items (
    quality ENUM('common', 'rare', 'epic') NOT NULL, 
    account_id INT, 
    item_id INT,
    FOREIGN KEY (account_id) REFERENCES accounts(id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE
);
```

