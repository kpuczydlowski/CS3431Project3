/*
	Kacper Puczydlowski
	Can Alper
	Project Team 27
	Create Table Calls
	*/
	
INSERT INTO Patient (SSN, FName, LName, Address, TelNum)
VALUES ('000000001', 'P1', 'Alco', 'Turkey', '8889999898');

INSERT INTO Patient (SSN, FName, LName, Address, TelNum)
VALUES ('000000002', 'P2', 'Alco', 'Turkey', '8889999891');

INSERT INTO Patient (SSN, FName, LName, Address, TelNum)
VALUES ('000000003', 'P3', 'Alco', 'Turkey', '8889999892');

INSERT INTO Patient (SSN, FName, LName, Address, TelNum)
VALUES ('000000004', 'P4', 'Alco', 'Turkey', '8889999893');

INSERT INTO Patient (SSN, FName, LName, Address, TelNum)
VALUES ('000000005', 'P5', 'Alco', 'Turkey', '8889999894');

INSERT INTO Patient (SSN, FName, LName, Address, TelNum)
VALUES ('000000006', 'P6', 'Alco', 'Turkey', '8889999858');

INSERT INTO Patient (SSN, FName, LName, Address, TelNum)
VALUES ('000000007', 'P7', 'Alco', 'Turkey', '8889699898');

INSERT INTO Patient (SSN, FName, LName, Address, TelNum)
VALUES ('000000008', 'P8', 'Alco', 'Turkey', '8879999898');

INSERT INTO Patient (SSN, FName, LName, Address, TelNum)
VALUES ('000000009', 'P9', 'Alco', 'Turkey', '7889999898');

INSERT INTO Patient (SSN, FName, LName, Address, TelNum)
VALUES ('111223333', 'P10', 'Alco', 'Turkey', '2889999898');

INSERT INTO Doctor (ID, FirstName, LastName, gender, Speciality)
VALUES (1, 'D1', 'Karakaya', 'M', 'Heart Surgeon');

INSERT INTO Doctor (ID, FirstName, LastName, gender, Speciality)
VALUES (2, 'D2', 'Karakaya', 'M', 'Heart Surgeon');

INSERT INTO Doctor (ID, FirstName, LastName, gender, Speciality)
VALUES (3, 'D3', 'Karakaya', 'F', 'Heart Surgeon');

INSERT INTO Doctor (ID, FirstName, LastName, gender, Speciality)
VALUES (4, 'D4', 'Karakaya', 'F', 'Heart Surgeon');

INSERT INTO Doctor (ID, FirstName, LastName, gender, Speciality)
VALUES (5, 'D5', 'Karakaya', 'M', 'Heart Surgeon');

INSERT INTO Doctor (ID, FirstName, LastName, gender, Speciality)
VALUES (6, 'D6', 'Karakaya', 'M', 'Heart Surgeon');

INSERT INTO Doctor (ID, FirstName, LastName, gender, Speciality)
VALUES (7, 'D7', 'Karakaya', 'M', 'Heart Surgeon');

INSERT INTO Doctor (ID, FirstName, LastName, gender, Speciality)
VALUES (8, 'D8', 'Karakaya', 'M', 'Heart Surgeon');

INSERT INTO Doctor (ID, FirstName, LastName, gender, Speciality)
VALUES (9, 'D9', 'Karakaya', 'M', 'Heart Surgeon');

INSERT INTO Doctor (ID, FirstName, LastName, gender, Speciality)
VALUES (10, 'D10', 'Karakaya', 'M', 'Heart Surgeon');

INSERT INTO Room (num, occupied)
VALUES (1, 1);

INSERT INTO Room (num, occupied)
VALUES (2, 0);

INSERT INTO Room (num, occupied)
VALUES (3, 1);

INSERT INTO Room (num, occupied)
VALUES (4, 0);

INSERT INTO Room (num, occupied)
VALUES (5, 0);

INSERT INTO Room (num, occupied)
VALUES (6, 1);

INSERT INTO Room (num, occupied)
VALUES (7, 0);

