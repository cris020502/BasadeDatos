CREATE DATABASE ejercicio1999;
GO 
USE  ejercicio1999;

--se crea tabla empeado
CREaTE TABLE empleado(
empleadoid int not null identity(1,1),
nombre nvarchar(15) not null,
apellido1 nvarchar(15) not null,
apellido2 nvarchar(15) ,
direccion nvarchar(50) not null,
salario decimal(10,2) not null,
jef int,
departamento int not null,

CONSTRAINT pk_empleadoid
PRIMARY KEY (empleadoid),
CONSTRAINT CHK_salario
CHECK(salario BETWEEN 200 AND 50000),
CONSTRAINT FK_EMPLEADO_JEFE
FOREIGN KEY (jef)
REFERENCES empleado(empleadoid)
ON DELETE NO ACTION
ON UPDATE NO ACTION

);
GO

CREATE TABLE departamento(
departamentiid int not null identity(1,1),
nombredepto nvarchar(15) not null,
estatus char(2) not null,
administrador int not null,

CONSTRAINT PK_DEPTO
PRIMARY KEY (departamentiid),
CONSTRAINT UNIQUE_NOMBREDEPTO
UNIQUE (nombredepto),
CONSTRAINT CHK_ESTATUS
CHECK (estatus IN ('SI','NO')),
CONSTRAINT FK_EMPLEADO_DEPTO
FOREIGN KEY (administrador)
REFERENCES empleado(empleadoid),

);
GO

ALTER TABLE empleado
ADD CONSTRAINT FK_EMPLEADO_DEPTO1
FOREIGN KEY (departamento)
REFERENCES departamento(departamentiid);
go

CREATE TABLE ubicacion(
ubicacionid int not null identity(1,1),
ubicacion nvarchar(15),
deptoid int not null,
CONSTRAINT PK_UBICACION
PRIMARY KEY (ubicacionid),
CONSTRAINT UNIQUE_DEPTOID
UNIQUE (deptoid),
CONSTRAINT FK_UBICACION_DEPTO
FOREIGN KEY (deptoid)
REFERENCES departamento(departamentiid)

);