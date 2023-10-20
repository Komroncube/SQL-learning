create table product_tags
(
    tag_id integer FOREIGN key REFERENCES tags(id),
    product_id UNIQUEIDENTIFIER foreign key REFERENCES products(id),
    CONSTRAINT [PK_product_tags] PRIMARY key CLUSTERED (tag_id, product_id)

)