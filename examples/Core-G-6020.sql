-- Core G-6020: Try to use output bind arguments in the RETURNING INTO clause of dynamic DML statements rather than the USING clause. 

create or replace package body employee_api is
   procedure upd_salary(
      in_employee_id  in  employees.employee_id%type
     ,in_increase_pct in  types_up.percentage
     ,out_new_salary  out employees.salary%type
   )
   is
      co_employee_id  constant employees.employee_id%type := in_employee_id;
      co_increase_pct constant types_up.percentage        := in_increase_pct;
      co_sql_stmt     constant types_up.big_string_type   := '
           update employees set salary = salary + (salary / 100 * :1)
            where employee_id = :2
        returning salary into :3';
   begin
      execute immediate co_sql_stmt
         using co_increase_pct,co_employee_id,out out_new_salary;
   end upd_salary;
end employee_api;
/
