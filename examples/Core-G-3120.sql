-- Core G-3120: Always use table aliases when your SQL statement involves more than one source.

select last_name
      ,first_name
      ,department_name
  from employees
  join departments
 using (department_id)
 where extract(month from hire_date) = extract(month from sysdate);
