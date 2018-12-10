CREATE DATABASE thirdAssignment;
GO

CREATE SCHEMA As3;
GO

CREATE TABLE As3.Products
(
	ID INT IDENTITY NOT NULL,
	Name NVARCHAR(50),
	Price MONEY

	CONSTRAINT PK_Products_ID PRIMARY KEY (ID)
);

CREATE TABLE As3.Customers
(
	ID INT IDENTITY NOT NULL,
	FirstName NVARCHAR(50),
	LastName NVARCHAR(50),
	CardNumber NVARCHAR(16)

	CONSTRAINT PK_Customers_ID PRIMARY KEY (ID)
);

CREATE TABLE As3.Orders
(
	ID INT IDENTITY NOT NULL,
	ProductID INT NOT NULL,
	CustomerID INT NOT NULL

	CONSTRAINT PK_Orders_ID PRIMARY KEY (ID)
	CONSTRAINT FK_Products_ProductID FOREIGN KEY (ProductID) REFERENCES As3.Products (ID)
	CONSTRAINT FK_Customers_CustomerID FOREIGN KEY (CustomerID) REFERENCES As3.Customers (ID)
);

INSERT INTO As3.Products(Name, Price) VALUES
	('Doohickey', 75),
	('Whatsit', 100),
	('Thingamajig', 85);

INSERT INTO As3.Customers(FirstName, LastName, CardNumber) VALUES
	('Joe', 'Average', '1234567890123456'),
	('Jane', 'Doe', '123456789012345'),
	('John', 'Jacobjingleheimerschmitt', '6543210987654321');

INSERT INTO As3.Orders VALUES
	(1, 3),
	(2, 1),
	(3, 2);

INSERT INTO As3.Products VALUES
	('iPhone', 200);

INSERT INTO As3.Customers VALUES
	('Tina', 'Smith', '123123123123123');

INSERT INTO As3.Orders VALUES
	(4, 4)

SELECT c.FirstName, c.LastName, p.Name, p.Price
FROM As3.Orders AS o
	INNER JOIN As3.Customers AS c ON o.CustomerID = c.ID
	INNER JOIN As3.Products AS p ON o.ProductID = p.ID
WHERE c.FirstName = 'Tina' AND c.LastName = 'Smith';

SELECT SUM(p.price)
FROM As3.Products as p
	INNER JOIN As3.Orders AS o ON p.ID = o.ProductID
WHERE p.Name = 'iPhone';

UPDATE As3.Products
SET Price = 250
WHERE Name = 'iPhone';