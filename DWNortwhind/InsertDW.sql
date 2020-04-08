/* Este estatuto extrae los datos de Customers de la NorthwindDB y la
carga en la tabla DimCustomer en DWNorthwind*/ 

INSERT INTO DimCustomer
SELECT c.CustomerID, c.CompanyName, c.City, c.Country, c.Region
FROM Lab0_NorthwindDB.dbo.Customers c;


/* Estos estatutos hacen un update al field de region de DimCustomer porque se pasaron con null*/

UPDATE DimCustomer SET Region = 'Europe' 
WHERE Country = 'Germany' OR Country = 'UK' OR Country = 'Sweden' OR Country = 'France'
OR Country = 'Spain' OR Country = 'Switzerland' OR Country = 'Austria' OR Country = 'Italy' 
OR Country = 'Portugal' OR Country = 'Ireland' OR Country = 'Belgium' OR Country = 'Norway'
OR Country = 'Denmark' Or Country = 'Finland' OR Country = 'Poland';

UPDATE DimCustomer SET Region = 'North America'
WHERE Country = 'Canada' OR Country = 'Mexico';

UPDATE DimCustomer SET Region = 'South America'
WHERE Country = 'Argentina' OR Country = 'Brazil' OR Country = 'Venezuela';


/* Este estatuto extrae los datos de Employees de la NorthwindDB y la
carga en la tabla DimEmployee en DWNorthwind*/ 
INSERT INTO DimEmployee
SELECT e.EmployeeID, CONCAT(e.FirstName,' ',e.LastName), e.City, e.Country, e.Region, e.HireDate
FROM Lab0_NorthwindDB.dbo.Employees e;

/* Este estatuto hace update de la region en DimEmployee  */
UPDATE DimEmployee SET Region = 'Europe' WHERE Country = 'UK';


/* Este estatuto extrae los datos de OrderDate de la NorthwindDB y la
carga en la tabla DimTime en DWNorthwind*/ 
INSERT INTO DimTime
SELECT DISTINCT o.OrderDate
FROM Lab0_NorthwindDB.dbo.Orders o;

 /* Este estatuto extrae los datos de Product de la NorthwindDB y la
carga en la tabla DimProduct en DWNorthwind*/ 
INSERT INTO DimProduct
SELECT p.ProductID, p.ProductName, c.CategoryName, s.CompanyName, s.Address, s.City, s.Region, s.PostalCode, s.Country
FROM Lab0_NorthwindDB.dbo.Products p, Lab0_NorthwindDB.dbo.Categories c, Lab0_NorthwindDB.dbo.Suppliers s
WHERE p.CategoryID = c.CategoryID AND p.SupplierID = s.SupplierID

/* Estos estatutos hacen un update al field de region de DimProduct porque se pasaron con null*/


UPDATE DimProduct SET Region = 'Europe' 
WHERE Country = 'Germany' OR Country = 'UK' OR Country = 'Sweden' OR Country = 'France'
OR Country = 'Spain' OR Country = 'Switzerland' OR Country = 'Austria' OR Country = 'Italy' 
OR Country = 'Portugal' OR Country = 'Ireland' OR Country = 'Belgium' OR Country = 'Norway'
OR Country = 'Denmark' Or Country = 'Finland' OR Country = 'Poland' OR Country = 'Netherlands';

UPDATE DimProduct SET Region = 'North America'
WHERE Country = 'Canada' OR Country = 'Mexico';

UPDATE DimProduct SET Region = 'South America'
WHERE Country = 'Argentina' OR Country = 'Brazil' OR Country = 'Venezuela';

UPDATE DimProduct SET Region = 'Asia'
WHERE Country = 'Japan' OR Country = 'Singapore';

UPDATE DimProduct SET Region = 'Oceania'
WHERE Country = 'Australia';

/* Este estatuto extrae los datos de Product de la NorthwindDB y la
carga en la tabla DimProduct en DWNorthwind*/

INSERT INTO FactSales
SELECT od.ProductID, o.EmployeeID, o.CustomerID, o.OrderDate , o.orderID, od.quantity, od.unitPrice, od.discount, 
od.unitPrice * od.quantity * od.discount, 
od.unitPrice * od.quantity - od.unitPrice * od.quantity * od.discount   
FROM Lab0_NorthwindDB.dbo.Orders o, Lab0_NorthwindDB.dbo.[Order Details] od 
WHERE o.OrderID = od.OrderID;
