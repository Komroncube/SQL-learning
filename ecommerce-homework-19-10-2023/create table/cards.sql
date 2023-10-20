create table cards
(
    card_id UNIQUEIDENTIFIER primary key,
    customer_id UNIQUEIDENTIFIER FOREIGN key REFERENCES customers(id)
)