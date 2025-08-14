# crear base de datos empresapatito
create database empresapatito;
use empresapatito;


create table empleados(
idempleado int not null,
nombre varchar(100) not null,
puesto varchar(50),
fechaingreso date, 
salario decimal (10,2),
constraint pk_empleados
primary key (idempleado)

);


# agregar una columna en la tabal empleados
alter table empleados
add column correo varchar(100);

select * from empleados;

# modificar el tipk de datos 
alter table empleados
modify column salario decimal (12,2) not null;

# renombrar un campo
alter table empleados 
rename column correo to email; 


# crear tabla departamento
create table departamento(
iddepartamento int not null auto_increment primary key ,
nombredepto varchar(100)
);


# agregar un campo a la tabla empleado , para foreign key
alter table empleados
add column iddepartamento int not null;


# agregar clave foranea
alter table empleados
add constraint fk_empleados_departamento
foreign key (iddepartamento)
references departamento(iddepartamento);


# eliminar una primary key de empleados
alter table empleados
drop primary key ;

# eliminar a la foranea de la tabla empleados

alter table empleados
drop constraint fk_empleados_departamento;

#eliminar auto increment
alter table departamento 
modify column iddepartamento int not null;

# eliminar primary key de departamento
alter table departamento
drop primary key;


## crear un constraint de verificacion en salario
alter table empleados
add constraint chk_salario
check (salario>0.0);





create table categoria(
id int not null primary key default -1,
nombre varchar (20),
status char(1) default 'A'
);
go

INSERT INTO categoria
values (default,'Carnes','D');

select * from categoria;

INSERT INTO categoria
values (1,'Carnes',default);

drop table categoria;



--DROP
--eliminar la columna email en la table empleados

alter table empleados
drop column email;

--alter
alter table empleados
add constraint pk_empleados
primary key (idempleado);

alter table departamento
add constraint pk_departamento
primary key (iddepartamento);

alter table empleados
add constraint pk_departamento
foreign  key (iddepartamento)
references departamento(iddepartamento) ;


--eliminar tabla 
drop table empleados;
drop table departamento;

drop database empresapatito; 