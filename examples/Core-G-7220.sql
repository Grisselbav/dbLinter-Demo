-- Core G-7220: Always use forward declaration for private functions and procedures.

create or replace package department_api is
   procedure del(in_department_id in departments.department_id%type);
end department_api;
/

create or replace package body department_api is
   function does_exist(in_department_id in departments.department_id%type)
      return boolean is
      co_department_id constant departments.department_id%type := in_department_id;
      l_return         pls_integer;
   begin
      <<check_row_exists>>
      begin
         select 1
           into l_return
           from departments
          where department_id = co_department_id;
      exception
         when no_data_found or too_many_rows then
            l_return := 0;
      end check_row_exists;

      return l_return = 1;
   end does_exist;

   procedure del(in_department_id in departments.department_id%type) is
      co_department_id constant departments.department_id%type := in_department_id;
   begin
      if does_exist(co_department_id) then
         null;
      end if;
   end del;
end department_api;
/
