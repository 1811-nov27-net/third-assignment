CREATE DATABASE Assment3db
--drop table Products
CREATE TABLE Products
(
  ID int NOT NULL PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Price money
);
--drop table Orders
CREATE TABLE Orders
(
  ID int NOT NULL,
  ProductID int NOT NULL,
  CustomerID int NOT NULL,
);
--drop table Customers
CREATE TABLE Customers
(
  ID int NOT NULL PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Price INT
);

ALTER TABLE Orders
ADD CONSTRAINT FK_ProductID
FOREIGN KEY (ID) 
REFERENCES Products(ID);

ALTER TABLE Orders
ADD CONSTRAINT FK_CustomerID
FOREIGN KEY (ID) 
REFERENCES Customers(ID);

INSERT INTO Products
  (Name, Price)
VALUES
  ( IPhone, $200);