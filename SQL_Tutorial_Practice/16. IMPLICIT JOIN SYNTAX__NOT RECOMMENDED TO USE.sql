-- ------------------------------- IMPLICIT JOIN SYNTAX -------------------------

SELECT *
FROM table1 t1
INNER JOIN table2 t2
ON t1.id = t2.id

-- conver to implicit
-- not advisable to use
SELECT *
FROM table1 t1, table2 t2
WHERE t1.id = t2.id