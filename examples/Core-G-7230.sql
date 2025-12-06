-- Core G-7230: Avoid declaring global variables public.

create or replace package employee_api as
   co_min_increase constant types_up.sal_increase_type := 0.01;
   co_max_increase constant types_up.sal_increase_type := 0.5;
   g_salary_increase types_up.sal_increase_type := co_min_increase;

   procedure set_salary_increase(in_increase in types_up.sal_increase_type);
   function salary_increase return types_up.sal_increase_type; -- @dbLinter ignore(G-7460) non-deterministic function
end employee_api;
/

create or replace package body employee_api as
   procedure set_salary_increase(in_increase in types_up.sal_increase_type) is
      co_increase constant types_up.sal_increase_type := in_increase;
   begin
      g_salary_increase := greatest(least(co_increase,co_max_increase)
                                   ,co_min_increase);
   end set_salary_increase;

   function salary_increase return types_up.sal_increase_type is -- @dbLinter ignore(G-7460) non-deterministic function
   begin
      return g_salary_increase;
   end salary_increase;
end employee_api;
/
