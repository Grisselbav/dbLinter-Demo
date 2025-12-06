-- Core G-9207: Always follow naming conventions for check constraints.

create table emp (
   -- ...
   sal number(7,2),
   constraint emp_sal check (sal > 0)
);
