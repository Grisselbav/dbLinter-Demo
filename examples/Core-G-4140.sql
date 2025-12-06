-- Core G-4140: Avoid executing any statements between a SQL operation and the usage of an implicit cursor attribute.

create or replace package body employee_api as
   co_one constant simple_integer := 1;
   co_msg constant types_up.text  := 'Do something based on ';

   procedure process_dept(in_dept_id in departments.department_id%type) is
      co_dept_id constant departments.department_id%type := in_dept_id;
   begin
      sys.dbms_output.put_line(co_msg || co_dept_id);
   end process_dept;

   procedure remove_employee(in_employee_id in employees.employee_id%type) is
      co_employee_id constant departments.department_id%type := in_employee_id;
      l_dept_id      employees.department_id%type;
   begin
      delete from employees
       where employee_id = co_employee_id
   returning department_id into l_dept_id;

      process_dept(in_dept_id => l_dept_id);

      if sql%rowcount > co_one then
         -- too many rows deleted.
         rollback;
      end if;
   end remove_employee;
end employee_api;
/
