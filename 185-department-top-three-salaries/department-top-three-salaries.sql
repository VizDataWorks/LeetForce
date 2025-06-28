# Write your MySQL query statement below
WITH top_3_salaries AS
        (SELECT departmentID,
            salary
        FROM 
            (SELECT distinct
                departmentID,
                salary,
                DENSE_RANK() OVER (PARTITION BY departmentID ORDER BY salary DESC) rn
            FROM 
                Employee
            ) as sal
        WHERE rn<=3
        )
SELECT
     d.name AS Department,
     e.name AS Employee,
     e.salary AS Salary   
FROM Employee e 
    JOIN Department d ON e.departmentId = d.id   
    JOIN  top_3_salaries t ON  e.departmentId = t.departmentID
WHERE e.salary = t.salary
