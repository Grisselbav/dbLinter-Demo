-- Core G-4110: Always use %NOTFOUND instead of NOT %FOUND to check whether a cursor returned data.

declare
   cursor c_employees is
      select *
        from employees
       order by employee_id;

   type t_employees_type is table of c_employees%rowtype;
   t_employees  t_employees_type;
   co_bulk_size constant simple_integer := 10;
begin
   open c_employees;

   <<process_employees>>
   loop
      fetch c_employees bulk collect into t_employees limit co_bulk_size;

      <<display_employees>>
      for i in 1..t_employees.count()
      loop
         sys.dbms_output.put_line(t_employees(i).last_name);
      end loop display_employees;

      exit process_employees when not c_employees%found;
   end loop process_employees;

   close c_employees;
end;
/
