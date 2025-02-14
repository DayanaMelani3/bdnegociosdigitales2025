--11.Listar los clientes y la 
--cantidad de pedidos que han realizaado

select c.CompanyName as [cliente],
count(*) as [Numero de ordenes]
from Customers as c 
INNER JOIN Orders as o
on c.customerID = o.CustomerID
group by c.CompanyName
order by [Numero de ordenes] desc

select c.CompanyName as [cliente],
count(*) as [Numero de ordenes]
from Customers as c 
INNER JOIN Orders as o
on c.customerID = o.CustomerID
group by c.CompanyName
order by 2 desc

--12. Obtener los empleados que han gestionado pedidos
--enviados a Alemania
SELECT distinct concat (e.FirstName, ' ', e.LastName) as [Nombre]
FROM Employees as e
INNER JOIN orders as o
ON e.EmployeeID = o.EmployeeID
where o.shipCountry = 'Germany'

--13. Listar los productos junto con el nombre del
--proveedor y el país de origen
SELECT p.productName as [Nombre del producto],
s.CompanyName as [Proveedor],
s.Country as [País de origen]
FROM Products as p 
INNER JOIN Suppliers as s
ON p.SupplierID = s.SupplierID
order by 1 asc 

--14. Obtener los pedidos agrupados por país de envío

select o.ShipCountry as [País de envío],
count (o.OrderID) as [Numero de ordenes]
from Orders as o
group by o.ShipCountry

--15. Obtener los empleados y la cantidad de territorios
--en los que trabajan

SELECT concat (e.firstName, ' ', e.LastName) as [Nombre],
t.TerritoryDescription,
count (et.TerritoryID) as [Cantidad territorios]
from Employees as e 
INNER JOIN EmployeeTerritories as et
on e.EmployeeID = et.EmployeeID
INNER JOIN Territories as t
on et.TerritoryID = t.TerritoryID
group by e.FirstName, e.LastName, t.TerritoryDescription
order by [Nombre], t.TerritoryDescription desc
--16. Listar las categorias y la cantidad de productos 
--que contienen

SELECT c.CategoryName as [categoria], 
count (p.productID) as [cantidad de productos]
from Categories as c
inner join products as p
on c.categoryID = p.CategoryID
group by c.CategoryName
order by 2 desc

--17. obtener la cantidad total de productos vendidos por proveedor
 select s.CompanyName as [proveedor],
 sum (od.Quantity) as [total de productos vendidos]
 from Suppliers as s
 inner join products as p
 on s.SupplierID = p.SupplierID
 inner join [Order Details] as od
 on od.ProductID = p.ProductID

 --18. Obtener la cantidad de pedidos enviados 