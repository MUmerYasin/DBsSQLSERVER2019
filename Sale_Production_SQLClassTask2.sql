-- USE master

-- CREATE DATABASE SaleProductionTwoDB
-- GO

USE SaleProductionTwoDB

-- CREATE SCHEMA Production
-- GO

-- CREATE SCHEMA Sales
-- GO

-- ##----------------[Sales].[customers] Table Create -------------

-- IF OBJECT_ID('[Sales].[customers]', 'U') IS NOT NULL
-- DROP TABLE [Sales].[customers]
-- GO
-- CREATE TABLE [Sales].[customers]
-- (
--     [customer_id] INT NOT NULL PRIMARY KEY, -- Primary Key column
--     [first_name] NVARCHAR(50) NOT NULL,
--     [last_name] NVARCHAR(50) NOT NULL,
--     [phone] NVARCHAR(50) NOT NULL,
--     [email] NVARCHAR(50) NOT NULL,
--     [street] NVARCHAR(50) NOT NULL,
--     [city] NVARCHAR(50) NOT NULL,
--     [state] NVARCHAR(50) NOT NULL,
--     [zip_code] NVARCHAR(50) NOT NULL
-- );
-- GO


-- ##----------------[Sales].[stores] Table Create -------------


-- IF OBJECT_ID('[Sales].[stores]', 'U') IS NOT NULL
-- DROP TABLE [Sales].[stores]
-- GO
-- CREATE TABLE [Sales].[stores]
-- (
--     [store_id] INT NOT NULL PRIMARY KEY, -- Primary Key column
--     [store_name] NVARCHAR(50) NOT NULL,
--     [phone] NVARCHAR(50) NOT NULL,
--     [email] NVARCHAR(50) NOT NULL,
--     [street] NVARCHAR(50) NOT NULL,
--     [city] NVARCHAR(50) NOT NULL,
--     [state] NVARCHAR(50) NOT NULL,
--     [zip_cade] NVARCHAR(50) NOT NULL,
-- );
-- GO

-- ##----------------[Sales].[staffs] Table Create -------------

-- CREATE TABLE [Sales].[staffs] (
--     [staff_id]   INT           NOT NULL,
--     [first_name] NVARCHAR (50) NOT NULL,
--     [last_name]  NVARCHAR (50) NOT NULL,
--     [email]      NVARCHAR (50) NOT NULL,
--     [phone]      NVARCHAR (50) NOT NULL,
--     [active]     NVARCHAR (50) NOT NULL,
--     [store_id]   INT           NOT NULL,
--     [manager_id] INT           NOT NULL,
--     CONSTRAINT [PK_Staff_Id] PRIMARY KEY CLUSTERED ([staff_id] ASC),
--     CONSTRAINT [FK_manger_id] FOREIGN KEY ([manager_id]) REFERENCES [Sales].[staffs] ([staff_id]),
--     CONSTRAINT [FK_store_id] FOREIGN KEY ([staff_id]) REFERENCES [Sales].[stores] ([store_id])
-- );

-- ##---------------- [Production].[categories] Table Create -------------

-- IF OBJECT_ID('[Production].[categories]', 'U') IS NOT NULL
-- DROP TABLE [Production].[categories]
-- GO

-- CREATE TABLE [Production].[categories]
-- (
--     [category_id] INT NOT NULL PRIMARY KEY, 
--     [category_name] NVARCHAR(50) NOT NULL,
-- );
-- GO

-- ##---------------- [Production].[brands] Table Create -------------


-- IF OBJECT_ID('[Production].[brands]', 'U') IS NOT NULL
-- DROP TABLE [Production].[brands]
-- GO
-- CREATE TABLE [Production].[brands]
-- (
--     [brand_id] INT NOT NULL PRIMARY KEY, -- Primary Key column
--     [brand_name] NVARCHAR(50) NOT NULL,
   
-- );
-- GO

-- ##---------------- [Production].[products] Table Create -------------

-- CREATE TABLE [Production].[products] (
--     [product_id]   INT NOT NULL,
--     [product_name] INT NOT NULL,
--     [brand_id]     INT NOT NULL,
--     [category_id]  INT NOT NULL,
--     [model_year]   INT NOT NULL,
--     [list_price]   INT NOT NULL,
--     CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED ([product_id] ASC),
--     CONSTRAINT [FK_brand_id] FOREIGN KEY ([brand_id]) REFERENCES [Production].[brands] ([brand_id]),
--     CONSTRAINT [FK_category_id] FOREIGN KEY ([product_id]) REFERENCES [Production].[categories] ([category_id])
-- );

-- ##---------------- [Production].[stocks] Table Create -------------

