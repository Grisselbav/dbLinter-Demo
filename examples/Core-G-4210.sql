-- Core G-4210: Try to use CASE rather than an IF statement with multiple ELSIF paths.

declare
   l_color types_up.color_code_type;
begin
   if l_color = constants_up.co_red then
      my_package.do_red();
   elsif l_color = constants_up.co_blue then
      my_package.do_blue();
   elsif l_color = constants_up.co_black then
      my_package.do_black();
   end if;
end;
/
