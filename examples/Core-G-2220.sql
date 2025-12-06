-- Core G-2220: Try to use PLS_INTEGER instead of NUMBER for arithmetic operations with integer values. 

declare
   l_result       number(9,0);
   co_upper_bound constant pls_integer := 1e8;
begin
   l_result := 0;
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
