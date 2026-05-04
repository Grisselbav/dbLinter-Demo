-- Core G-3120: Always use table aliases when your SQL statement involves more than one source.

select last_name
      ,first_name
  from employees
 where employee_id in (
          select employee_id
            from jobs
           where job_title like '%Manager%'
       );
