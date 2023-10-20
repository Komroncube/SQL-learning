create table notifications
(
    id UNIQUEIDENTIFIER primary key,
    account_id UNIQUEIDENTIFIER FOREIGN KEY REFERENCES  staff_accounts(id),
    title varchar(100),
    content text,
    seen bit,
    created_at datetime, 
    receive_time datetime,
    notification_expiry_date datetime
)
go