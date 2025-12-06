-- Core G-9216: Always follow naming conventions for procedures.

create or replace package department_api is
   -- ...
   procedure fermer_département(in_id in number);
end;
/
