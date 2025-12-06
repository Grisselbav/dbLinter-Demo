-- Core G-3195: Always use wildcards in a LIKE clause.

select e.employee_id
      ,e.last_name
  from employees e
 where e.last_name like 'Smith';
