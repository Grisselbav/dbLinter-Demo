-- Core G-4350: Always use 1 as lower and COUNT() as upper bound when looping through a dense array. 

declare
   type t_employee_type is table of employees.employee_id%type;
   t_employees t_employee_type := t_employee_type();
begin
   <<process_employees>>
   for i in t_employees.first()..t_employees.last()
   loop
      sys.dbms_output.put_line(t_employees(i)); -- some processing
   end loop process_employees;
end;
/
