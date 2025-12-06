-- Core G-7430: Try to use no more than one RETURN statement within a function.

create or replace package body my_package is
   function my_function(in_value in pls_integer) return boolean
      deterministic
   is
      co_yes constant pls_integer := 1;
   begin
      if in_value = co_yes then
         return true;
      else
         return false;
      end if;
   end my_function;
end my_package;
/
