-- Core G-5070: Avoid using Oracle predefined exceptions.

begin
   raise no_data_found;
end;
/
