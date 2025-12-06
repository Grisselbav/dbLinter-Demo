-- Core G-4360: Always use a WHILE loop to process a loose array.

declare -- raises no_data_found when processing 2nd record
   type t_employee_type is table of employees.employee_id%type;
   t_employees    t_employee_type;
   co_rogers      constant integer := 134;
   co_matos       constant integer := 143;
   co_mcewen      constant integer := 158;
   co_index_matos constant integer := 2;
begin
   t_employees := t_employee_type(co_rogers,co_matos,co_mcewen);
   t_employees.delete(co_index_matos);

   if t_employees is not null then
      <<process_employees>>
      for i in 1..t_employees.count()
      loop
         sys.dbms_output.put_line(t_employees(i));
      end loop process_employees;
   end if;
end;
/
