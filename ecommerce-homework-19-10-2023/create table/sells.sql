create table cells
(
    id UNIQUEIDENTIFIER primary KEY,
    product_id UNIQUEIDENTIFIER FOREIGN KEY REFERENCES  products(id),
    price float, 
    quantity smallint
)
go