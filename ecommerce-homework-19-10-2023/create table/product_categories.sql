create table product_categories
(
    category_id UNIQUEIDENTIFIER FOREIGN key REFERENCES categories(id),
    product_id UNIQUEIDENTIFIER foreign key REFERENCES products(id)
    CONSTRAINT [PK_product_categories] PRIMARY key CLUSTERED (category_id, product_id)
)