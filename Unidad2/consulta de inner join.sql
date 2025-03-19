
select pr.Descripcion, pr.Precio, pr.Id_Fab, p.Fab, pr.Id_producto, p.Producto
from pedidos as p
inner join productos as pr
on p.Fab