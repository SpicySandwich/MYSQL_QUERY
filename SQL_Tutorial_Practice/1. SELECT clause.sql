-- ----------------------------  SELECT clause ------------------------------

-- "USE" keyword
-- what database to use
USE database_name;

-- "ORDER BY" keyword
-- to sort
SELECT * FROM table_name ORDER BY column_name;

-- Read all data
SELECT * FROM table_name;

-- Read data with specifc column only
SELECT column1, column2 FROM table_name;

-- Adding MATH in reading data
SELECT column1, column2, column_math + 2 *3 FROM table_name;

-- Adding "()" MATH with open/close parenthis to priority to solve
SELECT column1, column2, (column_math + 2) *3 FROM table_name;

-- Adding "AS"alias in MATH for output to have customize column name
SELECT column1, column2, (column_math + 2) *3 AS customize_column_name FROM table_name;

-- Adding " 'column name can have space' "
SELECT column1, column2, (column_math + 2) *3 AS 'customize column name' FROM table_name;

-- "DISTINCT" use to read data without duplicate value

SELECT DISTINCT column_name FROM table_name;
