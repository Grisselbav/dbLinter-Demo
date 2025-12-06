-- Core G-9112: Always follow naming conventions for collection type definitions (arrays/tables).

declare
   type t_varray is varray(10) of string;
   type nested_table_type is table of string;
   type x_assoc_array_y is table of string index by pls_integer;
begin
   null;
end;
/
