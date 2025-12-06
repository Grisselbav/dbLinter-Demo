-- Core G-4340: Always use a NUMERIC FOR loop to process a dense array.

declare
   type t_employee_type is varray(10) of employees.employee_id%type;
   t_employees   t_employee_type;
   co_himuro     constant integer        := 118;
   co_livingston constant integer        := 177;
   co_min_value  constant simple_integer := 1;
   co_increment  constant simple_integer := 1;
   i             pls_integer;
begin
   t_employees := t_employee_type(co_himuro,co_livingston);
   i           := co_min_value;

   <<process_employees>>
   loop
      exit process_employees when i > t_employees.count();
      sys.dbms_output.put_line(t_employees(i));
      i := i + co_increment;
   end loop process_employees;
end;
/
