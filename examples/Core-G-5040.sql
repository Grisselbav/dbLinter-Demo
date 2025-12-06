-- Core G-5040: Avoid use of WHEN OTHERS clause in an exception section without any other specific handlers.

begin
   my_package.some_processing();
exception
   when others then
      my_package.some_further_processing();
end;
/
