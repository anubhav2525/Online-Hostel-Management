create or replace trigger biroom before insert on room for each row
declare
begin
	if( :new.room_number is NULL or
		:new.room_image is NULL or
		:new.room_description is NULL or
		:new.hostel_id is NULL
	   )then
	raise_application_error(-20004,'ALL FIELDS MUST BE REQUIRE TO FILL');
	end if;
end;
/