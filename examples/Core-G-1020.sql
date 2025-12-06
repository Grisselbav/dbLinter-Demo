-- Core G-1020: Always have a matching loop or block label.

declare
   i simple_integer := 1;
begin
   <<prepare_data>>
   begin
      null;
   end data_preparation;

   <<process_with_while_loop>>
   while (i <= 10)
   loop
      i := i + 1;
   end loop while_loop;

   <<process_with_basic_loop>>
   loop
      exit process_with_basic_loop when true;
   end loop basic_loop;

   <<process_with_for_loop>>
   for i in 1..10 loop
      sys.dbms_output.put_line(i);
   end loop for_loop;

   <<process_with_cursor_for_loop>>
   for r in (select table_name from user_tables) loop
      sys.dbms_output.put_line(r.table_name);
   end loop cursor_for_loop;
end;
/
