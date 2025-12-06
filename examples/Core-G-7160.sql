-- Core G-7160: Always explicitly state parameter mode.

create or replace package employee_api is
   procedure store(io_id       in out employees.id%type
                  ,in_first_name      employees.first_name%type
                  ,in_last_name       employees.last_name%type
                  ,in_email           employees.email%type
                  ,in_department_id   employees.department_id%type
                  ,out_success out    pls_integer);
end employee_up;
/
