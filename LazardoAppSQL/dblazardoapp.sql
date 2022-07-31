

CREATE TABLE tblazardoproduct(
`product_id` Integer unsigned NOT NULL auto_increment,
`product_brand` VARCHAR(15) NOT NULL,
`product_name` Varchar(15) NOT NULL,
`product_price` DOUBLE NOT NULL,
`product_current_date` datetime NOT NULL,
`product_expiration_date` datetime NOT NULL,
`product_comment` Varchar(50) NULL,
PRIMARY KEY (`product_id`)
);

CREATE TABLE tbpurchasedetails(
`purchase_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`client_purchase_id` INTEGER UNSIGNED NULL,
`client_product_purchase_id` INTEGER UNSIGNED NULL,
INDEX (`client_purchase_id`),
INDEX (`client_product_purchase_id`),
PRIMARY KEY(`purchase_id`),
CONSTRAINT `fk_client_purchase_id` FOREIGN KEY (`client_purchase_id`) REFERENCES `tbclientdetails`(`client_id`),
CONSTRAINT `fk_product_id` FOREIGN KEY (`client_product_purchase_id`) REFERENCES `tblazardoproduct`(`product_id`)
)ENGINE = InnoDB;

CREATE TABLE tbclientdetails(
`client_id` INTEGER UNSIGNED  NOT NULL,
`client_firstname` VARCHAR(20) NOT NULL,
`client_lastname` VARCHAR(20) NOT NULL,
`client_email` VARCHAR(20) NOT NULL,
PRIMARY KEY (`client_id`),
CONSTRAINT `fk_client_login_id` FOREIGN KEY (`client_id`) REFERENCES `tbclientlogin` (`client_login_id`)
) ENGINE = InnoDB;

CREATE TABLE tbclientlogin(
`client_login_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
`client_username` VARCHAR(15) NOT NULL,
`client_password` VARCHAR(15) NOT NULL,
PRIMARY KEY (`client_login_id`)
) ENGINE = InnoDB;

