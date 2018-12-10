CREATE DATABASE assignment3;

GO

CREATE SCHEMA a3;

GO

CREATE TABLE a3.Products
(
	ID INT IDENTITY PRIMARY KEY NOT NULL,
	Name NVARCHAR(100) NOT NULL,
	Price MONEY NOT NULL
);

CREATE TABLE a3.Customers
(
	ID INT IDENTITY PRIMARY KEY NOT NULL,
	FirstName NVARCHAR(100) NOT NULL,
	LastName NVARCHAR(100) NOT NULL,
	CardNumber NVARCHAR(100) NOT NULL
);

CREATE TABLE a3.Orders
(
	ID INT IDENTITY PRIMARY KEY NOT NULL,
	ProductID INT FOREIGN KEY REFERENCES a3.Products(ID) NOT NULL,
	CustomerID INT FOREIGN KEY REFERENCES a3.Customers(ID) NOT NULL
);

INSERT INTO a3.Products(Name, Price) VALUES ('Tablet', 200.00);

INSERT INTO a3.Products(Name, Price) VALUES ('Phone', 200.00);

INSERT INTO a3.Products(Name, Price) VALUES ('Phablet', 250.00);

INSERT INTO a3.Customers(FirstName, LastName, CardNumber) VALUES('John','Doe', '0000-1111-2222-3333');

INSERT INTO a3.Customers(FirstName, LastName, CardNumber) VALUES('Jane','Doe', '1234-5678-9012-3456');

INSERT INTO a3.Customers(FirstName, LastName, CardNumber) VALUES('Another','Guy', '3333-2222-1111-0000');

INSERT INTO a3.Orders(ProductID, CustomerID) VALUES (1,1);

INSERT INTO a3.Orders(ProductID, CustomerID) VALUES (2,2);

INSERT INTO a3.Orders(ProductID, CustomerID) VALUES (3,3);

INSERT INTO a3.Products(Name, Price) VALUES ('iPhone', 200);

INSERT INTO a3.Customers(FirstName, LastName, CardNumber) VALUES ('Tina', 'Smith', '1111-2222-3333-4444');

SELECT * FROM a3.Products

SELECT * FROM a3.Customers

INSERT INTO a3.Orders(ProductID, CustomerID) VALUES(4,4);

SELECT * FROM a3.Orders AS o WHERE o.CustomerID = 4;

SELECT COUNT(o.ProductID)*  FROM a3.Orders AS o WHERE o.ProductID = 4;

