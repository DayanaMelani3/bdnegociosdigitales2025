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


);
