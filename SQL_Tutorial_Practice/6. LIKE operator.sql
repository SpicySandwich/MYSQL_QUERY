-- ---------------------------- LIKE OPERATOR--------------------------------

-- "LIKE" retrieve string value that match String pattern
-- " % " any number of the characters or numbers
-- " _ " single character

-- last value with start with letter
SELECT * FROM table_name WHERE column_firstname LIKE 'd%';

-- first value with start with letter
SELECT * FROM table_name WHERE column_firstname LIKE '%d';

-- first or last value with start with letter
SELECT * FROM table_name WHERE column_firstname LIKE '%d%';

-- "NOT" first or last value with start with letter is "EXCLUDED"
SELECT * FROM table_name WHERE column_firstname NOTLIKE '%d%';

-- last value should "EXACT" start with letter sample word "conred" with 6 characters
SELECT * FROM table_name WHERE column_firstname LIKE '_____d';
SELECT * FROM table_name WHERE column_firstname LIKE 'c____d';