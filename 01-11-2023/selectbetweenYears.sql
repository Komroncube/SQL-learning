CREATE procedure GetStudentByYear
@from int, @till int
as 
select * from Students where year between @from and @till
GO

CREATE procedure GetStudentById
@id INT
as 
SELECT * from Students where id = @id
drop PROCEDURE GetStudentById