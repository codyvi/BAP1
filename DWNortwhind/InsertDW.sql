 /* Este estatuto extrae los datos de Customers de la NorthwindDB y la
carga en la tabla DImCustomer en DWNorthwind*/ 

INSERT INTO DimCustomer
SELECT c.CustomerID, c.CompanyName, c.City, c.Country, c.Region
FROM Lab0_NorthwindDB.dbo.Customers c;
