
CREATE DATABASE dbCompany;

CREATE TABLE dbCompany.tblEmployees (
ID INT PRIMARY KEY AUTO_INCREMENT,
FirstName VARCHAR(16) NOT NULL,
LastName VARCHAR(16) NOT NULL,
Age INT NOT NULL,
Address VARCHAR(16) NOT NULL,
PhoneNumber VARCHAR(11) UNIQUE,
BirthDate DATE NOT NULL
);

INSERT INTO dbCompany.tblEmployees (FirstName,LastName,Age,Address,PhoneNumber,BirthDate) VALUES
("Joshua","Santos",24,"Malolos","09225544119","1995-10-16"),
("John Paul","Reyes",21,"Apalit","09553269345","1998-05-25"),
("Christian","Santos",27,"Apalit","09554312563","1992-03-05"),
("Justine","Cruz",30,"Tabang","09226025431","1989-07-23"),
("Justine","Reyes",27,"Malolos","09954231643","1992-09-26"),
("John Mark","Ocampo",32,"Guguinto","09956235431","1987-12-10"),
("Joshua","Garcia",25,"Malolos","09223451256","1994-01-05"),
("Daniel","Mendoza",30,"Tabang","09153478921","1989-05-28"),
("Angelo","Mendoza",35,"San Fernando","09954317643","1984-06-05"),
("Ryan","Andrada",26,"Malolos","09223654395","1993-02-14")