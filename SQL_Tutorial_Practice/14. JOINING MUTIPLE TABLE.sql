-- -------------------- JOINING MULTIPLE TABLES ---------------------

-- joining mutiple table which each column has connected to a table

SELECT *
FROM table1 t1
INNER JOIN table2 t2
ON t1.id = t2.join_column_to_table1
INNER JOIN table3 t3
ON t1.join_column_to_table3 = t3.id 

-- sample
-----------------------------------------------------------------------
SELECT u.firstname, u.lastname, p.post_date, l.name AS 'LOCATION ADDRESS'
FROM users u
INNER JOIN posts p
ON u.id = p.users_id
INNER JOIN location l
ON u.location_id = l.id