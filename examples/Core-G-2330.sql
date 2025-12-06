-- Core G-2330: Never use zero-length strings to substitute NULL.

create or replace package body constants_up is
   function null_string return varchar2
      deterministic
   is
   begin
      return '';
   end null_string;
end constants_up;
/
