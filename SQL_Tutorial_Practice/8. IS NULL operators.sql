-- ----------------------- IS NULL operators--------------------------

-- get row with null value
SELECT * FROM table_name WHERE age IS NULL;

-- get row without null value
SELECT * FROM table_name WHERE age IS NOT NULL;