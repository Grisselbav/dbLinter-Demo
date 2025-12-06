-- Core G-9109: Always follow naming conventions for OUT parameters of functions and procedures.

create or replace package p is
   procedure p2(param out integer);
end p;
/
