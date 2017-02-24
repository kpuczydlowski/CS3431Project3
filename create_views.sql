/*
	Kacper Puczydlowski
	Can Alper
	Project Team 27
	Create View Calls
	*/

CREATE or Replace VIEW CriticalCases as
	Select P.SSN as Patient_SSN, P.FName as firstName, P.LName as lastName, count(admt.aNum) as numICU
	From Patient P, 
		(Select A.Patient_SSN as SSN, SI.AdmissionNum as aNum
		 From RoomService RS, StayIn SI, Admission A
		 Where RS.service = 'ICU' and
		 SI.roomNum = RS.roomNum and 
		 A.Num = SI.AdmissionNum) admt
	Where admt.SSN = P.SSN
	Group By P.SSN, P.FName, P.LName
	Having count(admt.aNum) > 1	;

Select * from CriticalCases;

Create or Replace View DoctorsLoad as 
	Select D.ID, D.gender as Gender, ids.load as load
	From 	((Select E.doctorID as doctorID, 'underload' as load From Examine E Group By E.doctorID having count(E.AdmissionNum) < 11) union
			(Select E.doctorID as doctorID, 'overload' as load From Examine E Group By E.doctorID having count(E.AdmissionNum) > 10)) ids,
			Doctor D
	Where D.ID = ids.doctorID;

Select * from DoctorsLoad;

CREATE or Replace VIEW CriticalCasesFour as
	Select *
	from CriticalCases
	Where numICU > 4;

Select * from CriticalCasesFour;