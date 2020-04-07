/* Insert customer data */
INSERT INTO DimCustomer
SELECT c.CustomerID, c.CompanyName, c.City, c.Country, c.Region
FROM NorthwindDB.dbo.Customers c;

/* Update customer region by country (except USA) */
UPDATE DimCustomer SET Region = 'Europe' 
WHERE Country = 'Germany' OR Country = 'UK' OR Country = 'Sweden' OR Country = 'France'
OR Country = 'Spain' OR Country = 'Switzerland' OR Country = 'Austria' OR Country = 'Italy' 
OR Country = 'Portugal' OR Country = 'Ireland' OR Country = 'Belgium' OR Country = 'Norway'
OR Country = 'Denmark' Or Country = 'Finland' OR Country = 'Poland';

UPDATE DimCustomer SET Region = 'North America'
WHERE Country = 'Canada' OR Country = 'Mexico';

UPDATE DimCustomer SET Region = 'South America'
WHERE Country = 'Argentina' OR Country = 'Brazil' OR Country = 'Venezuela';


/* Insert employee data */
INSERT INTO DimEmployee
	SELECT e.EmployeeID, CONCAT(e.FirstName,' ',e.LastName), e.City, e.Country, e.Region, e.HireDate
	FROM NorthwindDB.dbo.Employees e;

/* Update employee region based on country */
UPDATE DimEmployee SET Region = 'Europe' WHERE Country = 'UK';


INSERT INTO DimTime
	SELECT DISTINCT o.OrderDate
	FROM NorthwindDB.dbo.Orders o;


INSERT INTO DimProduct
	SELECT p.ProductID, p.ProductName, c.CategoryName, s.CompanyName, s.Address, s.City, s.Region, s.PostalCode, s.Country
	FROM NorthwindDB.dbo.Products p, NorthwindDB.dbo.Categories c, NorthwindDB.dbo.Suppliers s
	WHERE p.CategoryID = c.CategoryID AND p.SupplierID = s.SupplierID

/* Update product region based on country */
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


INSERT INTO FactSales
	SELECT od.ProductID, o.EmployeeID, o.CustomerID, o.OrderDate , o.orderID, od.quantity, od.unitPrice, od.discount, 
	od.unitPrice * od.quantity * od.discount, 
	od.unitPrice * od.quantity - od.unitPrice * od.quantity * od.discount   
	FROM NorthwindDB.dbo.Orders o, NorthwindDB.dbo.[Order Details] od 
	WHERE o.OrderID = od.OrderID;