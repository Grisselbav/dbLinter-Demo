-- Core G-5050: Avoid use of the RAISE_APPLICATION_ERROR built-in procedure with a hard-coded 20nnn error number or hard-coded message. 

declare
   co_invalid_emp_text constant types_up.text := 'Invalid employee_id';
begin
   raise_application_error(-20501,co_invalid_emp_text);
end;
/
