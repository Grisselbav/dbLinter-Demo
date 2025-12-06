-- Core G-1230: Avoid tables without relationships.

create table parent (
   parent_id   raw(16) default sys_guid() not null,
   parent_name varchar2(100 char)         not null,
   constraint parent_pk primary key (parent_id)
);

create table child (
   child_id   raw(16) default sys_guid() not null,
   parent_id  raw(16)                    not null,
   child_name varchar2(100 char)         not null,
   constraint child_pk primary key (child_id)
);
