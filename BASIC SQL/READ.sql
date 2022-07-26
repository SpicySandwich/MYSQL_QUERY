-- ---------------------------- READ ---------------------

-- "where" look for the value
SELECT * FROM dbcompany.tblemployees where Firstname = "justinE";

-- CONDITIONAL STATEMENT

-- = equal
-- <> not equal
-- > greater than
-- < less than
-- >= greater than or equal to
-- <= lesser than or equal to

-- get all age greater than
SELECT * FROM dbcompany.tblemployees where age > 30;

-- "NOT" except meaning will read all the data without the value
SELECT * FROM dbcompany.tblemployees where not Firstname = "justinE";

-- "IN" mutiple value to find
SELECT * FROM dbcompany.tblemployees where Firstname in ("justine","john mark");

-- "AND" both condition must be true
SELECT * FROM dbcompany.tblemployees where Firstname = "justinE" and age >= 30;

-- "OR" either condition is true
SELECT * FROM dbcompany.tblemployees where Firstname = "justine" or age >= 31;

-- Selecting table
-- select only table to be read or with condition
SELECT Firstname, lastname FROM dbcompany.tblemployees;
SELECT Firstname, lastname,age FROM dbcompany.tblemployees where age > 30;

-- "DISTINCT" Keyword
-- used to select UNIQUE value without repeated data
SELECT DISTINCT firstname FROM dbcompany.tblemployees;

-- COUNT keyword
-- count selected data
SELECT COUNT(firstname) FROM dbcompany.tblemployees;
SELECT COUNT(*) FROM dbcompany.tblemployees;

-- ---------------------------- END READ -------------------
