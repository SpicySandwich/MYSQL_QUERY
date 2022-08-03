CREATE TABLE `tbclientlogin` (
  `client_login_id` int unsigned NOT NULL AUTO_INCREMENT,
  `client_username` varchar(15) NOT NULL,
  `client_password` varchar(15) NOT NULL,
  PRIMARY KEY (`client_login_id`),
  UNIQUE KEY `client_username` (`client_username`)
) ENGINE=InnoDB 

CREATE TABLE `tbclientdetails` (
  `client_id` int unsigned NOT NULL,
  `client_firstname` varchar(20) NOT NULL,
  `client_lastname` varchar(20) NOT NULL,
  `client_email` varchar(30) NOT NULL,
  `money_balance` int DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `client_email` (`client_email`),
  UNIQUE KEY `client_email_2` (`client_email`),
  CONSTRAINT `fk_client_login_id` FOREIGN KEY (`client_id`) REFERENCES `tbclientlogin` (`client_login_id`)
) ENGINE=InnoDB 

CREATE TABLE `tbpurchasedetails` (
  `purchase_id` int unsigned NOT NULL AUTO_INCREMENT,
  `client_purchase_id` int unsigned DEFAULT NULL,
  `client_product_purchase_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`purchase_id`),
  KEY `client_purchase_id` (`client_purchase_id`),
  KEY `client_product_purchase_id` (`client_product_purchase_id`),
  CONSTRAINT `fk_client_purchase_id` FOREIGN KEY (`client_purchase_id`) REFERENCES `tbclientdetails` (`client_id`),
  CONSTRAINT `fk_product_id` FOREIGN KEY (`client_product_purchase_id`) REFERENCES `tblazardoproduct` (`product_id`)
) ENGINE=InnoDB 

CREATE TABLE `tblazardoproduct` (
  `product_id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_brand` varchar(15) NOT NULL,
  `product_name` varchar(15) NOT NULL,
  `product_price` double NOT NULL,
  `product_current_date` datetime NOT NULL,
  `product_expiration_date` datetime NOT NULL,
  `product_comment` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB 