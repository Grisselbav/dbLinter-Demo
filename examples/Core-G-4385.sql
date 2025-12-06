-- Core G-4385: Never use a cursor for loop to check whether a cursor returns data.

declare
   l_employee_found boolean := false;
   cursor c_employees is
      select employee_id,last_name
        from employees;
begin
   <<check_employees>>
   for r_employee in c_employees
   loop
      l_employee_found := true;
   end loop check_employees;
   if l_employee_found then
      null; -- some processing;
   end if;
end;
/
