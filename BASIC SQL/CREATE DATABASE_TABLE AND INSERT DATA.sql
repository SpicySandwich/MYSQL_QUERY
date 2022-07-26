 -- --------------------------------- CREATE DATABASE  -----------------------------

 Create database sql_test;

 -- --------------------------------- CREATE TABLE -----------------------------
 
create table sql_test.tbstudent(
student_id Integer primary key auto_increment,
firstname varchar(20) not null,
lastname varchar(20) not null,
phone_number varchar(11),
scholarship boolean not null,
date_entrolled datetime not null
);
 
 
 -- --------------------------------- INSERT -----------------------------
 
 insert into sql_test.tbstudent(
 firstname,
 lastname,
 phone_number,
 scholarship,
 date_entrolled
 )
Values
("conred","alas-as", "09392281488",true,"2020-12-12"),
("batman","wayne","09392281499",false,"2022-01-01")