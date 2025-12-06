-- Core G-8120: Never check existence of a row to decide whether to create it or not.

create or replace package body department_api is
   procedure ins(in_r_department in departments%rowtype) is
      l_count pls_integer;
   begin
      select count(*)
        into l_count
        from departments
       where department_id = in_r_department.department_id;

      if l_count = 0 then
         insert into departments
         values in_r_department;
      end if;
   end ins;
end department_api;
/
