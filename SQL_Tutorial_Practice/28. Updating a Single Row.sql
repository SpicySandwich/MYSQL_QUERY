-- ------------------------------- Updating a Single Row -------------------

-- "SET"  what column to updated and value
-- "WHERE" what row to be updated

UPDATE table_name
SET column_age = 30
WHERE column_id = 1;

-- update with calling other column for value

UPDATE table_name
SET column_age = column_age_or_any_column * 2
WHERE column_id = 1;