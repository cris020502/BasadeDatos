Lenguaje SQL-LDD

-- crear la base de datos empresa(0bjeto)
CREATE DATABASE empresa2;
GO

--cambiar a la base de datos
USE empresa2;
GO

--crear tabla empleado
CREATE TABLE Empleados(
 IdEmpleado int not null,
 Nombre varchar(100) not null,
 Puesto varchar(50) not null,
 FechaIngreso date,
 Salario money not null,
 CONSTRAINT pk_empleados
 PRIMARY KEY (IdEmpleado)
);
 GO


 CREATE TABLE Productos(
  ProductoId int primary key,
  NombreProducto nvarchar(50) not null,
  Existencia int not null,
  PrecioUnitario money not null
 );
 GO

 CREATE TABLE Productos2(
  ProductoId int not null identity(1,1),
  NombreProducto nvarchar(50) not null,
  Existencia int not null,
  Precio money not null,
  CONSTRAINT pk_Productos2 PRIMARY KEY(ProductoId),
  CONSTRAINT unique_nombreProducto UNIQUE(NombreProducto),
  CONSTRAINT chk_existencia CHECK (Existencia >0 AND Existencia<=1000),
  CONSTRAINT chk_Precio CHECK(Precio >0.0)
 );
 GO

 -- insertar en productos sin identity
 INSERT INTO Productos(ProductoId, NombreProducto, Existencia, PrecioUnitario)
 VALUES (1, 'Burritos de frijoles', 65, 20.99);
 GO
 
 SELECT * FROM Productos
 GO

 INSERT INTO Productos(ProductoId, NombreProducto, Existencia, PrecioUnitario)
 VALUES (2, 'Burritos de frijoles', 65, 20.99);
 GO
 
 SELECT * FROM Productos
 GO

 -- Insertar en tabla productos 2 CON IDENTITY

 INSERT INTO Productos2(NombreProducto, Existencia, Precio)
 VALUES ('Burritos de Chorizo Verde', 100, 21.0);
 GO
 
 SELECT * FROM Productos2
 GO

  INSERT INTO Productos2(NombreProducto, Existencia, Precio)
 VALUES ('Burritos de Chorizo Grueso', 300, 200);
 GO
 
 SELECT * FROM Productos2
 GO
  INSERT INTO Productos2(NombreProducto, Existencia, Precio)
 VALUES ('Burritos de Chorizo Grueso2', 300, 200);
 GO
 
 SELECT * FROM Productos2
 GO

 INSERT INTO Productos2(NombreProducto, Existencia, Precio)
 VALUES ('Burritos de Frijol', 300, 1200);
 GO
 
 SELECT * FROM Productos2
 GO

 --crear  dos tablas con razon de cardinalidad de 1:n, con participacion total, esto quiere decir que la foreing key es not null
 create table categoria (
 idcategoria int not null identity(1,1),
 nombrecategoria nvarchar(25) not null,
 constraint pk_categoria
 primary key (idcategoria),
 constraint unique_nombrecategoria
 unique (nombrecategoria),

 );
 go

 --tabla producto3

 create table producto3(
 productoid int not null identity(1,1),
 nombreproducto nvarchar(25) not null,
 existencia int not null,
 preciounitario money not null,
 categoriaid int not null,
 constraint pk_Productoid
 primary key (productoid),

 constraint chk_existencia3
check (existencia>0 and existencia<1000),
constraint chk_preciounitario3
check(preciounitario>0.0),
constraint unique_nombreproducto3
unique (nombreproducto),
constraint fk_producto3_categoria
foreign key (categoriaid) 
references categoria(idcategoria)
 ); 

  --crear  dos tablas con razon de cardinalidad de 1:n, con participacion total, esto quiere decir que la foreing key es not null
 create table categoria2(
 id int not null identity(1,1),
 nombrecategoria nvarchar(25) not null,
 constraint pk_categoria2
 primary key (id),
 constraint unique_nombrecategoria2
 unique (nombrecategoria),

 );
 go

 --tabla producto3

 create table producto4(
 productoid int not null identity(1,1),
 nombreproducto nvarchar(25) not null,
 existencia int not null,
 preciounitario money not null,
 categoriaid int not null,
 constraint pk_Productoid4
 primary key (productoid),

 constraint chk_existencia4
check (existencia>0 and existencia<1000),
constraint chk_preciounitario4
check(preciounitario>0.0),
constraint unique_nombreproducto4
unique (nombreproducto),
constraint fk_producto4_categoria
foreign key (categoriaid) 
references categoria2(id)
 ); 

 --crear tabla1
 create table tabla1 (
 tabla1id int not null ,
 tabla1id2 int not null,
 nombret1 nvarchar(20) not null,
 constraint pk_tabla1id
 primary key (tabla1id,tabla1id2)


 );


 --tabla 2
 create table tabla2(
 tabla2id int not null,
 nombret2 nvarchar(25),
 tabla1id int,
 tabla1id2 int,
 constraint pk_tablaid2
 primary key (tabla2id),
 constraint fk_tabla2_tabla1
 foreign key(tabla1id,tabla1id2)
 references tabla1(tabla1id,tabla1id2)
 ); 

 --tabalas con cardinalidad 1:1

 create table employee(
 id int not null identity(1,1),
 nombre nvarchar(25),
  ap1 nvarchar(25),
  ap2 nvarchar(25),
  sexo nvarchar(25),
  salario money not null,
  constraint pk_employee
  primary key  (id)
 );

 create table department(
 id int not null identity (1,1),
 nombre nvarchar(20), 
 ubicacion nvarchar(20),
 employeeid int,
  
 constraint pk_department
 primary key (id),
 constraint fk_department_employee
 foreign key (employeeid)

 references employee(id),
 constraint unique_employeeid
unique(employeeid) 

 );