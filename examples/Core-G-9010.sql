-- Core G-9010: Always use a format model in string to date/time conversion functions.

create or replace package body employee_api is
   procedure set_dob(
      in_employee_id in employees.employee_id%type
     ,in_dob_str     in varchar2
   ) is
      co_employee_id constant employees.employee_id%type := in_employee_id;
      co_dob_str     constant type_up.date_string        := in_dob_str;
   begin
      update employees
         set date_of_birth = to_date(co_dob_str default null on conversion error)
       where employee_id = co_employee_id;
   end set_dob;
end employee_api;
/
