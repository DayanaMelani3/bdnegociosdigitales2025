select * from orders
select count (*) from orders
select count(ShipRegion) from orders 

select * from products

--Selecciona el precio más bajo de los productos
select min(UnitPrice) from products

--selecciona el precio máximo
select max(unitprice)
from products

--seleccionar ambos y la media(avg)
select min(UnitPrice), max (unitPrice),
avg(UnitsInStock)
from products

--Seleccionar cuantos pedidos existen
select count (*)as [Numero de pedidos]
from Orders

select * from orders

--Calcula el total de dinero vendido 
select sum(UnitPrice * Quantity)
from [Order Details]

--Calcula el total de unidades en stock de 
--todos los productos
select sum (UnitsInStock) as 
count()
from products

--seleccionar el numero de products por categoria
select categoryid, count(*) as 'Numero de productos'
from products
group by CategoryID

------JOIN------
select * from
Categories as c
inner join products as p
on c.CategoryID = p.categoryID

select Categories.CategoryName,
count(*) as [Numero de productos]
from
categories
inner join Products as p
on Categories.CategoryID= p.CategoryID
group by Categories.CategoryName

--Calcular el precio promedio de los productos por cada categoria
select  categoryid, avg(UnitPrice) as 'Precio promedio'
from products
group by CategoryID

--seleccionar el numero de pedidos realizados por cada empleado  por el 
--ultimo trimestre de 1996
select EmployeeID, count(*) as 'Numero de pedidos' 
from orders
group by EmployeeID

select EmployeeID, count(*) from Orders
where OrderDate between '1996-10-01' and '1996-12-31'
group by EmployeeID

--seleccionar la suma total de unidades vendidas por cada producto
select ProductID, sum(Quantity) as 'Numero de productos vendidos'
from [Order Details]
group by productID
order by 1 desc

select orderid,  ProductID, sum(Quantity) as 'Numero de productos vendidos'
from [Order Details]
group by orderid, productID
order by 2 desc

--HAVINGGGGGGGG-----

--Seleccionar el numero de productos por categoria
--pero solo aquellos que tengan más de 10 productos

--paso 1
select * from products

--paso 2
select CategoryID from products

--paso 3(filtrar las categorias)
select categoryID from products
where CategoryID in (2,4,8)

--paso4 (agrupado)
select categoryID, UnitsInStock from products
where CategoryID in (2,4,8)
order by categoryID
 -- paso 5
 select categoryID, UnitsInStock 
from products
where CategoryID in (2,4,8)
group by categoryID
order by categoryID

--paso 6
select categoryID, sum(UnitsInStock) 
from products
where CategoryID in (2,4,8)
group by categoryID
having count(*)>10
order by categoryID

--listar las ordenes agrupadas por empleado, pero que solo muestre aquellos
--que hayan gestionado más de 10 pedidos
select OrderID 
from orders
having count (OrderID)>10
group by employeeid






