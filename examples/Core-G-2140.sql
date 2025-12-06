-- Core G-2140: Never initialize variables with NULL.

declare
   l_note varchar2(100 char) := null;
begin
   sys.dbms_output.put_line(l_note);
end;
/
