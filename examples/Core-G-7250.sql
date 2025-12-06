-- Core G-7250: Never use RETURN in package initialization block.

create or replace package body employee_api as
   g_salary_increase types_up.sal_increase_type;

   procedure set_salary_increase(in_increase in types_up.sal_increase_type) is
      co_increase constant types_up.sal_increase_type := in_increase;
   begin
      g_salary_increase := greatest(least(co_increase,constants_up.max_salary_increase())
                                   ,constants_up.min_salary_increase());
   end set_salary_increase;

   function salary_increase return types_up.sal_increase_type is -- @dbLinter ignore(G-7460) non-deterministic function
   begin
      return g_salary_increase;
   end salary_increase;

begin
   g_salary_increase := constants_up.min_salary_increase();

   return;

   set_salary_increase(constants_up.min_salary_increase()); -- dead code
end employee_api;
/
