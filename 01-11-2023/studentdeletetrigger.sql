CREATE TRIGGER StudentDeleted
ON Students
FOR DELETE
AS 
BEGIN
    SET NOCOUNT ON
    DECLARE @id INT
    DECLARE @tablename NVARCHAR(100)



    SELECT TOP 1 @id = id, @tablename = 'Deleted' + fullname FROM deleted;
    DECLARE @sql NVARCHAR(MAX)
    SET @sql = N'SELECT * INTO ' + QUOTENAME(@tablename) + ' FROM deleted;'
    EXEC sp_executesql @sql
    PRINT (CAST(@id AS NVARCHAR(10)) + ' id ochib ketdi')
END;


DROP TRIGGER StudentDeleted;

delete Students where id=20;


