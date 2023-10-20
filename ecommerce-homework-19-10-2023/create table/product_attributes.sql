create table product_attributes
(
    product_id UNIQUEIDENTIFIER foreign key references products(id),
    attribute_id UNIQUEIDENTIFIER foreign key REFERENCES attributes(id),
    primary key (product_id, attribute_id),
)