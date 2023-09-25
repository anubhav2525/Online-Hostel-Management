create or replace trigger bihostel before insert on hostel for each row
declare
begin
	if( :new.hostel_id is NULL or
		:new.hostel_name is NULL or
		:new.address is NULL or
		:new.city is NULL or
		:new.state is NULL or
		:new.pincode is NULL or
		:new.phone is NULL or
		:new.manager_id is NULL or
		:new.number_employee is NULL
	)then
	raise_application_error(-20002,'ALL FIELDS MUST BE REQUIRETO FILL');
	end if;
end;
/