-- Core G-7450: Never return a NULL value from a BOOLEAN function.

create or replace package body my_package is
   function my_function return boolean
      deterministic
   is
   begin
      return null;
   end my_function;
end my_package;
/
