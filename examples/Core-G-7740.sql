-- Core G-7740: Never handle multiple DML events per trigger if primary key is assigned in trigger.

create or replace trigger dept_br_iu
before insert or update
on departments for each row
begin
   if inserting then
      :new.department_id := department_seq.nextval;
      :new.created_date  := sysdate;
   end if;
   if updating then
      :new.changed_date := sysdate;
   end if;
end;
/
