-- Core G-9209: Always follow naming conventions for global temporary tables.

create global temporary table département_tmp (
    id number(8,0) not null
    -- ...
) on commit preserve rows;
