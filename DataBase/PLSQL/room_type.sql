create or replace trigger biroom_type before insert on room_type for each row
declare
begin
	if( :new.room_number is NULL or
		:new.room_number is NUll or
		:new.room_price is NULL
	   )then
	raise_application_error(-20003,'ALL FIELDS MUST BE REQUIRE TO FILLL');
	end if;
end;
/