CREATE DATABASE Biblioteca;


USE Biblioteca;


CREATE TABLE Libros (
IdLibro int not null,
NumISBO int not null,
Autor nvarchar(45) not null,
Titulo nvarchar(45) not null,
Cantidad nvarchar(45) not null,

CONSTRAINT pk_Libros 
PRIMARY KEY (IdLibro)
);

CREATE TABLE Lectores(
IdLector int not null ,
Nombre nvarchar(45) not null,
Ap_Paterno nvarchar(45) not null,
Ap_MAterno nvarchar(45) not null,
NumMenbresia int not null,

CONSTRAINT pk_IdLector
PRIMARY KEY (IdLector)
);

CREATE TABLE Prestamo(
IdPrestamo int not null,
IdLibro int not null,
IdLector int not null,

CONSTRAINT pk_IdPrestamo
PRIMARY KEY (IdPrestamo),

CONSTRAINT fk_Prestamo_Libros
FOREIGN KEY (IdLibro)
REFERENCES Libros(IdLibro),

CONSTRAINT fk_Prestamo_Lectores
FOREIGN KEY (IdLector)
REFERENCES Lectores(IdLector)
);

