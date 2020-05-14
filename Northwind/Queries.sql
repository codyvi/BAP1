/* Queries Northwind*/

/* Querie 1*/
Select TOP 1 pr.ProductName as 'Nombre del Producto', sum(ord.quantity) as 'Numero De Ventas' , Year(o.OrderDate) as Año
from [Order Details] ord, Orders o, Products pr
Where ord.ProductID = pr.ProductID and ord.OrderId = o.OrderId and
Year(o.OrderDate) = 1996
GROUP BY pr.ProductName, ord.ProductID, Year(o.OrderDate)
ORDER BY sum(ord.quantity) DESC;

/* Querie 2*/
SELECT SUM(od.UnitPrice * od.Quantity * (1-od.Discount)) as [Ventas en 1996]
FROM [Order Details] od, Orders o
WHERE YEAR(o.OrderDate) = '1996' AND o.OrderID = od.OrderID

/* Querie 3*/
SELECT SUM(od.UnitPrice * od.Quantity * (1-od.Discount)) as [Ventas en 1997]
FROM [Order Details] od, Orders o
WHERE YEAR(o.OrderDate) = '1997' AND o.OrderID = od.OrderID

/* Querie 4*/
SELECT SUM(od.UnitPrice * od.Quantity * (1-od.Discount)) as [Ventas Totales]
FROM [Order Details] od

/*Querie 5*/
SELECT  Top(1) e.Region as [Region con mas ventas en 1997], SUM(od.UnitPrice * od.Quantity * (1-od.Discount)) as [Total en ventas]
FROM  Orders o, [Order Details] od, Employees e
WHERE YEAR(o.OrderDate) = '1997' AND o.OrderID = od.OrderID AND o.EmployeeID = e.EmployeeID
GROUP BY e.Region
ORDER BY [Total en ventas] DESC

/*Querie 6*/
SELECT  Top(1) e.City as [Ciudad  con mas ventas en 1997], SUM(od.UnitPrice * od.Quantity * (1-od.Discount)) as [Total en ventas]
FROM  Orders o, [Order Details] od, Employees e
WHERE YEAR(o.OrderDate) = '1997' AND o.OrderID = od.OrderID AND o.EmployeeID = e.EmployeeID AND e.Region = 'WA'
GROUP BY e.City
ORDER BY SUM(od.UnitPrice * od.Quantity * (1-od.Discount)) DESC

/*Querie 7*/
SELECT  e.Region, e.Country, SUM(od.UnitPrice * od.Quantity * (1-od.Discount)) as [total de ventas]
FROM  Orders o, [Order Details] od, Employees e
WHERE o.OrderID = od.OrderID AND o.EmployeeID = e.EmployeeID
GROUP BY e.Region, e.Country

