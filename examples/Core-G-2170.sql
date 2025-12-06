-- Core G-2170: Never overload variables.

begin
   <<main>>
   declare
      l_variable user_objects.object_name%type := 'test_main';
   begin
      <<sub>>
      declare
         l_variable user_objects.object_name%type := 'test_sub';
      begin
         sys.dbms_output.put_line(l_variable
            || '-'
            || main.l_variable);
      end sub;
   end main;
end;
/
