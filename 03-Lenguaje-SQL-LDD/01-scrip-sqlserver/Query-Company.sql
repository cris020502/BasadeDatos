CREATE DATABASE Company;
GO

USE Company;
GO

CREATE TABLE Department (
    DepartmentId int not null,
    NumDepto int not null,
    NameDepto nvarchar(25) not null,
    manager int not null,
    [start-date] date not null,

    CONSTRAINT pk_Department
    PRIMARY KEY (DepartmentId)
);

CREATE TABLE Employee (
    Employerid int not null,
    FirtsName nvarchar(25) not null,
    [name] nvarchar(25) not null,
    salary bit not null,
    birthday date not null,
    [address] nvarchar(25) not null,
    DepartmentId int not null,
    boss int not null,

    CONSTRAINT pk_Employee
    PRIMARY KEY (Employerid),

    CONSTRAINT fk_Employee_Department
    FOREIGN KEY (DepartmentId)
    REFERENCES Department(DepartmentId),

    CONSTRAINT fk_Employee_Boss
    FOREIGN KEY (boss)
    REFERENCES Employee(Employerid)
);

CREATE TABLE Locations (
    locationsId int not null,
    [location] nvarchar(25) not null,
    departmentId int not null,

    CONSTRAINT pk_Locations
    PRIMARY KEY (locationsId),

    CONSTRAINT fk_Locations_Department
    FOREIGN KEY (departmentId)
    REFERENCES Department(DepartmentId)
);

CREATE TABLE Dependent (
    Employerid int not null,
    [name] nvarchar(25) not null,
    sex nvarchar(25) not null,
    birthdate date not null,
    relationship nvarchar(25) not null,

    CONSTRAINT pk_Dependent
    PRIMARY KEY (Employerid, name),

    CONSTRAINT fk_Dependent_Employee
    FOREIGN KEY (Employerid)
    REFERENCES Employee(Employerid)
);

CREATE TABLE Project (
    ProyectId int not null,
    NumberProject int not null,
    nameProject nvarchar(25) not null,
    locationId int not null,
    DepartmentId int not null,

    CONSTRAINT pk_Project
    PRIMARY KEY (ProyectId),

    CONSTRAINT fk_Project_Locations
    FOREIGN KEY (locationId)
    REFERENCES Locations(locationsId),

    CONSTRAINT fk_Project_Department
    FOREIGN KEY (DepartmentId)
    REFERENCES Department(DepartmentId)
);

CREATE TABLE workson (
    Employerid int not null,
    ProyectId int not null,
    [hours] int not null,

    CONSTRAINT pk_workson
    PRIMARY KEY (Employerid, ProyectId),

    CONSTRAINT fk_workson_Employee
    FOREIGN KEY (Employerid)
    REFERENCES Employee(Employerid),

    CONSTRAINT fk_workson_Project
    FOREIGN KEY (ProyectId)
    REFERENCES Project(ProyectId)
);