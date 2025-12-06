-- Core G-4325: Never reuse labels in inner scope.

<<my_label>>
declare
   co_min_value constant simple_integer := 1;
   co_max_value constant simple_integer := 8;
begin
   <<my_label>>
   for i in co_min_value..co_max_value
   loop
      sys.dbms_output.put_line(i);
   end loop my_label;
end my_label;
/
