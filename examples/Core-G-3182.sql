-- Core G-3182: Always specify column names/aliases instead of positional references in GROUP BY clauses.

select job_id
      ,sum(salary) as sum_salary
  from employees
 group by job_id,2
 order by job_id;
