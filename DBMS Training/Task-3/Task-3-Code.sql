WITH temp_table As(
select ai.account_id, ai.item_id, ai.quality, i.type, i.name, CASE  
WHEN quality='epic' then 2
WHEN quality='rare' then 1
WHEN quality='common' then 0
END as strength from 
accounts_items as ai join items as i ON ai.item_id = i.id),

best_quality As (
select account_id, type, CASE 
WHEN max(strength)=2 then 'epic'
WHEN max(strength)=1 then 'rare'
WHEN max(strength)=0 then 'common'
END as advised_quality
from temp_table group by account_id, type),

temp_table_2 as (
SELECT  bq.account_id, bq.type, t.quality, t.item_id, t.name
FROM best_quality as bq JOIN temp_table as t 
ON bq.account_id = t.account_id AND bq.type = t.type AND bq.advised_quality = t.quality)

SELECT a.username, t.type, t.quality AS advised_quality,
GROUP_CONCAT(t.name ORDER BY t.name SEPARATOR ', ') AS advised_name  
FROM temp_table_2 as t  JOIN accounts as a 
ON t.account_id = a.id
GROUP BY a.username, t.type, t.quality
ORDER BY a.username, t.type;



