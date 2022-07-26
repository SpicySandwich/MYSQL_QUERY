-- ----------------------------- JOINING ACROSS DATABASE -------------------

-- joining table from other database
-- always check what database use

SELECT *
FROM table_name1 t1
INNER JOIN database_name2.table_name2 dt2
ON t1.id = dt2.id
