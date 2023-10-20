create table variants
(
    id UNIQUEIDENTIFIER PRIMARY key,
    variant_attribute_value_id UNIQUEIDENTIFIER,
    product_id UNIQUEIDENTIFIER FOREIGN key references products(id)
)