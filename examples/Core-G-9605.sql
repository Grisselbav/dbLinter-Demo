-- Core G-9605: Never use an invalid stats keyword.

select /*+ table_stats(emp default rec=14 blk=1 rowlen=10) */ empno, ename
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
