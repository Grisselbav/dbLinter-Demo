-- Core G-3220: Always process saved exceptions from a FORALL statement.

declare
   t_employee_ids   employee_api.t_employee_ids_type;
   co_increase      constant employees.salary%type          := 0.1;
   co_department_id constant departments.department_id%type := 10;
begin
   t_employee_ids := employee_api.employee_ids_by_department(
                        id_in => co_department_id
                     );
   <<process_employees>>
   forall i in 1..t_employee_ids.count() save exceptions
      update employees
         set salary = salary + (salary * co_increase)
       where employee_id = t_employee_ids(i);
end;
/
