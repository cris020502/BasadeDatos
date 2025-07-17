
CREATE DATABASE Airport;
USE Airport;


CREATE TABLE AIRPORT (
    Airport_code VARCHAR(3) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50),
    Name VARCHAR(100) NOT NULL,
    CONSTRAINT pk_airport
    PRIMARY KEY (Airport_code)
);


CREATE TABLE AIRPLANE_TYPE (
    Type_name VARCHAR(50) NOT NULL,
    Max_seats INT NOT NULL,
    Company VARCHAR(50),
    CONSTRAINT pk_airplane_type
    PRIMARY KEY (Type_name)
);


CREATE TABLE AIRPLANE (
    Airplane_id VARCHAR(20) NOT NULL,
    Total_no_of_seats INT NOT NULL,
    No_of_avail_seats INT NOT NULL,
    Type_name VARCHAR(50) NOT NULL,
    CONSTRAINT pk_airplane
    PRIMARY KEY (Airplane_id),
    CONSTRAINT fk_airplane_type
    FOREIGN KEY (Type_name)
    REFERENCES AIRPLANE_TYPE(Type_name)
);


CREATE TABLE AIRLINE (
    Name VARCHAR(50) NOT NULL,
    CONSTRAINT pk_airline
    PRIMARY KEY (Name)
);


CREATE TABLE FLIGHT (
    Number VARCHAR(10) NOT NULL,
    Airline_name VARCHAR(50) NOT NULL,
    CONSTRAINT pk_flight
    PRIMARY KEY (Number),
    CONSTRAINT fk_flight_airline
    FOREIGN KEY (Airline_name)
    REFERENCES AIRLINE(Name)
);


CREATE TABLE FLIGHT_LEG (
    Leg_no INT NOT NULL,
    Flight_number VARCHAR(10) NOT NULL,
    Departure_airport_code VARCHAR(3) NOT NULL,
    Arrival_airport_code VARCHAR(3) NOT NULL,
    Scheduled_dep_time TIME NOT NULL,
    Scheduled_arr_time TIME NOT NULL,
    CONSTRAINT pk_flight_leg
    PRIMARY KEY (Leg_no, Flight_number),
    CONSTRAINT fk_flight_leg_flight
    FOREIGN KEY (Flight_number)
    REFERENCES FLIGHT(Number),
    CONSTRAINT fk_flight_leg_departure
    FOREIGN KEY (Departure_airport_code)
    REFERENCES AIRPORT(Airport_code),
    CONSTRAINT fk_flight_leg_arrival
    FOREIGN KEY (Arrival_airport_code)
    REFERENCES AIRPORT(Airport_code)
);


CREATE TABLE LEG_INSTANCE (
    Date DATE NOT NULL,
    Leg_no INT NOT NULL,
    Flight_number VARCHAR(10) NOT NULL,
    Airplane_id VARCHAR(20) NOT NULL,
    Dep_time TIME,
    Arr_time TIME,
    CONSTRAINT pk_leg_instance
    PRIMARY KEY (Date, Leg_no, Flight_number),
    CONSTRAINT fk_leg_instance_flight_leg
    FOREIGN KEY (Leg_no, Flight_number)
    REFERENCES FLIGHT_LEG(Leg_no, Flight_number),
    CONSTRAINT fk_leg_instance_airplane
    FOREIGN KEY (Airplane_id)
    REFERENCES AIRPLANE(Airplane_id)
);


CREATE TABLE FARE (
    Code VARCHAR(10) NOT NULL,
    Flight_number VARCHAR(10) NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Restrictions VARCHAR(100),
    CONSTRAINT pk_fare
    PRIMARY KEY (Code, Flight_number),
    CONSTRAINT fk_fare_flight
    FOREIGN KEY (Flight_number)
    REFERENCES FLIGHT(Number)
);


CREATE TABLE CAN_LAND (
    Airport_code VARCHAR(3) NOT NULL,
    Type_name VARCHAR(50) NOT NULL,
    CONSTRAINT pk_can_land
    PRIMARY KEY (Airport_code, Type_name),
    CONSTRAINT fk_can_land_airport
    FOREIGN KEY (Airport_code)
    REFERENCES AIRPORT(Airport_code),
    CONSTRAINT fk_can_land_type
    FOREIGN KEY (Type_name)
    REFERENCES AIRPLANE_TYPE(Type_name)
);


CREATE TABLE SEAT (
    Seat_no VARCHAR(10) NOT NULL,
    Date DATE NOT NULL,
    Leg_no INT NOT NULL,
    Flight_number VARCHAR(10) NOT NULL,
    Customer_name VARCHAR(100),
    Phone VARCHAR(20),
    CONSTRAINT pk_seat
    PRIMARY KEY (Seat_no, Date, Leg_no, Flight_number),
    CONSTRAINT fk_seat_leg_instance
    FOREIGN KEY (Date, Leg_no, Flight_number)
    REFERENCES LEG_INSTANCE(Date, Leg_no, Flight_number)
);