-- CREATE TABLE [Production].[stocks] (
--     [store_id]   INT NULL,
--     [product_id] INT NULL,
--     [quantity]   INT NULL,
--     CONSTRAINT [FK_Product_Id] FOREIGN KEY ([product_id]) REFERENCES [Production].[products] ([product_id]),
--     CONSTRAINT [FK_Store_Id] FOREIGN KEY ([store_id]) REFERENCES [Sales].[stores] ([store_id])
-- );

-- ##---------------- [Sales].[orders] Table Create -------------

-- CREATE TABLE [Sales].[orders] (
--     [order_id]      INT           NOT NULL,
--     [customer_id]   INT           NOT NULL,
--     [order_status]  NVARCHAR (50) NOT NULL,
--     [order_date]    NVARCHAR (50) NOT NULL,
--     [required_date] NVARCHAR (50) NOT NULL,
--     [shipped_date]  NVARCHAR (50) NOT NULL,
--     [store_id]      INT           NOT NULL,
--     [staff_id]      INT           NOT NULL,
--     CONSTRAINT [PK_order_items] PRIMARY KEY CLUSTERED ([order_id] ASC),
--     CONSTRAINT [FK_Customer] FOREIGN KEY ([customer_id]) REFERENCES [Sales].[customers] ([customer_id]),
--     CONSTRAINT [FK_Staff_Id_Order] FOREIGN KEY ([staff_id]) REFERENCES [Sales].[staffs] ([staff_id]),
--     CONSTRAINT [FK_Store_Id_Order] FOREIGN KEY ([store_id]) REFERENCES [Sales].[stores] ([store_id])
-- );

-- ##---------------- [Sales].[order_items] Table Create -------------
-- CREATE TABLE [Sales].[order_items] (
--     [order_id]   INT NOT NULL,
--     [item_id]    INT NOT NULL,
--     [product_id] INT NOT NULL,
--     [quantity]   INT NOT NULL,
--     [list_price] INT NOT NULL,
--     [discount]   INT NOT NULL,
--     CONSTRAINT [PK_Order_Item_ID] PRIMARY KEY CLUSTERED ([item_id] ASC),
--     CONSTRAINT [FK_Order_ID] FOREIGN KEY ([order_id]) REFERENCES [Sales].[orders] ([order_id]),
--     CONSTRAINT [FK_Product_ID] FOREIGN KEY ([product_id]) REFERENCES [Production].[products] ([product_id])
-- );


-- ##------------------------
-- group by, sum

-- -- Create a new table called '[SaleDataTest]' in schema '[dbo]'
-- -- Drop the table if it already exists
-- IF OBJECT_ID('[dbo].[SaleDataTest]', 'U') IS NOT NULL
-- DROP TABLE [dbo].[SaleDataTest]
-- GO
-- -- Create the table in the specified schema
-- CREATE TABLE [dbo].[SaleDataTest]
-- (
--     [Id] INT NOT NULL PRIMARY KEY, -- Primary Key column
--     [Country] NVARCHAR(50) NOT NULL,
--     [Region] NVARCHAR(50) NOT NULL,
--     [sale] NVARCHAR(50) NOT NULL

-- );
-- GO


IF OBJECT_ID('[dbo].[SaleData]', 'U') IS NOT NULL
DROP TABLE [dbo].[SaleData]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[SaleData]
(
    [Id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [Country] NVARCHAR(50) NOT NULL,
    [Region] NVARCHAR(50) NOT NULL,
    [sale] INT NOT NULL

);
GO

-- INSERT INTO [dbo].[SaleData]
-- ( 
--  [id], [Country], [Region],[Sale]
-- )
-- VALUES
-- ( 
--  1, 'Pakistan', 'Faisalabad', 100
-- ),
-- ( 
--  2, 'Pakistan', 'Lahore', 200
-- ),

-- ( 
--  3, 'Pakistan', 'Lahore', 300
-- ),
-- ( 
--  4, 'Turkey', 'Istanbol', 100
-- )
-- -- Add more rows here
-- GO

SELECT  Country,Region, SUM(sale) AS 'Total SUM' FROM [dbo].[SaleData]
GROUP BY ROLLUP( Country,Region)
-- SUM TOTAL OF ALL REGION AND ALL TOTAL = ROll UP use
-- HAVING SUM(sale) > 100 
GO

SELECT  Country,Region, SUM(sale) AS 'Total SUM' FROM [dbo].[SaleData]
GROUP BY Cube( Country,Region)
-- SUM TOTAL OF ALL REGION AND ALL TOTAL = ROll UP use
-- HAVING Region = 'Lahore'
ORDER BY Region DESC
GO




