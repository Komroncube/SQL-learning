create table product_shippings
(
    product_id UNIQUEIDENTIFIER foreign key REFERENCES products(id),
    shipping_id integer FOREIGN key REFERENCES shippings(id),
    ship_charge numeric,
    free bit,
    estimated_days NUMERIC
)