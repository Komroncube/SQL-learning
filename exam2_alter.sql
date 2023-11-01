CREATE PROCEDURE FindInAllDatabases
@InputParameter sql_variant
AS
BEGIN
    DECLARE @SearchStr nvarchar(100) = CAST(@InputParameter as nvarchar(MAX))
    DECLARE @Results TABLE (DatabaseName nvarchar(256), TableName nvarchar(256), ColumnName nvarchar(128), ColumnValue nvarchar(3630))

    SET NOCOUNT ON

    DECLARE @DatabaseName nvarchar(256)
    DECLARE @TableName nvarchar(256)
    DECLARE @ColumnName nvarchar(128)
    DECLARE @SearchStr2 nvarchar(110)
    DECLARE @Sql nvarchar(MAX)

    SELECT TOP 1 @DatabaseName = name
    FROM sys.databases
    WHERE state_desc = 'ONLINE'
        AND name NOT IN ('master', 'tempdb', 'model', 'msdb')
    ORDER BY name

    WHILE @DatabaseName IS NOT NULL
    BEGIN
        SET @SearchStr2 = QUOTENAME('%' + @SearchStr + '%', '''')
        SET @TableName = ''

        -- Create a dynamic SQL query to switch to the current database
        SET @Sql = 'USE ' + QUOTENAME(@DatabaseName)
        EXEC sp_executesql @Sql

        WHILE @TableName IS NOT NULL
        BEGIN
            SET @ColumnName = ''

            SELECT TOP 1 @TableName = QUOTENAME(TABLE_SCHEMA) + '.' + QUOTENAME(TABLE_NAME)
            FROM INFORMATION_SCHEMA.TABLES
            WHERE TABLE_TYPE = 'BASE TABLE'
                AND QUOTENAME(TABLE_SCHEMA) + '.' + QUOTENAME(TABLE_NAME) > @TableName
                AND OBJECTPROPERTY(OBJECT_ID(QUOTENAME(TABLE_SCHEMA) + '.' + QUOTENAME(TABLE_NAME)), 'IsMSShipped') = 0

            WHILE (@TableName IS NOT NULL) AND (@ColumnName IS NOT NULL)
            BEGIN
                SET @ColumnName = ''

                SELECT TOP 1 @ColumnName = QUOTENAME(COLUMN_NAME)
                FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_SCHEMA = PARSENAME(@TableName, 2)
                    AND TABLE_NAME = PARSENAME(@TableName, 1)
                    AND DATA_TYPE IN ('char', 'varchar', 'nchar', 'nvarchar', 'int', 'decimal', 'datetime')
                    AND QUOTENAME(COLUMN_NAME) > @ColumnName

                IF @ColumnName IS NOT NULL
                BEGIN
                    -- Generate a dynamic SQL query for the search
                    SET @Sql = 'INSERT INTO @Results
                        SELECT ''' + @DatabaseName + ''', ''' + @TableName + ''', ''' + @ColumnName + ''', LEFT(' + @ColumnName + ', 3630) 
                        FROM ' + @TableName + ' (NOLOCK) WHERE ' + @ColumnName + ' LIKE ' + @SearchStr2
                    EXEC sp_executesql @Sql
                END
            END
        END

        -- Move to the next database
        SELECT TOP 1 @DatabaseName = name
        FROM sys.databases
        WHERE state_desc = 'ONLINE'
            AND name NOT IN ('master', 'tempdb', 'model', 'msdb')
            AND name > @DatabaseName
        ORDER BY name
    END

    -- Return the search results
    SELECT DatabaseName, TableName, ColumnName, ColumnValue FROM @Results
END

drop PROCEDURE FindInAllDatabases

exec FindInAllDatabases @InputParameter = "Rustambek"
