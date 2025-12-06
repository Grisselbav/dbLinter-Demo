-- Core G-1080: Avoid using the same expression on both sides of a relational comparison operator or a logical operator.

begin
   select emp.first_name
         ,emp.last_name
         ,emp.salary
         ,emp.hire_date
     from employees emp
    where emp.salary > 3000
       or emp.salary > 3000
    order by emp.last_name,emp.first_name;
end;
/
