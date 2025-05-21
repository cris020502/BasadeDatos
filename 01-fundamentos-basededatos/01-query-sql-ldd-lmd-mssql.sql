-- SQL-LDD
-- CREA UNA BASE DE DATOS
CREATE DATABASE bdpruebag2;
--cambiar base de datos
--CREA UNA TABLA 
CREATE TABLE categoria (
idcategoria int not null identity(1,1),
categorianombre nvarchar (20) not null,
CONSTRAINT pk_categoria
primary key (idcategoria)
);

create table producto (
idproducto int not null,
nombreproducto varchar(20),
descripcion varchar(100) null,
existencia int not null,
precio money not null,
idcategoria int not null,
constraint pk_producto
primary key(idproducto),
constraint fk_producto_categoria
foreign key(idcategoria)
references categoria(idcategoria)
);


--	sql lmd
insert into categoria (categorianombre)
values('vinos y licores');

insert into categoria (categorianombre)
values('carnes frias'),
('linea blanca'),
('lacteos');

update categoria 
set categorianombre  = 'carnes refrias'
where idcategoria = 2;
select * from categoria;

select categorianombre from categoria;


