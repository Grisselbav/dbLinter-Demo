-- Core G-7310: Avoid standalone procedures – put your procedures in packages.

create or replace procedure my_procedure is
begin
   null;
end my_procedure;
/
