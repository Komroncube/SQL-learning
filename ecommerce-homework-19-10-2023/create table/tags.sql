create table tags
(
    id integer identity primary key,
    tag_name varchar(255),
    icon text,
    created_at DATETIME,
    updated_at DATETIME,
    created_by UNIQUEIDENTIFIER,
    updated_by UNIQUEIDENTIFIER
)
go