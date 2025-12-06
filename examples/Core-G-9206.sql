-- Core G-9206: Always follow naming conventions for foreign key constraints.

create table parent (
   parent_id raw(16) default sys_guid() not null,
   -- ...
   constraint parent_pk primary key (parent_id)
);

create table child (
   -- ...
   parent_id  raw(16) not null,
   constraint child_parent foreign key (parent_id) references parent
);
