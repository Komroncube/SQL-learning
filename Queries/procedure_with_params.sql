create PROCEDURE insertData 
@name varchar(40), @quantity int
as 
insert into Fruits (name, count) VALUEs (@name, @quantity);
exec insertData @name ='Shaftoli', @quantity =23;