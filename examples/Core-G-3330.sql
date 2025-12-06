-- Core G-3330: Avoid autonomous transactions.

create or replace package body dept_api is
   procedure ins_dept(in_dept_row in dept%rowtype) is
      pragma autonomous_transaction;
   begin
      insert into dept
      values in_dept_row;
      commit; -- required by autonomous transaction
   end ins_dept;
end dept_api;
/
