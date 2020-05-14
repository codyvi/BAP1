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

