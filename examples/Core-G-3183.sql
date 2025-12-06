-- Core G-3183: Always specify column aliases instead of expressions in GROUP BY clauses.

select lower(job_id) as job
      ,sum(salary) as sum_salary
  from employees
 group by lower(job_id)
 order by job;
