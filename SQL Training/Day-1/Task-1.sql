WITH temp_table_1 AS (
select image_id, score, Round(score) as weak_label from 
(select *, row_number() over(order by score desc) new_col from unlabeled_image_predictions) as new_table 
where new_col%3=1 limit 10000),

temp_table_2 AS ( 
select image_id, score, Round(score) as weak_label from 
(select *, row_number() over(order by score asc) new_col from unlabeled_image_predictions) as new_table 
where new_col%3=1 limit 10000)

select * from (
select * from temp_table_1 union  select * from temp_table_2) as finalAnswer order by image_id;




