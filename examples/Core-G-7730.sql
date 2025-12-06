-- Core G-7730: Avoid multiple DML events per trigger.

create or replace trigger dept_br_iu
before insert or update
on departments for each row
begin
   if inserting then
      :new.created_date := sysdate;
   end if;
   if updating then
      :new.changed_date := sysdate;
   end if;
end;
/
