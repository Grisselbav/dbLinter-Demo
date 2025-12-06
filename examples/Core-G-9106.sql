-- Core G-9106: Always follow naming conventions for object variables.

create or replace type dept_type as object (
   deptno integer,
   dname  varchar2(14 char),
   loc    varchar2(13 char)
);
/

declare
   dept dept_type;
begin
   null;
end;
/
