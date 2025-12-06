-- Core G-9210: Always follow naming conventions for views.

create or replace view salaires_des_départements as
select d.department_id,
       d.department_name,
       sum(e.salary) as salaire_total
  from employees e
  join departments d on e.department_id = d.department_id
 group by d.department_id, d.department_name;
