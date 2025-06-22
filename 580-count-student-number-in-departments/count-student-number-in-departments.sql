# Write your MySQL query statement below

select D.dept_name , count(distinct student_id) student_number
from 
     Department D left join student S  on S.dept_id  = D.dept_id 
group by D.dept_name
order by student_number desc