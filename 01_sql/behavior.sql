use AdventureWorks2017;
GO

-- view
create view vw_Person
as
select firstname, lastname
from Person.Person;
GO

alter view vw_Person with schemabinding
as
select firstname, lastname
from Person.Person;
GO

select * from vw_Person;
GO

-- function
-- tabular fuction
create function fn_Person(@first nvarchar(50)) -- (varname, vartype)
returns TABLE -- return type
as -- (
RETURN -- return
select firstname, lastname
from Person.Person
where firstname = @first;
go -- )

--select * from fn_Person('joshua');

-- scaler function
create function fn_FullName(@first nvarchar(50), @middle nvarchar(50), @last nvarchar(50))
returns nvarchar(200)
AS
BEGIN
    --return @first + ' ' + @middle + ' ' + @last
    --return @first + Isnull(' ' + @middle, '') + ' ' + @last
    return @first + COALESCE(' ' + @middle, '') + ' ' + @last 
END;
GO

select dbo.fn_FullName(firstname, null, lastname) as full_name from fn_Person('joshua');
GO

-- stored procedure (SP)(proc)
create PROCEDURE sp_InsertName(@first nvarchar(50), @middle nvarchar(50), @last nvarchar(50))
as
begin
    begin tran --TRANSACTION
        begin try
            declare @mname as nvarchar(50) = @middle;

            if(@middle is null)
            begin
                set @mname = ''
            end

            CHECKPOINT --(SAVEPOINT) save data temporarily 

            insert into Person.Person(Firstname, MiddleName, Lastname)
            values (@first, @mname, @last)

            commit transaction 
        end try

        begin catch
            print error_message()
            print error_line()
            print error_severity()
            print error_state()
            print error_number()
        end catch
END;

execute sp_InsertName 'fred', null, 'belotte';
go

-- trigger
create trigger tr_InsertName
on Person.Person 
INSTEAD of insert
as
UPDATE pp
set firstname = inserted.firstname
from Person.Person as pp
where pp.BusinessEntityID = inserted.BusinessEntityID;