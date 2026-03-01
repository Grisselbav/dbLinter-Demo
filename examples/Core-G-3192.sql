-- Core G-3192: Avoid joining tables with the USING clause.

select department_id, emp.last_name, mgr.last_name as mgr_last_name 
  from employees emp 
  join departments dept using (department_id)
  left join employees mgr on emp.manager_id = mgr.employee_id
 order by department_id, emp.last_name;
