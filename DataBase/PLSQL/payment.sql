create or replace trigger bipayment before insert on payment_receipt for each row
declare
begin
	if( :new.payment_id is NuLL or
		:new.customer_id is NULL or
		:new.booking_id is NULL or
		:new.first_name is NULL or
		:new.last_name is NULL or
		:new.payment_mode is NULL or
		:new.payment_details is NULL or
		:new.amount is NULL or
		:new.dues is NULL
	  )then
	raise_application_error(-20007,'ALL FIELD MUST BE REQUIRE TO FILL');
	end if;
end;
/