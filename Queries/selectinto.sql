-- select * into MyNewBackUpTable from fruits;
select name from MyNewBackUpTable;

-- select * into LessonDb.dbo.BackUpTableFromLMS 
-- from Fruits;

select * from Vegetables;
Insert into MyNewBackUpTable(name, count, price) 
SELECT name, count, price from Vegetables;