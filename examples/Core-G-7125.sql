-- Core G-7125: Always use CREATE OR REPLACE instead of CREATE alone.

create package body employee_api is
   function employee_by_id(in_employee_id in integer) -- @dbLinter ignore(G-7460) non-deterministic function
      return employees%rowtype is
      co_employee_id constant employees.employee_id%type := in_employee_id;
      r_employee     employees%rowtype;
   begin
      select *
        into r_employee
        from employees
       where employee_id = co_employee_id;

      return r_employee;
   exception
      when no_data_found then
         null;
      when too_many_rows then
         raise;
   end employee_by_id;
end employee_api;
/
