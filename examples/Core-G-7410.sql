-- Core G-7410: Avoid standalone functions – put your functions in packages.

create or replace function my_function return varchar2
   deterministic
is
begin
   return null;
end my_function;
/
