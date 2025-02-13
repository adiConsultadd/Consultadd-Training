# Task 
In the problem statment it was written that we have a binary classifier which takes as input an image and then outputs the image quality as 0 or 1.
Here 1 represents a High-Quality-Image and 0 represents a Low-Quality-Image. 
Now, we have a SQL Table containing 1-M unlabeled images and we run this table through our machine learning model to get the float scores from 0 to 1 for each image.

In this question we just had to give a SQL query, which once feeded with the table returns us combination of two resultant sets.
The first resultand set we should have the image_id and weak label for every third image after sorting the rows of the table in desc order starting from the first row. We must have atmost 10k entries from this resultant set.
For the second resultant set we should have the image_id and weak label for every third image after sorting the rows of the table in asc order starting from the first row. We must have atmost 10k entries from this resultant set.
And at last merge the two resultant set and return it.


# Approach : 
For this I have used the approach of window functions, specifically the ROW_NUMBER() and CTE(Common Table Expressions).
So what I have done is that I have created two CTE's named temp_table_1 and temp_table_2. In which the first table is using ROW_NUMBER() to add a new column (new_col) to the existing table giving it a number or a kind off an index which starts from 1, I have added this new row numbers after sorting the table in descreasing order.
And the second table is doing the same, just it is doing this in asecnding order. And along with this I have taken out every 3rd row/image from the set using the concept of mods.
So, basically out of every 3 entries I want the first row in my final result, so for this I have used the newly added row_number and done its modulo with 3 and every time it turns out to be 1 then that is my target row which I want in the result set.
i.e "new_col%3=1"

And at last after geting the two-resultant set I have used Union operator to get the final resultant set. Out of which I have taken out the image_id and the weak_label which was asked in the question.
For weak_label I have used ROUND() function, which round's any number above 0.5 to '1' and similary any number below 0.5 to '0'.


# Steps To Run The Code : 
### First Create A New Database
```sql
    create database task1
```
### Use That Database
```sql
    use task1
```
### Create A New Table In That Database Name "unlabeled_image_predictions"
```sql
    create table unlabeled_image_predictions(
        image_id INT,
        score float
    )
```
### Insert The Data Into This Newly Created Table
```sql
insert into unlabeled_image_predictions (image_id, score) VALUES
('828', '0.3149'), ('705','0.9892'), ('46', '0.5616'), ('594', '0.7670'), ('232', '0.1598'), ('524','0.9876'), ('306', '0.6487'), ('132', '0.8823'), ('906', '0.8394'), ('424', '0.7790'), ('609','0.5241'), ('809','0.1058'), ('219', '0.7143'), ('439','0.3387'), ('464', '0.3674'), ('823', '0.3361'), ('617', '0.0218'), ('272', '0.9778'), ('63', '0.2552'), ('402', '0.7655'), ('616', '0.1003'), ('276', '0.2672'), ('363', '0.2661'), ('405', '0.6929'), ('986','0.8931'), ('161', '0.7113'), ('715', '0.8921'), ('109', '0.1151'), ('701','0.0758'), ('554', '0.4418'), ('998', '0.0379'), ('624', '0.8270'), ('640', '0.8790'), ('913', '0.2421'), ('344', '0.3761'), ('847', '0.4889'), ('482', '0.5023'), ('47','0.0072'), ('867','0.4050'), ('96', '0.4498'), ('126', '0.3564'), ('943','0.0452'), ('115', '0.5309'), ('417', '0.7168'), ('706', '0.9649'), ('166', '0.2507'), ('991','0.4191'), ('465', '0.0895'), ('53', '0.8169'), ('971','0.9871');
```

### Approach Used : 
```sql
WITH temp_table_1 AS (
select image_id, Round(score) as weak_label from 
(select *, row_number() over(order by score desc) new_col from unlabeled_image_predictions) as new_table 
where new_col%3=1 limit 10000),

temp_table_2 AS ( 
select image_id, Round(score) as weak_label from 
(select *, row_number() over(order by score asc) new_col from unlabeled_image_predictions) as new_table 
where new_col%3=1 limit 10000)

select image_id, weak_label from (
select * from temp_table_1 union select * from temp_table_2) as finalAnswer order by image_id;
```

[Output for the Task-1 Based On The Above Input](Task-1-Output-Table.csv)

# Concepts Used :
- Window Functions - ROW_NUMBER()
- Common Table Expressions - CTE
- UNION Operator