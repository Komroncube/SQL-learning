create table product_coupons
(
    coupon_id integer FOREIGN key REFERENCES coupons(id),
    product_id UNIQUEIDENTIFIER FOREIGN key REFERENCES products(id),
    primary key ( coupon_id, product_id)
)