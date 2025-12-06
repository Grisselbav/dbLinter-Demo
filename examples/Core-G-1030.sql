-- Core G-1030: Avoid defining variables that are not used.

create or replace package body my_package is
   procedure my_proc is
      l_last_name      employees.last_name%type;
      l_first_name     employees.first_name%type;
      e_good           exception;
   begin
      select e.last_name
        into l_last_name
        from employees e
       where e.department_id = 10;
   exception
      when no_data_found then
         null; -- handle_no_data_found;
      when too_many_rows then
         null; -- handle_too_many_rows;
   end my_proc;
end my_package;
/
