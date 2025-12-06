-- Core G-7420: Always make the RETURN statement the last statement of your function.

create or replace package body my_package is
   function my_function(
      in_from in pls_integer
     ,in_to   in pls_integer
   ) return pls_integer
      deterministic
   is
      l_ret pls_integer;
   begin
      l_ret := in_from;
      <<for_loop>>
      for i in in_from..in_to
      loop
         l_ret := l_ret + i;
         if i = in_to then
            return l_ret;
         end if;
      end loop for_loop;
   end my_function;
end my_package;
/
