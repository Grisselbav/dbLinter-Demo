-- Core G-9104: Always follow naming conventions for record variables.

declare
   emp  emp%rowtype;
   type r_dept_type is record(
         deptno number,
         dname  varchar2(14 char),
         loc    varchar2(13 char)
      );
   dept r_dept_type;
begin
   null;
end;
/
