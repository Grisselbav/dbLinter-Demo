-- Core G-8410: Always use application locks to ensure a program unit is only running once at a given time.

/* Example */
create or replace package body lock_up is
   -- manage locks in a dedicated table created as follows:
   --   CREATE TABLE app_locks (
   --      lock_name VARCHAR2(128 CHAR) NOT NULL primary key
   --   );

   procedure request_lock(in_lock_name in varchar2) is
      co_lock_name constant app_locks.lock_name%type := in_lock_name;
   begin
      -- raises dup_val_on_index
      insert into app_locks (lock_name) values (co_lock_name);
   end request_lock;

   procedure release_lock(in_lock_name in varchar2) is
      co_lock_name constant app_locks.lock_name%type := in_lock_name;
   begin
      delete from app_locks where lock_name = co_lock_name;
   end release_lock;
end lock_up;
/

/* Call bad example */
declare
   co_lock_name constant app_locks.lock_name%type := 'APPLICATION_LOCK';
begin
   lock_up.request_lock(in_lock_name => co_lock_name);
   -- processing
   lock_up.release_lock(in_lock_name => co_lock_name);
exception
   when dup_val_on_index then
      -- expected exception
      lock_up.release_lock(in_lock_name => co_lock_name);
      raise;
   when others then
      -- unexpected exception, logging is recommended
      lock_up.release_lock(in_lock_name => co_lock_name);
      raise;
end;
/
