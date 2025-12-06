-- Core G-2320: Never use VARCHAR data type.

create or replace package types_up is
   subtype description_type is varchar(200);
end types_up;
/
