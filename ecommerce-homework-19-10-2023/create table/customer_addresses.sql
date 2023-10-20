create table customer_addresses
(
    id UNIQUEIDENTIFIER primary key,
    customer_id UNIQUEIDENTIFIER foreign key REFERENCES customers(id),
    address_line1 text,
    address_line2 text,
    postal_code varchar(255),
    country varchar(255),
    city varchar(255),
    phone_number varchar(255)
)
go