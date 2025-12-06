-- Core G-7140: Always ensure that locally defined procedures or functions are referenced.

create or replace package body my_package is
   procedure my_procedure is
      function my_func return number
         deterministic
      is
         co_true constant integer := 1;
      begin
         return co_true;
      end my_func;
   begin
      null;
   end my_procedure;
end my_package;
/
