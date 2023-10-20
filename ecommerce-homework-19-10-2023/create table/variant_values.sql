create table variant_values
(
    id UNIQUEIDENTIFIER primary key,
    variant_id UNIQUEIDENTIFIER FOREIGN key REFERENCES variants(id),
    price numeric,
    quantity integer,
)