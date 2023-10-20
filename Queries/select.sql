select * from Fruits;
SELECT * FROM Vegetables;

select name, sum(count) as sum from Fruits GROUP by name;

select name, sum(count) from Fruits group by name having name ='apple';

select name, count from fruits union all select name, count from Vegetables;

select * from Vegetables
where  name in (select name from Vegetables where count>20);

select * from fruits 
where name in (select name from Vegetables);