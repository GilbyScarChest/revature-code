use AdventureWorks2017;
go

select * from Person.Person;

select p.firstname, p.LastName, p.title
from Person.Person as p

select p.firstname, p.LastName, pp.phonenumber
from Person.Person as p
inner join person.PersonPhone as pp on pp.BusinessEntityID = p.BusinessEntityID
where pp.phonenumber like '310%';