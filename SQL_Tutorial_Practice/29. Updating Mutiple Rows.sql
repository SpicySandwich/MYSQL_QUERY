-- ------------------------------- Updating Mutiple Rows --------------------------

-- "IN"

UPDATE table_name
SET column_price = column_price_total * 5 , column_date = "2022-01-01"
WHERE column_id IN (1,2);