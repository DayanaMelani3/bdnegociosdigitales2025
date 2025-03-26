
CREATE OR ALTER VIEW [dbo].[vistaOrdenesDeCompra]  
AS  
SELECT  
    o.OrderID AS [Número Orden],  
    o.OrderDate AS [Fecha de Orden],  
    o.RequiredDate AS [Fecha de Requisición],  
    CONCAT(e.FirstName, ' ', e.LastName) AS [Nombre de Empleado],  
    cu.CompanyName AS [Nombre del Cliente],  
    p.ProductName AS [Nombre de Producto],  
    c.CategoryName AS [Nombre de la Categoría],  
    od.UnitPrice AS [Precio de Venta],  
    od.Quantity AS [Cantidad Vendida],  
    (od.Quantity * od.UnitPrice) AS [Importe]  
FROM Categories AS c  
INNER JOIN Products AS p  
    ON c.CategoryID = p.CategoryID  
INNER JOIN [Order Details] AS od  
    ON od.ProductID = p.ProductID   
INNER JOIN Orders AS o  
    ON od.OrderID = o.OrderID  
INNER JOIN Customers AS cu  
    ON cu.CustomerID = o.CustomerID  
INNER JOIN Employees AS e  
    ON e.EmployeeID = o.EmployeeID

select count(distinct [numero Orden]) as [Numero de Ordenes]
from vistaordenescompra

select sum([Cantidad Vendida] * [Precio de Venta]) as [importe Total]
from vistaordenescompra
Go

select sum(importe) as [importe Total]
from vistaordenescompra
where year([Fecha de Orden]) between '1995' and '1996'  
Go

create or alter view vista_ordenes_1995_1996
as
select [Nombre del Cliente] as 'Nombre Cliente',
sum(importe) as [importe Total]
from vistaordenescompra
where year([Fecha de Orden])
between '1995' and '1996'  
group by [Nombre del Cliente]
having count(*)>2


create schema rh

create table rh.tablarh (
  id int primary key,
  nombre nvarchar(50)
)


-- vista horizontal
create or alter view rh.viewcategoriasproductos
as
select c.CategoryID, CategoryName, p.ProductID, p.ProductName
from
Categories as c
inner join Products as p
on c.CategoryID = p.CategoryID;
GO

--Funciones de cadena, fecha, instrucciones de control,
--variables




