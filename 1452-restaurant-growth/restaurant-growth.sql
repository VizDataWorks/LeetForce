# Write your MySQL query statement below

select visited_on, amount, average_amount 
from
(select distinct visited_on, 
    sum(amount) over (order by visited_on RANGE  BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW  ) as amount,
    round(sum(amount) over (order by visited_on RANGE  BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW )/7,2) as average_amount 
from 
 customer C ) as total
 WHERE DATEDIFF(visited_on, (SELECT MIN(visited_on) FROM Customer)) >= 6

