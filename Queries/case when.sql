select id, name, count,
case 
    when count>30 then 'greater than 30'
    when count>20 then 'greater than 20'
    else 'less than 21'
end as quantitytext
from Fruits order by [count];