-- Core G-4310: Never use GOTO statements in your code.

create or replace package body my_package is
   procedure password_check(in_password in varchar2) is
      co_password    constant dba_users.password%type := in_password;
      co_digitarray  constant varchar2(10 char)       := '0123456789';
      co_lower_bound constant simple_integer          := 1;
      co_errno       constant simple_integer          := -20501;
      co_errmsg      constant varchar2(100 char)      := 'Password must contain a digit.';
      l_isdigit      boolean                          := false;
      l_len_pw       pls_integer;
      l_len_array    pls_integer;
   begin
      l_len_pw    := length(co_password);
      l_len_array := length(co_digitarray);

      <<check_digit>>
      for i in co_lower_bound..l_len_array
      loop
         <<check_pw_char>>
         for j in co_lower_bound..l_len_pw
         loop
            if substr(co_password,j,1) = substr(co_digitarray,i,1) then
               l_isdigit := true;
               goto check_other_things;
            end if;
         end loop check_pw_char;
      end loop check_digit;

      <<check_other_things>>
      null;

      if not l_isdigit then
         raise_application_error(co_errno,co_errmsg);
      end if;
   end password_check;
end my_package;
/
