--1. 
Select  C.Empresa, C.Limite_Credito, 
R.Nombre 
from Clientes as c
inner join Representantes as R
on C.Rep_Cli = R.Num_Empl
where C.Limite_Credito > 5000

--2. 
select P.Num_Pedido, 
P.Cantidad, P.Importe, C.Empresa
from Pedidos as p
inner join Clientes as c
on P.Cliente = C.Num_Cli
where P.Cantidad > 100 or P.Importe> 5000

--3 
select O.Ciudad, O.Region, R.Nombre 
from Oficinas as o
inner join Representantes as R
on O.Jef = R.Num_Empl
where O.Region = ('Este', 'Oeste')

--4. 
select C.Empresa, R.Nombre 
from Clientes as c
inner join  Representantes as R
on C.Rep_Cli = R.Num_Empl
inner join  Oficinas as o
on R.Oficina_Rep = O.Oficina
where O.Ciudad in ('Navarra', 'Castellon', 'Daimiel')

--5.
select C.Empresa, C.Limite_Credito, R.Nombre
from Clientes as c
inner join Representantes as R
on C.Rep_Cli = R.Num_Empl
order by C.Limite_Credito desc

--6.
select C.Empresa, R.Nombre, count(P.Num_Pedido) 
from Clientes as c
inner join Pedidos as p
on C.Num_Cli = P.Cliente
inner join Representantes as r 
on C.Rep_Cli = r.Num_Empl
where num_pedido >= 3
group by C.Empresa, R.Nombre

--7.
select R.Nombre, O.Ciudad, o.Region, SUM(P.Importe) 
from Representantes as R
inner join Oficinas as o
ON R.Oficina_Rep = O.Oficina
inner join Pedidos as p
on R.Num_Empl = P.Rep
Group by R.Nombre, O.Ciudad, O.Region

--8.













