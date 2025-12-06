-- Core G-4230: Always use a COALESCE instead of a NVL command, if parameter 2 of the NVL function is a function call or a SELECT statement.

select nvl(dummy,my_package.expensive_null(value_in => dummy))
  from dual;
