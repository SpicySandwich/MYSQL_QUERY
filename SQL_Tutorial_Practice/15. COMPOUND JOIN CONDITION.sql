-- ------------------------------------ COMPOUND JOIN CONDITION ---------------------

-- adding "AND" for more join column
-- sample table2: a table which has connected  mutiple table
-- table2 has note for all connected table

SELECT *
FROM table1 t1
INNER JOIN table2 t2
ON t1.column_order_id = t2.join_column_order_id
AND t1.column_product_id = t2.join_column_product_id

