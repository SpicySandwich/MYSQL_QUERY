-- ----------------------------- INNER JOIN -------------------

"INNER JOIN" selects records that have matching values in both tables.

-- join 2 table by their id

SELECT * FROM table_name1 
INNER JOIN table_name2
ON table_name1.column_id1.id = table_name2.column_id2.id

-- join table with prefix which column2

SELECT * FROM column1, table_name1.column2, column3
FROM table_name1
INNER JOIN table_name2
ON table_name1.column2.id = table_name2.column2.id

-- much readable

SELECT * FROM column1, tb1.column2, column3
FROM table_name1 tb1
INNER JOIN table_name2 tb2
ON tb1.column2.id = tb2.column2.id