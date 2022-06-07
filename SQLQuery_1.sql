-- USE AdventureWorks2019
-- GO

-- SELECT * FROM sys.databases
-- GO

-- SELECT * FROM sys.schemas
-- GO

-- SELECT * FROM sys.tables
-- GO

-----------------------------------

USE AdventureWorks2019
GO

SELECT * FROM Production.Product
GO

SELECT ProductID, Name AS 'Product Name' FROM Production.Product
GO

SELECT ProductID, Name AS 'Product Name' FROM Production.Product
WHERE ProductID > 879
GO

SELECT ProductID, Name AS 'Product Name' FROM Production.Product
WHERE Name = 'Fork End'
GO

-- Select Products start with F
-- Hint: LIKE

---------------------------------------------  