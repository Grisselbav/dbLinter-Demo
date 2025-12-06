-- Core G-9116: Always follow naming conventions for record fields.

declare
   type r_dept_type is
      record(
         numéro_de_département number,
         nom                   varchar2(30 char)
      );
begin
   null;
end;
/
