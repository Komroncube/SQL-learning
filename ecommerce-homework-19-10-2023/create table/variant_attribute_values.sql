create table variant_attribute_values
(
    variant_attribute_value_id UNIQUEIDENTIFIER FOREIGN key REFERENCES variants(variant_attribute_value_id),
    attribute_value_id UNIQUEIDENTIFIER FOREIGN key REFERENCES attibute_values(id),
    primary key (variant_attribute_value_id, attribute_value_id)
)