-- ------------------------------- INSERTING HIERARCHICAL ROWS -------------------

-- insert data in mutilple table that is connected

-- "LAST_INSERT_ID()" the last id beibg inserted and also work for with "auto_increment"


INSERT INTO table_location (column_location_name)
VALUES ("cebu");

INSERT INTO table_user (column_username,join_column_location_id)
VALUES
("conred" LAST_INSERT_ID());

-- this will get the last inserted id in table_location and use in table_user
