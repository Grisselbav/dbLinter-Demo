-- Core G-3190: Avoid using NATURAL JOIN.

select d.department_name
      ,e.last_name
      ,e.first_name
  from employees e
natural join departments d
 order by d.department_name
      ,e.last_name;
