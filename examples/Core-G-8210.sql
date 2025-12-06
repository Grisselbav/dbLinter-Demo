-- Core G-8210: Always use synonyms when accessing objects of another application schema.

declare
   l_product_name oe.products.product_name%type;
   co_price       constant oe.products.list_price%type := 1000;
begin
   select p.product_name
     into l_product_name
     from oe.products p
    where list_price > co_price;
exception
   when no_data_found then
      null; -- handle_no_data_found;
   when too_many_rows then
      null; -- handle_too_many_rows;
end;
/
