
- 18. Obtener la cantidad de pedidos enviados por
- cada empresa de transporte 

SELECT s.CompanyName as [transportista], 
count(*) as [total de pedidos] 
from Orders as o
inner join shipers as s
on o.shipVia = s.shipperID
group by s.companyName

- diferencia con el count
select * from Orders

select count(*) from orders
select count (OrderID) from orders 
 select count(ShipRegion) from Orders

 **CONSULTAS AVANZADAS**

 ![Consultas](./img/2.avif)

- 19. Obtener los clientes que han realizado pedidos con
 mas de un producto

 select c.CompanyName, count(distinct ProductID) as [numero de productos]
 from
 customers as c
 INNER JOIN orders as o
 on c.CustomerID = o.CustomerID
 INNER JOIN [Order Details] as od
 on od.OrderID = o.OrderID
 group by c.CompanyName
 order by 2 desc

 - 20. Listar los empleados con la cantidad total de pedidos que han gestionado, y a que
 - clientes les han vendido, agrupandolos por nombre completo y dentro de este nombre por
 - cliente, ordenandolos por la cantidad de mayor pedido
 
select concat (e.FirstName, ' ', e.LastName) as [nombre], 
c.companyName as [cliente] 
,count(OrderID) as [numero de ordenes]
from orders as o
inner join Employees as e
on o.EmployeeID = e.EmployeeID
inner join Customers as c
on o.CustomerID = c.CustomerID
group by e.FirstName, e.LastName, c.CompanyName
order by [nombre] asc, [cliente]

- Left join, rigth join, full join y cross join

- practica de utilizaci�n de left join 

