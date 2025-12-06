-- Core G-9111: Always follow naming conventions for record type definitions.

declare
   type dept_typ is
      record(
         deptno number,
         dname  varchar2(14 char),
         loc    varchar2(13 char)
      );
begin
   null;
end;
/
