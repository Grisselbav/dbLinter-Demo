-- Core G-9603: Never reference an unknown table/alias.

select --+ leading(emps depts)
       *
  from emp
  join dept on emp.deptno = dept.deptno;

select * from dbms_xplan.display_cursor(format => 'basic +hint_report');

/*
------------------------------------------------
| Id  | Operation                    | Name    |
------------------------------------------------
|   0 | SELECT STATEMENT             |         |
|   1 |  MERGE JOIN                  |         |
|   2 |   TABLE ACCESS BY INDEX ROWID| DEPT    |
|   3 |    INDEX FULL SCAN           | PK_DEPT |
|   4 |   SORT JOIN                  |         |
|   5 |    TABLE ACCESS FULL         | EMP     |
------------------------------------------------

Hint Report (identified by operation id / Query Block Name / Object Alias):
Total hints for statement: 1 (U - Unused (1))
---------------------------------------------------------------------------

   1 -  SEL$58A6D7F6
         U -  leading(emps depts)
*/
