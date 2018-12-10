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


-- drop table sdb.Customers

create table sdb.Customers
(
	CustomerID int identity not null,
	FirstName nvarchar(100) not null,
	LastName nvarchar(100) not null,
	CardNumber int null,
	constraint PK_Customers_id primary key (CustomerID)

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

select c.LastName,o.OrderID,p.Name as [Product Name] from sdb.Orders as o inner join sdb.Customers as c on c.CustomerID = o.CustomerID inner join sdb.Products as p on p.ProductID=o.ProductID where c.FirstName = 'Tina' and c.LastName = 'Smith';



select sum(p.Price) as [Total Sold]
	from sdb.Products as p
	inner join sdb.Orders as o on p.ProductID = o.ProductID
	where p.Name = 'iPhone'
	group by o.ProductID;
	
update sdb.Products
set Price = 250
where Name = 'iPhone';
