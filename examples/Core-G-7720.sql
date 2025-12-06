-- Core G-7720: Never use multiple UPDATE OF in trigger event clause.

create or replace trigger dept_br_u
before update of department_id or update of department_name
on departments for each row
begin
   -- will only fire on updates of department_name
   insert into departments_log (
      department_id
     ,department_name
     ,modification_date)
   values (
      :old.department_id
     ,:old.department_name
     ,sysdate);
end;
/
