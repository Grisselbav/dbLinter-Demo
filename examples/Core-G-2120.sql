-- Core G-2120: Try to have a single location to define your types.

create or replace package body my_package is
   procedure my_proc is
      subtype big_string_type is varchar2(1000 char);
      l_note big_string_type;
   begin
      l_note := some_function();
      do_something(l_note);
   end my_proc;
end my_package;
/
