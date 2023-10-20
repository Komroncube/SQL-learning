create table attributes
(
    id UNIQUEIDENTIFIER primary key,
    attribute_name varchar(255),
    created_at DATETIME,
    updated_at DATETIME,
    created_by UNIQUEIDENTIFIER,
    updated_by UNIQUEIDENTIFIER
)