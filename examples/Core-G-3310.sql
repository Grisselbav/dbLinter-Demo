-- Core G-3310: Never commit within a cursor loop.

declare
   l_counter          integer                           := 0;
   l_discount         discount.percentage%type;
   co_status_new      constant orders.order_status%type := 'New';
   co_commit_interval constant integer                  := 100;
begin
   <<new_orders>>
   for r_order in (
      select o.order_id,o.customer_id
        from orders o
       where o.order_status = co_status_new
   )
   loop
      l_discount := sales_api.calculate_discount(p_customer_id => r_order.customer_id);

      update order_lines ol
         set ol.discount = l_discount
       where ol.order_id = r_order.order_id;

      l_counter  := l_counter + 1;
      if l_counter = co_commit_interval then
         commit;
         l_counter := 0;
      end if;
   end loop new_orders;
   if l_counter > 0 then
      commit;
   end if;
end;
/
