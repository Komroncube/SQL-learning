create table products
(
    id UNIQUEIDENTIFIER PRIMARY KEY,
    product_name varchar(255),
    SKU VARCHAR(255),
    regular_price NUMERIC, 
    discount_price NUMERIC,
    quantity INTEGER,
    short_description varchar(255),
    product_description text,
    product_weight numeric,
    product_note varchar(255),
    published bit,
    created_at DATETIME,
    updated_at DATETIME,
    created_by UNIQUEIDENTIFIER,
    updated_by UNIQUEIDENTIFIER
)
GO