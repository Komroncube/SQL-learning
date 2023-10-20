create table categories
(
    id UNIQUEIDENTIFIER primary key,
    parent_id UNIQUEIDENTIFIER foreign key REFERENCES categories(id),
    category_name varchar(255),
    category_description text,
    icon text, 
    image_path text,
    active bit,
    created_at DATETIME,
    updated_at DATETIME,
    created_by UNIQUEIDENTIFIER,
    updated_by UNIQUEIDENTIFIER
)