-- Core G-1130: Avoid granting table access to API roles.

create table t (c1 integer);
grant read, update on t to dbl_backend_role;
grant read on dbl_dbms to public;
grant read on dbl_severity_levels to dbl_backend;