INSERT INTO Room (num, occupied)
VALUES (8, 1);

INSERT INTO Room (num, occupied)
VALUES (9, 1);

INSERT INTO Room (num, occupied)
VALUES (10, 1);

INSERT INTO Room (num, occupied)
VALUES (11, 0);

INSERT INTO Room (num, occupied)
VALUES (12, 0);

INSERT INTO RoomService (roomNum, service)
VALUES (1, 'Defibilator');

INSERT INTO RoomService (roomNum, service)
VALUES (2, 'EKG');

INSERT INTO RoomService (roomNum, service)
VALUES (3, 'Heart Monitor');

INSERT INTO RoomService (roomNum, service)
VALUES (4, 'Kolonoscope');

INSERT INTO RoomService (roomNum, service)
VALUES (5, 'Sink');

INSERT INTO RoomService (roomNum, service)
VALUES (6, 'Medicine Cabinet');

INSERT INTO RoomService (roomNum, service)
VALUES (7, 'Pressurized Room');

INSERT INTO RoomService (roomNum, service)
VALUES (8, 'Medicine Cabinet');

INSERT INTO RoomService (roomNum, service)
VALUES (9, 'Defibilator');

INSERT INTO RoomService (roomNum, service)
VALUES (10, 'Defibilator');

INSERT INTO RoomService (roomNum, service)
VALUES (11, 'ICU');

INSERT INTO RoomService (roomNum, service)
VALUES (12, 'ICU');

INSERT INTO Equipment (serialNum, TypeID, purchaseYear, LastInspecton, roomNum)
VALUES ('A01-02X', 0, 2012, '31-AUG-06', 1);

INSERT INTO Equipment (serialNum, TypeID, purchaseYear, LastInspecton, roomNum)
VALUES ('A01-02E', 0, 2011, '31-AUG-06', 1);

INSERT INTO Equipment (serialNum, TypeID, purchaseYear, LastInspecton, roomNum)
VALUES ('A01-02B', 0, 2009, '13-JUN-06', 1);

INSERT INTO Equipment (serialNum, TypeID, purchaseYear, LastInspecton, roomNum)
VALUES ('B01-02X', 1, 2013, '09-AUG-03', 3);

INSERT INTO Equipment (serialNum, TypeID, purchaseYear, LastInspecton, roomNum)
VALUES ('B01-02C', 1, 2000, '31-AUG-06', 4);

INSERT INTO Equipment (serialNum, TypeID, purchaseYear, LastInspecton, roomNum)
VALUES ('B01-02D', 1, 1999, '31-AUG-06', 5);

INSERT INTO Equipment (serialNum, TypeID, purchaseYear, LastInspecton, roomNum)
VALUES ('C01-02X', 2, 2003, '03-AUG-06', 2);

INSERT INTO Equipment (serialNum, TypeID, purchaseYear, LastInspecton, roomNum)
VALUES ('D01-02X', 2, 2011, '31-AUG-06', 7);

INSERT INTO Equipment (serialNum, TypeID, purchaseYear, LastInspecton, roomNum)
VALUES ('G01-02X', 2, 2010, '31-AUG-06', 3);

INSERT INTO EquiptmentType (ID, model, description, instructions)
VALUES (0, 'A MODEL 0', 'A DESCRIPTION 1', 'AN INSTUCTION 4');

INSERT INTO EquiptmentType (ID, model, description, instructions)
VALUES (1, 'A MODEL 1', 'A DESCRIPTION 2', 'AN INSTUCTION 5');

INSERT INTO EquiptmentType (ID, model, description, instructions)
VALUES (2, 'A MODEL 2', 'A DESCRIPTION 3', 'AN INSTUCTION 6');

INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN)
VALUES (0, '01-JAN-2013', '02-JAN-2013', 3000, 4000, '000000001');

INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN)
VALUES (1, '02-JAN-2013', '04-JAN-2013', 3000, 4000, '000000001');

INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN)
VALUES (2, '03-JAN-2013', '04-JAN-2013', 3000, 4000, '000000002');

INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN)
VALUES (3, '04-JAN-2013', '05-JAN-2013', 3000, 4000, '000000002');

INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN)
VALUES (4, '05-JAN-2013', '07-JAN-2013', 3000, 4000, '000000002');

INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN)
VALUES (5, '05-JAN-2013', '03-JAN-2013', 3000, 4000, '000000002');

INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN)
VALUES (6, '06-JAN-2013', '07-JAN-2013', 3000, 4000, '000000002');

INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN)
VALUES (7, '08-JAN-2013', '09-JAN-2013', 3000, 4000, '000000004');

INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN)
VALUES (8, '07-JAN-2013', '11-JAN-2013', 3000, 4000, '000000005');

INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN)
VALUES (9, '07-JAN-2013', '21-JAN-2013', 3000, 4000, '000000005');

INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN)
VALUES (10, '07-JAN-2013', '17-JAN-2013', 3000, 4000, '000000006');

INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN)
VALUES (11, '19-JAN-2013', '20-JAN-2013', 3000, 4000, '000000004');

INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN)
VALUES (12, '07-JAN-2013', '09-JAN-2013', 3000, 4000, '000000007');

INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN)
VALUES (13, '01-JAN-2013', '02-JAN-2013', 3000, 4000, '111223333');

INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN)
VALUES (14, '01-JAN-2013', '03-JAN-2013', 3000, 4000, '111223333');

INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN)
VALUES (15, '05-JAN-2013', '06-JAN-2013', 3000, 4000, '111223333');

INSERT INTO FutureVisit (visitNum, visitDate)
VALUES (15, '09-AUG-2014');

INSERT INTO Examine (doctorID, AdmissionNum, comments)
VALUES (1, 1, 'c1');

INSERT INTO Examine (doctorID, AdmissionNum, comments)
VALUES (3, 2, 'c2');

INSERT INTO Examine (doctorID, AdmissionNum, comments)
VALUES (4, 3, 'c3');

INSERT INTO Examine (doctorID, AdmissionNum, comments)
VALUES (2, 4, 'c4');

INSERT INTO Examine (doctorID, AdmissionNum, comments)
VALUES (1, 5, 'c5');

INSERT INTO Examine (doctorID, AdmissionNum, comments)
VALUES (6, 6, 'c6');

INSERT INTO Examine (doctorID, AdmissionNum, comments)
VALUES (7, 7, 'c7');

INSERT INTO Examine (doctorID, AdmissionNum, comments)
VALUES (1, 8, 'c8');

INSERT INTO Examine (doctorID, AdmissionNum, comments)
VALUES (1, 9, 'c9');

INSERT INTO Examine (doctorID, AdmissionNum, comments)
VALUES (2, 10, 'c10');

INSERT INTO Examine (doctorID, AdmissionNum, comments)
VALUES (2, 11, 'c1');

INSERT INTO Examine (doctorID, AdmissionNum, comments)
VALUES (3, 12, 'c1');

INSERT INTO Examine (doctorID, AdmissionNum, comments)
VALUES (8, 13, 'c1');

INSERT INTO Examine (doctorID, AdmissionNum, comments)
VALUES (8, 14, 'c1');

INSERT INTO Examine (doctorID, AdmissionNum, comments)
VALUES (8, 15, 'c1');

INSERT INTO StayIn (AdmissionNum, roomNum, startDate, endDate)
VALUES (1, 2, '21-JAN-2013', '23-JAN-2013');

INSERT INTO StayIn (AdmissionNum, roomNum, startDate, endDate)
VALUES (2, 11, '21-JAN-2013', '23-JAN-2013');

INSERT INTO StayIn (AdmissionNum, roomNum, startDate, endDate)
VALUES (3, 11, '21-JAN-2013', '23-JAN-2013');

INSERT INTO StayIn (AdmissionNum, roomNum, startDate, endDate)
VALUES (4, 11, '21-JAN-2013', '23-JAN-2013');

INSERT INTO StayIn (AdmissionNum, roomNum, startDate, endDate)
VALUES (5, 11, '21-JAN-2013', '23-JAN-2013');

