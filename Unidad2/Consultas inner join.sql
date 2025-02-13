--consultas básicas con inner join

--1. Obtener los nombres de los clientes y los países
-- a los que se enviaron sus pedidos

select o.CustomerID, o.ShipCountry
from Orders as o
inner join Customers as c
on c.CustomerID = o.CustomerID
order by 2 desc

select o.CustomerID, o.ShipCountry
from Orders as o
inner join Customers as c
on c.CustomerID = o.CustomerID
order by o.ShipCountry desc

 --2. Obtener los productos y sus respectivos proveedores
select p.ProductName as 'Nombre producto', 
s.CompanyName 'Nombre del proveedor'
from 
Products as p
inner join Suppliers  as s
on p.SupplierID = s.SupplierID

--3. Obtener los pedidos y los empleados que los gestionaron 
select o.OrderID, concat(e.Title, '-', e.FirstName, ' ', e.LastName) as 'Nombre'
from 
orders as o 
inner join Employees as e
on o.EmployeeID = e.EmployeeID

--4. Listar los productos junto con sus precios y la categoria
-- a la que pertenecen
Select p.ProductName as 'Nombre del producto', c.CategoryName as 'Nombre categoria', p.UnitPrice 'Precio' 
from products as p
inner join Categories as c
on p.CategoryID = c.CategoryID


-- 5.Obtener el nombre del cliente, el número de orden y la fecha de orden
select c.CompanyName as 'cliente',
o.OrderID, o.ShippedDate
from customers as c
inner join orders as o
on c.CustomerID = o.CustomerID

--6. Listar las ordenes mostrando, el nombre del producto y 
-- la cantidad que se vendió
select  od.OrderID as 'Numero de orden ',
p.ProductName as 'Nombre del producto',
od.Quantity as 'Cantidad vendida'
from [Order Details]as od
inner join products as p 
on od.ProductID = p.ProductID
where od.OrderID = 11031
order by od.Quantity desc

--la orden que mas productos a vendido
select od.OrderID as [Numero de orden],
count (*) as 'Cantidad de productos vendidos'
from [Order Details] as od
inner join Products as p
on od.ProductID = p.ProductID
group by od.OrderID
order by od.OrderID desc

select * from 
[Order Details] as od
where od.OrderID = 11077

--7. obtener los empleados y sus respectivos jefes
select concat(e1.FirstName, '', e1.LastName) as [nombre],
concat(j1.FirstName, ' ', j1.LastName) as [Jefe]
from Employees as e1
inner join Employees as j1
on e1.ReportsTo = j1.ReportsTo

select  FirstName, ReportsTo
from Employees

--8. Listar los pedidos y el nombre de la empresa de transporte utilizada
select o.OrderID,  from 
orders as o
inner join
Shippers as s
on o.ShipVia = s.ShipperID

--cons

---9. Obtener la cantidad total de productos vendidos por categoria

--10. Obtener el total de ventas por empleado
select sum(Quantity) from [Order Details]

select c.CategoryName as 'Nombre categoria', 
sum(Quantity) as 'Productos vendidos'
from Categories as c
inner join Products as p
on c.CategoryID = p.CategoryID
INNER JOIN [Order Details] as od
on od.ProductID = p.ProductID
group by c.CategoryName
order by c.CategoryName

--10. obtener el total de ventas por empleado
select concat (e.FirstName, ' ', e.LastName) as nombre, 
sum((od.Quantity * od.UnitPrice)-(o.orderID)
from orders as o 
where EmployeeID =1

select * 
from orders as o
INNER JOIN [Order Details] as od
on o.OrderID = od.OrderID
INNER JOIN [Order Details] as od
on od.OrderID = o.OrderID


