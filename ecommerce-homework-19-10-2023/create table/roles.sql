create table roles
(
    id integer IDENTITY primary key,
    role_name varchar(255),
    privileges text,
    created_at DATETIME,
    updated_at DATETIME,
    created_by UNIQUEIDENTIFIER,
    updated_by UNIQUEIDENTIFIER
)