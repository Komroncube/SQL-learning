create PROCEDURE insertData 
@name varchar(40), @quantity int
as 
insert into Fruits (name, count) VALUEs (@name, @quantity);

exec insertData @name = 'orik', @quantity = 23;
GO

CREATE procedure GetStudentByYear
@from int, @till int
as 
select * from Students where Year(year) between @from and @till