
-- ---------------------------- UPDATE ---------------------


-- "SET" keyword
-- what column to be updated and what value to change

-- "WHERE" keyword
-- use update certain row

-- Update single column
UPDATE dbcompany.tblemployees SET firstname = "conred" WHERE ID = 1;

-- Update multiple column
UPDATE dbcompany.tblemployees SET age = 15, lastname = "alas-as" WHERE ID = 1;


-- "NOT" use to invertWHERE condition
-- update to Empty all in Address but and remain 1 column
UPDATE dbcompany.tblemployees SET address= "" WHERE NOT ID = 1;

-- "IN" use to update mutiple row
-- going update 2,4,6 with same address value
UPDATE dbcompany.tblemployees SET address = "NCR" WHERE ID IN (2,4,6);

-- SELECT * FROM dbcompany.tblemployees;


-- ---------------------------- END UPDATE ---------------------