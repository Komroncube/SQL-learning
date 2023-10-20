create table orders
(
    id UNIQUEIDENTIFIER primary key,
    coupon_id integer foreign key REFERENCES coupons(id),
    customer_id UNIQUEIDENTIFIER foreign key REFERENCES customers(id),
    order_status_id INTEGER FOREIGN key REFERENCES order_statuses(id),
    order_approved_at DATETIME,
    order_delivered_carrier_date datetime,
    order_delivered_customer_date datetime,
    created_at datetime
)