-- Core G-9204: Always follow naming conventions for primary key constraints.

create table emp (
   empno number(4,0) not null,
   -- ...
   constraint emp#primary#key primary key (empno)
);
