create database assignment3

--drop table Products
create table Products
(
	ID int primary key not null,
	Name nvarchar(100) not null,
	Price decimal(10,2) not null
);

--drop table Orders
create table Orders
(
	ID int primary key not null,
	ProductID int not null,
	CustomerID int not null
	foreign key (ProductID) references Products(ID),
	foreign key (CustomerID) references Customers(ID)
);

--drop table Customers
create table Customers
(
	ID int primary key not null,
	FirstName nvarchar(100) not null,
	LastName nvarchar(100) not null,
	CardNumber int not null
);


insert into Products values (1, 'widget', 15.00);
insert into Products values (2, 'thingy', 20.00);
insert into Products values (3, 'knicknack', 25.00);

insert into Customers values (1, 'Bob', 'Smith', 01);
insert into Customers values (2, 'Steve', 'Adams', 02);
insert into Customers values (3, 'Brian', 'Johnson', 03);

insert into Orders values (1, 1, 1);
insert into Orders values (2, 2, 2);
insert into Orders values (3, 3, 3);

insert into Products values (4, 'Iphone', 200.00);
insert into Customers values (4, 'Tina', 'Smith', 04);
insert into Orders values (4, 4, 4); --Tina Smith bought an IPhone

select *
from orders
where CustomerID = 4;

select sum(Price)
from Products as p
left join Orders as o on o.ProductID = p.ID
where p.ID = 4;


