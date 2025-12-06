-- Core G-4320: Always label your loops.

declare
   i pls_integer;
begin
   i := 1;
   while (i <= 10)
   loop
      i := i + 1;
   end loop;

   loop
      exit when true;
   end loop;

   for i in 1..10
   loop
      sys.dbms_output.put_line(i);
   end loop;

   for r_employee in (select last_name from employees)
   loop
      sys.dbms_output.put_line(r_employee.last_name);
   end loop;
end;
/
