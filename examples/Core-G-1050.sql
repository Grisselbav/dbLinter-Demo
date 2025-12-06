-- Core G-1050: Avoid using literals in your code.

create or replace procedure p is
begin
   some_api.setup(in_department_id => 10);
   some_api.process(in_department_id => 10);
   some_api.teardown(in_department_id => 10);
end;
/
