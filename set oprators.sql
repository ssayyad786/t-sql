--Select country from all customers
Select Distinct Country
From dbo.Customers

--select country from all emaployee
Select Distinct Country 
From dbo.Employees

---
---Union ALL
--- both sql should return same type of data, and number of column should also be same
--- Note its not like joins where tables are combined on basis on FK,PK here we work on results of both query
Select Distinct Country
From dbo.Customers
UNION ALL
Select Distinct Country 
From dbo.Employees


--Union first combined both result set then applied distinc clause
Select Distinct Country
From dbo.Customers
UNION
Select Distinct Country 
From dbo.Employees


---Intersect
Select Distinct Country
From dbo.Customers
Intersect
Select Distinct Country 
From dbo.Employees


---Except
Select Distinct Country
From dbo.Customers
Except
Select Distinct Country 
From dbo.Employees
