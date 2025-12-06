-- Core G-3150: Try to use identity columns for surrogate keys.

create table locations (
   location_id        number(10)        not null
  ,location_name      varchar2(60 char) not null
  ,city               varchar2(30 char) not null
  ,constraint locations_pk primary key (location_id)
  )
/

create sequence location_seq start with 1 cache 20
/

create or replace trigger location_br_i
before insert on locations
for each row
begin
   :new.location_id := location_seq.nextval;
end;
/
