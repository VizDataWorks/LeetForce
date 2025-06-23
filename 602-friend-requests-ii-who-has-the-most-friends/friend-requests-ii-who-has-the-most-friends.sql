# Write your MySQL query statement below


select distinct id, count(*) as num 
from 
    (select requester_id id from RequestAccepted
    union all
    select accepter_id id from RequestAccepted
    ) as total_IDS  
group by id
order by count(*) desc
limit 1;
