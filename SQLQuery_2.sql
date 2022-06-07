USE AdventureWorks2019
GO

-- All columns 
SELECT * FROM Production.Product
GO

SELECT [Name] AS 'Product Name' FROM Production.Product
GO

SELECT COUNT(*) AS 'Total Products' FROM Production.Product
GO

SELECT [ProductID], [Name] FROM Production.Product
GO

SELECT [ProductID], [Name] FROM Production.Product
ORDER BY ProductID ASC
GO

SELECT [ProductID], [Name] 
    FROM Production.Product
    WHERE ProductID = 957
    ORDER BY ProductID ASC
GO

SELECT TOP 5 [ProductID], [Name] 
    FROM Production.Product
    ORDER BY ProductID ASC
GO

------------------ DML 

-- CREATE 
-- ALTER 
-- DROP

----------------

-- SELECT [name] FROM sys.databases
-- WHERE [name] = 'master'
-- GO

------------

-- USE master
-- GO

-- CREATE DATABASE TestDatabase
-- GO

------

USE TestDatabase
GO

CREATE SCHEMA Sales
GO

CREATE TABLE [Sales].[Order]
(
    [Order_Id] INT NOT NULL IDENTITY(1001, 1) CONSTRAINT PK_Order_Id PRIMARY KEY,
    [Order_Name] NVARCHAR(50) NOT NULL CONSTRAINT UN_Order_Name UNIQUE,
    [Order_Price] FLOAT NOT NULL 
);
GO

INSERT INTO [Sales].[Order]
(
    Order_Name, Order_Price 
)
VALUES 
(
    'Item 5', 831.42
),
(
    'Item 6', 21231.42
)
GO

SELECT * FROM Sales.[Order]
GO

-- DROP     -- Structure + Data 
-- TRUNCATE -- Complete Data
-- DELETE   -- Specific Record 

TRUNCATE TABLE Sales.[Order]
GO

DELETE Sales.[Order]
WHERE Order_Name = 'Item 5'
GO

--------------------------------------------- DDL
-- CREATE  (DATABASE, SCHEMA, TABLE)
-- Column Constraints (PRIMARY KEY, UNIQUE)
-- DROP TABLE 
-- ALTER ?
--------------------------------------------- DML
-- SELECT, FROM, WHERE, ORDER BY
-- INSERT INTO
-- DELETE, TRUNCATE
-- UPDATE ?

-- DROP TABLE Sales.[Order]
-- GO

---------------------- Happy Learning :)