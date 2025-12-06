-- Core G-2610: Never use self-defined weak ref cursor types.

declare
   type local_weak_cursor_type is ref cursor;
   c_data local_weak_cursor_type;
begin
   if configuration.use_employee then
      open c_data for
         select e.employee_id,e.first_name,e.last_name
           from employees e;
   else
      open c_data for
         select e.emp_id,e.name
           from emp e;
   end if;
end;
/
