create or replace trigger bilogin before insert on login for each row
declare
begin
  if(   :new.login_id is NULL or
        :new.login_password is NULL 
  )then
  raise_application_error(-20008,'All Fields Require To Fill');
  end if;
end;
/