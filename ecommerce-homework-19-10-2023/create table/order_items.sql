create table order_items 
(
    id UNIQUEIDENTIFIER primary key,
    product_id UNIQUEIDENTIFIER FOREIGN KEY REFERENCES products(id),
    order_id UNIQUEIDENTIFIER FOREIGN key REFERENCES orders(id),
    price numeric,
    quatity integer,
    shipping_id integer FOREIGN key REFERENCES shippings(id),
)