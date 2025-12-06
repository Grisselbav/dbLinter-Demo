-- Core G-2230: Try to use SIMPLE_INTEGER datatype when appropriate. 

declare
   l_result       number(9,0)          := 0;
   co_upper_bound constant pls_integer := 1e8;
begin
   <<burning_cpu>>
   for i in 1..co_upper_bound
   loop
      if i > 0 then
         l_result := l_result + 1;
      end if;
   end loop burning_cpu;
   sys.dbms_output.put_line(l_result);
end;
/
