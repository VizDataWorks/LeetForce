# Write your MySQL query statement below

with cte as (
		select	*,
				row_number()
					over(partition by company
						 order by salary) as rw,
				count(id) 
					over(partition by company) as cnt
		from	employee
)
select	id,
		company,
        salary
from	cte
where	rw between (cnt/2)
		   and (cnt/2 + 1)