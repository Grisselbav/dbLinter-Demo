-- Core G-9105: Always follow naming conventions for collection variables (arrays/tables).

declare
   type t_varray_type is varray(10) of string;
   array1 t_varray_type;
   type t_nested_table_type is table of string;
   array2 t_nested_table_type;
   type t_assoc_array_type is table of string index by pls_integer;
   array3 t_assoc_array_type;
begin
   null;
end;
/
