-- Core G-3185: Never use ROWNUM at the same query level as ORDER BY.

select first_name
      ,last_name
      ,salary
      ,hire_date
      ,rownum as salary_rank
  from employees
 where rownum <= 5
 order by salary desc;
