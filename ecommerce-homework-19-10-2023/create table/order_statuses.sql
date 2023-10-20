create table order_statuses
(
    id integer identity primary key,
    status_name varchar(255),
    color varchar(50),
    privacy varchar(50),
    created_at datetime,
    updated_at datetime,
    created_by UNIQUEIDENTIFIER,
    updated_by UNIQUEIDENTIFIER
)