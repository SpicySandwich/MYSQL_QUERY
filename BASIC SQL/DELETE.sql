-- -------------------------- DELETE ----------------



-- "WHERE" to delete a certain row or multiple rows
DELETE FROM dbcompany.tblemployees WHERE ID = 1;
DELETE FROM dbcompany.tblemployees WHERE ID IN(2,3);

-- "NOT" to delete all data except the value is specified
DELETE FROM dbcompany.tblemployees WHERE ID = 4;

-- "TRUNCATE" use delete all data in table
TRUNCATE dbcompany.tblemployees;


-- "DROP" use to delete TABLE and DATABASE
DROP TABLE dbcompany.tblemployees;
DROP DATABASE dbcompany;



-- -------------------------- DELETE ----------------