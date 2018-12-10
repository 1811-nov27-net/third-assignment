--create database Business
--go
create schema B;
go

--drop table B.Customers
--drop table B.Products
--drop table B.Orders


create table B.Customers(
	ID	INT IDENTITY(1,1),
	Firstname	NVARCHAR(100),
	Lastname	NVARCHAR(100),
	CardNumber	NVARCHAR(50),
	primary key (ID)
)

create table B.Products(
	ID	INT	IDENTITY(1,1),
	Name	NVARCHAR(100),
	Price	MONEY,
	primary key (ID)
)

create table B.Orders(
	ID	INT	IDENTITY(1,1),
	ProductID	INT foreign key references B.Products(ID),
	CustomerID	INT foreign key references B.Customers(ID),
)

insert into B.Products(Name, Price)
VALUES('Iphone', 200),
('Horse',1500),
('Labtop',800)

insert into B.Customers(Firstname,Lastname, CardNumber)
VALUES('Tina', 'Smith','123456789'),
('Vlad', 'Sordoff','111111'),
('Tony', 'Tuff', '123414')

insert into B.Orders(ProductID,CustomerID)
VALUES(1,1),
(1,2),
(3,3)

select *
from B.Orders as o
INNER JOIN B.Customers as c ON o.CustomerID = c.ID
WHERE c.Firstname = 'Tina' AND c.Lastname = 'Smith'

select sum(Price) as [IPhone total money made]
from B.Orders as o
inner join B.Products as p ON o.ProductID = p.ID
where p.Name = 'Iphone'
group by p.ID

update B.Products
set Price = 250
where Name = 'Iphone'
