# Write your MySQL query statement below
WITH ranked_employees AS
 ( SELECT
     departmentId,
     name,
     salary,
     DENSE_RANK() OVER (
        PARTITION BY departmentId
        ORDER BY salary DESC) AS salary_rank
    FROM 
      employee
     )
 
 SELECT
    d.name AS Department,
    re.name AS employee,
    re.salary
 FROM 
      ranked_employees re 
 JOIN 
      Department d ON re.departmentId = d.Id
WHERE salary_rank = 1
