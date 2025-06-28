# Write your MySQL query statement below

WITH id_list AS
    (SELECT DISTINCT id, 
            ROW_NUMBER() OVER (
                PARTITION BY email 
                ORDER BY id) rn
            
        FROM 
        Person
    )

    DELETE FROM Person
    WHERE ID IN ( SELECT  id  
                   FROM
                         id_list 
                    WHERE rn>1
                     )