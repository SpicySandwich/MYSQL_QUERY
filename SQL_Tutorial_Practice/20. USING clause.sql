-- --------------------------------- USING clause ------------------------

-- "USING" only use if both table are same column_name
-- NOTE: has same column name in both table

------------------------
SELECT *
FROM table1 t1
JOIN table2 t2
  --ON t1.id = t2.id
    USING (id)
LEFT table3 t3
    USING (id);

------------------------

SELECT *
FROM table1 t1
JOIN table2 t2
  -- ON t1.id = t2.id AND t1.id2 = t2.id2;
     USING(id,id2);