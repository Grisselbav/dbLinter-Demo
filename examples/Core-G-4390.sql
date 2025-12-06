-- Core G-4390: Avoid use of unreferenced FOR loop indexes.

declare
   l_row          pls_integer;
   l_value        pls_integer;
   co_lower_bound constant simple_integer           := 1;
   co_upper_bound constant simple_integer           := 5;
   co_row_incr    constant simple_integer           := 1;
   co_value_incr  constant simple_integer           := 10;
   co_delimiter   constant types_up.short_text_type := ' ';
   co_first_value constant simple_integer           := 100;
begin
   l_row   := co_lower_bound;
   l_value := co_first_value;
   <<for_loop>>
   for i in co_lower_bound..co_upper_bound
   loop
      sys.dbms_output.put_line(l_row
         || co_delimiter
         || l_value);
      l_row   := l_row + co_row_incr;
      l_value := l_value + co_value_incr;
   end loop for_loop;
end;
/
