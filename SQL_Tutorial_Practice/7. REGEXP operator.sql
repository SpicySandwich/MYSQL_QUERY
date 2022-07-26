-- ---------------------------- REGEXP OPERATOR--------------------------------

-- "REGEXP" Regular Expression
-- "  " start of the string
-- " $ " end of the string
-- " | " multiple search pattern/ or
-- " [value] " to match value in bracket
-- " [a-b] " range

-- find the value stated first or last
SELECT * FROM table_name WHERE column_firstname REGEX 'red';

-- find the value stated from beggining
SELECT * FROM table_name WHERE column_firstname REGEX '^red';

-- find the value stated from last
SELECT * FROM table_name WHERE column_firstname REGEX 'red&';

-- find the value anywhere with mutilple search pattren
SELECT * FROM table_name WHERE column_firstname REGEX 'red | con | alas';

SELECT * FROM table_name WHERE column_firstname REGEX '^red | con& | alas';

-- A to C in beggining
SELECT * FROM table_name WHERE column_firstname REGEX '^[a-c]';