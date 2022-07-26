CREATE DATABASE db_spring_test;

-- "users" has location_id to connet to location.id

-- "posts" has user_id to connect in users.id table
-- many post in one users

-- "location"
-- one location per users



CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKscan6s3oplch90k26jpvied7b` (`location_id`),
  CONSTRAINT `FKscan6s3oplch90k26jpvied7b` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `posts` (
  `id` int NOT NULL,
  `details` varchar(255) DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  `users_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhc5cfu63utmr42sr1v1tsr7so` (`users_id`),
  CONSTRAINT `FKhc5cfu63utmr42sr1v1tsr7so` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `location` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci