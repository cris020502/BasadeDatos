CREATE DATABASE classroom;

USE classroom;

CREATE TABLE Instructor(
ssn int not null ,
iname nvarchar (50) not null,
lname nvarchar (50) not null,
CONSTRAINT PK_SSN
PRIMARY KEY (ssn)
);

CREATE TABLE class(
coursenum int not null,
courseyear date not null,
term varchar (50),
section varchar (50),
CONSTRAINT PK_COURSE
primary key (coursenum,
courseyear,
term,
section)
);


CREATE TABLE teaches(
ssn int,
coursenum int,
courseyear date,
term varchar(50),
section varchar(50),
 CONSTRAINT fk_Teaches_Instructor
    FOREIGN KEY (ssn)
    REFERENCES Instructor(ssn),
    
    CONSTRAINT fk_Teaches_Class
    FOREIGN KEY (courseNum, courseyear, term, section)
    REFERENCES class(courseNum, courseyear, term, section)
);