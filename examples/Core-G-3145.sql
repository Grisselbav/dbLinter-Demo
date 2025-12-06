-- Core G-3145: Avoid using SELECT * directly from a table or view.

begin
   <<raise_salary>>
   for r_employee in (
      select *
        from employees
   )
   loop
      employee_api.calculate_raise_by_seniority(
         id_in       => r_employee.id
        ,salary_in   => r_employee.salary
        ,hiredate_in => r_employee.hiredate
      );
   end loop raise_salary;
end;
/
