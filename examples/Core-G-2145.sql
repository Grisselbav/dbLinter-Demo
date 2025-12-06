-- Core G-2145: Never self-assign a variable.

declare
   co_parallel_degree constant types_up.name%type := 'parallel_degree';
   l_function_result  pls_integer;
   l_parallel_degree  pls_integer;
begin
   l_function_result := maintenance.get_config(co_parallel_degree);
   if l_function_result is not null then
      l_parallel_degree := l_parallel_degree;
      do_something(l_parallel_degree);
   end if;
end;
/
