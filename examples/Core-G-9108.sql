-- Core G-9108: Always follow naming conventions for IN parameters of functions and procedures.

create or replace package p is
   procedure p2(param in integer);
end p;
/
