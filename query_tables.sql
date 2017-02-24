/*
	Kacper Puczydlowski
	Can Alper
	Project Team 27
	Create Table Calls
	*/

/* Q1: Report the hospital rooms (the room number) that are currently occupied. */
Select num
From Room
Where occupied = 1;

/* Q2: For a given division manager (say, ID = 10), report all regular employees that are
supervised by this manager. Display the employees ID, names, and salary.*/
Select E.ID, E.FName, E.LName, E.Salary
From Employee E, (Select ID
				  from Employee
				  Where empRank = 'Division'
				  And ID = 10) D
Where E.empRank = 'Regular'
AND E.supervisorID = D.ID;


/* Q3: For each patient, report the sum of amounts paid by the insurance company for
that patient, i.e., report the patients SSN, and the sum of insurance payments over all
visits. */
Select Patient_SSN, sum(InsurancePayment) as TotalInsurance
From Admission
Group By Patient_SSN;


/* Q4: Report the number of visits done for each patient, i.e., for each patient, report the
patient SSN, first and last names, and the count of visits done by this patient. */
Select P.SSN, P.FName, P.LName, num_visit.cnt as NumberVisits
From Patient P,
	 (Select Patient_SSN, count(*) as cnt
	  from Admission
	  Group By Patient_SSN)  num_visit
where P.SSN = num_visit.Patient_SSN;


/* Q5: Report the room number that has an equipment unit with serial number ‘A01-02X’. */
Select roomNum
From Equipment
Where serialNum = 'A01-02X';

/*Q6: Report the employee who has access to the largest number of rooms. We need the employee ID, and the number of rooms (s)he can access. */
Select E.ID, room_count.cnt as maxRooms
From Employee E,
	 (Select EmpID as ID, count(*) as cnt
	  from RoomAccess
	  Group By EmpID) room_count
Where E.ID = room_count.ID
Group by E.ID, room_count.cnt
Having room_count.cnt = max(room_count.cnt);

/* Q7: Report the number of regular employees, division managers, and general
managers in the hospital. */
Select empRank as Type, count(*) as Count
From Employee
Group By empRank;

/* Q8: For patients who have a scheduled future visit (which is part of their most recent
visit), report that patient (SSN, and first and last names) and the visit date. */
Select P.SSN, P.FName, P.LName, FV.visitDate
From Patient P, Admission A, FutureVisit FV
Where P.SSN = A.Patient_SSN
AND FV.visitNum = A.Num;

/* Q9: For each equipment type that has more than 3 units, report the equipment type ID,
model, and the number of units this type has. */
Select ET.ID as TypeID, ET.model as model, num_each_type.cnt as count
From EquiptmentType ET,
	 (Select TypeID, count(*) as cnt
	  From Equipment
	  Group By TypeID
	  having count(*) > 3) num_each_type
Where ET.ID = num_each_type.TypeID;

/* Q10: Report the date of the coming future visit for patient with SSN = 111-22-3333. */
Select FV.visitDate
From FutureVisit FV,
	 (Select Num, AdmissionDate
	  From Admission
	  Where Patient_SSN = '111223333'
	  Group By Num, AdmissionDate
	  having AdmissionDate = max(AdmissionDate)) recent_visit
Where FV.visitNum = recent_visit.Num;

/* Q11: For patient with SSN = 111-22-3333, report the doctors (only ID) who have
examined this patient more than 2 times. */
Select doctorID
From Examine
Where AdmissionNum in (Select Num
					  From Admission
					  Where Patient_SSN = '111223333')
Group by doctorID
Having count(AdmissionNum) >= 2;

/* Q12: Report the equipment types (only the ID) for which the hospital has purchased
equipments (units) in both 2010 and 2011. Do not report duplication. */
Select Distinct E.TypeID
From Equipment E, (Select ID from EquiptmentType) eID
where E.purchaseYear >= 2010
AND E.purchaseYear <= 2011
AND E.TypeID in eID.ID;