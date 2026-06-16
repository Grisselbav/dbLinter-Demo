-- Core G-7127: Always use the FORCE option when creating views.

create or replace view dept_sal_v as
select d.deptno, d.dname, sum(e.sal + nvl(e.comm, 0)) as sal
  from dept d
  left join emps e
    on e.deptno = d.deptno
 group by d.deptno, d.dname;
