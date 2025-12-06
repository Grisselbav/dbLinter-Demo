-- Core G-9110: Always follow naming conventions for IN/OUT parameters of functions and procedures.

create or replace package p is
   procedure p2(param in out integer);
end p;
/
