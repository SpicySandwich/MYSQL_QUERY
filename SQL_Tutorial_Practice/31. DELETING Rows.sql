-- ---------------------------------- DELETING Rows  -------------------

DELETE FROM table_name; this will delete all the data in table_name = "DANGEROUS"

DELETE FROM table_name
WHERE column_id = 1;

-- Using Subqueries

DELETE FROM table_name
WHERE join_column_id_ = 
  (SELECT column_id_connected_to_joincolumn
   FROM table2
   WHERE column_name = "testname")

-- Using MULTIPLE Subqueries

DELETE FROM table_name
WHERE join_column_id_ IN
  (SELECT column_id_connected_to_joincolumn
   FROM table2
   WHERE column_name IN ("testname1","testname2"));

