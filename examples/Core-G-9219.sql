-- Core G-9219: Always follow naming conventions for collection types.

create or replace type dept_ot force as object (
   departement_id number
   -- ...
);
/

create or replace type depts as table of dept_ot;
/
