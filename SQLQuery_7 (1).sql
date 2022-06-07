
-- Create a new table called '[TableName]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[TableName]', 'U') IS NOT NULL
DROP TABLE [dbo].[TableName]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[TableName]
(
    [Id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [ColumnName2] NVARCHAR(50) NOT NULL,
    [ColumnName3] NVARCHAR(50) NOT NULL
    -- Specify more columns here
);
GO

-- Create a new table called '[TestTable]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[TestTable]', 'U') IS NOT NULL
DROP TABLE [dbo].[TestTable]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[TestTable]
(
    [Id] INT NOT NULL, -- Primary Key column
    [ColumnName2] NVARCHAR(50) NOT NULL,
    [ColumnName3] NVARCHAR(50) NOT NULL
    -- Specify more columns here
);
GO

ALTER INDEX c2_index
ON [dbo].[TestTable]
DISABLE
GO

CREATE CLUSTERED INDEX c2_index
ON [dbo].[TestTable](ColumnName2)
GO