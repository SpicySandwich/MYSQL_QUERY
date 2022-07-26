-- ------------------------- LIMIT operator -------------------

"LIMIT" limit the data return

-- get only 5 row from 1 to 5
SELECT * FROM table_name LIMIT 5;

-- get start to 3 but count start to 4, with 2 limit rows only
SELECT * FROM table_name LIMIT 3, 2;

-- get top 3 loyal customer
SELECT * FROM table_name ORDER BY column_loyal_points LIMIT 3;