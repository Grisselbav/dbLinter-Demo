-- Core G-2210: Avoid declaring NUMBER variables, constants or subtypes with no precision.

create or replace package types_up is
   subtype salary_type is number;
end types_up;
/
