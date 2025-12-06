-- Core G-2150: Avoid comparisons with NULL value, consider using IS [NOT] NULL.

declare
   l_value integer;
begin
   if l_value = null then
      null;
   end if;
end;
/
