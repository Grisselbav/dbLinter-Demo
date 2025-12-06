-- Core G-9215: Always follow naming conventions for functions.

create or replace package departement_api is
   -- ...
   function département_id_par_nom(in_nom in varchar2) return number;
end;
/
