--Crear un store procedure que permita insertar un cliente
--

create or alter procedure spu_agregar_cliente
@id nchar(5),
@nombre nvarchar(40),
@city nvarchar(15) = 'San Miguel'
as
begin
if exists (select 1 from customers where CustomerID = @id)
begin
print('El cliente ya existe')
return 1
end

insert into Customers(customerid, companyname)
values (@id, @nombre);
print('El cliente insertado exitosamnete');
return 0;


end;
go

exec spu_agregar_cliente 'AIFKI', 'Patito de hule'
exec spu_agregar_cliente 'AIFKI', 'Patito de hule'
go

create or alter procedure spu_agregar_cliente_try_catch
@id nchar(5),
@nombre nvarchar(40),
@city nvarchar(15) = 'San Miguel'
as
begin
begin try
insert into Customers(customerid, companyname)
values (@id, @nombre);
print('El cliente insertado exitosamnete');
end try
begin catch
print('El cliente ya existe');
end catch
end;

exec spu_agregar_cliente 'AIFKI', 'Muñeca vieja'

---manejo de ciclos en store procedures

--imprimir el numero de veces que indique el usario

create or alter procedure spu_imprimir
@numero int
as
begin

if @numero<=0
begin
print ('El numero no puede se 0 o negativo')
return
end

  declare @i int
  SET @i = 1
  while (@i<=@numero)
  begin
  print concat('Numero'+ @i)
  set @i = @i + 1
  end

end;
GO

exec spu_imprimir 0
