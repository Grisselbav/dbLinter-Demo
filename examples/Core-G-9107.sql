-- Core G-9107: Always follow naming conventions for cursor parameters.

declare
   cursor c_emp(in_ename in varchar2) is
      select *
        from emp
       where ename like in_ename;
begin
   null;
end;
/
