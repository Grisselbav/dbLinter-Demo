-- Core G-3210: Always use BULK OPERATIONS (BULK COLLECT, FORALL) whenever you have to execute a DML statement for more than 4 times.

declare
   t_employee_ids   employee_api.t_employee_ids_type;
   co_increase      constant employees.salary%type          := 0.1;
   co_department_id constant departments.department_id%type := 10;
begin
   t_employee_ids := employee_api.employee_ids_by_department(
                        id_in => co_department_id
                     );
   <<process_employees>>
   for i in 1..t_employee_ids.count()
   loop
      update employees
         set salary = salary + (salary * co_increase)
       where employee_id = t_employee_ids(i);
   end loop process_employees;
end;
/
