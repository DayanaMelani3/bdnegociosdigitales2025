#Ejercicio de pedidos con Store procedure

-Este ejercicio permite realizar un pedido.
-Validar que el pedido no exista
-Validar que el cliente, el empleado y el producto exista
-Validar que la cantidad a vender tenga suficiente stock
-Insertar el pedido y calcular el importe(Multiplicando el precio del
-producto por cantidad vendida)
-Actualizar el stock del producto (restando el stock menos la cantidad vendida)

``` sql
```
create or alter procedure spu_realizar_pedido
@numPedio int,
@cliente int,
@repre int,
@fab char(3),
@producto char(5),
@cantidad int
as
begin
    -- Verifica si el pedido ya existe
    if exists (select 1 from Pedidos where num_Pedio = @numPedio)
    begin
        print 'El pedido ya existe'
        return 
    end

    -- Verifica si los datos son válidos
    if not exists (select 1 from Clientes where Num_Cli = @cliente) or
       not exists (select 1 from Representantes where Num_Empl = @repre) or
       not exists (select 1 from Productos where Id_fab = @fab and Id_producto = @producto)
    begin
        print 'Los datos no son válidos'
        return 
    end

    -- Valida la cantidad
    if @cantidad <= 0
    begin
        print 'La cantidad no puede ser 0 o negativa'
        return
    end
    
    declare @stockValido int
    select @stockValido = Stock from Productos where Id_fab = @fab and Id_producto = @producto 
    
    if @cantidad > @stockValido 
    begin
        print 'No hay suficiente stock. Stock disponible: ' + cast(@stockValido as varchar(10))
        return
    end

    declare @precio decimal(18,2)
    declare @importe decimal(18,2)

    select @precio = precio from Productos where Id_fab = @fab and Id_producto = @producto
    set @importe = @cantidad * @precio

    begin try
        -- Inserta el pedido
        insert into Pedidos 
        values (@numPedio, GETDATE(), @cliente, @repre, @fab, @producto, @cantidad, @importe)

        -- Actualiza el stock
        update Productos
        set stock = stock - @cantidad
        where Id_fab = @fab and Id_producto = @producto;

        print 'Pedido realizado con éxito.'
    end try
    begin catch
        print 'Error: ' + ERROR_MESSAGE()
    end catch
end;

```sql
```
#pruebas
exec spu_realizar_pedido @numPedido = 113070, @cliente = 2117,
@repre=101, @fab = 'ACI',
@producto = '4100X', @cantidad = 20 

select * from producto
where Id_fab = 'ACI',