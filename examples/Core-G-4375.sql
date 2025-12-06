-- Core G-4375: Always use EXIT WHEN instead of an IF statement to exit from a loop. 

declare
   co_first_year constant pls_integer := 1900;
begin
   <<process_employees>>
   loop
      my_package.some_processing();

      if extract(year from sysdate) > co_first_year then
         exit process_employees;
      end if;

      my_package.some_further_processing();
   end loop process_employees;
end;
/
