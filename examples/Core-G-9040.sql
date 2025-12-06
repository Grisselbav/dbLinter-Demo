-- Core G-9040: Try using FX in string to date/time conversion format model to avoid fuzzy conversion.

create or replace package body employee_api is
   procedure set_dob(
      in_employee_id in employees.employee_id%type
     ,in_dob_str     in varchar2
   ) is
      co_employee_id constant employees.employee_id%type := in_employee_id;
      co_dob_str     constant type_up.date_string        := in_dob_str;
   begin
      update employees
         set date_of_birth = to_date(
                co_dob_str default null on conversion error
               ,'YYYY-MM-DD'
             )
       where employee_id = co_employee_id;
   end set_dob;
end employee_api;
/
