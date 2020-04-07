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



/* crear dimension de tiempo importando datos y estructura creada con BI Studio*/
/* el recurso Time es le que debio haber creado en Business Tntelligence studio y la estamos copiando
a la tabla de DimTime. Las siguientes 2 lineas NO estan incompletas. Crean y cargan DimTime al mismo tiempo */
select * into DimTime from JC0_NorthwindDW.dbo.Time
go

--en Dimtime es necesario tener una llave primaria.
alter table DimTime add primary key (pk_date)
go


--tabla de Hechos FACT SALES puede ser necesario agregar-quitar columnas
-- OrderId  es necesario solo para efectos de la carga de los datos
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
