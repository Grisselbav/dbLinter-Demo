-- Core G-2130: Try to use subtypes for constructs used often in your code. 

create or replace package body my_package is
   procedure my_proc is
      l_note varchar2(1000 char);
   begin
      l_note := some_function();
      do_something(l_note);
   end my_proc;
end my_package;
/
