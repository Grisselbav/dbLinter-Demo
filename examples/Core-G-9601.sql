-- Core G-9601: Never use unknown hints.

insert --+ nologging append
  into sales_hist
select * from sales;

select * from dbms_xplan.display_cursor(format => 'basic');

/*
-----------------------------------------------
| Id  | Operation                | Name       |
-----------------------------------------------
|   0 | INSERT STATEMENT         |            |
|   1 |  LOAD TABLE CONVENTIONAL | SALES_HIST |
|   2 |   PARTITION RANGE ALL    |            |
|   3 |    TABLE ACCESS FULL     | SALES      |
-----------------------------------------------
*/
