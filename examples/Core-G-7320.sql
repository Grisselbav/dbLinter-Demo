-- Core G-7320: Avoid using RETURN statements in a PROCEDURE.

create or replace package body my_package is
   procedure my_procedure is
      l_idx     simple_integer          := 1;
      co_modulo constant simple_integer := 7;
   begin
      <<mod7_loop>>
      loop
         if mod(l_idx,co_modulo) = 0 then
            return;
         end if;

         l_idx := l_idx + 1;
      end loop mod7_loop;
   end my_procedure;
end my_package;
/
