-- Core G-1070: Avoid nesting comment blocks.

begin
   /* comment one -- nested comment two */
   null;
   -- comment three /* nested comment four */
   null;
end;
/
