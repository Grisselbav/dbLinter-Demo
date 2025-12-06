-- Core G-2510: Avoid using the LONG and LONG RAW data types.

declare
   l_long long;
   l_raw  long raw;
begin
   do_something(l_long);
   do_something(l_raw);
end;
/
