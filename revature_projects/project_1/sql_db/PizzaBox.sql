use master
GO

create DATABASE PizzaBox;
Go

use PizzaBox;
Go

create schema [Order];
GO

create schema Accounts;
GO

create schema Products;
GO

create table [Order].[Order]
(
    OrderId int not null identity(1,2)
    ,OrderTotal decimal(5,2) not NULL
    ,Completed bit not NULL --DEFAULT
    ,[Date] datetime2(7) not NULL
    ,UserId int --FOREIGN KEY
    ,StoreId int --FOREIGN KEY
    ,ProductOrderId int --FOREIGN KEY
    ,CONSTRAINT PK_Order_OrderId primary key (OrderId)
)

create table [Order].Store
(
    StoreId int not null identity(1,2)
    ,[Name] nvarchar(20) not NULL
    ,AddressId int --FOREIGN KEY
    ,CONSTRAINT PK_Store_StoreId primary key (StoreId)
)

create table [Order].ProductOrder
(
    ProductOrderId int not null identity(1,2)
    ,ProductId int --FOREIGN KEY
    ,PizzaId int --FOREIGN KEY
    ,Quantity int not NULL
    ,CONSTRAINT PK_Order_ProductOrderId primary key (ProductOrderId)
)

create table Accounts.[User]
(
    UserId int not null identity(1,2)
    ,FirstName nvarchar(20) not NULL
    ,LastName nvarchar(20) not NULL
    ,Email nvarchar(50) not NULL
    ,AddressId int --FOREIGN KEY
    ,CONSTRAINT PK_Accounts_UserId primary key (UserId)
)

create table Accounts.Login
(
    LoginId int not null identity(1,2)
    ,Username nvarchar(20) not NULL
    ,[Password] nvarchar(20) not NULL
    ,UserId int --FOREIGN KEY
    ,CONSTRAINT PK_Accounts_LoginId primary key (LoginId)
)

create table Accounts.Address
(
    AddressId int not null identity(1,2)
    ,AddressLine1 nvarchar(50) not NULL
    ,AddressLine2 nvarchar(50)
    ,City nvarchar(15) not NULL
    ,[State] nvarchar(10) not NULL
    ,CONSTRAINT PK_Accounts_AddressId primary key (AddressId)
)

create table Products.Pizza
(
    PizzaId int not null identity(1,2)
    ,ToppingsId int -- FOREIGN KEY
    ,CrustSizeId int --FOREIGN KEY
    ,CrustTypeId int --FOREIGN KEY
    ,ProductId int --FOREIGN KEY 
    ,UserId int --FOREIGN KEY
    ,CONSTRAINT PK_Products_PizzaId primary key (PizzaId)
)

create table Products.Toppings
(
    ToppingsId int not null identity(1,2)
    ,Topping nvarchar(20) not NULL
    ,CONSTRAINT PK_Products_ToppingsId primary key (ToppingsId)
)

create table Products.Product
(
    ProductId int not null identity(1,2)
    ,ProductName nvarchar(20) not NULL
    ,CONSTRAINT PK_Products_ProductId primary key (ProductId)
)

create table Products.CrustSize
(
    CrustSizeId int not null identity(1,2)
    ,OrderSize nvarchar(10) not NULL
    ,Cost decimal(4,2) not NULL
    ,CONSTRAINT PK_Products_CrustSizeId primary key (CrustSizeId)
)

create table Products.CrustType
(
    CrustTypeId int not null identity(1,2)
    ,CrustType nvarchar(20) not NULL
    ,CONSTRAINT PK_Products_CrustType primary key (CrustTypeId)
)


alter table [Order].[Order]
    add CONSTRAINT FK_Order_UserId FOREIGN Key (UserId) REFERENCES Accounts.[User] (UserId);

alter table [Order].[Order]
    add CONSTRAINT FK_Order_StoreId FOREIGN Key (StoreId) REFERENCES [Order].Store (StoreId);

alter table [Order].[Order]
    add CONSTRAINT FK_Order_ProductOrderId FOREIGN Key (ProductOrderId) REFERENCES [Order].ProductOrder (ProductOrderId);

alter table [Order].Store
    add CONSTRAINT FK_Store_AddressId FOREIGN Key (AddressId) REFERENCES Accounts.Address (AddressId);

alter table [Order].ProductOrder
    add CONSTRAINT FK_ProductOrder_ProductId FOREIGN Key (ProductId) REFERENCES Products.Product (ProductId);

alter table [Order].ProductOrder
    add CONSTRAINT FK_ProductOrder_PizzaId FOREIGN Key (PizzaId) REFERENCES Products.Pizza (PizzaId);

alter table Accounts.[User]
    add CONSTRAINT FK_User_AddressId FOREIGN Key (AddressId) REFERENCES Accounts.Address (AddressId);

alter table Accounts.Login
    add CONSTRAINT FK_Login_UserId FOREIGN Key (UserId) REFERENCES Accounts.[User] (UserId);

alter table Products.Pizza
    add CONSTRAINT FK_Pizza_ToppingsId FOREIGN Key (ToppingsId) REFERENCES Products.Toppings (ToppingsId);

alter table Products.Pizza
    add CONSTRAINT FK_Pizza_CrustSizeId FOREIGN Key (CrustSizeId) REFERENCES Products.CrustSize (CrustSizeId);

alter table Products.Pizza
    add CONSTRAINT FK_Pizza_CrustTypeId FOREIGN Key (CrustTypeId) REFERENCES Products.CrustType (CrustTypeId);

alter table Products.Pizza
    add CONSTRAINT FK_Pizza_UserId FOREIGN Key (UserId) REFERENCES Accounts.[User] (UserId);


alter table [Order].[Order]
    add CONSTRAINT DF_Order_Completed default (1) for Completed;

alter table Accounts.Login
    add CONSTRAINT UQ_Accounts_Login UNIQUE (Username);



insert into products.Product(ProductName)
values ('Pizza')




insert into Products.Toppings(Topping)
values ('Cheese');

insert into Products.Toppings(Topping)
values ('Pepperioni');

insert into Products.Toppings(Topping)
values ('Veggie');




insert into Products.CrustSize(OrderSize, Cost)
values ('Small', 10.99);

insert into Products.CrustSize(OrderSize, Cost)
values ('Medium', 12.99);

insert into Products.CrustSize(OrderSize, Cost)
values ('Large', 14.99);                       




insert into Products.CrustType(CrustType)
values ('Regular');

insert into Products.CrustType(CrustType)
values ('Thin Crust');

insert into Products.CrustType(CrustType)
values ('Deep Dish');



-- insert into [Order].Store ([Name])
-- values ('Dallas');

-- insert into [Order].Store (AddressLine1, City)
-- values ('1234 N. Kennedy Dr.', 'Dallas');

-- select *
-- from Products.Pizza;

-- drop DATABASE PizzaBox;

select *
from Products.CrustSize;

select*
from Products.Pizza;

select *
from Products.CrustType;

select *
from Products.Toppings;

select *
from [Order].ProductOrder;
