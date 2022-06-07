-- TestDatabase
-- DROP DATABASE TestDB
-- GO 

-- CREATE DATABASE TestDatabase
-- GO

-- ALTER DATABASE TestDatabase MODIFY NAME = TestDB
-- GO 

-- USE master
-- GO

-- CREATE DATABASE POS 
-- GO

------------------

USE POS 
GO

-- SELECT COUNT(*) AS 'Total Schemas' FROM sys.schemas
-- GO

-- SELECT [Name] FROM sys.schemas
-- GO


CREATE SCHEMA Production
GO

-- DROP SCHEMA Production
-- GO

CREATE TABLE dbo.Category
(
    CategoryId INT NOT NULL
)
GO

-- ALTER SCHEMA Production TRANSFER dbo.Category
-- GO

DROP TABLE Production.Category
GO

-- CREAT DATABASE
-- ALTER DATABASE
-- DROP DATABASE
-- CREATE SCHEMA
-- ALTER SCHEMA
-- DROP SCHEMA
-- CREATE TABLE  ***
-- DROP TABLE 
-- ALTER TABLE   ***

-- Column Level Constrainst 
-- Table Level Constraints
-- Table Relationships 


CREATE TABLE Production.Category
(
    CategoryId INT NOT NULL IDENTITY(1, 1),
    CategoryName NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_CategoryId PRIMARY KEY (CategoryId)   
)
GO

-- ALTER TABLE ADD
-- ALTER TABLE ALTER COLUMN
-- ALTER TABLE DROP COLUMN

CREATE TABLE Production.Product 
(
    ProductId INT NOT NULL IDENTITY(1, 1),
    ProductName NVARCHAR(50) NOT NULL,
    UnitPrice FLOAT NOT NULL,
    IsDiscontinued BIT NOT NULL,
    CategoryId INT NOT NULL,
    CONSTRAINT PK_ProductId PRIMARY KEY (ProductId),
    CONSTRAINT FK_CategoryId FOREIGN KEY (CategoryId) REFERENCES Production.Category(CategoryId)
)
GO

SELECT * FROM Production.Category 
GO

INSERT INTO Production.Category (CategoryName)
VALUES 
(
    'Apple'
),
(
    'Microsoft'
),
(
    'Waan'
)
GO

INSERT INTO Production.Product (ProductName, UnitPrice, IsDiscontinued, CategoryId)
VALUES
(
    'Mobile', 43252.243, 1, 3
),
(
    'Laptop', 323524, 1, 3
),
(
    'Power-Bank', 34224, 0, 1
),
(
    'Smart-Watch', 42421, 1, 2
)
GO

SELECT * FROM Production.Category
GO
SELECT * FROM Production.Product
GO


SELECT p.ProductName, c.CategoryName, p.UnitPrice
FROM Production.Product p
INNER JOIN Production.Category c ON c.CategoryId = p.CategoryId
GO

-- Happy Learning :)