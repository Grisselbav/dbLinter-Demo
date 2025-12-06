-- Core G-2180: Never use quoted identifiers.

declare
   "sal+comm"     integer;
   "my constant"  constant integer := 1;
   "my exception" exception;
begin
   "sal+comm" := "my constant";
   do_something("sal+comm");
exception
   when "my exception" then
      null;
end;
/
