-- Core G-4370: Avoid using EXIT to stop loop processing unless you are in a basic loop.

declare
   i            integer;
   co_min_value constant simple_integer := 1;
   co_max_value constant simple_integer := 10;
   co_increment constant simple_integer := 1;
begin
   i := co_min_value;
   <<while_loop>>
   while (i <= co_max_value)
   loop
      i := i + co_increment;
      exit while_loop when i > co_max_value;
   end loop while_loop;

   <<basic_loop>>
   loop
      exit basic_loop when true;
   end loop basic_loop;

   <<for_loop>>
   for i in co_min_value..co_max_value
   loop
      null;
      exit for_loop when i = co_max_value;
   end loop for_loop;

   <<process_employees>>
   for r_employee in (
      select last_name
        from employees
   )
   loop
      sys.dbms_output.put_line(r_employee.last_name);
      null; -- some processing
      exit process_employees when true;
   end loop process_employees;
end;
/
