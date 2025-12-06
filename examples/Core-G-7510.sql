-- Core G-7510: Always prefix Oracle supplied packages with owner schema name.

declare
   co_hello_world constant varchar2(30 char) := 'Hello World';
begin
   dbms_output.put_line(co_hello_world);
end;
/
