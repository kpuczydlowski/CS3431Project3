/*
	Kacper Puczydlowski
	Can Alper
	Project Team 27
	Test Case for create_triggers
*/

/*	1	*/

INSERT INTO Room (num, occupied)
VALUES (2002, 0);

INSERT INTO RoomService (roomNum, service)
VALUES (2002, 'Defibilator1');

INSERT INTO RoomService (roomNum, service)
VALUES (2002, 'Defibilator2');

INSERT INTO RoomService (roomNum, service)
VALUES (2002, 'Defibilator3');

INSERT INTO RoomService (roomNum, service)
VALUES (2002, 'Defibilator4');
/*	2	*/

INSERT INTO Patient (SSN, FName, LName, Address, TelNum)
VALUES ('777888992', 'Triggers', 'Alco', 'Turkey', '2889999898');

INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN)
VALUES (0, '01-JAN-2013', '02-JAN-2013', 3000, 4000, '777888992');

/*	3	*/

INSERT INTO  Employee (ID, FName, LName, Salary, OfficeNum, jobTitle, empRank, supervisorID)
VALUES (99, 'e103', 'e103', 100000, 2122, 'gen103', 'General', null);

INSERT INTO  Employee (ID, FName, LName, Salary, OfficeNum, jobTitle, empRank, supervisorID)
VALUES (98, 'e102', 'e102', 100000, 2122, 'div102', 'Division', 99);

INSERT INTO  Employee (ID, FName, LName, Salary, OfficeNum, jobTitle, empRank, supervisorID)
VALUES (100, 'e100', 'e100', 100000, 211, 'reg100', 'Regular', 98);

INSERT INTO  Employee (ID, FName, LName, Salary, OfficeNum, jobTitle, empRank, supervisorID)
VALUES (101, 'e101', 'e101', 100000, 212, 'reg101', 'Regular', 100);

INSERT INTO  Employee (ID, FName, LName, Salary, OfficeNum, jobTitle, empRank, supervisorID)
VALUES (102, 'e102', 'e102', 100000, 2122, 'div102', 'Division', 100);

INSERT INTO  Employee (ID, FName, LName, Salary, OfficeNum, jobTitle, empRank, supervisorID)
VALUES (103, 'e103', 'e103', 100000, 2122, 'gen103', 'General', 100);

/*	4	*/

INSERT INTO Patient (SSN, FName, LName, Address, TelNum)
VALUES ('777888999', 'Triggers', 'Alco', 'Turkey', '2889999898');

INSERT INTO Room (num, occupied)
VALUES (200, 0);

INSERT INTO RoomService (roomNum, service)
VALUES (200, 'ICU');

INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN)
VALUES (100, '05-JAN-2013', '06-JAN-2013', 3000, 4000, '777888999');

INSERT INTO StayIn (AdmissionNum, roomNum, startDate, endDate)
VALUES (100, 200, '21-JAN-2013', null);

/*	5	*/
INSERT INTO EquiptmentType (ID, model, description, instructions)
VALUES ('MRI', 'A MODEL 0', 'A DESCRIPTION 1', 'AN INSTUCTION 4');

INSERT INTO Equipment (serialNum, TypeID, purchaseYear, LastInspecton, roomNum)
VALUES ('A01-02E', 'MRI', 1792, '31-AUG-06', 2002);

/*	6	*/

INSERT INTO Doctor (ID, FirstName, LastName, gender, Speciality)
VALUES (11, 'D11', 'Karakaya', 'M', 'Heart Surgeon');

INSERT INTO Doctor (ID, FirstName, LastName, gender, Speciality)
VALUES (12, 'D12', 'Karakaya', 'F', 'Butcher');

INSERT INTO Patient (SSN, FName, LName, Address, TelNum)
VALUES ('777888991', 'Triggers6', 'Alco', 'Turkey', '2889999898');

INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN)
VALUES (11001, '05-JAN-2013', '06-FEB-2013', 3000, 4000, '777888991');

INSERT INTO Examine (doctorID, AdmissionNum, comments)
VALUES (11, 11001, 'c1');

INSERT INTO Examine (doctorID, AdmissionNum, comments)
VALUES (12, 11001, 'c1');

INSERT INTO Admission (Num, AdmissionDate, LeaveDate, TotalPayment, InsurancePayment, Patient_SSN)
VALUES (11002, '05-JAN-2013', '06-FEB-2013', 3000, 4000, '777888991');

DROP TRIGGER ThreeServices;
DROP TRIGGER CalculateInsPayment;
DROP TRIGGER Manages;
DROP TRIGGER MRIPurchaseYear;
DROP TRIGGER PrintDoctors;
DROP TRIGGER ICUinThreeMonths;


/*		*/
