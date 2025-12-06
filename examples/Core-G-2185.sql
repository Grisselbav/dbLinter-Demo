-- Core G-2185: Avoid using overly short names for explicitly or implicitly declared identifiers. 

declare
   i integer;
   c constant integer := 1;
   e exception;
begin
   i := c;
   do_something(i);
exception
   when e then
      null;
end;
/
