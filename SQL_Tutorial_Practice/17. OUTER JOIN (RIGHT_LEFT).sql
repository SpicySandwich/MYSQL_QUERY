-- ----------------------------- OUTER JOIN ------------------------------

2 TYPES OF OUTER JOIN

-- 1. LEFT JOIN - whether the in "ON" condition "is true or not" | "FROM table_name will" be true or not| will show
-- 2. RIGHT JOIN - whether the in "ON" condition "is true or not" | "RIGHT JOIN table_name" will be true or not|will show

-- INNER JOIN - return if its has value
-- OUTER JOIN - also return even it has no value


--LEFT JOIN -- will show FROM table1 true or false
SELECT *
FROM table1 t1
LEFT OUTER JOIN table2 t2
ON t1.id = t2.id


--RIGHT JOIN -- will show RIGHT TABLE table2 true or false
SELECT *
FROM table1 t1
RIGHT OUTER JOIN table2 t2
ON t1.id = t2.id