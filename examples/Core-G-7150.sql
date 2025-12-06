-- Core G-7150: Try to remove unused parameters.

create or replace package body department_api is
   function name_by_id( -- @dbLinter ignore(G-7460) non-deterministic function
      in_department_id in integer
     ,in_manager       in employees%rowtype
   )
      return departments.department_name%type is
      co_department_id  constant departments.department_id%type := in_department_id;
      l_department_name departments.department_name%type;
   begin
      <<find_department>>
      begin
         select department_name
           into l_department_name
           from departments
          where department_id = co_department_id;
      exception
         when no_data_found or too_many_rows then
            l_department_name := null;
      end find_department;

      return l_department_name;
   end name_by_id;
end department_api;
/
