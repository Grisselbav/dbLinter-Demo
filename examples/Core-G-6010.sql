-- Core G-6010: Always use a character variable to execute dynamic SQL.

declare
   l_next_val employees.employee_id%type;
begin
   execute immediate 'select employees_seq.nextval from dual'
      into l_next_val;
end;
/
