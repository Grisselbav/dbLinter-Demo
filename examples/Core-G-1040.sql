-- Core G-1040: Avoid dead code.

declare
   co_dept_purchasing constant departments.department_id%type := 30;
begin
   if 2 = 3 then -- dead code detection works with literals only
      null; -- some dead code here
   end if;

   null; -- some enabled code here

   <<my_loop>>
   loop
      exit my_loop when true;
      null; -- some dead code here
   end loop my_loop;

   null; -- some other enabled code here

   case
      when 1 = 1 and 'x' = 'y' then -- dead code detection works with literals only
         null; -- some dead code here
      else
         null; -- some further enabled code here
   end case;

   <<my_loop2>>
   for r_emp in (
      select last_name, first_name
        from employees
       where department_id = co_dept_purchasing
          or commission_pct is not null
         and 5 = 6 -- dead code detection works with literals only
   )
   -- "or commission_pct is not null" is dead code
   loop
      sys.dbms_output.put_line(r_emp.last_name);
      continue when true;
      sys.dbms_output.put_line(r_emp.first_name); -- dead code
   end loop my_loop2;

   return;
   null; -- some dead code here
end;
/
