-- Insert rows into table 'odamlar' in schema '[dbo]'
INSERT INTO [dbo].[odamlar]
( -- Columns to insert data into
 [LastName], [FirstName], [Age]
)
VALUES
( -- First row: values for the columns in the list above
 'Jurayev', 'Rustambek', 19
),
( -- Second row: values for the columns in the list above
 'Sharofiddinov', 'Nurmuhammad', 20
)
-- Add more rows here
GO


-- Insert rows into table 'Buyurtma' in schema '[dbo]'
INSERT INTO [dbo].[Buyurtma]
( -- Columns to insert data into
 [ColumnName1], [ColumnName2], [ColumnName3]
)
VALUES
( -- First row: values for the columns in the list above
 ColumnValue1, ColumnValue2, ColumnValue3
),
( -- Second row: values for the columns in the list above
 ColumnValue1, ColumnValue2, ColumnValue3
)
-- Add more rows here
GO

create database ECOMMERCE