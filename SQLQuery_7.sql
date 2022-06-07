-- Create a new table called '[Sales]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Sales]', 'U') IS NOT NULL
DROP TABLE [dbo].[Sales]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Sales]
(
    [Country] NVARCHAR(50) NOT NULL,
    [Region] NVARCHAR(50) NOT NULL,
    [Sales] INT NOT NULL
);
GO

INSERT INTO [dbo].[Sales] VALUES ('Pakistan', 'Faisalabad', 100)
INSERT INTO [dbo].[Sales] VALUES ('Pakistan', 'Lahore', 200)
INSERT INTO [dbo].[Sales] VALUES ('Pakistan', 'Lahore', 300)
INSERT INTO [dbo].[Sales] VALUES ('Turkey', 'Istanbol', 100)

-- DELETE [dbo].[Sales]
-- GO

-- TRUNCATE TABLE [dbo].[Sales]
-- GO

SELECT * 
FROM Sales;

SELECT Country, Region, SUM(Sales) AS 'Total Sales'
FROM Sales 
GROUP BY ROLLUP(Country, Region)
GO

SELECT Country, Region, SUM(Sales) AS 'Total Sales'
FROM Sales 
GROUP BY CUBE(Country, Region)
GO

---------------

SELECT * FROM Sales.SalesOrderDetail
GO

SELECT SalesOrderID, SUM(LineTotal) AS 'Total'
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING SUM(LineTotal) < 3
ORDER BY SUM(LineTotal) DESC
GO