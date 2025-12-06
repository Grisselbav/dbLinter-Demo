-- Core G-2110: Try to use anchored declarations for variables, constants and types.

create or replace package body my_package is
   procedure my_proc is
      l_last_name  varchar2(20 char);
      co_first_row constant integer := 1;
   begin
      select e.last_name
        into l_last_name
        from employees e
       where rownum = co_first_row;
   exception
      when no_data_found then
         null; -- handle no_data_found
      when too_many_rows then
         null; -- handle too_many_rows (impossible)
   end my_proc;
end my_package;
/
