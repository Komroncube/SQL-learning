select * from Fruits;
SELECT * FROM Vegetables;

select name, sum(count) as sum from Fruits GROUP by name;

select name, sum(count) from Fruits group by name having name ='apple';