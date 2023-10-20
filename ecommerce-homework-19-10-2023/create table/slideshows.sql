create table slideshows
(
    id UNIQUEIDENTIFIER primary key,
    destination_uri text, 
    image_uri text,
    clicks smallint,
    created_at DATETIME,
    updated_at DATETIME,
    created_by UNIQUEIDENTIFIER,
    updated_by UNIQUEIDENTIFIER
)
GO