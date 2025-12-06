-- Core G-1110: Avoid connect users that own database objects.

-- database objects owned by connect user
create table t1 (c1 integer);
create view v1 as select * from t1;
