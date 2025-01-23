# creacion de base de datos

#crea la base de datos tienda1
create database tienda1;

#utilizar una base de datos
use tienda1;

#sql--LLD
#crear la tabla categoria
create table categoria(
categoriaid int not null,
nombre varchar (20) not null,
constraint pk_categoria
primary key (categoriaid),
constraint unico_nombre
unique(nombre)
);

#SQL LMD
# Agregar registros a la tabla categoria

insert into categoria 
values(1, 'carnes fria');

insert into categoria (categoriaid, nombre)
values (2, 'Linea blanca');

insert into categoria (nombre, categoriaid)
values ('vinos y licores', 3);

insert into categoria
values(4, 'Ropa'),
(5, 'Dulces'),
(6, 'Lacteos');

insert into categoria(nombre, categoriaid)
values ('Panaderia', 7),
('Zapateria', 8),
('Jugueteria', 9);

insert into categoria
values(10, 'panaderia');

select * from categoria;

create table producto1(
productoid int not null,
nombreProducto varchar(20) not null,
descripcion varchar(80),
precio decimal(10,2) not null,
existencia int not null,
categoriaid int null,
constraint pk_producto1
primary key (productoid),
constraint unico_descripcion
unique(nombreProducto),
constraint chk_precio
check (precio>0.0 and precio<=1000),
constraint chk_existencia
check(existencia>0 and existencia<=200),
constraint fk_categoria_producto1
foreign key (categoriaid)
references categoria(categoriaid)
);


insert into producto1
values (1,'Miguelito','Dulce sano para la lombriz', 34.5, 45, 5);

insert into producto1
values (2,'tupsi pop','Dulce sano para la lombriz', -34.5, 45, 5);

insert into producto1
values 

);
