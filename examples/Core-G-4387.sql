-- Core G-4387: Never use a FOR LOOP for a query that should return not more than one row.

create or replace package body employee_api is
   function emp_name(in_empno in integer) return varchar2 is -- @dbLinter ignore(G-7460) non-deterministic function
      l_ename emp.ename%type;
   begin
      <<fetch_name>>
      for r in (
         select ename
           from emp
          where empno = in_empno
      )
      loop
         l_ename := r.ename;
      end loop fetch_name;
      return l_ename;
   end emp_name;
end employee_api;
/
