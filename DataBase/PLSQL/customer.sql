create or replace trigger customer before insert on customer_details for each row
declare
begin
	if( :new.customer_id is NULL or
		:new.email_id is NULL or
		:new.first_name is NULL or
		:new.last_name is NULL or
		:new.gender is NULL or
		:new.age is NULL or
		:new.address is NULL or
		:new.city is NULL or
		:new.state is NULL or
		:new.pincode is NULL or
		:new.phone is NULL 
	  )then
	raise_application_error(-20005,'ALL FIELDS MUST BE REQUIRE TO FILL');
	end if;
end;
/