INSERT INTO StayIn (AdmissionNum, roomNum, startDate, endDate)
VALUES (6, 11, '21-JAN-2013', '23-JAN-2013');

INSERT INTO  Employee (ID, FName, LName, Salary, OfficeNum, jobTitle, empRank, supervisorID)
VALUES (14, 'e4', 'e44', 100000, 211, 'gen0', 'General', NULL);

INSERT INTO  Employee (ID, FName, LName, Salary, OfficeNum, jobTitle, empRank, supervisorID)
VALUES (15, 'e5', 'e55', 100000, 241, 'gen1', 'General', NULL);

INSERT INTO  Employee (ID, FName, LName, Salary, OfficeNum, jobTitle, empRank, supervisorID)
VALUES (10, 'e0', 'e00', 10000, 421, 'division0', 'Division', 14);

INSERT INTO  Employee (ID, FName, LName, Salary, OfficeNum, jobTitle, empRank, supervisorID)
VALUES (11, 'e1', 'e11', 10000, 321, 'division1', 'Division', 14);

INSERT INTO  Employee (ID, FName, LName, Salary, OfficeNum, jobTitle, empRank, supervisorID)
VALUES (12, 'e2', 'e22', 10000, 211, 'division2', 'Division', 15);

INSERT INTO  Employee (ID, FName, LName, Salary, OfficeNum, jobTitle, empRank, supervisorID)
VALUES (13, 'e3', 'e23', 10000, 221, 'division3', 'Division', 15);

INSERT INTO Employee (ID, FName, LName, Salary, OfficeNum, jobTitle, empRank, supervisorID)
VALUES (0, 'E1', 'L1', 3000, 1, 'Employee', 'Regular', 10);

INSERT INTO Employee (ID, FName, LName, Salary, OfficeNum, jobTitle, empRank, supervisorID)
VALUES (1, 'E2', 'L1', 3000, 1, 'Employee', 'Regular', 10);

INSERT INTO Employee (ID, FName, LName, Salary, OfficeNum, jobTitle, empRank, supervisorID)
VALUES (2, 'E3', 'L1', 3000, 1, 'Employee', 'Regular', 10);

INSERT INTO Employee (ID, FName, LName, Salary, OfficeNum, jobTitle, empRank, supervisorID)
VALUES (3, 'E4', 'L1', 3000, 1, 'Employee', 'Regular', 10);

INSERT INTO Employee (ID, FName, LName, Salary, OfficeNum, jobTitle, empRank, supervisorID)
VALUES (4, 'E5', 'L1', 3000, 1, 'Employee', 'Regular', 10);

INSERT INTO Employee (ID, FName, LName, Salary, OfficeNum, jobTitle, empRank, supervisorID)
VALUES (5, 'E6', 'L1', 3000, 1, 'Employee', 'Regular', 10);

INSERT INTO Employee (ID, FName, LName, Salary, OfficeNum, jobTitle, empRank, supervisorID)
VALUES (6, 'E7', 'L1', 3000, 1, 'Employee', 'Regular', 10);

INSERT INTO Employee (ID, FName, LName, Salary, OfficeNum, jobTitle, empRank, supervisorID)
VALUES (7, 'E8', 'L1', 3000, 1, 'Employee', 'Regular', 10);

INSERT INTO Employee (ID, FName, LName, Salary, OfficeNum, jobTitle, empRank, supervisorID)
VALUES (8, 'E9', 'L1', 3000, 1, 'Employee', 'Regular', 10);

INSERT INTO Employee (ID, FName, LName, Salary, OfficeNum, jobTitle, empRank, supervisorID)
VALUES (9, 'E10', 'L1', 3000, 1, 'Employee', 'Regular', 10);


/*	Test Case for create_views	*/
INSERT INTO Patient (SSN, FName, LName, Address, TelNum)
VALUES ('100000001', 'P1', 'Alco', 'Turkey', '8889999898');

INSERT INTO Patient (SSN, FName, LName, Address, TelNum)
VALUES ('100000002', 'P2', 'Alco', 'Turkey', '8889999899');