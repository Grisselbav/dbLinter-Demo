-- Core G-4260: Avoid inverting boolean conditions with NOT.

declare
   l_color types_up.color_code_type;
begin
   if not l_color != constants_up.co_red then
      my_package.do_red();
   end if;
end;
/
