-- Core G-4240: Always use a CASE instead of a NVL2 command if parameter 2 or 3 of NVL2 is either a function call or a SELECT statement.

select nvl2(dummy,my_package.expensive_nn(value_in => dummy)
         ,my_package.expensive_null(value_in => dummy))
  from dual;
