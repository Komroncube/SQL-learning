create table staff_accounts
(
    id UNIQUEIDENTIFIER PRIMARY KEY,
    first_name varchar(100),
    last_name varchar(100),
    phone_number varchar(100),
    email varchar(255),
    password_hash text,
    active bit,
    profile_img text,
    created_at DATETIME,
    updated_at DATETIME,
    created_by UNIQUEIDENTIFIER,
    updated_by UNIQUEIDENTIFIER
)
go