-- Core G-7180: Try to keep the complexity of functions, procedures and triggers simple.

create or replace package job_util as
   function max_salary(in_job_id in varchar2) return integer deterministic;
end job_util;
/
create or replace package body job_util as
   function max_salary(in_job_id in varchar2) return integer deterministic is
      l_result integer;
   begin
      case in_job_id
         when 'AC_ACCOUNT' then l_result := 9000;
         when 'AC_MGR'     then l_result := 16000;
         when 'AD_ASST'    then l_result := 6000;
         when 'AD_PRES'    then l_result := 40000;
         when 'AD_VP'      then l_result := 30000;
         when 'FI_ACCOUNT' then l_result := 9000;
         when 'FI_MGR'     then l_result := 16000;
         when 'HR_REP'     then l_result := 9000;
         when 'IT_PROG'    then l_result := 10000;
         when 'MK_MAN'     then l_result := 15000;
         when 'MK_REP'     then l_result := 9000;
         when 'PR_REP'     then l_result := 10500;
         when 'PU_CLERK'   then l_result := 5500;
         when 'PU_MAN'     then l_result := 15000;
         when 'SA_MAN'     then l_result := 20080;
         when 'SA_REP'     then l_result := 12008;
         when 'SH_CLERK'   then l_result := 5500;
         when 'ST_CLERK'   then l_result := 5000;
         when 'ST_MAN'     then l_result := 8500;
         else l_result := 0;
      end case;
      return l_result;
   end max_salary;
end job_util;
/
