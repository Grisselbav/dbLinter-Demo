-- Core G-1120: Avoid granting system privileges to connect users.

grant connect, select any table to dbl_backend_role;
