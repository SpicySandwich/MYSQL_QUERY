-- --------------------------------- Using Subqueries in Updates ----------------------

-- check value in join column  inorder to update

UPDATE users 
SET firstname = "bats"
WHERE location_id = 
(SELECT id
FROM location
WHERE name = "bohols")

-- check mutiple value in join column has the value inorder to update

UPDATE users 
SET firstname = "batss"
WHERE location_id IN
(SELECT id
FROM location
WHERE name IN ("bohols", "cebu"))

-- check the points for greater than 3000 for join column in table2. Where table1 connected then update the status for "GOLD Rank"

UPDATE table1
SET column_status = "GOLD Rank"
WHERE  column_id IN
    (SELECT column_customer_id
     FROM table2
     WHERE column_points > 3000);