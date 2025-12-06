-- Core G-3130: Try to use ANSI SQL-92 join syntax.

select e.employee_id
      ,e.last_name
      ,e.first_name
      ,d.department_name
  from employees e
      ,departments d
 where e.department_id = d.department_id
   and extract(month from e.hire_date) = extract(month from sysdate);
