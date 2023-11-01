CREATE PROCEDURE SearchAllDatabasesDemo
    @InputParameter sql_variant
AS
BEGIN
    DECLARE @SearchStr nvarchar(100) = CAST(@InputParameter as nvarchar(MAX))

    -- Create a temporary table to store the results
    CREATE TABLE #Results (DatabaseName nvarchar(256), TableName nvarchar(256), ColumnName nvarchar(128), ColumnValue nvarchar(3630))

    SET NOCOUNT ON

    DECLARE @DatabaseName nvarchar(256)
    DECLARE @SqlQuery nvarchar(max)

    DECLARE db_cursor CURSOR FOR
    SELECT name
    FROM sys.databases
    WHERE state_desc = 'ONLINE' AND name NOT IN ('master', 'tempdb', 'model', 'msdb')

    OPEN db_cursor

    FETCH NEXT FROM db_cursor INTO @DatabaseName

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @SqlQuery = 
            N'INSERT INTO #Results ' +
            N'SELECT ''' + @DatabaseName + ''', t.name, c.name, ' + QUOTENAME('[' + @SearchStr + ']', '''') +
            N' FROM ' + QUOTENAME(@DatabaseName) + N'.sys.tables t ' +
            N'INNER JOIN ' + QUOTENAME(@DatabaseName) + N'.sys.columns c ON t.object_id = c.object_id ' +
            N'WHERE c.name = ' + QUOTENAME(@SearchStr, '''')  -- Check for the column name directly

        -- Execute the generated query
        PRINT @SqlQuery
        EXEC sp_executesql @SqlQuery

        FETCH NEXT FROM db_cursor INTO @DatabaseName
    END

    CLOSE db_cursor
    DEALLOCATE db_cursor

    -- Return the results from the temporary table
    SELECT DatabaseName, TableName, ColumnName, ColumnValue FROM #Results

    -- Clean up by dropping the temporary table
    DROP TABLE #Results
END



drop PROCEDURE SearchAllDatabasesDemo;

EXEC SearchAllDatabasesDemo @InputParameter = 5000;
