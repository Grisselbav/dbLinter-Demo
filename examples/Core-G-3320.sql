-- Core G-3320: Try to move transactions within a non-cursor loop into procedures.

declare
   co_upper_bound constant integer               := 5;
   co_max_level   constant integer               := 3;
   co_number      constant types_up.short_string := 'Number';
   co_line        constant types_up.short_string := 'Line';
   co_space       constant types_up.short_string := ' ';
   l_counter      integer                        := 0;
begin
   <<create_headers>>
   loop
      insert into headers (id,text)
      values (
         l_counter,co_number
         || co_space
         || l_counter
      );

      insert into lines (header_id,line_no,text)
      select l_counter
            ,rownum
            ,co_line
             || co_space
             || rownum
        from dual
     connect by level <= co_max_level;

      commit;
      l_counter := l_counter + 1;
      exit create_headers when l_counter > co_upper_bound;
   end loop create_headers;
end;
/
