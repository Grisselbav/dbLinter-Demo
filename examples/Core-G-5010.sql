-- Core G-5010: Try to use a error/logging framework for your application.

declare
   co_start constant logger_logs.text%type := 'start';
   co_end   constant logger_logs.text%type := 'end';
begin
   sys.dbms_output.put_line(co_start);
   -- some processing
   sys.dbms_output.put_line(co_end);
end;
/
