/*
	Kacper Puczydlowski
	Can Alper
	Project Team 27
	Create View Calls
	*/

Set Serveroutput on
Create or Replace Trigger ThreeServices
	Before Insert or Update on RoomService
	For each row
	Declare
		temp Integer;
	Begin
		dbms_output.put('Room num ' );
		dbms_output.put_line(:new.roomNum );
		Begin
			Select COUNT(*) into temp
				from RoomService RS 
				where RS.roomNum = :new.roomNum 
				Group By RS.roomNum;
			EXCEPTION
	      		WHEN NO_DATA_FOUND THEN
	        	temp := 0;
			END;

		dbms_output.put_line(temp);
		If(temp > 1) Then
			RAISE_APPLICATION_ERROR(-20000, 'Too many services...');
		End If;

	End;
	/

Create or Replace Trigger CalculateInsPayment
	Before Insert or Update of TotalPayment on Admission
	For each row
	Begin
		:new.InsurancePayment := :new.TotalPayment*0.7;
		dbms_output.put('Calculated InsurancePayment	');
		dbms_output.put(:new.InsurancePayment);
		dbms_output.new_line;
	End;
	/

Create or Replace Trigger Manages
	Before Insert or Update of empRank on Employee
	For each row
	Declare 
		temp Varchar(20);
	Begin
		Begin
			Select empRank into temp from Employee E Where E.ID = :new.supervisorID;
		EXCEPTION
	      		WHEN NO_DATA_FOUND THEN
	        	temp := null;
			END;
		If(:new.empRank = 'Regular') Then
			If (temp <> 'Division') Then
				RAISE_APPLICATION_ERROR(-20000, 'Manages Regular violation...');
			End If;
		End If;
		If(:new.empRank = 'Division') Then
			If (temp <> 'General' ) Then
				RAISE_APPLICATION_ERROR(-20000, 'Manages Division violation...');
			End If;
		End If;
		If(:new.empRank = 'General') Then
			If (temp <> 'General' or temp <> null ) Then
				RAISE_APPLICATION_ERROR(-20000, 'Manages General violation...');
			End If;
		End If;
	End;
	/
	



Create or Replace Trigger MRIPurchaseYear
	Before Insert or Update on Equipment
	For each row
	Begin
		if(:new.TypeID = 'MRI' and (:new.purchaseYear < 2005 or :new.purchaseYear = null) ) Then
			RAISE_APPLICATION_ERROR(-20003, 'MRI error');
		end if;
	End;
	/

Create or Replace Trigger PrintDoctors
	Before Insert on Admission
	For each row
	Begin
		For rec in (Select D.lastName as last, D.firstName as first from Examine E, Doctor D where E.AdmissionNum = (Select Num from Admission A where :new.Patient_SSN = A.Patient_SSN) AND E.doctorID = D.ID)
		loop
			dbms_output.put(rec.last);
			dbms_output.put(',	');
			dbms_output.put(rec.first);
			dbms_output.new_line;
		end loop;
	End;
	/

Create or Replace Trigger ICUinThreeMonths
	Before Insert on StayIn
	For each row
	Declare
		temp date;
	Begin
		For rec in (Select RS.service as serv
		From RoomService RS
		Where RS.roomNum = :new.roomNum)
		loop
			If (rec.serv = 'ICU') Then
				temp := Add_months(:new.startDate, 3);
				INSERT INTO FutureVisit (visitNum, visitDate)
				VALUES (:new.AdmissionNum, temp);
				Exit;
			End If;
		end loop;
	End;
	/	