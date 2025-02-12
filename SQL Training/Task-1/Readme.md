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
So what I have done is that I have two CTE's named temp_table_1 and temp_table_2. In which the first table is using ROW_NUMBER() to add a new column to the existing table giving it a number or kind off an index after the table in descreasing order.
And the second table is doing the same just it is doing this in asecnding order. And along with this I have taken out every 3rd row/image from the set using the concept of mods.
So, basically out of every 3 entries I want the first row in my final result, so for this I have used the newly added row_number and done its modulo with 3 and every time it turns out to be 1 then that is my target row which I want in the result set.
i.e "new_col%3=1"

And at last after geting the two-resultant set I have used Union operator to get the final resultant set. Out of which I have taken out the image_id and the weak_label.
For weak_label I have used ROUND() function, which round any number above 0.5 to 1 and similary any number below 0.5 to 0.
