-- select * into newtable from Fruits;
select * from newtable;

CREATE TABLE Odamlar (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT PK_Odamlar PRIMARY KEY (ID)
);

CREATE TABLE Buyurtma (
    OrderID int NOT NULL identity(1,1) PRIMARY KEY,
    OrderNumber int NOT NULL,
    PersonID int FOREIGN KEY REFERENCES Odamlar(ID)
);
