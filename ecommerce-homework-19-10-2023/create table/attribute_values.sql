create table variant_attribute_values
(
    id UNIQUEIDENTIFIER PRIMARY key,
    attribute_id UNIQUEIDENTIFIER foreign key REFERENCES attributes(id),
    attribute_value varchar(255),
    color varchar(255)
)