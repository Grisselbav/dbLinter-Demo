-- Core G-2190: Avoid using ROWID or UROWID. 

declare
   l_department_name departments.department_name%type;
   l_rowid           rowid;
begin
   update departments
      set department_name = l_department_name
    where rowid = l_rowid;
end;
/
