-- Core G-5030: Never assign predefined exception names to user defined exceptions.

declare
   l_dummy          dual.dummy%type;
   no_data_found    exception;
   co_rownum        constant simple_integer           := 0;
   co_no_data_found constant types_up.short_text_type := 'no_data_found';
begin
   select dummy
     into l_dummy
     from dual
    where rownum = co_rownum;

   if l_dummy is null then
      raise no_data_found;
   end if;
exception
   when no_data_found then
      sys.dbms_output.put_line(co_no_data_found);
end;
/
