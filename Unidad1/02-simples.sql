--lenguaje SQL-LMD (insert, update, select -crud)
--Consultas simples

use Northwind;

--mostrar todos los clientes, proveedores, categorias, productos, ordenes, detalles de orden, empleados con todas las columnas de datos de la empresa
select * from Customers;
select * from Orders;
select * from Employees;
select * from Suppliers;
select * from Categories;
select * from Products;
select * from detalleorden;
select * from Shippers;
select * from [Order Details];

-- proyeccion
select ProductID, ProductName, UnitPrice, UnitsInStock
from products; 

--seleccionar o mostrar el numero de empleado, su primer nombre,
-- su cargo, ciudad y pais
select EmployeeID, FirstName, Title, city, country
from Employees;

--Alias de columna

--en base a la consulta anterior visualizar el employeeid como numero empleado,
--fistname como primerNombre
--Title como cargo, city como ciudad, country con país

select EmployeeID as [Numero Empleado],
FirstName as primernombre, Title 'cargo', City as ciudad, 
Country as país
from Employees;

--Campos calculados
-- Seleccionar el importe de cada uno de los productos
--vendidos en una orden 
select *, (UnitPrice * Quantity)from [Order Details]; 

--poner un alias para que no aparezca el nombre anterior
select *, (UnitPrice * Quantity) as Importe
from [Order Details];

--seleccionar las fechas de orden y año, mes y día, el cliente
--quien las ordeno y el empleado que las realizo 

select OrderDate as 'Fecha de orden', year(OrderDate) as 'año de la orden', month(OrderDate) as 'mes de la orden', day(OrderDate) as 'día de la orden',
CustomerID, EmployeeID from Orders;

--Clausula where
--Operadores relacionales(<,>,=,<=,>=)

select* from Customers;

-- seleccionar el cliente BOLID

select CustomerID, CompanyName, city, Country
from Customers
where CustomerID = 'BOLID';

--seleccionar los clientes, mostrando su identificador,
--nombre de la empresa, contacto, ciudad y país,
--de alemania
select customerid as Numero, ContactName as [Nombre del contacto], city as ciudad, Country as país, CompanyName as compañía
from Customers
where country = 'germany'

--Seleccionar todos los clientes que no sean de alemania 
select customerid as Numero, ContactName as [Nombre del contacto], city as ciudad, Country as país, CompanyName as compañía
from Customers
where country <> 'germany'

--seleccionar todos los productos, mostrando su nombre de producto
--categoria a la que pertenece, existencia, precio, pero solamente
--donde su precio sea mayor a 100

select ProductName as [Nombre Producto],
CategoryID as 'Categoria',
UnitsInStock as 'Existencia',
UnitPrice as 'precio', (UnitPrice * UnitsInStock) as [Costo inventario]
from Products
where UnitPrice > 100

--Seleccionar las ordenes de compra
-- Mostrando la fecha de orden, la fecha de entrega, la
--fecha de envio, el cliente a quién se vendio 
-- de 1996

select OrderDate as 'Fecha orden',
RequiredDate [Fecha de Entrega],
ShippedDate as 'Fecha de envío',
CustomerID as 'Cliente'
from orders





