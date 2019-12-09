use AdventureWorks2017;
GO

-- select
select 1 + 1;

select * 
from Person.Person;

select firstname, lastname, middlename
from person.person;


select firstname, lastname, middlename
from person.Person
where firstname = 'robert';

select firstname, lastname, middlename
from person.Person
where firstname = 'robert' or firstname = 'john';

select firstname, lastname, middlename
from person.Person
where firstname <> 'robert' AND firstname <> 'john';

select firstname, lastname, middlename
from person.Person
where firstname like '%r%e' or firstname like 'robert_' or firstname like 'r[aeiou]%';

select count(*), firstname, lastname
from person.Person
where firstname = 'robert' or firstname = 'john'
group by firstname, lastname;

select count(*) as [amount of], firstname, lastname
from person.Person
where firstname like '%r%e' or firstname like 'robert_' or firstname like 'r[aeiou]%'
group by firstname, lastname;

select count(*) as [amount of], firstname, lastname
from person.Person
where firstname = 'robert' or firstname = 'john'
group by firstname, lastname
having count(*) > 1;

select count(*) as [amount of], firstname, lastname
from person.Person
where firstname = 'robert' or firstname = 'john'
group by firstname, lastname
having count(*) > 1
order by lastname asc, firstname desc;

-- mode of execution 
/*
FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY
*/

-- insert
SELECT *
from person.Address
where AddressLine1 = 'UT';

insert into person.Address(AddressLine1, AddressLine2, City, StateProvinceID, PostalCode, SpatialLocation, rowguid, ModifiedDate)
values ('UT', Null, 'Arlington', 79, 76010, 0xE6100000010CD6FA851AE6D74740BC262A0A03905EC0, '32a54b9e-e034-4bfb-b573-a71cde60d8ca', '2019-11-08');

insert into person.Address
select AddressLine1, AddressLine2, City, StateProvinceID, PostalCode, SpatialLocation, rowguid, ModifiedDate
from person.address
where AddressLine1 = 'UT';

-- bulk insert
bulk insert person.Address from 'data.csv' with (rowterminator = '\n', fieldterminator = ',');

-- update

-- WARNING -- Never do an UPDATE clause without a WHERE clause!!!

select firstname
from person.Person
where firstname = 'robert';

update person.Person
set firstname = 'john'
where firstname = 'robert';

update pp
set firstname = 'robert'
from person.person as pp
where pp.LastName = 'jones';

-- delete

delete
from Person.Person
where middlename is null and firstname = 'louisa';

-- join

select pp.firstname, pp.lastname, pa.addressline1, pa.city, pa.PostalCode
from person.person as pp
inner join person.BusinessEntityAddress as pbea on pbea.BusinessEntityID = pp.BusinessEntityID
inner join person.Address as pa on pbea.AddressID = pa.AddressID
where pp.firstname = 'jimmy';

select pp.firstname, pp.lastname, ppt.Name, ssoh.OrderDate 
from person.person as pp
inner join person.BusinessEntityAddress as pbea on pbea.BusinessEntityID = pp.BusinessEntityID
inner join person.Address as pa on pbea.AddressID = pa.AddressID
inner join Sales.Customer as sc on sc.CustomerID = pp.BusinessEntityID
inner join sales.SalesOrderHeader as ssoh on ssoh.CustomerID = sc.CustomerID
inner join sales.SalesOrderDetail as ssod on ssod.SalesOrderID = ssoh.SalesOrderID
inner join Production.product as ppt on ppt.ProductID = ssod.ProductID
where pp.firstname = 'jimmy' and datepart(month, ssoh.OrderDate) = 7;

select pp.firstname, pp.lastname, ppt.Name, ssoh.OrderDate 
from person.person as pp
inner join person.BusinessEntityAddress as pbea on pbea.BusinessEntityID = pp.BusinessEntityID
inner join person.Address as pa on pbea.AddressID = pa.AddressID
inner join Sales.Customer as sc on sc.CustomerID = pp.BusinessEntityID
inner join sales.SalesOrderHeader as ssoh on ssoh.CustomerID = sc.CustomerID
inner join sales.SalesOrderDetail as ssod on ssod.SalesOrderID = ssoh.SalesOrderID
inner join Production.product as ppt on ppt.ProductID = ssod.ProductID
where pp.firstname = 'jimmy' and datepart(month, ssoh.OrderDate) = 7 and ppt.Name like '%tire%';


select pp.firstname, pp.lastname, ppt.Name, ssoh.OrderDate
from person.person as pp
inner join person.BusinessEntityAddress as pbea on pbea.BusinessEntityID = pp.BusinessEntityID
inner join person.Address as pa on pbea.AddressID = pa.AddressID
inner join Sales.Customer as sc on sc.CustomerID = pp.BusinessEntityID
inner join
(
    select salesorderid, customerid, OrderDate
    from Sales.SalesOrderHeader
    where datepart(month, OrderDate) = 7
) as ssoh on ssoh.customerid = sc.customerid
inner join sales.SalesOrderDetail as ssod on ssod.SalesOrderID = ssoh.SalesOrderID
inner join
(
    select productid, name
    from Production.Product
    where name like '%tire%'
) as ppt on ppt.productid = ssod.productid
where pp.firstname = 'jimmy';


with OrderHeader as
(
    select salesorderid, customerid, OrderDate
    from Sales.SalesOrderHeader
    where datepart(month, OrderDate) = 7
),
Product as
(
    select productid, name
    from Production.Product
    where name like '%tire%'
)
select pp.firstname, pp.lastname, ppt.Name
from person.person as pp
inner join person.BusinessEntityAddress as pbea on pbea.BusinessEntityID = pp.BusinessEntityID
inner join person.Address as pa on pbea.AddressID = pa.AddressID
inner join Sales.Customer as sc on sc.CustomerID = pp.BusinessEntityID
inner join sales.SalesOrderHeader as ssoh on ssoh.CustomerID = sc.CustomerID
inner join sales.SalesOrderDetail as ssod on ssod.SalesOrderID = ssoh.SalesOrderID
inner join Production.product as ppt on ppt.ProductID = ssod.ProductID
where pp.firstname = 'jimmy';

-- union
select distinct pp1.firstname
from person.person as pp1
inner join Person.person as pp2 on pp2.LastName = pp1.FirstName;

select firstname
from Person.Person
INTERSECT
select lastname
from person.person;

drop DATABASE PizzaBox;
Go
