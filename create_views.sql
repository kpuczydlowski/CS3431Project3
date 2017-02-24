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

CREATE or Replace VIEW OverloadFemDoc as
	Select *
	From DoctorsLoad D
	Where D.gender = 'F' and D.load = 'overload';


CREATE or Replace VIEW CriticalCaseUnderload as
	Select D.ID, A.Patient_SSN as SSN, E.comments
	From 	(Select * From DoctorsLoad	Where	load = 'underload') D,
			Examine E, Admission A, CriticalCases CC
	Where	E.doctorID = D.ID and
			A.Num = E.AdmissionNum and
			A.Patient_SSN = CC.Patient_SSN;

Create or Replace Trigger ThreeServiceTrigger
	BEFORE INSERT OR UPDATE OF roomNum ON RoomService
	For each row
	BEGIN
		(Select RS.service from RoomService RS Where :new.roomNum = RS.roomNum Group By RS.service having count(RS.service) > 2) s;
		If (s is not null)  Then
			RAISE_APPLICATION_ERROR(-1, 'error');
		end If;
	End;
	/

