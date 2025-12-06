-- Core G-1060: Avoid storing ROWIDs or UROWIDs in database tables.

begin
   insert into employees_log (
      employee_id
     ,last_name
     ,first_name
     ,rid
   )
   select employee_id
         ,last_name
         ,first_name
         ,rowid
     from employees;
end;
/
