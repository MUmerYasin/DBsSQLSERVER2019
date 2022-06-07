USE AdventureWorks2019


-- SELECT * FROM [Person].[Address]
-- GO
-- ###-----------------------------------------------------------------
-- Question # 1 -->

-- SELECT PP.FirstName AS 'Name', PE.EmailAddress AS 'Email', PP.Title, PPs.PasswordSalt
--     FROM [Person].[Person] PP
--     INNER JOIN [Person].[EmailAddress] PE ON PP.BusinessEntityID = PE.BusinessEntityID
--     INNER JOIN [Person].[Password] PPs ON PP.BusinessEntityID = PPs.BusinessEntityID
-- GO


-- ###-----------------------------------------------------------------

-- Question # 2 -->Join Production.Product


-- SELECT PrP.Name AS 'Product Name', PrP.ProductNumber, PrP.Color, PrH.StandardCost
--     FROM [Production].[Product] PrP
--     INNER JOIN [Production].[ProductCostHistory] PrH ON PrP.ProductID =PrH.ProductID
--     -- WHERE PrP.SafetyStockLevel > 350 AND 400 > PrP.SafetyStockLevel 
--     WHERE PrP.SafetyStockLevel Between 350 AND 900   
--     GROUP BY PrP.ProductNumber, PrP.Color, PrP.Name, PrH.StandardCost
--     HAVING PrP.Color = 'Red'
-- GO

-- ###-----------------------------------------------------------------

-- Sale ID Sale order Detail

SELECT [SalesOrderID], ProductID, SUM(UnitPrice) AS 'Unit Price', SUM(UnitPriceDiscount) AS 'Unit Price Discount'  FROM [Sales].[SalesOrderDetail]
GROUP BY ProductID, [UnitPrice], [UnitPriceDiscount], [SalesOrderID]
GO

SELECT count(ProductID) AS 'ProductID',count(SalesOrderID) AS 'SalesOrderID'   FROM [Sales].[SalesOrderDetail]
-- GROUP BY ProductID, [SalesOrderID]
GO


SELECT DISTINCT[ProductID]   FROM [Sales].[SalesOrderDetail]
-- GROUP BY ProductID, [SalesOrderID]
GO






