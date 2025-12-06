-- Core G-5080: Always use FORMAT_ERROR_BACKTRACE when using FORMAT_ERROR_STACK or SQLERRM.

create or replace package body order_api as
   procedure discount_and_recalculate(
      in_customer_id in integer
     ,in_discount    in number
   ) is
      co_customer_id constant customer.id%type                  := in_customer_id;
      co_discount    constant customer.discount_percentage%type := in_discount;
   begin
      customer_api.apply_discount(
         in_customer_id => co_customer_id
        ,in_discount    => co_discount
      );
      customer_api.calc(co_customer_id);
   exception
      when zero_divide then
         null; -- ignore
      when others then
         logging_package.log_error('Error: ' || sqlerrm);
         raise;
   end discount_and_recalculate;
end order_api;
/
