-- Core G-5060: Avoid unhandled exceptions.

create or replace package body department_api is
   function name_by_id(in_id in departments.department_id%type)
      return departments.department_name%type is
      co_id             constant departments.department_id%type := in_id;
      l_department_name departments.department_name%type;
   begin
      select department_name
        into l_department_name
        from departments
       where department_id = co_id;

      return l_department_name;
   end name_by_id;
end department_api;
/
