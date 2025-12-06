-- Core G-7710: Avoid cascading triggers.

create or replace trigger dept_br_u
before update on departments for each row
begin
   insert into departments_hist (
      department_id
     ,department_name
     ,manager_id
     ,location_id
     ,modification_date)
   values (
      :old.department_id
     ,:old.department_name
     ,:old.manager_id
     ,:old.location_id
     ,sysdate);
end;
/
create or replace trigger dept_hist_br_i
before insert on departments_hist for each row
begin
   insert into departments_log (
      department_id
     ,department_name
     ,modification_date)
   values (
      :new.department_id
     ,:new.department_name
     ,sysdate);
end;
/
