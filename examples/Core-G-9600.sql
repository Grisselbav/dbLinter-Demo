-- Core G-9600: Never define more than one comment with hints.

select -- a comment
       /*+ full(e) */
       /* another comment */
       --+ full(d)
       e.empno,
       e.ename,
       d.dname
  from emp e
  join dept d
    on d.deptno = e.deptno
 where empno > 7900;

select * from dbms_xplan.display_cursor(format => 'basic +hint_report');

/*
------------------------------------------------
| Id  | Operation                    | Name    |
------------------------------------------------
|   0 | SELECT STATEMENT             |         |
|   1 |  NESTED LOOPS                |         |
|   2 |   NESTED LOOPS               |         |
|   3 |    TABLE ACCESS FULL         | EMP     |
|   4 |    INDEX UNIQUE SCAN         | PK_DEPT |
|   5 |   TABLE ACCESS BY INDEX ROWID| DEPT    |
------------------------------------------------

Hint Report (identified by operation id / Query Block Name / Object Alias):
Total hints for statement: 1
---------------------------------------------------------------------------

   3 -  SEL$58A6D7F6 / E@SEL$1
           -  full(e)
*/
