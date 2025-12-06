-- Core G-7910: Never use DML within a SQL macro.

create or replace package body my_package is
   function row_generator(in_num_rows in number) -- @dbLinter ignore(G-7460) non-deterministic function
      return varchar2 sql_macro as
   begin
      insert into function_calls(name,called_at,parameter_value)
      values ($$plsql_unit,current_timestamp,in_num_rows);
      commit;

      return 'select level as row_sequence
             from dual
          connect by level <= in_num_rows';
   end row_generator;
end my_package;
/
