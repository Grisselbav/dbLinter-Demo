-- Core G-7515: Always prefix Oracle supplied object types with owner schema name.

declare
   o_array json_array_t;
begin
   o_array := json_array_t.parse('[1,42,99]');
   sys.dbms_output.put_line(o_array.to_string);
end;
/
