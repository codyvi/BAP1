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
    hiredate datetime, 
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

create table FactSales (
ProductID       int ,
EmployeeID      int ,
CustomerID      char(5) ,
orderDate       datetime ,
OrderID         int,                               
Quantity        smallint,
unitPrice       money,
discountPercent real,
discountAmount  money,
total           money, 
primary key (ProductID, EmployeeID, CustomerID, orderDate),
foreign key (ProductID)  references dbo.DimProduct(productID),
foreign key (EmployeeID) references dbo.DimEmployee(employeeID),
foreign key (CustomerID) references dbo.DimCustomer(CustomerID),
foreign key (orderDate)  references dbo.DimTime(PK_Date)
)
