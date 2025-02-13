# Task - 3 : 
In this task we were given the schema's of a MMORPG game which is under development. To be specific we were given three tables "accounts", "items" and "accounts_items". 
- accounts Table : This table contained information about the users of this name , mainly there username and a unique-id that can be used to identify each user.
- items Table : This table contained information about the weapons present in this game. There were mainly 3 types of weapons named sword, shield and armor. This table contained id, type and name of each item present in this game.
- accounts_item Table : This table acted as a junction table between user and items as this contained information about which user is having which all item.Along with the basic information it also contained the quality of item that a particular user has, each item lies in any one of these quality i.e. 'common', 'rare' and 'epic'. So, this table contained account_id of the user, item_id of item that this user has and the quality of this item which this user has.

So for these tables we had to give a query which will tell best quality items present in the inventory for each user.

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
    account_id INT, 
    item_id INT,
    quality ENUM('common', 'rare', 'epic') NOT NULL, 
    FOREIGN KEY (account_id) REFERENCES accounts(id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE
);
```


# Input Data 
### Accounts Table
```sql
INSERT INTO accounts (username) VALUES ('cmunns1'),('yworcso');
```

### Items Table
```sql
INSERT INTO items (id, type, name) VALUES
(1, 'sword', 'Sword of Solanaceae'),
(2, 'shield', 'Shield of Rosaceae'),
(3, 'shield', 'Shield of Fagaceae'),
(5, 'shield', 'Shield of Lauraceae'),
(6, 'sword', 'Sword of Loasaceae'),
(7, 'armor', 'Armor of Myrtaceae'),
(8, 'shield', 'Shield of Rosaceae'),
(10, 'shield', 'Shield of Rosaceae');
```


### Accounts_Items Table
```sql
INSERT INTO accounts_items (account_id, item_id, quality) 
VALUES
(1, 10, 'epic'),  
(1, 2, 'rare'),   
(1, 2, 'rare'),   
(1, 7, 'rare'),   
(1, 1, 'common'), 
(1, 2, 'common'), 
(1, 3, 'common'), 
(1, 5, 'common'), 
(1, 8, 'common'), 
(1, 3, 'epic'),
(1, 6, 'common'),
(2, 8, 'epic'),   
(2, 5, 'rare'),   
(2, 3, 'common'), 
(2, 6, 'common'),
(2, 3, 'epic');
```
# Concepts Used : 
- Common Table Expressions (CTE)
- Aggregate Functions - Group_Concat(), Max()
- Joins

# Approach : 
- Our first objective is to find the highest rank weapon of each type present with each and every user. For this I have created a CTE (temp_table_1) in which I have first joined the table accounts_items and items based on the common item_id's, this way now I also have the weapon name,  weapon type and their name. Along with that I have added a new column having 0,1 and 2, where 0 means that this weapon is of common type then 1 mean that this weapon is of rare type and 2 means that this weapon is of epic type. [Result Step - 1](Result-Step-1.csv)
- After that using the first CTE(temp_table) I have found the best rank weapon for each user by grouping based on account_id and type. I have stored this information in one more CTE's as it will be used again to generate the final result. [Result Step - 2](Result-Step-2.csv)
- Now by joining the above 2 CTE's, I have created a new table having which contains for each users weapons of all types of best rank they have. [Result Step - 3](Result-Step-3.csv)
- Now at last in the above table I have grouped by the similar weapons together. That is the all the swords of user-1 are merged together similarly all the swords of user-2 are merged together. After that I have used the Group_Concat() to get all the names of the weapons that a user had of highest rank in case they have more than one weapon of same type and same rank.[Result Step - 4 / Final Result](Result-Step-4.csv)