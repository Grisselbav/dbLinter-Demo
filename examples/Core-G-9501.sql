-- Core G-9501: Never use parameter in string expression of dynamic SQL. Use asserted local variable instead.

create or replace package body pkg is
    function f (in_table_name in varchar2) return boolean as
        co_templ     constant varchar2(4000 byte) := 'DROP TABLE #in_table_name# PURGE';
        l_table_name varchar2(128 byte);
        l_sql        varchar2(4000 byte);
    begin
        l_table_name := in_table_name;
        l_sql := replace(co_templ, '#in_table_name#', l_table_name);
        execute immediate l_sql;
        return true;
    end f;
end pkg;
/
