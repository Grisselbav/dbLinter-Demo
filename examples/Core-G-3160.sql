-- Core G-3160: Avoid visible virtual columns.

alter table employees
   add total_salary generated always as
      (salary + nvl(commission_pct,0) * salary)
/

declare
   r_employee employees%rowtype;
   co_id      constant employees.employee_id%type := 107;
begin
   r_employee        := employee_api.employee_by_id(co_id);
   r_employee.salary := r_employee.salary * constants_up.small_increase();

   update employees
      set row = r_employee
    where employee_id = co_id;
end;
/
