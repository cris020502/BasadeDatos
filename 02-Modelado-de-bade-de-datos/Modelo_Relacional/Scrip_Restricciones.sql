--crear base de datos 
CREATE DATABASE restricciones;  

--utilizar la base de datos
USE restricciones;

--crear tabla de categoria
CREATE TABLE categoria(
categoriaid int,
nombre nvarchar(30)
);

insert into categoria
values(1,'carnes frias');

insert into categoria
values(1,'carnes frias');

insert into categoria
values(null,'Ropa');

SELECT * FROM categoria;
DROP TABLE categoria;


CREATE TABLE categoria(
categoriaid int  not null,
nombre nvarchar(30),
constraint pk_categoria
primary key (categoriaid)
);

insert into categoria
values(1,'carnes frias');

insert into categoria
values(2,'vinos y licores');

insert into categoria
values(3,'Ropa');

insert into categoria
values(4,'Ropa');

SELECT * FROM categoria;

drop table categoria;

CREATE TABLE categoria(
categoriaid int  not null,
nombre nvarchar(30) not null,
constraint pk_categoria
primary key (categoriaid),
constraint unique_nombre
unique(nombre)
);

insert into categoria
values(1,'carnes frias');

insert into categoria
values(2,'vinos y licores');

drop table categoria;
drop table producto;

--4 tabla

CREATE TABLE categoria(
categoriaid int  not null,
nombre nvarchar(30) not null,
constraint pk_categoria
primary key (categoriaid),
constraint unique_nombre
unique(nombre)

);

--tabla productos

create table producto(
productoid int not null,
nombrepro nvarchar(20),
precio money not null,
existencia numeric(10,2) not null,
categoria int,
constraint pk_producto
primary key(productoid),
constraint unique_nombrepro
unique (nombrepro),
constraint chk_precio
check (precio>0 and precio<=4000),
constraint chk_existencia
check(existencia >=0),
constraint fk_producto_categoria
foreign key (categoria)
references categoria(categoriaid)
 
);

insert into categoria
values(1,'carnes frias');

insert into categoria
values(2,'vinos y licores');
insert into categoria
values(8,'ropachina');

insert into producto
values(1,'tonayan',4000,4,2);

insert into producto
values(2,'tonayan2',1250.6,4,2);
insert into producto
values(3,'bucañas',200,8,2);

insert into producto
values(4,'calzonchino',6.3,890,8);

select * from producto;
select * from categoria;

select * 
from producto as p
inner join categoria as c
on c.categoriaid=p.categoria;