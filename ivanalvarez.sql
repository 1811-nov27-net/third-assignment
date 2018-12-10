create database thirdassignmentdb
go
--create schema thirdassignment
go

create table thirdassignment.products
(
	productid int identity not null,
	productname nvarchar(50) not null,
	price float default 0 not null,

	constraint pk_products_id primary key (productid),
)
insert into thirdassignment.products (productname, price) values
('iphone',200.0),('htc',150.0),('nokia',100.0);

create table thirdassignment.customers
(
	customerid int identity not null,
	firstname nvarchar(50) not null,
	lastname nvarchar(50) not null,
	cardnumber int unique not null,--?

	constraint pk_customers_id primary key (customerid),
)
insert into thirdassignment.customers (firstname, lastname, cardnumber) values
('Tina','Smith', 123456789),('Jay','Salsbery',987654321),('Newt','Berry',135792468);

create table thirdassignment.orders
(
	orderid int identity not null,
	productid int not null,
	customerid int not null,

	constraint pk_orders_id primary key (orderid),
	constraint fk_orders_productid foreign key (productid) references thirdassignment.products (productid),
	constraint fk_orders_customerid foreign key (customerid) references thirdassignment.customers (customerid),
)
insert into thirdassignment.orders (productid,customerid) values
(1,1),(1,2),(3,1),(2,2),(3,3);

select * from thirdassignment.customers

select c.firstname, c.lastname, p.productname
from thirdassignment.customers as c, thirdassignment.products as p 
where c.customerid = 1

select 
from thirdassignment.

update thirdassignment.products
set price = 250
where productname = 'iphone'
