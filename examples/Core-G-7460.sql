-- Core G-7460: Try to define your packaged/standalone function deterministic if appropriate.

create or replace package department_api is
   function name_by_id(in_department_id in departments.department_id%type)
      return departments.department_name%type;
end department_api;
/
