-- Core G-4365: Never use unconditional CONTINUE or EXIT in a loop.

begin
   <<process_employees>>
   loop
      my_package.some_processing();

      continue process_employees;

      my_package.some_further_processing(); -- Dead code
   end loop process_employees;
end;
/
