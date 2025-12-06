-- Core G-3110: Always specify the target columns when coding an insert statement.

create or replace package body dept_api is
   procedure ins_dept(in_dept_row in dept%rowtype) is
   begin
      insert into departments
      values (
         departments_seq.nextval
        ,in_dept_row.department_name
        ,in_dept_row.manager_id
        ,in_dept_row.location_id
      );
   end ins_dept;
end dept_api;
/
