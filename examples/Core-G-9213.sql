-- Core G-9213: Always follow naming conventions for triggers.

create or replace trigger logon after logon on database
begin
   null; -- some monitoring activity
end;
/
