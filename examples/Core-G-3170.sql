-- Core G-3170: Always use DEFAULT ON NULL declarations to assign default values to table columns if you refuse to store NULL values.

create table null_test (
   test_case        number(2) not null
  ,column_defaulted varchar2(10 char) default 'Default' null)
/
insert into null_test(test_case,column_defaulted) values (1,'Value');
insert into null_test(test_case,column_defaulted) values (2,default);
insert into null_test(test_case,column_defaulted) values (3,null);

select test_case,column_defaulted from null_test;
