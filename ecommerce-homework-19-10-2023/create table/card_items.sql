create table card_items
(
    id UNIQUEIDENTIFIER primary KEY,
    card_id UNIQUEIDENTIFIER FOREIGN key REFERENCES cards(card_id),
    product_id UNIQUEIDENTIFIER FOREIGN key REFERENCES products(id),
    quantity SMALLINT
)