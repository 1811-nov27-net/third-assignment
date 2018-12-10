CREATE DATABASE Ass3

CREATE SCHEMA Store

CREATE TABLE Store.Products
(
	ID INT IDENTITY NOT NULL,
	Name NVARCHAR (100) NOT NULL,
	Price Money
	CONSTRAINT PK_Products_ID PRIMARY KEY (ID)
)

CREATE TABLE Store.Customers
(
	ID INT IDENTITY NOT NULL,
	FirstName NVARCHAR (100) NOT NULL,
	LastName NVARCHAR (100) NOT NULL,
	CardNumber BIGINT NOT NULL
	CONSTRAINT PK_Customers PRIMARY KEY (ID)
)

CREATE TABLE Store.Orders
(
	ID INT IDENTITY NOT NULL,
	ProductID INT NOT NULL,
	CustomerID INT NOT NULL
	CONSTRAINT PK_Orders_ID PRIMARY KEY (ID)
)
-- table could likely be improved by including quantity purchased to allow the storage of the events that a customor buys more than one copy of the same product-- no time
ALTER TABLE Store.Orders
	ADD QtyPurchase INT NOT NULL DEFAULT(0)
ALTER TABLE Store.Orders
	ALTER Column QtyPurchase

SELECT * FROM Store.Orders
	


-- PLEASE disregard code b/t comments
ALTER TABLE Store.Orders
	ADD CONSTRAINT FK_Orders_Products_ProductID FOREIGN KEY (ProductID) REFERENCES Store.Products(ID)

ALTER TABLE Store.Orders
	ADD CONSTRAINT FK_Orders_Customers_CustomerID FOREIGN KEY (CustomerID) REFERENCES Store.Customers(ID)

INSERT INTO Store.Products (Name, Price)
VALUES ('Thingy', 100)
INSERT INTO Store.Products (Name, Price)
VALUES ('ThingBob', 200)
INSERT INTO Store.Products (Name, Price)
VALUES ('Widget', 250)
INSERT INTO Store.Products (Name, Price)
VALUES ('iPhone', 200)

INSERT INTO Store.Customers (FirstName, LastName, CardNumber)
VALUES ('Tina', 'Smith', 123456789789)
INSERT INTO Store.Customers (FirstName, LastName, CardNumber)
VALUES ('Beau', 'Hansen', 123456789780)
INSERT INTO Store.Customers (FirstName, LastName, CardNumber)
VALUES ('Raheem', 'Sterling', 123456789781)

INSERT INTO Store.Orders (ProductID, CustomerID)
VALUES (4, 1)
INSERT INTO Store.Orders (ProductID, CustomerID)
VALUES (1, 1)
INSERT INTO Store.Orders (ProductID, CustomerID)
VALUES (2, 2)
INSERT INTO Store.Orders (ProductID, CustomerID)
VALUES (4, 3)

SELECT p.ID, p.Name, p.Price FROM Store.Orders AS o
	INNER JOIN Store.Customers AS c ON o.CustomerID = c.ID
	INNER JOIN Store.Products AS p ON o.ProductID = p.ID
WHERE c.FirstName = 'Tina' AND c.LastName ='Smith'

SELECT SUM(p.Price) AS [Revenue from iPhone Sales] FROM Store.Products AS p
	INNER JOIN Store.Orders AS o ON p.ID = o.ProductID
WHERE o.ProductID = 4 -- I know a subquery here would be better to retreive the productID of iPhone, but I fear I don't have enough time.



UPDATE Store.Products
SET Price = 250
WHERE Name = 'iPhone'