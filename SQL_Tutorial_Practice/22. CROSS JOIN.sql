-- ----------------------------------- CROSS JOIN -----------

-- "CROSS JOIN " to combine or join every record from first table, with every record in a second table.

-- EXPLICIT CROSS JOIN - more clear than IMPLICIT

-- table1 will join to table2

SELECT t1.username,t2.location
FROM table1 t1
CROSS JOIN table2 t2;

---- IMPLICIT sample --

SELECT t1.username,t2.age
FROM table1 t1,able2 t2;

-- table1
-------------------------
| id  | username | date |
-------------------------
|  1  | conred   | 2020 |
-------------------------
|  2  | justin   | 2021 |
-------------------------
|  3  | wayne    | 2022 |
-------------------------

-- table2
------------------
| id  | location | 
------------------
|  1  | bohol    |
-----------------
|  2  | maynila  |
------------------
|  3  | cebu     |
------------------

-- OUTPUT

------------------------
| username | location | 
-------------------------
|  conred  | bohol    | 
-------------------------
| justin   | bohol    | 
-------------------------
| wayne    | bohol    | 
------------------------
|  conred  | maynila  | 
-------------------------
| justin   | maynila  | 
-------------------------
| wayne    | maynila  | 
------------------------
|  conred  | cebu    | 
-------------------------
| justin   | cebu    | 
-------------------------
| wayne    | cebu    | 
------------------------

