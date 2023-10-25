create procedure CreateUser
@username varchar(255), @userpass varchar(8), @coutry varchar(255), @city varchar(255)
as
Insert into Users (USER_NAME, USER_PASS, COUNTRY, CITY) values (@username, @userpass, @coutry, @city);