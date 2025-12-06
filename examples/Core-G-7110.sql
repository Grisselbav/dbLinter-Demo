-- Core G-7110: Try to use named notation when calling program units.

declare
   r_employee employees%rowtype;
   co_id      constant employees.employee_id%type := 107;
begin
   employee_api.employee_by_id(r_employee,co_id);
end;
/
