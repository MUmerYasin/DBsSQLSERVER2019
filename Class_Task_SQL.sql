-- Create a new database called 'ClassTaskDB'
-- Connect to the 'master' database to run this snippet
USE master

CREATE DATABASE SQLTask
GO

CREATE SCHEMA production
GO


-- #-------------------------------------------------
IF OBJECT_ID('[dbo].[categrories]', 'U') IS NOT NULL
DROP TABLE [production].[categrories]
GO

CREATE TABLE [production].[categrories]
(
    [category_id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [category_name] NVARCHAR(50) NOT NULL,
);
GO

-- #-------------------------------------------------


INSERT INTO [production].[categrories]
( -- Columns to insert data into
 [category_id], [category_name]
)
VALUES
( -- First row: values for the columns in the list above
 1, 'Kids'
),
( -- Second row: values for the columns in the list above
 2, 'Mans'
)
-- Add more rows here
GO

-- Select rows from a Table or View '[TableOrViewName]' in schema '[dbo]'
SELECT * FROM [production].[categrories]
GO

-- #-------------------------------------------------


IF OBJECT_ID('[production].[brands]', 'U') IS NOT NULL
DROP TABLE [production].[brands]
GO
CREATE TABLE [production].[brands]
(
    [brand_id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [brand_name] NVARCHAR(50) NOT NULL,
);
GO

-- #-------------------------------------------------

INSERT INTO [production].[brands]
( -- Columns to insert data into
 [brand_id], [brand_name]
)
VALUES
( -- First row: values for the columns in the list above
 1, 'HP'
),
( -- Second row: values for the columns in the list above
 2, 'Dell'
)
-- Add more rows here
GO

-- Select rows from a Table or View '[TableOrViewName]' in schema '[dbo]'
SELECT * FROM [production].[brands]
GO

-- #-------------------------------------------------


IF OBJECT_ID('[production].[products]', 'U') IS NOT NULL
DROP TABLE [production].[products]
GO
CREATE TABLE [production].[products]
(
    [product_id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [product_name] NVARCHAR(50) NOT NULL,
    [brands_id_FK] INT NOT NULL,
    [category_id_FK] INT NOT NULL,
    [model_year] NVARCHAR(50) NOT NULL,
    [list_price] NVARCHAR(50) NOT NULL,

    CONSTRAINT FK_CategoryId FOREIGN KEY (category_id_FK) REFERENCES Production.categrories(category_id),
    CONSTRAINT FK_Brands FOREIGN KEY (brands_id_FK) REFERENCES Production.brands(brand_id)


);
GO

-- #-------------------------------------------------

INSERT INTO [production].[products]
( -- Columns to insert data into
 [product_id], [product_name], [brands_id_FK],[category_id_FK],[model_year],[list_price]
)
VALUES
( -- First row: values for the columns in the list above
 1, '14Laptop',1,1,'2022','2222'
),
( -- First row: values for the columns in the list above
 2, 'phone',2,2,'2018','1254'
)
GO

-- Select rows from a Table or View '[TableOrViewName]' in schema '[dbo]'
SELECT * FROM [production].[products]
GO

-- #-------------------------------------------------


SELECT p.product_name , p.list_price, b.brand_name, c.category_name
FROM Production.products p
INNER JOIN Production.brands b ON   p.brands_id_FK = b.brand_id
INNER JOIN Production.categrories c ON p.category_id_FK = c.category_id
GO
