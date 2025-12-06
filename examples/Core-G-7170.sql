-- Core G-7170: Avoid using an IN OUT parameter as IN or OUT only.

declare
   l_employee  employees.employee_id%type;
   l_salary_id employees.salary%type;
   procedure fetch_salary_by_id(
      io_employee_id in out employees.employee_id%type
     ,io_salary      in out employees.salary%type
   ) is
   begin
      select salary
        into io_salary
        from employees
       where employee_id = io_employee_id;
   exception
      when no_data_found or too_many_rows then
         raise;
   end fetch_salary_by_id;
begin
   l_employee := 100;
   fetch_salary_by_id(l_employee, l_salary_id);
   sys.dbms_output.put_line('Employee ID: ' || l_employee || ', Salary: ' || l_salary_id);
end;
/
