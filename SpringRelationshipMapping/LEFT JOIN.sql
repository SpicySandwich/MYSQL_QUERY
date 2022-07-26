
SELECT * FROM db_spring_test.users
LEFT  JOIN db_spring_test.posts
ON db_spring_test.posts.users_id = db_spring_test.users.id
LEFT JOIN db_spring_test.location
ON db_spring_test.location.id = db_spring_test.users.location_id
