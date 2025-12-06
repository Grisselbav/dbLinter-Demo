-- Core G-7520: Avoid using deprecated units in your own code.

begin
   sys.dbms_lock.sleep(1);
end;
/
