create table customers
(
    id UNIQUEIDENTIFIER primary key,
    first_name varchar(100),
    last_name varchar(100),
    phone_number varchar(255),
    email text,
    password_hash text,
    active bit,
    registered_at datetime,
    created_at datetime
)