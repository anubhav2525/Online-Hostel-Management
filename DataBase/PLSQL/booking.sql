create or replace trigger bibooking before insert on booking for each row
declare
begin
	if( :new.booking_id is NULL or    
		:new.customer_id is NULL or
		:new.room_number is NULL or
		:new.hostel_id is NULL or
		:new.booking_date is NULL or
		:new.check_in_date is NULL or
		:new.check_out_date is NULL or
		:new.number_of_night is NULL
	  )then
	raise_application_error(-20006,'ALL FIELDS MUST BE REQUIRE TO FILL');
	end if;
end;
/