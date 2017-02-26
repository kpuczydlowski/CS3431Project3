/*
	Kacper Puczydlowski
	Can Alper
	Project Team 27
	Create Table Calls
	*/

DROP TABLE Room CASCADE CONSTRAINTS;
DROP TABLE Employee CASCADE CONSTRAINTS;
DROP TABLE Equipment CASCADE CONSTRAINTS;
DROP TABLE EquiptmentType CASCADE CONSTRAINTS;
DROP TABLE RoomService CASCADE CONSTRAINTS;
DROP TABLE RoomAccess CASCADE CONSTRAINTS;
DROP TABLE Patient CASCADE CONSTRAINTS;
DROP TABLE Doctor CASCADE CONSTRAINTS;
DROP TABLE Admission CASCADE CONSTRAINTS;
DROP TABLE FutureVisit CASCADE CONSTRAINTS;
DROP TABLE Examine CASCADE CONSTRAINTS;
DROP TABLE StayIn CASCADE CONSTRAINTS;

CREATE TABLE Room
		(num INTEGER Primary Key,
		 occupied INTEGER
		);

CREATE TABLE Employee
		(ID INTEGER Primary Key,
		 FName Varchar(20),
		 LName Varchar(30) Not NULL,
		 Salary INTEGER,
		 OfficeNum INTEGER,
		 jobTitle Varchar(20),
		 empRank Varchar(20),
		 supervisorID INTEGER References Employee(ID)
		);

CREATE TABLE EquiptmentType
		(ID Varchar(20),
		 model Varchar(20) not NULL,
		 description Varchar(100),
		 instructions Varchar(100),
		 CONSTRAINT pk_et PRIMARY KEY (ID)
		 );

CREATE TABLE Equipment
		(serialNum Varchar(20),
		 TypeID Varchar(20) References EquiptmentType(ID),
		 purchaseYear INTEGER,
		 LastInspecton date,
		 roomNum INTEGER References Room(num),
		 CONSTRAINT pk_e PRIMARY KEY (serialNum)
		);


CREATE TABLE RoomService
		(roomNum INTEGER References Room(num),
		 service Varchar(20),
		 Constraint pk_rs PRIMARY KEY (roomNum, service)
		);

CREATE TABLE RoomAccess
		(roomNum INTEGER References Room(num),
		 EmpID INTEGER References Employee(ID),
		 Constraint pk_ra PRIMARY KEY (roomNum, EmpID)
		);

CREATE TABLE Patient
		(SSN CHAR(9) Primary Key,
		 FName Varchar(20),
		 LName Varchar(30) Not NULL,
		 Address Varchar(100),
		 TelNum CHAR(10)
		);

CREATE TABLE Doctor
		(ID INTEGER Primary Key,
    	 FirstName Varchar(20),
    	 LastName Varchar(20),
    	 gender CHAR(1),
    	 Speciality Varchar(20),
    	 CONSTRAINT genderValue check (gender in ('M','F'))
    	);

CREATE TABLE Admission
		(Num INTEGER Primary Key,
	     AdmissionDate date,
	     LeaveDate date,
	     TotalPayment INTEGER,
	     InsurancePayment INTEGER,
	     Patient_SSN CHAR(9) References Patient(SSN)
	    );

CREATE TABLE FutureVisit
		(visitNum INTEGER References Admission(Num),
		 visitDate date,
		 CONSTRAINT pk_fv PRIMARY KEY (visitNum)
		);

CREATE TABLE Examine
		(doctorID INTEGER References Doctor(ID),
		 AdmissionNum INTEGER References Admission(Num),
		 comments Varchar(100),
		 CONSTRAINT pk_ex PRIMARY KEY (doctorID, AdmissionNum)
		);

CREATE TABLE StayIn
		(AdmissionNum INTEGER References Admission(Num),
		 roomNum INTEGER References Room(num),
		 startDate date,
		 endDate date,
		 CONSTRAINT datescheck check (startDate <= endDate),
		 CONSTRAINT pk_si PRIMARY KEY (AdmissionNum, roomNum, startDate)
		);


