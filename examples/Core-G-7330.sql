-- Core G-7330: Always assign values to OUT parameters.

create or replace package body my_package is
   procedure greet(
      in_name      in  varchar2
     ,out_greeting out varchar2
   ) is
      l_message types_up.text;
      co_name   constant employees.first_name := in_name;
      co_hello  constant types_up.text        := 'Hello, ';
   begin
      l_message := co_hello || co_name;
   end greet;
end my_package;
/
