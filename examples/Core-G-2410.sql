-- Core G-2410: Try to use boolean data type for values with dual meaning.

declare
   co_newfile constant pls_integer := 1000;
   co_oldfile constant pls_integer := 500;
   l_bigger   pls_integer;
begin
   if co_newfile < co_oldfile then
      l_bigger := 1;
   else
      l_bigger := 0;
   end if;
   do_something(l_bigger);
end;
/
