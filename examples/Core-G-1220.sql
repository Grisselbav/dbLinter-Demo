-- Core G-1220: Avoid composite primary keys.

create table orders (
   order_no integer primary key,
   other_order_attrs json
);

create table order_items (
   order_no integer,
   order_item_no integer,
   other_order_item_attrs json,
   constraint order_items_pk primary key (order_no, order_item_no),
   constraint order_items_orders_fk foreign key (order_no) references orders
);
