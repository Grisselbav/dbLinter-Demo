-- Core G-2310: Avoid using CHAR data type.

create or replace package types_up
is
   subtype description_type is char(200);
end types_up;
/
