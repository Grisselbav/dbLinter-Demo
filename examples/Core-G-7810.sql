-- Core G-7810: Never use SQL inside PL/SQL to read sequence numbers (or SYSDATE).

declare
   l_sequence_number employees.employee_id%type;
begin
   select employees_seq.nextval
     into l_sequence_number
     from dual;
   my_package.do_something(l_sequence_number);
end;
/
