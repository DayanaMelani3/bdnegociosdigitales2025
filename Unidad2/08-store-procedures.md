**crear un store procedure para seleccionar todos los clientes**
-  Es un conjunto de instrucciones, utiles para reutilizar el codigo


![Consultas](./img/1.jpg)


         reate or alter procedure spu_mostrar_clientes
           as
           begin
           select * from customers;
           end;
            GO

- Ejecutar un store en transact
exec spu_mostrar_clientes;

- Crear un sp que muestre los clientes por pa�s
- parametros de entrada

         create or alter proc spu_customersporpais
         @pais nvarchar(15)
          as
          begin
          select * from Customers
           where Country = @pais;
           end;
           FIN

 declare @p1 nvarchar(15 )= 'Spain';
 declare @p1 nvarchar(15 )= 'Germany';
 exec spu_Customers_pais @p1, @p2;
 go




- Generar un reporte que permita visualizar los datos de compra de un
- determinado cloiente, en rango de fechas, mostrando
- elmonto total de compras por producto, mediante un sp



- Storre procedure con parametros de salida

        create or alter proc spu_obtener_numero_clientes
         @calif decimal(10,2)
         @customerid nchar(5),---- parametro de entrada
         @totalCustomers int output --parametro de salida 
          AS
          begin
            select  @totalCustomers= count (*) from Customers;
	          where CustomerID = @customerid;
	          end;
	           GO

             declare  @numero int;
                 exec spu_obtener_numero_clientes  @customerid = 'ANATR',
                                  @totalCustomers = @numero output;
                  print @numero;
                     go 


               create or alter proc spu_obtener_numero_clientes
             @calif decimal(10,2)
             as
               begin
              if @calif>=0 and @calif<=10
               begin
             if @calif>=8
             print'La calificaci�n es aprobatoria'
             else
            print'La calificaci�n es reprobatoria'
             end
            else
            print 'Calificacion no valida'
            end;
            go
- crear un sp que permita verificar si un clienet existe antes de devolver su inf

            create or alter proc  spu_obtener_cliente_siexiste
            @numeroCliente nchar(5)
            as
            begin
             if exists (select 1 from Customers where CustomerID =  @numeroCliente)
              select * from Customers where CustomerID =  @numeroCliente;
              else
            print 'El cliente no existe'
             end;
              go 

   select * from Customers
   select 1 from Customers where CustomerID = 'AROUT'

   exec spu_obtener_cliente_siexiste  @numeroCliente =  'AROUT'

   - Crear un sp que permita insertar un cliente,
   - pero se debe verificar primero que no exista

