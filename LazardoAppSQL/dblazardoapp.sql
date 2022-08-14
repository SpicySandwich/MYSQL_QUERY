
-- client login

CREATE TABLE `tbclientlogin` (
  `client_login_id` int unsigned NOT NULL AUTO_INCREMENT,
  `client_username` varchar(15) NOT NULL,
  `client_password` varchar(15) NOT NULL,
  PRIMARY KEY (`client_login_id`),
  UNIQUE KEY `client_username` (`client_username`)
) ENGINE=InnoDB;


-- client details if buyer or seller for role

CREATE TABLE `tbclientdetails` (
  `client_id` int unsigned NOT NULL,
  `client_firstname` varchar(20) NOT NULL,
  `client_lastname` varchar(20) NOT NULL,
  `client_email` varchar(30) NOT NULL,
  `money_balance` double unsigned DEFAULT '0',
  `role` int unsigned NOT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `client_email` (`client_email`),
  UNIQUE KEY `client_email_2` (`client_email`),
  KEY `role` (`role`),
  CONSTRAINT `fk_client_login_id` FOREIGN KEY (`client_id`) REFERENCES `tbclientlogin` (`client_login_id`),
  CONSTRAINT `fk_role` FOREIGN KEY (`role`) REFERENCES `tbclientrole` (`client_role_id`)
) ENGINE=InnoDB;

-- client role 

CREATE TABLE `tbclientrole` (
  `client_role_id` int unsigned NOT NULL AUTO_INCREMENT,
  `client_role_type` varchar(10) NOT NULL,
  PRIMARY KEY (`client_role_id`)
) ENGINE=InnoDB;

-- buyer cart will be place here the product id and who purchase

CREATE TABLE `tbpurchasedetails` (
  `purchase_id` int unsigned NOT NULL AUTO_INCREMENT,
  `client_purchase_id` int unsigned DEFAULT NULL,
  `client_product_purchase_id` int unsigned DEFAULT NULL,
  `payment_status` int unsigned DEFAULT '1',
  PRIMARY KEY (`purchase_id`),
  KEY `client_purchase_id` (`client_purchase_id`),
  KEY `client_product_purchase_id` (`client_product_purchase_id`),
  KEY `payment_status` (`payment_status`),
  CONSTRAINT `fk_client_purchase_id` FOREIGN KEY (`client_purchase_id`) REFERENCES `tbclientdetails` (`client_id`),
  CONSTRAINT `fk_payment_status` FOREIGN KEY (`payment_status`) REFERENCES `tbpaymentstatus` (`status_id`),
  CONSTRAINT `fk_product_id` FOREIGN KEY (`client_product_purchase_id`) REFERENCES `tblazardoproduct` (`product_id`)
) ENGINE=InnoDB;

-- payment status must hava 1 = UNPAIN for default and 2 = PAID 

