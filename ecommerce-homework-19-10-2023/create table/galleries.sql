create table galleries
(
    id UNIQUEIDENTIFIER primary key,
    product_id UNIQUEIDENTIFIER FOREIGN key REFERENCES products(id),
    image_path text,
    thumbnail bit,
    display_order smallint,
    created_at DATETIME,
    updated_at DATETIME,
    created_by UNIQUEIDENTIFIER,
    updated_by UNIQUEIDENTIFIER
)
go