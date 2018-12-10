--use adventureworks;
--go

-- drop tables
drop table if exists thirdassignment.orders;
drop table if exists thirdassignment.customers;
drop table if exists thirdassignment.products;
go

--Schema
drop schema if exists thirdassignment;
go

create schema thirdassignment;
go

create table thirdassignment.products(
	id int IDENTITY(1,1) NOT NULL,
	name nvarchar(100) NOT NULL,
	price money NOT NULL
);

create table thirdassignment.customers (
	id int IDENTITY(1,1) NOT NULL,
	firstName nvarchar(50) not null,
	lastName nvarchar(50) not null,
	cardnumber nvarchar(16) not null,
);

create table thirdassignment.orders (
	id int IDENTITY(1,1) NOT NULL,
	productId int not null,
	customerId int not null
);

--Primary Keys
alter table thirdassignment.products
	add constraint PK_Products primary key (id);
alter table thirdassignment.customers
	add constraint PK_Customers primary key (id);
alter table thirdassignment.orders
	add constraint PK_Orders primary key (id);

--Foreign Keys
alter table thirdassignment.orders
	add constraint FK_Order_Product foreign key (productId) references thirdassignment.products (id);
alter table thirdassignment.orders
	add constraint FK_Order_Customer foreign key (customerId) references thirdassignment.customers (id);

--Insert
insert into thirdassignment.products (name, price) values
('Product 1', 10),
('Product 2', 20),
('Product 3', 30);

insert into thirdassignment.customers (firstName, lastName, cardnumber) values
('First Name 1', 'Last Name 1', '1111111111111111'),
('First Name 2', 'Last Name 2', '2222222222222222'),
('First Name 3', 'Last Name 3', '3333333333333333');

insert into thirdassignment.orders (productId, customerId) values
(1,1),
(2,2),
(3,3);

insert into thirdassignment.products (name, price) values
('IPhone', 200);

insert into thirdassignment.customers (firstName, lastName, cardnumber) values
('Tina', 'Smith', '4444444444444444');


insert into thirdassignment.orders (productId, customerId) values
(4,4);

select o.* from thirdassignment.orders o
	inner join thirdassignment.customers c
		on o.customerId = c.id
where c.firstName = 'Tina'
	and c.lastName = 'Smith';

select Sum(price)*count(*) as revenues
from thirdassignment.orders o
	inner join thirdassignment.products p
		on o.productId = p.id
where	p.name = 'Iphone';


UPDATE thirdassignment.products
SET price = '250'
WHERE name = 'Iphone';

select * from thirdassignment.products
where name = 'IPhone';