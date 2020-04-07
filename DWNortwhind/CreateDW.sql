create database DWNorthwind
GO
USE DWNorthwind

GO

CREATE TABLE DimCustomer(
    CustomerID char(5),
    CustomerName varchar(40),
    City varchar(15),
    Country varchar(15),
    Region varchar(15),
    PRIMARY KEY (CustomerID)
);

/*FALATAN LAS OTRAS Dimensiones: Clientes, Empleados  */

CREATE TABLE DimEmployee(
    EmployeeID int,
    Name varchar(31),
    City varchar(15),
    Country varchar(15),
    Region varchar(15),
    HireDate datetime, 
    PRIMARY KEY (EmployeeID)
);

CREATE TABLE DimTime(
    OrderDate datetime,
    PRIMARY KEY (orderDate)
);

CREATE TABLE DimProduct(
    ProductID int,
    ProductName varchar(40),
    CategoryName varchar(15),
    SupplierName varchar(40),
    Address varchar(60),
    City varchar(15),
    Region varchar(15),
    PostalCode varchar(10),
    Country varchar(15),
    PRIMARY KEY (ProductID)
);

CREATE TABLE FactSales(
    ProductID int,
    EmployeeID int,
    CustomerID char(5),
    OrderDate datetime,
    OrderID int,
    Quantity smallint,
    UnitPrice money,
    DiscountPercent real,
    DiscountAmount money,
    Total money,
    PRIMARY KEY (ProductID, EmployeeID, CustomerID, OrderDate),
    FOREIGN KEY (ProductID) REFERENCES dbo.DimProduct(ProductID),
    FOREIGN KEY (EmployeeID) REFERENCES dbo.DimEmployee(EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES dbo.DimCustomer(CustomerID),
    FOREIGN KEY (OrderDate) REFERENCES dbo.DimTime(OrderDate)
);
