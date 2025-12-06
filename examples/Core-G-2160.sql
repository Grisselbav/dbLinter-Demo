-- Core G-2160: Avoid initializing variables using functions in the declaration section.

declare
   co_department_id  constant integer := 100;
   l_department_name departments.department_name%type :=
      department_api.name_by_id(in_id => co_department_id);
begin
   sys.dbms_output.put_line(l_department_name);
end;
/
