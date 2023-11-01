create trigger afterDeleteStudent
on Students
after DELETE
as
begin
    insert into