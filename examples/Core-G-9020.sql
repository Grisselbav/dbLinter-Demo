-- Core G-9020: Try to use a format model and NLS_NUMERIC_CHARACTERS in string to number conversion functions.

create or replace package body employee_api is
   procedure set_salary(
      in_employee_id in employees.employee_id%type
     ,in_salary      in varchar2
   ) is
      co_employee_id constant employees.employee_id%type := in_employee_id;
      co_salary      constant type_up.date_string        := in_salary;
   begin
      update employees
         set salary = to_number(co_salary default null on conversion error)
       where employee_id = co_employee_id;
   end set_dob;
end employee_api;
/
