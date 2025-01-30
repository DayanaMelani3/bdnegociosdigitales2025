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

use Northwind;

--Operadores Lógicos (or, and y not)
--seleccionar los productos que tengan un precio de entre 10 y 50 
select * from Products

select ProductName as 'Nombre', UnitPrice as 'Precio', 
UnitsInStock as 'Existencia'
from Products
where UnitPrice>=10
and UnitPrice<=50;

--mostrar todos los pedidos por clientes que no son enviados a Alemania

select * from Orders
where ShipCountry <> 'Germany'

--seleccionar Clientes de 'Mexico' o 'USA'
 select * from customers
 where Country = 'Mexico' or country= 'USA'

 --seleccionar Empleados que nacieron entre 1955 y 1958 y 
 --que viven en Londres

 select * from Employees
 where year (BirthDate)>=1955 and year(BirthDate)<=1958 and City = 'London'

 --seleccionar los pedidos con flete de peso (Freight) mayor a $100
 -- y enviados a Francia o España

 select OrderID, OrderDate,ShipCountry, Freight
 from Orders
 where Freight>100 
 and (ShipCountry = 'Spain' or ShipCountry = 'France')
 
 --Select las primeras cinco ordenes de compra
 select top 5 * from Orders

 --seleccionar los productos con precio entre $10 y $50,
 --que NO estén descontinuados y tengan más de 20 unidades en stock
  select ProductName, UnitPrice, UnitsInStock, Discontinued
  from Products
  where UnitPrice>=10 and  UnitPrice<=50
  and discontinued = 0
  and UnitsInStock>20
  

  --pedidos enviados a France o Germany pero con flete menor a 50

  select ShipCountry, Freight, OrderID
  from Orders 
  where (ShipCountry = 'Germany' or ShipCountry = 'France')
  and Freight<50

  -- Clientes que NO sean de Mexico o USA y
  -- que tengan fax registrado
  select companyname, country, city, fax
  from Customers
  where not(Country='Mexico' or Country = 'USA')
  and Fax is not null

  select companyname, country, city, fax
  from Customers
  where not(Country<>'Mexico' and Country <> 'USA')
  and Fax is not null
                --TAREA--
  --Seleccionar pedidos con flete mayor a 100
  -- enviados a Brasil o Argentina,
  --pero NO enviados por el transportista 1

  select * from Shippers

  --seleccionar Empleados que NO viven en London o Seattle
  --y que fueron contratados después de 1995

  select concat( FirstName, '', LastName)as[Nombre Completo],
  hiredate, city, country
  from Employees
  where NOT( city ='London' or city <> 'Seattle')
  and year (HireDate)>= 1992

  --Clausula IN (or)
  --seleccionar loss productos con categoria 1 ,3 o 5
  select ProductName, CategoryID, UnitPrice
  from Products
  where CategoryID = 1 or CategoryID =3 or CategoryID=5

select ProductName, CategoryID, UnitPrice
  from Products
  where CategoryID in(1,3,5);

  --sleccionar todas las ordenes de la region RJ, Tachira y que
  --no tengan region asignada
  select ShipRegion, OrderID, OrderDate
  from Orders
  where ShipRegion in ('Táchira','RJ')
  or ShipRegion is null

  --seleccionar las ordenes que tengan cantidades de 12, 9, y 40 
  -- y discount de 0.15 o 0.o5
  select OrderID,Quantity,Discount
  from [Order Details]
  where Quantity in (12, 9 ,40)
  and Discount in (0.15, 0.05)


  





  --Between







