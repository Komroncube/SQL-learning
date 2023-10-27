-- create database EmployeeProject;
create table Employees (
    Id int IDENTITY(1,1) PRIMARY KEY,
    Name varchar(255),
    Surname varchar(255),
    Email varchar(255),
    Login varchar(255),
    Password varchar(255),
    Status int default 1,
    Role int,
    CreatedDate datetime DEFAULT GETUTCDATE(),
    ModifyDate datetime,
    DeletedDate datetime,
);

-- Insert rows into table 'Emplyees' in schema '[dbo]'
INSERT INTO [dbo].[Employees]
( -- Columns to insert data into
 [name], [Surname], [Email], [Login], [Password], [Role]
)
VALUES
( -- First row: values for the columns in the list above
 'Name', 'surname', 'email', 'Login', 'password', 3
)
-- Add more rows here
GO

select * from Employees;