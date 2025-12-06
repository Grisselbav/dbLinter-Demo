-- Core G-4395: Avoid hard-coded upper or lower bound values with FOR loops.

begin
   <<for_loop>>
   for i in 2..5
   loop
      sys.dbms_output.put_line(i);
   end loop for_loop;
end;
/
