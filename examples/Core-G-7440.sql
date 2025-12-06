-- Core G-7440: Never use OUT parameters to return values from a function.

create or replace package body my_package is
   function my_function(out_date out date) return boolean
      deterministic
   is
   begin
      out_date := sysdate;
      return true;
   end my_function;
end my_package;
/
