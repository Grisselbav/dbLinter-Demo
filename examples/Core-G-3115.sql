-- Core G-3115: Avoid self-assigning a column.

update employees
   set first_name = first_name;
