-- Core G-1210: Never create a table without a primary key.

create table t (
   id   integer           not null,
   name varchar2(20 char) not null
);
