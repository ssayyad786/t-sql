/*Section 12*/
Select * From NORTHWND.dbo.Customers;
select * From [Order Details];

/*Aliasing 13
If two tables have same colom name and we want to refer spesific table then we use "as". so we dont have to write full big
name every time
*/

Select prod.SupplierID, sup.SupplierID 
From dbo.Products AS prod, dbo.Suppliers AS sup 

/* We can also write expresion to rename dipalay name of particular column
    or expression just calculate and show result in new column, that column will not have any name 
	we can give that column that a name
*/
Select prod.SupplierID, sup.SupplierID AS 'Suhail Sayyad' 
From dbo.Products AS prod, dbo.Suppliers AS sup 

Select prod.SupplierID, sup.SupplierID , prod.SupplierID + sup.SupplierID As Addition
From dbo.Products AS prod, dbo.Suppliers AS sup 



/*Section 14 filitering data
Filtering in database refers to the the action of reterving only subset of data, based on one or multiple conditions 
oprator 


********Compareson oprator***************
=   Equal
>    grater then
<    less then 
>=    grater then equal
<=    les then equal
!=     Not equal
<>      Not equal

*************Range oprator********************
**BETWEEN** 

WHERE <expresion 1>
BETWEEN <expression 1> AND <expression 2>

**IN**

Where <Expression 1>
IN (<expression 2>,< expression 3>...)




*/

Select *
From dbo.Orders
Where ShipCountry = 'Germany'

---date used
Select *
From dbo.Orders
where OrderDate >= '1998-01-01'



---between oprator ---
---Note boundary will also will be included in result set
Select *
From dbo.Orders
where OrderDate BETWEEN '1998-01-01' AND '1998-01-06'

---oprator IN used

select *
From dbo.Orders
Where ShipCountry IN ('USA','Canada');

---multiple clause in where 
Select *
From dbo.Orders
where OrderDate BETWEEN '1998-01-01' AND '1998-01-06'
AND
ShipCountry IN ('USA','Canada');

--- use of not
Select *
From dbo.Orders
where OrderDate BETWEEN '1998-01-01' AND '1998-01-06'
AND
ShipCountry NOT IN ('USA','Canada');


---date without between oprator

Select *
From dbo.Orders
where OrderDate >= '1998-01-01' 
AND 
      OrderDate <= '1998-01-06';

--- Use () parnthsis to group similar rule together 
--- without parenthsis sql server will execute query on basis of presidence
Select *
From dbo.Orders
Where (ShipCountry = 'USA'
       OR ShipCountry = 'Canada')
	   AND EmployeeID = 1;

--- IS NULL
Select *
From dbo.Orders
Where ShipRegion IS NULL

---NOT NULL
Select *
From dbo.Orders
Where ShipRegion IS NOT NULL

/* Ordering  15 */
Select EmployeeID,FirstName,LastName
From dbo.Employees

Select EmployeeID,FirstName,LastName
From dbo.Employees
ORDER BY FirstName ASC

Select EmployeeID,FirstName,LastName
From dbo.Employees
ORDER BY FirstName DESC

--order by FirstName and LastName
--- below data will be order by fisrtname and last name but as we have given first name first first name will be given priority 
--- example if ppl have last name same then pripority will be given to first name . sorting will happen on the basis of first name first


Select EmployeeID,FirstName,LastName
From dbo.Employees
ORDER BY FirstName,LastName 

Select EmployeeID,FirstName,LastName
From dbo.Employees
ORDER BY FirstName ASC,
         LastName  ASC;

Select EmployeeID,FirstName,LastName
From dbo.Employees
ORDER BY FirstName DESC,
         LastName  DESC;

/* 16 Aggregate Function */

--count number of rows 
Select Count(*) As [Number of Rows]
from dbo.Orders
-- Secont method use of count function
-- you can give colum name and it will not return row in cloum with is null
Select *
From dbo.Orders;
Select *
From dbo.Orders
Where ShipRegion is Not NULL;
---Now see behaviour of count function ,
---As we see if we give column name as attribute to Count funcation it will not return us NULL rows count
Select Count(ShipRegion)
from dbo.Orders

---SUM(expression) ---> To calculate total of all rows with application values in a columns
Select SUM(UnitsInStock) As TotalUnitsInStock
From dbo.Products

---AVG(expression) ---> To clculate average of all rows with applicable values in a column
Select AVG(UnitPrice) AS AverageUnitPrice
from dbo.Products

---MIN(expression)  --> get minimum
Select MIN(UnitPrice) AS AverageUnitPrice
from dbo.Products

---Max
Select MAX(UnitPrice) AS AverageUnitPrice
from dbo.Products

---What average function did internally

Select SUM(UnitPrice)/COUNT(UnitPrice) AS AVG
FROM dbo.Products

/* 17 Querying Database Grouping

*/

Select *
From dbo.Customers

---groupby
Select Country, Count (*) AS TOTAL
From dbo.Customers
GROUP BY Country 

-- adding order by
Select Country, Count (*) AS TOTAL
From dbo.Customers
GROUP BY Country 
Order By TOTAL DESC

---
Select Country, ContactTitle
From dbo.Customers
ORDER By Country,ContactTitle

Select Country, ContactTitle, Count(*) As Total
From dbo.Customers
Group By Country,ContactTitle
Order By Country


---
Select *
From dbo.[Order Details]


Select OrderID,
       Count(ProductID) As TotalNumberOfProducts,
	   Max(UnitPrice) As HighestUnitPrice,
	   Min(UnitPrice) As LowestUnitPrice,
	   Sum(UnitPrice*Quantity*(1-Discount)) As TotalNetAmount,
	   Avg(UnitPrice*Quantity*(1-Discount)) As AverageNetAmount
From dbo.[Order Details]
Group By OrderID
Order By OrderID


















