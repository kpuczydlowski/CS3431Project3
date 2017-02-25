/*
	Kacper Puczydlowski
	Can Alper
	Project Team 27
	Create View Calls
	*/


Create or Replace Trigger ThreeServices
	Before Insert or Update of roomNum on RoomService
	For each row
	Declare
		temp Number;
	Begin
		Select count(service) into temp 
			from RoomService RS where RS.roomNum = :new.roomNum 
			Group By service Having count(service) > 1;
		If(temp <> null) Then
			RAISE_APPLICATION_ERROR(-20000, 'Too many services...');
		End If;

	End;
	/

Create or Replace Trigger CalculateInsPayment
	Before Insert or Update of TotalPayment on Admission
	For each row
	Begin
		:new.InsurancePayment := :new.TotalPayment*0.7;
	End;
	/

Create or Replace Trigger Manages
	Before Insert or Update of empRank on Employee
	For each row
	Declare 
		temp Varchar(20);
	Begin
		Select empRank into temp from Employee E Where E.ID = :new.supervisorID;
		If(:new.empRank = 'Regular') Then
			If (temp <> 'Division') Then
				RAISE_APPLICATION_ERROR(-20000, 'Not inserted...');
			End If;
		End If;
		If(:new.empRank = 'Division') Then
			If (temp <> 'General' ) Then
				RAISE_APPLICATION_ERROR(-20000, 'Not inserted...');
			End If;
		End If;
		If(:new.empRank = 'General') Then
			If (temp <> 'General' or temp <> null ) Then
				RAISE_APPLICATION_ERROR(-20000, 'Not inserted...');
			End If;
		End If;
	End;
	/
	

Create or Replace Trigger ICUinThreeMonths
	Before Insert on Admission
	For each row
	Declare
		temp date;
		temp_s Varchar(30);
	Begin
		Select RS.service into temp_s
		From StayIn SI, RoomService RS
		Where RS.roomNum = SI.roomNum;
		If (temp_s = 'ICU') Then
			temp := Add_months(:new.AdmissionDate, 3);
			INSERT INTO FutureVisit (visitNum, visitDate)
			VALUES (:new.Num, temp);
		End If;
	End;
	/

Create or Replace Trigger MRIPurchaseYear
	Before Insert or Update on Equipment
	For each row
	Begin
		if(:new.TypeID = 'MRI' and (:new.purchaseYear < 2005 or :new.purchaseYear = null) ) Then
			RAISE_APPLICATION_ERROR(-1, 'MRI error');
		end if;
	End;
	/

Create or Replace Trigger PrintDoctors
	Before Insert on Admission
	For each row
	Begin
		For rec in (Select D.lastName as last, D.firstName as first from Examine E, Doctor D where E.AdmissionNum = :new.Num and E.doctorID = D.ID)
		loop
			dbms_output.put(rec.last);
			dbms_output.put(',	');
			dbms_output.put(rec.first);
			dbms_output.new_line;
		end loop;
	End;
	/