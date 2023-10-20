create table shippings
(
    id integer IDENTITY primary key,
    name text,
    active bit,
    icon_path text,
    created_at DATETIME,
    updated_at DATETIME,
    created_by UNIQUEIDENTIFIER,
    updated_by UNIQUEIDENTIFIER,
)