-- -------------------------------- NATURAL JOIN -------------------

--  NOT RECOMMENED - sometimes it show unexpected result
-- guessing to whom it will join


SELECT t1.column_id, t2.column_name
FROM table1 t1
NATURAL JOIN table2 t2;
