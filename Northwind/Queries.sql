/* Queries Northwind*/

/* Querie 1*/
Select TOP 1 pr.ProductName as 'Nombre del Producto', sum(ord.quantity) as 'Numero De Ventas' , Year(o.OrderDate) as Año
from [Order Details] ord, Orders o, Products pr
Where ord.ProductID = pr.ProductID and ord.OrderId = o.OrderId and
Year(o.OrderDate) = 1996
GROUP BY pr.ProductName, ord.ProductID, Year(o.OrderDate)
ORDER BY sum(ord.quantity) DESC;
