CREATE DATABASE EmployeeDB;
USE EmployeeDB;


CREATE TABLE Department (
    Department_id INT NOT NULL,
    num_dept INT NOT NULL,
    name_dept NVARCHAR(30) NOT NULL,
    gerent_FK INT,
    Start_date DATE,
    
    CONSTRAINT pk_Department 
    PRIMARY KEY (Department_id)
);


CREATE TABLE Employee (
    idEmployer INT NOT NULL,
    SSN NVARCHAR(20) NOT NULL,
    Firstname NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Salary DOUBLE NOT NULL,
    Address NVARCHAR(50) NOT NULL,
    Sex NVARCHAR(15) NOT NULL,
    Department_id INT NOT NULL,
    Gersnr_FK INT,
    
    CONSTRAINT pk_Employee 
    PRIMARY KEY (idEmployer),
    
    CONSTRAINT fk_Employee_Department
    FOREIGN KEY (Department_id)
    REFERENCES Department(Department_id)
);

CREATE TABLE Location (
    Location_id INT NOT NULL,
    location NVARCHAR(100) NOT NULL,
    department_id INT NOT NULL,
    
    CONSTRAINT pk_Location 
    PRIMARY KEY (Location_id),
    
    CONSTRAINT fk_Location_Department
    FOREIGN KEY (department_id)
    REFERENCES Department(Department_id)
);


CREATE TABLE Projects (
    Project_id INT NOT NULL,
    NumProject INT NOT NULL,
    NameProject NVARCHAR(100) NOT NULL,
    Location NVARCHAR(100) NOT NULL,
    Department_id INT NOT NULL,
    
    CONSTRAINT pk_Projects 
    PRIMARY KEY (Project_id),
    
    CONSTRAINT fk_Projects_Department
    FOREIGN KEY (Department_id)
    REFERENCES Department(Department_id)
);


CREATE TABLE Work_on (
    Employee_id INT NOT NULL,
    Project_id INT NOT NULL,
    hours INT NOT NULL,
    
    CONSTRAINT pk_Work_on 
    PRIMARY KEY (Employee_id, Project_id),
    
    CONSTRAINT fk_Work_on_Employee
    FOREIGN KEY (Employee_id)
    REFERENCES Employee(idEmployer),
    
    CONSTRAINT fk_Work_on_Projects
    FOREIGN KEY (Project_id)
    REFERENCES Projects(Project_id)
);


CREATE TABLE Dependents (
    Employee_id INT NOT NULL,
    Name NVARCHAR(100) NOT NULL,
    Sex NVARCHAR(15) NOT NULL,
    Birthday DATE NOT NULL,
    Relationship NVARCHAR(50) NOT NULL,
    
    CONSTRAINT pk_Dependents 
    PRIMARY KEY (Employee_id, Name),
    
    CONSTRAINT fk_Dependents_Employee
    FOREIGN KEY (Employee_id)
    REFERENCES Employee(idEmployer)
);