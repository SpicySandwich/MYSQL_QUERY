-- ------------------ SELF JOIN ---------------

-- "SELF JOIN"  is a regular join, but the table is joined with itself.
-- only return a condition is true 

-- in 1 table there employee name and manager name for column_firstname
-- that is define using column_managerid for employee for who is manager
-- column_managerid is connected to id
-----------------------------------------------------------
id | column_firstname | column_lastname | column_managerid
-----------------------------------------------------------
1  |employee1name     | employee1last   |  3
-----------------------------------------------------------
2  |employee2name     | employee2last   |  3
-----------------------------------------------------------
3  |managername       | managerlast     |
-----------------------------------------------------------


SELECT t1.id, t1.column_firstname, t1.column_lastname, t2.column_firstname AS manager
FROM table_name1 t1
INNER JOIN table_name1 t2
ON t1.column_managerid = t2.id;


-- OUTPUT
-----------------------------------------------------------
id | column_firstname | column_lastname | manager
-----------------------------------------------------------
1  |employee1name     | employee1last   |  managername  
-----------------------------------------------------------
2  |employee2name     | employee2last   |  managername 
-----------------------------------------------------------