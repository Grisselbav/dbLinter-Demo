-- Core G-4330: Always use a CURSOR FOR loop to process the complete cursor results unless you are using bulk operations.

declare
   cursor c_employees is
      select employee_id,last_name
        from employees;
   r_employee c_employees%rowtype;
begin
   open c_employees;

   <<read_employees>>
   loop
      fetch c_employees into r_employee;
      exit read_employees when c_employees%notfound;
      sys.dbms_output.put_line(r_employee.last_name);
   end loop read_employees;

   close c_employees;
end;
/
