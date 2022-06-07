USE master

CREATE DATABASE SQLClassTest
GO

CREATE SCHEMA production
GO

-- ALTER DROP SCHEMA production

CREATE SCHEMA Territory
GO

CREATE SCHEMA Sales
GO

CREATE SCHEMA HR
GO

-- #-----------------------[production].[category]--------------------------
IF OBJECT_ID('[production].[category]', 'U') IS NOT NULL
DROP TABLE [production].[category]
GO

CREATE TABLE [production].[category]
(
    [category_id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [category_name] NVARCHAR(50) NOT NULL,
);
GO


INSERT INTO [production].[category]
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
SELECT * FROM [production].[category]
GO

-- #---------------------[production].[product]----------------------------

IF OBJECT_ID('[production].[product]', 'U') IS NOT NULL
DROP TABLE [production].[product]
GO
CREATE TABLE [production].[product]
(
    [product_id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [product_name] NVARCHAR(50) NOT NULL,
    [category_id_FK] INT NOT NULL,
    [isDiscontinued] NVARCHAR(50) NOT NULL,
    [Unit_price] FLOAT NOT NULL,

    CONSTRAINT FK_CategoryId FOREIGN KEY (category_id_FK) REFERENCES Production.category(category_id)

);
GO


INSERT INTO [production].[product]
( -- Columns to insert data into
 [product_id], [product_name],[category_id_FK],[isDiscontinued],[Unit_price]
)
VALUES
( -- First row: values for the columns in the list above
 1, 'Laptop',1,'YES',220
),
( -- First row: values for the columns in the list above
  2, 'Phone',2,'No',220
)
GO

-- Select rows from a Table or View '[TableOrViewName]' in schema '[dbo]'
SELECT * FROM [production].[product]
GO

-- #---------------------[Territory].[Country]----------------------------

IF OBJECT_ID('[Territory].[Country]', 'U') IS NOT NULL
DROP TABLE [Territory].[Country]
GO
CREATE TABLE [Territory].[Country]
(
    [CountryCode] NVARCHAR(5) NOT NULL PRIMARY KEY, -- Primary Key column
    [CountryName] NVARCHAR(60) NOT NULL,
);
GO

INSERT INTO [Territory].[Country]
(
 [CountryCode],[CountryName]
)
VALUES
( 
    '12345','Kasur'
),
( 
    '34567','Lahore'
)
GO

SELECT * FROM [Territory].[Country]
GO
-- #--------------------[Sales].[SalesTerritory]-----------------------------


IF OBJECT_ID('[Sales].[SalesTerritory]', 'U') IS NOT NULL
DROP TABLE [Sales].[SalesTerritory]
GO
CREATE TABLE [Sales].[SalesTerritory]
(
    [TerritoryId] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [Name] NVARCHAR(50) NOT NULL,
    [CountryCode_FK] NVARCHAR(5) NOT NULL
    CONSTRAINT FK_CountryCode FOREIGN KEY (CountryCode_FK) REFERENCES [Territory].[Country](CountryCode)
);
GO

INSERT INTO [Sales].[SalesTerritory]
( 
    [TerritoryId],[Name],[CountryCode_FK]
)
VALUES
( 
    1, 'Middle East Territory','12345'
),
( 
    2, 'North East Territory','34567'
)
GO

SELECT * FROM [Sales].[SalesTerritory]
GO

-- #----------------------[Territory].[City]---------------------------------#

IF OBJECT_ID('[Territory].[City]', 'U') IS NOT NULL
DROP TABLE [Territory].[City]
GO
CREATE TABLE [Territory].[City]
(
    [CityId] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [CityName] NVARCHAR(60) NOT NULL,
    [CountryCode_City_FK] NVARCHAR(5) NOT NULL
    CONSTRAINT FK_CountryCode_City FOREIGN KEY (CountryCode_City_FK) REFERENCES [Territory].[Country](CountryCode)
);
GO

INSERT INTO [Territory].[City]
( 
    [CityId],[CityName],[CountryCode_City_FK]
)
VALUES
( 
    1, 'Raja Jang','12345'
),
( 
    2, 'Raiwind','34567'
)
GO

SELECT * FROM [Territory].[City]

-- #-------------------------[HR].[Employees]------------------------------#

IF OBJECT_ID('[HR].[Employees]', 'U') IS NOT NULL
DROP TABLE [HR].[Employees]
GO
CREATE TABLE [HR].[Employees]
(
    [EmployeeId] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [FirstName] NVARCHAR(50) NOT NULL,
    [LastName] NVARCHAR(50) NOT NULL,
    [BirthDate] NVARCHAR(50) NULL,
    [HireDate] NVARCHAR(50) NOT NULL,
    [CityId_FK] INT NOT NULL
    CONSTRAINT FK_CityId_Employees FOREIGN KEY (CityId_FK) REFERENCES [Territory].[City](CityId)
);
GO

INSERT INTO [HR].[Employees]
( 
    [EmployeeId],[FirstName],[LastName],[BirthDate],[HireDate],[CityId_FK]
)
VALUES
( 
    1, 'M. Umer','Yasin','03/03/1933','01/02/2001',1
),
( 
    2,  'Ali','Ahmaed','07/04/1978','04/12/2011',2
)
GO

SELECT * FROM [HR].[Employees]

-- #---------------------[Sales].[Customers]----------------------------------#

IF OBJECT_ID('[Sales].[Customers]', 'U') IS NOT NULL
DROP TABLE [Sales].[Customers]
GO
CREATE TABLE [Sales].[Customers]
(
    [CustomerId] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [FirstName] NVARCHAR(50) NOT NULL,
    [LastName] NVARCHAR(50) NOT NULL,
    [CityId_FK] INT NOT NULL
    CONSTRAINT FK_CityId_Customers FOREIGN KEY (CityId_FK) REFERENCES [Territory].[City](CityId)
);
GO

INSERT INTO [Sales].[Customers]
( 
    [CustomerId],[FirstName],[LastName],[CityId_FK]
)
VALUES
( 
    1, 'Ahsan','Naveed',1
),
( 
    2,  'Waqar','Jutt',2
)
GO

SELECT * FROM [Sales].[Customers]

-- #------------simple INNER JOIN And  VIEW-------------------------------------------#



SELECT c.category_id, p.product_id
    FROM Production.product p
    INNER JOIN Production.category c ON p.product_id = c.category_id
GO

CREATE VIEW Production.TempProductionViews
AS
   SELECT c.category_id, p.product_id
    FROM Production.product p
    INNER JOIN Production.category c ON p.product_id = c.category_id
GO 

SELECT * FROM Production.TempProductionViews

-- #----------------------simple INNER JOIN And  VIEW---------------------------------#


SELECT TC.CityName, ST.TerritoryId, Co.CountryCode, HRE.EmployeeId 
    FROM Territory.Country Co
    INNER JOIN Sales.SalesTerritory ST ON co.CountryCode = St.CountryCode_FK
    INNER JOIN Territory.City TC ON co.CountryCode = TC.CountryCode_City_FK
    INNER JOIN HR.Employees HRE ON TC.CityId = HRE.CityId_FK
    INNER JOIN Sales.Customers SC  ON SC.CustomerId = HRE.CityId_FK
GO

CREATE VIEW Sales.TempSalesViews
AS
   SELECT TC.CityName, ST.TerritoryId, Co.CountryCode, HRE.EmployeeId 
    FROM Territory.Country Co
    INNER JOIN Sales.SalesTerritory ST ON co.CountryCode = St.CountryCode_FK
    INNER JOIN Territory.City TC ON co.CountryCode = TC.CountryCode_City_FK
    INNER JOIN HR.Employees HRE ON TC.CityId = HRE.CityId_FK
    INNER JOIN Sales.Customers SC  ON SC.CustomerId = HRE.CityId_FK
GO

SELECT * FROM Sales.TempSalesViews