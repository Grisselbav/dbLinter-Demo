-- Core G-1270: Try to define a comment for each column.

create table parent (
   parent_id   raw(16) default sys_guid() not null,
   parent_name varchar2(100 char)         not null,
   constraint parent_pk primary key (parent_id),
   constraint parent_uk1 unique (parent_name)
);
