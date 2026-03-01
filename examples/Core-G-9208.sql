-- Core G-9208: Always follow naming conventions for assertions.

create assertion department_has_employees check (
   exists (
      select 1
        from departments d
       where exists (
                select 1
                  from employees e
                 where e.department_id = d.department_id                   
                   and e.department_id is not null -- avoiding ORA-08673
             )
   )
) initially deferred;
