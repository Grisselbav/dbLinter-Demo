-- Core G-9205: Always follow naming conventions for unique constraints.

create table emp (
   -- ...
   ename varchar2(14 char) not null,
   -- ...
   constraint ename unique (ename)
);
