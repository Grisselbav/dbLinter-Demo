-- Core G-8510: Always use dbms_application_info to track program process transiently.

create or replace package body employee_api is
   procedure process_emps is
   begin
      <<employees>>
      for emp_rec in (
         select employee_id
           from employees
          order by employee_id
      )
      loop
         -- some processing
         sys.dbms_output.put_line(emp_rec.employee_id);
      end loop employees;
   end process_emps;
end employee_api;
/
