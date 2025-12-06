-- Core G-4270: Avoid comparing boolean values to boolean literals.

declare
   co_string  constant types_up.text := '42';
   l_is_valid boolean;
begin
   l_is_valid := my_package.is_valid_number(co_string);
   if l_is_valid = true then
      my_package.convert_number(l_string);
   end if;
end;
/
