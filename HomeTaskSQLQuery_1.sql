
--------------------------Create Data Base---------------------------------
-- -- Create a new database called 'TestingDB'
-- -- Connect to the 'master' database to run this snippet
-- USE master
-- GO
-- -- Create the new database if it does not exist already
-- IF NOT EXISTS (
--     SELECT [name]
--         FROM sys.databases
--         WHERE [name] = N'TestingDB'
-- )
-- CREATE DATABASE TestingDB
-- GO

-----------------------------------------------------------
-- USE master

-- SELECT * FROM sys.databases
-- GO

-- SELECT * FROM sys.schemas
-- GO

-----------------------------------------------------------------

USE AdventureWorks2019
GO

-- SELECT * FROM Production.Product
-- GO

-- SELECT ProductID, Name AS 'Product Name' FROM Production.Product
-- GO

-- SELECT ProductID, Name AS 'Product Name' FROM Production.Product
-- WHERE ProductID > 879
-- GO

-- SELECT ProductID, Name AS 'Product Name' FROM Production.Product
-- WHERE Name = 'Fork End'

-- SELECT ProductID, Name AS 'Product Name' FROM Production.Product
-- WHERE Name LIKE 'F%'
-- GO

-- DROP DATABASE AdventureWorks2019
-- GO

-- SELECT [Name] FROM Production.Product
-- GO

-- SELECT COUNT(*) AS 'Total Product' FROM Production.Product
-- GO

-- SELECT [Name], [ProductID] 
--     FROM Production.Product
--     WHERE ProductID > 90
--     ORDER BY ProductID DESC
-- GO


-- SELECT  TOP 5 [Name], [ProductID] 
--     FROM Production.Product
--     WHERE ProductID > 90
--     ORDER BY ProductID DESC
-- GO

-- ASC >Defaul

--------------------------------- DML
--  Creat
--  Alter
--  Drop

---------------------------------------------

-- create > all object create by this key word e.g table

-- Create a new database called 'DatabaseName'
-- Connect to the 'master' database to run this snippet
-- USE master
-- GO
-- -- Create the new database if it does not exist already
-- IF NOT EXISTS (
--     SELECT [name]
--         FROM sys.databases
--         WHERE [name] = N'DatabaseName'
-- )
-- CREATE DATABASE DatabaseName
-- GO

------------------------------------------------------------
-- T- SQl id STATIC language
-------------------------------------------------------------

-- Create a new database called 'TestDataBase'
-- -- Connect to the 'master' database to run this snippet
-- USE master
-- GO
-- -- Create the new database if it does not exist already
-- IF NOT EXISTS (
--     SELECT [name]
--         FROM sys.databases
--         WHERE [name] = N'TestDataBase
--     '
-- )
-- CREATE DATABASE TestDataBase
-- GO



USE TestDataBase
GO

-- use define dbo - system Database sys
CREATE SCHEMA Sales 
GO
-- Security > Schemas> Sales





-- Create a new table called '[Order]' in schema '[Sales]'
-- Drop the table if it already exists
IF OBJECT_ID('[Sales].[Order]', 'U') IS NOT NULL
DROP TABLE [Sales].[Order]
GO
-- Create the table in the specified schema
CREATE TABLE [Sales].[Order]
(
    [Order_Id] INT NOT NULL CONSTRAINT PK_Order_ID PRIMARY KEY, -- Primary Key column
    [Order_Name] NVARCHAR(50) NOT NULL CONSTRAINT Un_Order_Name UNIQUE ,
    [Order_Price] FLOAT NOT NULL
    -- Specify more columns here
);
GO

-- IDENTITY(1,1) every time start with 1 and auto increment of 1, Auot increment = range

-- compsite key > add second PK using CONSTRAINT
-- UNIQUE > KEY Data not store if it is duplicte
