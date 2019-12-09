use master;
GO

-- create
create database PizzaBox;
GO

create schema [Order];
GO

create schema Account;
go

create table [Order].[Order]
(
    OrderId int not null identity(1, 2) -- Sequence: identity(step, increment)  -- primary key
    ,UserId int not null --foreign key REFERENCES [Account].User.UserId
    ,StoreId int not NULL --foreign key 
    ,TotalCost decimal(3,2) not NULL
    ,OrderDate DATETIME2(7) not null -- computed --checked -- we only use datetime2
    ,Active BIT not null -- default
    ,CONSTRAINT PK_Order_OrderId primary key (OrderId)
    --,CONSTRAINT FK_Order_UserId FOREIGN KEY (UserId) REFERENCES Account.User(UserId)
);

create table [Order].OrderPizza
(
    OrderPizzaId int not null identity(1,2)
    ,OrderId int not NULL
    ,PizzaId int not null
)

create table [Order].Pizza
(
    PizzaId int not null IDENTITY(1,2)
    ,SizeId int not null -- foreign key
    ,CrustId int not null -- foreign key
    ,Price decimal(2,2) not NULL
    ,Active bit not null
)

-- alter
alter table [Order].[Order]
    add CONSTRAINT PK_Order_OrderId primary key (OrderId);

alter table [Order].[OrderPizza]
    add CONSTRAINT PK_OrderPizza_OrderId primary key (OrderPizzaId);

alter table [Order].[Pizza]
    add CONSTRAINT PK_Pizza_PizzaId primary key (PizzaId);

alter table [Order].[OrderPizza]
    add CONSTRAINT FK_OrderPizza_OrderId FOREIGN Key (OrderId) REFERENCES [Order].[Order].[OrderId];

alter table [Order].[OrderPizza]
    add CONSTRAINT FK_OrderPizza_PizzaId FOREIGN Key (PizzaId) REFERENCES [Order].[Pizza].[PizzaId];

alter table [Order].[Order]
    add CONSTRAINT DF_Order_Active default (1) for Active;

alter table [Order].[Pizza]
    add CONSTRAINT DF_Pizza_Active default (1) for Active;

alter table [Order].[Order]
    add CONSTRAINT CK_Order_OrderDate check (OrderDate > '2019-11-11');

alter table [Order].[Order]
    drop CONSTRAINT CK_Order_Orderdate; 

ALTER table [Order].[Order]
    add TipAmount decimal(2,2) null;

alter table [Order].[Order]
    drop column TipAmount;

-- drop
drop table [Order].[OrderPizza]; -- restorable

-- truncate
TRUNCATE table [Order].[OrderPizza]; -- not restorable. structure is recreated without data

drop database PizzaBox;