/*
* Copyright 2025 Philipp Salvisberg <philipp.salvisberg@examples/grisselbav.com>
*/

set echo off
prompt
prompt ================================================================================================================
prompt Start of install.sql
prompt ================================================================================================================

set define off
set sqlblanklines on
set verify off
set feedback off

prompt spool install.log...
whenever sqlerror exit failure
whenever oserror exit failure
spool install.log

prompt
prompt ================================================================================================================
prompt Log Database User used for installation (expected SYS)
prompt ================================================================================================================

select user;

prompt
prompt ================================================================================================================
prompt Roles
prompt ================================================================================================================

prompt create role dbl_backend_role...
create role if not exists dbl_backend_role;
grant create session to dbl_backend_role;

prompt
prompt ================================================================================================================
prompt Users
prompt ================================================================================================================

prompt create user dbl_owner...
create user if not exists dbl_owner
   no authentication
   default tablespace users
   quota 1g on users;

prompt create user dbl_backend...
create user if not exists dbl_backend
   no authentication;
grant dbl_backend_role to dbl_backend;

prompt create user dbl_read...
create user if not exists dbl_read identified by dbl_read;
grant connect to dbl_read;
grant select any dictionary to dbl_read;

prompt
prompt ================================================================================================================
prompt DBL_OWNER schema
prompt ================================================================================================================

prompt alter session set current_schema = dbl_owner...
alter session set current_schema = dbl_owner;

prompt
prompt ================================================================================================================
prompt Domains
prompt ================================================================================================================

prompt create domain dbl_description...
create domain if not exists dbl_description
   as varchar2(200 char) strict;

prompt create domain dbl_identifier...
create domain if not exists dbl_identifier
   as raw(16) strict
   -- formatted 36 character GUID
   display lower(substr(rawtohex(dbl_identifier), 1, 8)
           || '-' || substr(rawtohex(dbl_identifier), 9, 4)
           || '-' || substr(rawtohex(dbl_identifier), 13, 4)
           || '-' || substr(rawtohex(dbl_identifier), 17, 4)
           || '-' || substr(rawtohex(dbl_identifier), 21, 12));

prompt create domain dbl_name...
create domain if not exists dbl_name
   as varchar2(100 char) strict;

prompt create domain dbl_small_integer...
create domain if not exists dbl_small_integer
   as number(5,0) strict
   -- integer must fit into a 16 bit integer
   constraint dbl_small_integer_ck check (dbl_small_integer between -32767 and 32767);

prompt
prompt ================================================================================================================
prompt Tables
prompt ================================================================================================================

prompt create table dbl_dbms...
create table if not exists dbl_dbms (
    dbms_id          dbl_identifier default on null for insert only sys_guid() not null,
    dbms_name        dbl_name                           not null,
    dbms_name_lower  varchar2(100 char) invisible generated always as (lower(dbms_name)) virtual not null,
    dbms_description dbl_description                    not null,
    constraint dbl_dbms_pk primary key (dbms_id),
    constraint dbl_dbms_uk1 unique (dbms_name),
    constraint dbl_dbms_uk2 unique (dbms_name_lower)
);

prompt create table dbl_severity_levels...
create table if not exists dbl_severity_levels (
    sevl_id          dbl_identifier default on null for insert only sys_guid() not null,
    sevl_name        dbl_name                             not null,
    sevl_name_lower  varchar2(100 char) invisible generated always as (lower(sevl_name)) virtual not null,
    sevl_priority    dbl_small_integer                    not null,
    sevl_description dbl_description                      not null,
    constraint dbl_severity_levels_pk primary key (sevl_id),
    constraint dbl_severity_levels_uk1 unique (sevl_name),
    constraint dbl_severity_levels_uk2 unique (sevl_name_lower),
    constraint dbl_severity_levels_uk3 unique (sevl_priority),
    constraint dbl_severity_levels_sevl_priority_ck check (sevl_priority between 1 and 5)
);

prompt create table employees...
create table employees (
   employee_id    number(6,0),
	first_name     varchar2(20 byte),
	last_name      varchar2(25 byte) not null,
	email          varchar2(25 byte) not null,
	phone_number   varchar2(20 byte),
	hire_date      date              not null,
	job_id         varchar2(10 byte) not null,
	salary         number(8,2),
	commission_pct number(2,2),
	manager_id     number(6,0),
	department_id  number(4,0)
);

prompt
prompt ================================================================================================================
prompt Relational views
prompt ================================================================================================================

prompt create view dbl_configs_v...
create or replace view dbl_configs_v as select '42' as dummy;

prompt create view dbl_config_rules_v...
create or replace view dbl_config_rules_v as select '42' as dummy;

prompt
prompt ================================================================================================================
prompt Packages
prompt ================================================================================================================

prompt package constants_up...
create or replace package constants_up is
   function small_increase return decimal deterministic;
end constants_up;
/

prompt package body constants_up...
create or replace package body constants_up is
   function small_increase return decimal deterministic is
   begin
      return 1.03;
   end small_increase;
end constants_up;
/

prompt package employee_api...
create or replace package employee_api is
   function employee_by_id(in_employee_id in employees.employee_id%type) -- @dbLinter ignore(G-7460) nondeterministic function
      return employees%rowtype;
end employee_api;
/

prompt package body employee_api...
create or replace package body employee_api is
   function employee_by_id(in_employee_id in employees.employee_id%type) -- @dbLinter ignore(G-7460) nondeterministic function
      return employees%rowtype is
      co_employee_id constant employees.employee_id%type := in_employee_id;
      r_employee employees%rowtype;
   begin
      select * into r_employee
        from employees
       where employee_id = co_employee_id;
      return r_employee;
   exception
      when no_data_found or too_many_rows then
         null;
   end employee_by_id;
end employee_api;
/

prompt
prompt ================================================================================================================
prompt Examples for SQL-based tests
prompt ================================================================================================================

prompt Core-G-1110...
alter session set current_schema = dbl_backend;
@examples/Core-G-1110
alter session set current_schema = dbl_owner;

prompt Core-G-1120...
@examples/Core-G-1120

prompt Core-G-1130...
@examples/Core-G-1130

prompt Core-G-1140...
@examples/Core-G-1140

prompt Core-G-1150...
@examples/Core-G-1150

prompt Core-G-1220...
@examples/Core-G-1220

prompt Core-G-1240...
@examples/Core-G-1240

prompt Core-G-1310...
@examples/Core-G-1310

prompt Core-G-3160...
set termout off
whenever sqlerror continue
spool off
@examples/Core-G-3160
spool install.log append
whenever sqlerror exit failure
set termout on

prompt Core-G-3170...
@examples/Core-G-3170

prompt Core-G-9202...
@examples/Core-G-9202

prompt Core-G-9203...
@examples/Core-G-9203

prompt Core-G-9204...
@examples/Core-G-9204

prompt Core-G-9209...
@examples/Core-G-9209

prompt Core-G-9211..
@examples/Core-G-9211

prompt Core-G-9216...
@examples/Core-G-9216

prompt Core-G-9218...
@examples/Core-G-9218

prompt
prompt ================================================================================================================
prompt End of install.sql
prompt ================================================================================================================

prompt done.
spool off
exit;
