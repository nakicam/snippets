-- 
use Northwind
select distinct
	o.orderid,
	companyname,
	CONVERT(varchar, OrderDate, 107) as OrderDate,
	case
	when ShippedDate is not null
	then CONVERT(varchar, shippeddate, 107)
	else 'pending shippment'
	end as shipped


from Orders as o
left join Customers as c on c.CustomerID = o.CustomerID
left join [Order Details] as od on od.OrderID = o.OrderDate

where od.OrderID not in
(
select OrderID from [Order Details] as od
inner join Products as p on p.ProductID=od.ProductID
where p.Discontinued = 1

)
And DATEPART(year,o.shippeddate) = 2018
or o.ShippedDate is null

order by shipped desc
go

/*
select DATEPART(year,shippeddate) as dateparts
from orders
go
*/

-- Alle Daten aus Orders
select * from orders
go


-- Kapitel 6 Limiting Results with SQL Functions
use pubs
select * from Authors
go

select Top(5) * from Authors
where state = 'CA' and au_id like '4%'
go


select Top(6)
	COUNT(ta.au_id) as NumberOfBooks,
	ta.au_id,
	CONCAT_WS(' ', a.au_fname, a.au_lname) as Author,
	Concat(a.au_fname,' ', a.au_lname) as Author2
from authors as a
	inner join titleauthor ta on a.au_id = ta.au_id

	group by a.au_fname, a.au_lname, ta.au_id
-- order by COUNT(ta.au_id)
order by NumberOfBooks DESC
go

select Top(1) with ties
	COUNT(ta.au_id) as NumberOfBooks,
	ta.au_id,
	CONCAT_WS(' ', a.au_fname, a.au_lname) as Author,
	Concat(a.au_fname,' ', a.au_lname) as Author2
from authors as a
	inner join titleauthor ta on a.au_id = ta.au_id

	group by a.au_fname, a.au_lname, ta.au_id
-- order by COUNT(ta.au_id)
order by NumberOfBooks DESC
go


select Top(10) Percent
	COUNT(ta.au_id) as NumberOfBooks,
	ta.au_id,
	CONCAT_WS(' ', a.au_fname, a.au_lname) as Author,
	Concat(a.au_fname,' ', a.au_lname) as Author2
from authors as a
	inner join titleauthor ta on a.au_id = ta.au_id

	group by a.au_fname, a.au_lname, ta.au_id
-- order by COUNT(ta.au_id)
order by NumberOfBooks DESC
go

-- Offset Fetch
select
	CONCAT_WS(' ', fname, lname) as Employee,
	j.job_desc as Position

from employee as e
inner join jobs as j on e.job_id = j.job_id

order by employee
Offset 0 rows
fetch next 5 Rows only
go

select
	CONCAT_WS(' ', fname, lname) as Employee,
	j.job_desc as Position

from employee as e
inner join jobs as j on e.job_id = j.job_id

order by employee
Offset 5rows
fetch next 5 Rows only
go

-- Prüfung
select
	CONCAT_WS(' ', fname, lname) as Employee,
	j.job_desc as Position

from employee as e
inner join jobs as j on e.job_id = j.job_id

order by employee
go



-- Variable hinzufügen

Declare @offsetrows int
Declare @fetchrows int

Set @offsetrows = 0
Set @fetchrows = 5

select
	CONCAT_WS(' ', fname, lname) as Employee,
	j.job_desc as Position

from employee as e
inner join jobs as j on e.job_id = j.job_id

order by employee
Offset @offsetrows rows
fetch next @fetchrows Rows only
go

-- Variable hinzufügen

Declare @offsetrows int
Declare @fetchrows int

Set @offsetrows = 0
Set @fetchrows = 5

select
	CONCAT_WS(' ', fname, lname) as Employee,
	j.job_desc as Position

from employee as e
inner join jobs as j on e.job_id = j.job_id

order by employee
Offset @offsetrows rows
fetch next @fetchrows Rows only
go


-- Stored Procedure erstellen
Create Procedure populate_table
@offsetrows int,
@fetchrows int
as

select
	CONCAT_WS(' ', fname, lname) as Employee,
	j.job_desc as Position

from employee as e
inner join jobs as j on e.job_id = j.job_id

order by employee
Offset @offsetrows rows
fetch next @fetchrows Rows only
go

exec populate_table 0,10 -- ausführen mit variablen werten
go



-- Kapitel 9 Simplifying Queries with Intermediary Tables
use Northwind
-- CTE
--With employeescte (
--	employeeid, 
--	firstname, 
--	lastname
--	)
--	as (
--	select employeeid, 
--	TRIM(firstname), 
--	trim(lastname) from Employees
--	)
--Select * from employeescte

with CTE (
EmployeeID,
FirstName,
LastName)

as (select employeeid, firstname, lastname from Employees),

-- 2 Query
region (
employeeid, regioncount, regionaveragesales)
as ( select employeeid, count(distinct shipregion), sum(od.quantity * od.UnitPrice) / Count(distinct shipregion)
from Orders as o
inner join [Order Details] as od on o.OrderDate = od.OrderID
group by EmployeeID),

-- 3 Query
totals (
employeeid, TotalAllSalesCount, TotalAllSales, AverageIndividualSalesAmount)
as
(
select 
employeeid, 
count(distinct o.orderid), 
SUM(od.quantity * od.unitprice),
sum(od.quantity * od.unitprice) / count(distinct o.orderid)

from orders as o inner join [Order Details] as od on o.orderid = od.orderid

group by employeeid)

select * from totals
go





use WideWorldImportersDW

-- Die Basis ist am besten Date Tabelle
with DimDate (
Date)
as (select Date from Dimension.Date),

-- 2 Query mit subquery
totalorders(date, OrdersPerDay,OrderAmount)
as(
	select [Order Date Key] as Date,
	count([WWI Order ID]) as OrdersPerDay, 
	SUM(fo.[Quantity]* fo.[Unit Price]) as OrderAmount
	from [Fact].[Order] as fo
	group by [Order Date Key])
-- Hier der Output --
select
DimDate.Date,
totalorders.date,
totalorders.OrdersPerDay,
totalorders.OrderAmount
from DimDate
-- JOINS über alle CTE --
left join totalorders on DimDate.date = totalorders.date

go






-- Temp Tables


-- Scope





-- Cursors





























