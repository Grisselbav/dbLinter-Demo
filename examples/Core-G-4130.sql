-- Core G-4130: Always close locally opened cursors.

create or replace package body employee_api as
   function department_salary(in_dept_id in integer) -- @dbLinter ignore(G-7460) non-deterministic function
      return number is
      cursor c_department_salary(p_dept_id in departments.department_id%type) is
         select sum(salary) as sum_salary
           from employees
          where department_id = p_dept_id;
      r_department_salary c_department_salary%rowtype;
      co_dept_id          constant departments.department_id%type := in_dept_id;
   begin
      open c_department_salary(p_dept_id => co_dept_id);
      fetch c_department_salary into r_department_salary;

      return r_department_salary.sum_salary;
   end department_salary;
end employee_api;
/
