-- Core G-2340: Always define your VARCHAR2 variables using CHAR SEMANTIC (if not defined anchored).

create or replace package types_up is
   subtype description_type is varchar2(200);
end types_up;
/
