-- Core G-5020: Never handle unnamed exceptions using the error number.

declare
   co_no_data_found constant integer := -1;
begin
   my_package.some_processing(); -- some code which raises an exception
exception
   when too_many_rows then
      my_package.some_further_processing();
   when others then
      if sqlcode = co_no_data_found then
         null;
      end if;
end;
/
