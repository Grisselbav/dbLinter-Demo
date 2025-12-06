-- Core G-1150: Always limit privileges of schema owners according to principle of least privileges.

grant select any table to dbl_owner;
