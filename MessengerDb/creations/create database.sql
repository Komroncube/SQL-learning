-- create database MessengerDemo;

create table Users
(
    Id integer IDENTITY(1,1) primary key,
    USER_NAME varchar(255) UNIQUE,
    USER_PASS VARCHAR(8),
    COUNTRY varchar(255),
    CITY varchar(255),
    CREATED_AT DATETIME DEFAULT GETDATE(),
    UPDATE_AT DATETIME,
);
create table Messages
(
    id integer IDENTITY(1,1) primary key,
    Sender integer,
    Recepient integer,
    MessageText text,
    Created_at datetime default getdate(),
);