CREATE TABLE `tbpaymentstatus` (
  `status_id` int unsigned NOT NULL AUTO_INCREMENT,
  `status_option` varchar(10) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB;

-- after buyer paid, it will be log to this table and query for specific seller who already paid the item

CREATE TABLE `tbclientsellerpaidinfo` (
  `paid_info_id` int unsigned NOT NULL AUTO_INCREMENT,
  `buyer_email_purchase` varchar(30) NOT NULL,
  `buyer_purchase_item` varchar(20) NOT NULL,
  `product_price` double NOT NULL,
  `transferbalance` double NOT NULL,
  `seller_email` varchar(30) NOT NULL,
  `paid_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`paid_info_id`),
  KEY `fk_paid_info_id` (`seller_email`)
) ENGINE=InnoDB;

-- seller create product

CREATE TABLE `tblazardoproduct` (
  `product_id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_brand` varchar(30) NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `product_price` double NOT NULL,
  `product_current_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_expiration_date` datetime NOT NULL,
  `product_comment` varchar(50) DEFAULT NULL,
  `sellerid` int unsigned NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `fk_seller_id` (`sellerid`),
  CONSTRAINT `fk_seller_id` FOREIGN KEY (`sellerid`) REFERENCES `tbclientdetails` (`client_id`)
) ENGINE=InnoDB;





-- update role

UPDATE tbclientdetails  cd
SET cd.role = 1
WHERE cd.client_email = 'conred@gmail.com';

-- add balance per client

UPDATE tbclientdetails  cd
JOIN (
SELECT cd2.money_balance AS currentbalance, cd2.client_email AS clientemail
FROM tbclientdetails cd2
WHERE cd2.client_email = 'conred@gmail.com'
) balance
SET cd.money_balance = balance.currentbalance - 2000
WHERE cd.client_email = balance.clientemail  AND balance.currentbalance <= 0;

-- update client details by using username in login

UPDATE tbclientdetails  cd
JOIN(
SELECT 
cd2.role AS clientrole, 
cd2.client_id AS clientid,
cd2.client_firstname AS firstname,
cd2.client_lastname AS lastname,
cd2. client_email AS email
FROM tbclientlogin cl2
LEFT JOIN tbclientdetails cd2
ON cl2.client_login_id = cd2.client_id
WHERE cl2.client_username = 'con' AND cd2.role = 1
) clientinfo
SET 
cd. client_email = COALESCE('conred@gmAIL.COM',clientinfo.email) , 
cd.client_firstname = COALESCE('conblue1',clientinfo.firstname), 
cd.client_lastname = COALESCE(NULL,clientinfo.lastname)
WHERE cd.client_id = clientinfo.clientid AND cd.role = clientinfo.clientrole;



-- transfer balance client to other client

UPDATE tbclientdetails  cd
JOIN(
SELECT cd2.client_email AS clientEmail, cd2.money_balance - 8000 AS transferbalance
FROM tbclientlogin cl2
LEFT JOIN tbclientdetails cd2
ON cl2.client_login_id = cd2.client_id
WHERE cd2.client_email  = 'conred@gmail.com'
) AS transfer
SET cd.money_balance = if( transfer.transferbalance >= 0, transfer.transferbalance, cd.money_balance)
WHERE cd.client_email  = transfer.clientEmail  AND transfer.transferbalance >= 0 ;

UPDATE tbclientdetails  cd
JOIN(
SELECT cd2.client_email AS clientEmail, cd2.money_balance - 1501 AS transferbalance
FROM tbclientlogin cl2
LEFT JOIN tbclientdetails cd2
ON cl2.client_login_id = cd2.client_id
WHERE cd2.client_email  = 'conseller3@gmail.com'
) AS transfer2
SET cd.money_balance = if( transfer2.transferbalance >= 0, transfer2.transferbalance, cd.money_balance)
WHERE cd.client_email  = transfer2.clientEmail  AND transfer2.transferbalance >= 0;


-- ---------------------------------------------------------------------


-- -----------------------------------------------------------------------------
 -- Buyer paid per product the product process
 
 -- PROCESS 1 = buyer subtract balance to product price since change payment status UNPAID to PAID next PROCESS 2
 -- PROCESS 2 = seller will recieve and added to its balance from buyer who purchase the product next PROCESS 3
 -- PROCESS 3 = will log current date paid and who paid and who is seller of the product

-- PROCESS 1
UPDATE tbclientdetails cd2,tbpurchasedetails pd2
JOIN(
SELECT  
cd.client_id,
cd.money_balance - lp.product_price  AS currentbalance,
pd.payment_status  AS ubpaidstatus, 
pd.client_purchase_id AS clientid,
cd.client_email AS buyeremail,
pd.purchase_id AS puchaseid,
cd.role AS sellerrole
FROM tbclientlogin cl  
LEFT JOIN tbclientdetails cd ON cd.client_id = cl.client_login_id
LEFT JOIN tbclientrole cr ON cr.client_role_id = cd.role
LEFT JOIN tbpurchasedetails pd ON pd.client_purchase_id =cd.client_id
LEFT JOIN tbpaymentstatus ps ON ps.status_id = pd.payment_status
LEFT JOIN tblazardoproduct lp  ON lp.product_id = pd.client_product_purchase_id
WHERE pd.payment_status = 1 AND cd.client_email = 'conred@gmail.com'  AND pd.purchase_id = 26 AND cd.role = 1 
GROUP BY cd.client_id
) total
SET cd2.money_balance =  if(total.currentbalance >= 0, total.currentbalance, cd2.money_balance), 
	pd2.payment_status = if(total.ubpaidstatus = 1, 2, pd2.payment_status)
WHERE cd2.client_email = total.buyeremail AND cd2.role = total.sellerrole  AND pd2.client_purchase_id = clientid  AND pd2.purchase_id = total.puchaseid;

-- PROCESS 2

UPDATE tbclientdetails cd2
JOIN(
SELECT  
cd.client_id, 
cd.money_balance AS buyerbalance, 
lp.sellerid AS seller, 
lp.product_price AS price
FROM tbclientlogin cl
LEFT JOIN tbclientdetails cd ON cd.client_id = cl.client_login_id
LEFT JOIN tbclientrole cr ON cr.client_role_id = cd.role
LEFT JOIN tbpurchasedetails pd ON pd.client_purchase_id =cd.client_id
LEFT JOIN tbpaymentstatus ps ON ps.status_id = pd.payment_status
LEFT JOIN tblazardoproduct lp ON lp.product_id = pd.client_product_purchase_id
WHERE pd.payment_status = 2 AND cd.client_email = 'conred@gmail.com' AND pd.purchase_id = 26
) total
SET cd2.money_balance = cd2.money_balance + total.price
WHERE cd2.client_id = total.seller;

-- PROCESS 3

 INSERT INTO tbclientsellerpaidinfo  (buyer_email_purchase, buyer_purchase_item, product_price, transferbalance, seller_email)
 (SELECT  
cd.client_email ,
lp.product_name ,
lp.product_price ,
lp.product_price ,
cd3.client_email
FROM tbclientlogin cl
LEFT JOIN tbclientdetails cd ON cd.client_id = cl.client_login_id
LEFT JOIN tbclientrole cr ON cr.client_role_id = cd.role
LEFT JOIN tbpurchasedetails pd ON pd.client_purchase_id =cd.client_id
LEFT JOIN tbpaymentstatus ps ON ps.status_id = pd.payment_status
LEFT JOIN tblazardoproduct lp ON lp.product_id = pd.client_product_purchase_id
JOIN tbclientdetails cd3 ON cd3.client_id = lp.sellerid
WHERE pd.payment_status = 2 AND cd.client_email = 'conred@gmail.com' AND pd.purchase_id = 26
);

-- -----------------------------------------------------------------------------



-- delete cart purchase by buyer
SELECT EXISTS(
SELECT 1
FROM tbclientdetails cd
LEFT JOIN tbpurchasedetails pd
ON cd.client_id = pd.client_purchase_id
WHERE cd.client_email = 'conred@gmail.com' AND pd.payment_status = 1 AND pd.purchase_id = 24
);
-- seller validation delete product with condition if product is not yet been purchase by buyer
SELECT EXISTS(
SELECT *
FROM tbclientdetails cd
LEFT JOIN tblazardoproduct lp
ON lp.sellerid = cd.client_id
LEFT JOIN tbpurchasedetails pd
ON lp.product_id = pd.client_purchase_id
WHERE cd.client_email = 'conseller3@gmail.com' AND lp.product_id = 24 AND pd.client_purchase_id IS NULL OR pd.client_purchase_id =''
);

-- seller delete product with condition if not yet bought by buyer then it will be delete 

DELETE FROM tblazardoproduct
WHERE product_id = (
SELECT id FROM(
SELECT lp.product_id AS id
FROM tblazardoproduct lp
LEFT JOIN tbclientdetails cd
ON lp.sellerid = cd.client_id
LEFT JOIN tbpurchasedetails pd
ON lp.product_id = pd.client_purchase_id
WHERE cd.client_email = 'conseller3@gmail.com' AND cd.role = 2 AND product_id = 10 AND pd.client_purchase_id IS NULL OR pd.client_purchase_id =''
) AS sellerdeleteprodct);

-- seller update product if value updated is null return old value

UPDATE tblazardoproduct lp, tbclientdetails cd
JOIN(
SELECT 
lp2.sellerid AS sellid, 
cd2.client_email AS selleremail, 
cd2.role AS sellerrole, 
lp2.product_id AS productid,
lp2.product_brand AS productbrand,
lp2.product_name AS productname,
lp2.product_price AS productprice,
lp2.product_comment AS productcomment
FROM tbclientdetails cd2
LEFT JOIN tblazardoproduct lp2
ON cd2.client_id = lp2.sellerid
WHERE cd2.client_email = 'conseller3@gmail.com' AND cd2.role = 2 AND lp2.product_id = 8
) info
SET lp.product_brand =  COALESCE('Skippy Update2',info.productbrand),
 lp.product_name =  COALESCE('Skippy Natural2',info.productname),
 lp.product_price =  COALESCE(10.42,info.productprice), 
 lp.product_comment =  COALESCE(null,info.productcomment)
WHERE lp.product_id = info.productid AND lp.sellerid = info.sellid AND cd.client_email = info.selleremail AND cd.role = info.sellerrole;

-- if product exist
SELECT EXISTS( 
SELECT 1 
FROM tblazardoproduct lp
WHERE lp.product_id = 15 );

-- buyer unpaid per product
SELECT EXISTS(
SELECT 1
FROM tbclientlogin cl  
LEFT JOIN tbclientdetails cd ON cd.client_id = cl.client_login_id
LEFT JOIN tbclientrole cr ON cr.client_role_id = cd.role
LEFT JOIN tbpurchasedetails pd ON pd.client_purchase_id =cd.client_id
LEFT JOIN tbpaymentstatus ps ON ps.status_id = pd.payment_status
LEFT JOIN tblazardoproduct lp  ON lp.product_id = pd.client_product_purchase_id
WHERE pd.payment_status = 1 AND cd.client_email = 'conred@gmail.com'  AND pd.purchase_id = 32 AND cd.role = 1 );

-- buyer cart product
INSERT INTO tbpurchasedetails (client_purchase_id, client_product_purchase_id) 
VALUES ((SELECT client_id FROM tbclientdetails WHERE client_email = "conred@gmail.com"),14);

ALTER TABLE tbpurchasedetails MODIFY COLUMN payment_status INTEGER UNSIGNED NULL;
ALTER TABLE tbpurchasedetails ADD INDEX `payment_status` (`payment_status`);


SELECT product_id as id, product_brand as brand, product_name as name, product_price as price, product_current_date as currentdate, 
product_expiration_date as expirationdate, product_comment as comment 
FROM tblazardoproduct 
WHERE sellerid = 82 ;
   
   


SELECT EXISTS(SELECT 1 FROM tbclientlogin cl LEFT JOIN tbclientdetails cd
ON cd.client_id = cl.client_login_id WHERE cl.client_username = 'con' AND cl.client_password = '1234' AND cd.role = 1);

SELECT cd.role
FROM tbclientlogin cl
LEFT JOIN tbclientdetails cd
ON cd.client_id = cl.client_login_id
WHERE cl.client_username = 'con' AND cl.client_password = '1234';

SELECT client_login_id as loginId, client_username as username, client_password as password  FROM tbclientlogin cl LEFT JOIN tbclientdetails cd
ON cd.client_id = cl.client_login_id WHERE cl.client_username = 'con' AND cl.client_password = '1234' AND cd.role = 1;

DELETE FROM tbclientlogin WHERE client_username = "conseller24";

SELECT cl.client_password FROM tbclientlogin cl LEFT JOIN tbclientdetails cd
ON cd.client_id = cl.client_login_id WHERE cl.client_username = 'con' ;


DELETE FROM tbpurchasedetails
WHERE purchase_id = (
SELECT id FROM(
SELECT pd.purchase_id AS id
FROM tbpurchasedetails pd
LEFT JOIN tbclientdetails cd
ON cd.client_id = pd.client_purchase_id
WHERE cd.client_email = 'conred@gmail.com' AND pd.payment_status = 1 AND pd.purchase_id = 29
) AS buyerdeletecart);


-- ALTER TABLE tbpurchasedetails DROP INDEX payment_status
-- AND TABLE changes
ALTER TABLE tbpurchasedetails  ADD CONSTRAINT `fk_payment_status` FOREIGN KEY (`payment_status`) REFERENCES `tbpaymentstatus` (`status_id`);

--  SET FOREIGN_KEY_CHECKS = 0; NOT RECOMMENDED
 SET FOREIGN_KEY_CHECKS = 0;

ALTER TABLE tbclientdetails ADD COLUMN `role` INTEGER UNSIGNED NOT NULL AFTER `money_balance`;
ALTER TABLE tbclientdetails ADD INDEX `role`(`role`);
ALTER TABLE tbclientdetails ADD CONSTRAINT `fk_role` FOREIGN KEY (`role`) REFERENCES `tbclientrole`(`client_role_id`);

UPDATE tbpurchasedetails
SET payment_status = 1;
ALTER TABLE tblazardoproduct DROP FOREIGN KEY `fk_seller_id`;
ALTER TABLE tblazardoproduct DROP KEY `sellerid`;
ALTER TABLE tbpurchasedetails MODIFY COLUMN payment_status INTEGER UNSIGNED NULL DEFAULT 1;
ALTER TABLE tbclientdetails MODIFY COLUMN money_balance DOUBLE UNSIGNED NULL DEFAULT 0;