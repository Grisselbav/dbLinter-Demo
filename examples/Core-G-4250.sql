-- Core G-4250: Avoid using identical conditions in different branches of the same IF or CASE statement.

declare
   l_color types_up.color_code_type;
begin
   case l_color
      when constants_up.co_red then
         my_package.do_red();
      when constants_up.co_blue then
         my_package.do_blue();
      when constants_up.co_red then  -- never reached
         my_package.do_black();      -- dead code
      else
         null;
   end case;
end;
/
