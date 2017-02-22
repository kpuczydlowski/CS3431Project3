/*
	Kacper Puczydlowski
	Can Alper
	Project Team 27
	Create View Calls
	*/

CREATE or Replace VIEW CriticalCases as
	Select P.SSN as Patient_SSN, P.FName as firstName, P.LName as lastName, count(admt.aNum) as numberOfAdmissionsToICU
	From Patient P, 
		(Select P.SSN as SSN, SI.AdmissionNum as aNum
		 From RoomService RS, StayIn SI, Patient P, Admission A
		 Where RS.service = 'ICU' and
		 SI.roomNum = RS.roomNum and
		 A.Num = SI.AdmissionNum and
		 A.Patient_SSN = P.SSN) admt
	Where admt.SSN = P.SSN
	Group By P.SSN, P.FName, P.LName
	Having count(admt.aNum) > 1;

Select * from CriticalCases;