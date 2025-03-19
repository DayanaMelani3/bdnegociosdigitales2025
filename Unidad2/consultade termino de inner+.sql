--21. Listar las categorias con el total de ingresos
--generados por sus productos
select c.CategoryName, sum(od.Quantity * od.UnitPrice) as [total]
from categories as c
inner join products as p
on c.CategoryID = p.CategoryID
 inner join [Order Details] as od
 on od.ProductID = p.ProductID
 group by c.CategoryName


select c.CategoryName, sum(od.Quantity * od.UnitPrice) as [total]
from categories as c
inner join products as p
on c.CategoryID = p.CategoryID
 inner join [Order Details] as od
 on od.ProductID = p.ProductID
 group by c.CategoryName, p.ProductName
 order by c.CategoryName

--22. listar los clientes con el total ($) gastado en pedido

SELECT c.companyname, sum(od.Quantity * od.UnitPrice) as [total]
from Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
inner join[Order Details] as od
on od.OrderID = o.OrderID
group by c.CompanyName


--23.listar los pedidos realizados entre el 1 de enero de 1997 y el 30 de junio de 1997
--y mostrar el total de dinero

select o.orderID, sum(od.Quantity * od.UnitPrice) as [total]
from Orders as o
inner join [Order Details] as od
on o.OrderID = od.OrderID
where OrderDate between '1997-01-01' and '1997-06-30'
group by o.OrderDate

--24.listar los productos con las categorias Beverages, seafood, confections
select p.ProductName, c.CategoryName 
from Categories as c
inner join Products as p
on c.CategoryID = p.CategoryID
where c.CategoryName in('Beverages', 'seafood','confections' )

--25. listar los clientes ubicados en Germany y que hayan
--realizado pedidos antes del 1 de enero de 1997
select *
from customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
where country = 'Germany'
and o.OrderDate<'1997-01-01'
--26.Listar los clientes que han realizado pedidos con un total entre $500 y $2000

 select c.CompanyName, sum(od.Quantity * od.UnitPrice) as [total]
 from Customers as c
 inner join orders as o
 on c.CustomerID = o.CustomerID
 inner join [Order Details] as od
 on od.OrderID = o.OrderID
 group by c.CompanyName
 having sum(od.Quantity * od.UnitPrice) between 500 and 2000
