-- Core G-7130: Always use parameters or pull in definitions rather than referencing external variables in a local program unit.

create or replace package body employee_api is
   procedure calc_salary(in_employee_id in integer) is
      co_employee_id constant employees.employee_id%type := in_employee_id;
      r_emp          employees%rowtype;

      function commission return number is -- @dbLinter ignore(G-7460) non-deterministic function
         l_commission employees.salary%type := 0;
      begin
         if r_emp.commission_pct is not null then
            l_commission := r_emp.salary * r_emp.commission_pct;
         end if;

         return l_commission;
      end commission;
   begin
      select *
        into r_emp
        from employees
       where employee_id = co_employee_id;

      sys.dbms_output.put_line(r_emp.salary + commission());
   exception
      when no_data_found then
         null;
      when too_many_rows then
         null;
   end calc_salary;
end employee_api;
/
