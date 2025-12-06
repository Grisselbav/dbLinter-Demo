-- Core G-3180: Always specify column names instead of positional references in ORDER BY clauses.

select upper(first_name)
      ,last_name
      ,salary
      ,hire_date
  from employees
 order by 4,1,3;
