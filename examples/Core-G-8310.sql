-- Core G-8310: Always validate input parameter size by assigning the parameter to a size limited variable in the declaration section of program unit.

create or replace package body department_api is
   function dept_by_name( -- @dbLinter ignore(G-7460) non-deterministic function
      in_dept_name in departments.department_name%type
   )
      return departments%rowtype is
      r_return                departments%rowtype;
      co_max_dept_name_length constant integer := 20;
   begin
      if in_dept_name is null or length(in_dept_name) > co_max_dept_name_length then
         raise err.e_param_to_large;
      end if;
      -- get the department by name
      <<trap>>
      begin
         select *
           into r_return
           from departments
          where department_name = in_dept_name;
         return r_return;
      exception
         when no_data_found then
            return null;
         when too_many_rows then
            raise;
      end trap;
   end dept_by_name;
end department_api;
/
