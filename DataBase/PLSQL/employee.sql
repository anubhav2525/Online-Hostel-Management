create or replace trigger biemployee before insert on employee for each row
declare
begin
	if( :new.staff_id is NULL or
		:new.email_id is NULL or
		:new.first_name is NULL or
		:new.last_name is NULL or
		:new.fathers_name is NULL or
		:new.gender is NULL or
		:new.age is NULL or
		:new.dob is NULL or
		:new.phone is NULL or
		:new.address is NULL or
		:new.state is NULL or
		:new.city is NULL or
		:new.pincode is NULL or
		:new.description is NULL or
		:new.status is NULL or
		:new.start_date is NULL or
		:new.end_date is NULL or
		:new.job_title is NULL 
	  )then
		raise_application_error(-20001,'ALL FIELDS MUST BE REQUIRED TO FILL');
	end if;
end;
/