create table coupons
(
    id integer IDENTITY primary key,
    code varchar(255),
    coupon_description text,
    discount_value numeric,
    discount_type varchar(50),
    times_used integer,
    max_usage integer,
    coupon_start_date datetime,
    coupon_end_date datetime, 
    created_at DATETIME,
    updated_at DATETIME,
    created_by UNIQUEIDENTIFIER,
    updated_by UNIQUEIDENTIFIER
)
go