-- ----------------------- Creating a Copy of a Table -------------------------

-- copy a table to other table but will ignore the primary key and auto increment

CREATE TABLE table_name2
AS SELECT * FROM table_name1



-- having same column table_name2 we can specified what data we can insert.
-- insert the data with age is greater than 25

INSERT INTO table_name2
SELECT * FROM table_name1
WHERE column_age > 25;


-- sample
-- copying other table with join and customize the column name

CREATE TABLE tb_user_info_backup AS

SELECT u.id, u.firstname, u.lastname, l.name AS address, p.post_date AS birthdate
FROM users u
LEFT JOIN posts p
ON p.users_id = u.id
LEFT JOIN location l
ON u.location_id = l.id;