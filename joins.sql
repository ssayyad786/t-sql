/* 18:- Joins    

*/

Select * From dbo.Customers; --91 rows

Select * From dbo.Orders;    --830 rows

Select * 
From dbo.Customers c
INNER JOIN dbo.Orders o  ON c.CustomerID = o.CustomerID;

Select *
From dbo.Customers c
Left Outer Join dbo.Orders o ON c.CustomerID = o.CustomerID;

Select *
From dbo.Customers c
Left Outer Join dbo.Orders o ON c.CustomerID = o.CustomerID
Where o.OrderID Is NULL;

Select *
From dbo.Customers c
Right Outer Join dbo.Orders o ON c.CustomerID = o.CustomerID;

Select *
From dbo.Orders o
Right Outer Join dbo.Customers c ON o.CustomerID = c.CustomerID;


Select *
From dbo.Customers c
FULL Outer Join dbo.Orders o ON c.CustomerID = o.CustomerID;


--Cross join on Customers and Orderst table
-- primary key and foreign key do not take a role in cross join
Select * From dbo.Customers c
Cross Join dbo.Orders o;

