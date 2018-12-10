CREATE DATABASE ShopDB;

GO
CREATE SCHEMA SH;

GO

CREATE TABLE SH.Products 
(
	ID INT IDENTITY NOT NULL,
	Name NVARCHAR(100) NOT NULL,
	Price MONEY NOT NULL
);

GO
CREATE TABLE SH.Orders 
(
	ID INT IDENTITY NOT NULL,
	ProductID INT NOT NULL,
	CustomerID INT NOT NULL,
);
GO
CREATE TABLE SH.Customer 
(
	ID INT IDENTITY NOT NULL,
	FirstName NVARCHAR(100) NOT NULL,
	LastName NVARCHAR(100) NOT NULL,
	CardNumber INT NOT NULL
);
GO

ALTER TABLE SH.Products ADD
	CONSTRAINT PK_Product_ID PRIMARY KEY (ID);

GO
ALTER TABLE SH.Customer ADD
	CONSTRAINT PK_Customer_ID PRIMARY KEY (ID);

GO
ALTER TABLE SH.Orders ADD
	CONSTRAINT PK_Order_ID PRIMARY KEY (ID);

GO

ALTER TABLE SH.Orders ADD
	CONSTRAINT FK_Product_ID
		FOREIGN KEY (ProductID) REFERENCES SH.Products (ID);
GO
ALTER TABLE SH.Orders ADD
CONSTRAINT FK_Customer_ID
		FOREIGN KEY (CustomerID) REFERENCES SH.Customer (ID);
GO

INSERT INTO SH.Products(Name, Price) VALUES
('Laptop', 800),
('Desktop', 500),
('Phone', 600);

INSERT INTO SH.Customer(FirstName, LastName, CardNumber) VALUES
('Axel', 'Tovar', 123456),
('Joel', 'Tovar', 567890),
('Michael', 'Colton', 140905);

INSERT INTO SH.Orders(ProductID, CustomerID) VALUES
((SELECT TOP(1)ID FROM SH.Products WHERE Name = 'Laptop'), (SELECT TOP(1)ID FROM SH.Customer WHERE FirstName = 'Axel')),
((SELECT TOP(1)ID FROM SH.Products WHERE Name = 'Desktop'),(SELECT TOP(1)ID FROM SH.Customer WHERE FirstName = 'Joel')),
((SELECT TOP(1)ID FROM SH.Products WHERE Name = 'Phone'), (SELECT TOP(1)ID FROM SH.Customer WHERE FirstName = 'Michael'));

INSERT INTO  SH.Products(Name, Price) VALUES
('iPhone', 200);

INSERT INTO SH.Customer(FirstName, LastName, CardNumber) VALUES 
('Tina' , 'Smith', 4589082);

SELECT * 
FROM SH.Customer;

SELECT * 
FROM SH.Products;

INSERT INTO SH.Orders(ProductID, CustomerID) VALUES
((SELECT TOP(1)ID FROM SH.Products WHERE Name = 'iPhone'),(SELECT TOP(1)ID FROM SH.Customer WHERE FirstName = 'Tina'));

SELECT ('Tina') as CustomerName, *
FROM SH.Orders 
WHERE CustomerID = 5;

SELECT COALESCE(SUM(Products.Price),0.00) AS [Total Revenue by iPhone] 
FROM SH.Products
	JOIN SH.Orders AS o ON SH.Products.ID = o.ProductID
WHERE o.ProductID IN (SELECT ID FROM SH.Products WHERE ID = 4);

UPDATE SH.Products
SET Price = 450
WHERE ID IN (SELECT ID FROM SH.Products WHERE Name = 'iPhone');

SELECT *
FROM SH.Products;