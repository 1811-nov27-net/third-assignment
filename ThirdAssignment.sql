create database storeDB;

go

create schema sdb;

go

create table sdb.Products
(
	ProductID int identity not null,
	Name nvarchar(200) not null,
	Price money not null,
	constraint PK_Products_id primary key (ProductID)

);

create table sdb.Customers
(
	CustomerID int identity not null,
	FirstName nvarchar(100) not null,
	LastName nvarchar(100) not null,
	CardNumber int null,
	constraint PK_Products_id primary key (CustomerID)

);
create table sdb.Orders
(
	OrderID int identity not null,	
	ProductID int not null,
	CustomerID int not null
	constraint PK_Orders_id primary key (OrderID)

);

insert into sdb.Products(Name, Price)
values
('iPad', 600),
('Chrome Book',300),
('iDoDad', 20);

insert into sdb.Customers(FirstName, LastName, CardNumber)
values
('Jenna', 'Hamelton', 123456),
('David', 'Hasselhoff', 654321),
('Marcus', 'DuPris', 123123);

insert into sdb.Orders(ProductID, CustomerID)
values
(1,1),
(1,2),
(3,3);


insert into sdb.Products(Name, Price)
values
('iPhone', 200);


insert into sdb.Customers(FirstName, LastName, CardNumber)
values
('Tina', 'Smith', 8335);

insert into sdb.Orders (ProductID, CustomerID) values (4,4);

