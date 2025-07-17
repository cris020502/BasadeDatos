CREATE DATABASE Cursos;
GO

USE Cursos;

CREATE TABLE Estudiante (
IdEstudiante int not null,
Nombre nvarchar(45) not null,
Ap_Paterno nvarchar(45) not null,
Ap_Materno nvarchar(45) not null,
Matricula int not null,

CONSTRAINT pk_IdEstudiante
PRIMARY KEY (IdEstudiante)
);
Go

CREATE TABLE Cursos (
IdCurso int not null,
Nombre nvarchar(45) not null,
Codigo int not null,

CONSTRAINT pk_Cursos
PRIMARY KEY (IdCurso)
);
Go

CREATE TABLE Inscripcion(
idIncripcion int not null,
IdEstudiante int not null,
IdCurso int not null,

CONSTRAINT pk_idIncripcion 
PRIMARY KEY (idIncripcion),

CONSTRAINT fk_Inscripcion_Estudiante 
FOREIGN KEY (IdEstudiante)
REFERENCES Estudiante(IdEstudiante),

CONSTRAINT fk_Inscripcion_Curso
FOREIGN KEY (IdCurso)
REFERENCES Cursos(IdCurso)
);