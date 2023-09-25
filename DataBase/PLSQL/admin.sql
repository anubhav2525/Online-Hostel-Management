create or replace trigger biadmin beffore insert on adminlogin for each row
declare
begin
  if( :new.adminid is NULL or    
		:new.adminpassword is NULL 
	  )then
	raise_application_error(-20009,'ALL FIELDS MUST BE REQUIRE TO FILL');
	end if;
end;