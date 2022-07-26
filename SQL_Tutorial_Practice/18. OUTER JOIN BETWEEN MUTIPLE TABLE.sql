-- ----------------------------------- OUTER JOIN BETWEEN MUTIPLE TABLE -------------
-- this will get the location even it has no connection/null
-- AVOID RIGHT JOIN when there is LEFT JOIN

SELECT t1.column_firstname, t1.column_lastname, t2.column_date_purchase, t3.column_name AS 'LOCATION ADDRESS'
FROM table1 t1
LEFT JOIN table2 t2
ON t2.join_column_id = t1.id
LEFT JOIN table3 t3
ON t1.join_column_id = t3.id


-- ------ EXAMPLE TEST -------

-- this will get the location even it has no connection/null
-- AVOID RIGHT JOIN when there is LEFT JOIN

SELECT u.firstname, u.lastname,p.post_date,l.name AS 'LOCATION ADDRESS'
FROM users u
LEFT JOIN posts p
ON p.users_id = u.id
LEFT JOIN location l
ON u.location_id = l.id