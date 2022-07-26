-- ---------------------------- ORDER BY clause --------------------

-- "ORDER BY" to sort 

-- "DESC" to descending order

-- output a to z
SELECT * FROM table_name ORDER BY firstname;

-- output z to a
SELECT * FROM table_name ORDER BY firstname DESC;

SELECT column_firstname, column_lastname, column_age + 2 AS AGE_OUTPUT 
FROM table_name 
ORDER BY AGE_OUTPUT DESC; 