-- Core G-1910: Avoid using the NOSONAR marker.

declare
   l_value pls_integer := null; -- NOSONAR G-2140: False positive
begin
   sys.dbms_output.put_line(l_value);
end;
/
