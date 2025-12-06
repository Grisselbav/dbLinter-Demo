-- Core G-9604: Never use an invalid stats method.

select /*+ table_stats(emp faster rows=14) */ empno, ename
  from emp e
 where deptno = 20;
select * from dbms_xplan.display_cursor(format => 'basic +hint_report');

/*
----------------------------------
| Id  | Operation         | Name |
----------------------------------
|   0 | SELECT STATEMENT  |      |
|   1 |  TABLE ACCESS FULL| EMP  |
----------------------------------

Hint Report (identified by operation id / Query Block Name / Object Alias):
Total hints for statement: 1 (E - Syntax error (1))
---------------------------------------------------------------------------

   1 -  SEL$1
         E -  table_stats
*/
