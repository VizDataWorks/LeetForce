# Write your MySQL query statement below
SELECT 
    d.name  as Department , 
    e.name as Employee ,
    e.salary 
FROM Employee e JOIN Department d ON e.departmentId = d.id  
WHERE (departmentId, salary) IN 
        ( Select departmentId, max(Salary) 
        FROM Employee GROUP BY departmentId)

