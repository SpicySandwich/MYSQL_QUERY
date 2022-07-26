-- --------------------------------- UNIONS ----------------------

-- "UNIONS" combine rows to mutiple table
-- combine data in many query


SELECT column_firstname
FROM table1
UNION
SELECT column_date
FROM table2

-- OUTPUT
-----------------
|column_firstname|
-----------------
| conred         |
-----------------
| batman         |
-----------------
| 2021           |
-----------------
| 2022           |
-----------------

--------------------------- GET status by POINTS -----

SELECT id, username, points, 'GOLD' AS Status
FROM table
WHERE points > 3000

UNION

SELECT id, username, points, 'SILVER' AS Status
FROM table
WHERE poitns BETWEEN 2000 AND 3000

UNION

SELECT id, username, points, 'BRONZE' AS Status
FROM table
WHERE points < 1999
ORDER BY points;

-- ----- SAMPLE  ---

-- will shou active and not active

SELECT p.id, p.details , p.post_date,  'ACTIVE' AS Status
FROM posts p
where p.post_date >= '2021-01-01'
UNION
SELECT p.id, p.details , p.post_date,  'NOT ACTIVE' AS Status
FROM posts p
where p.post_date < '2021-01-01'