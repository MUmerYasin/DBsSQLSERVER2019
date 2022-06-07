

SELECT [ErrorLogID], [UserName], [ErrorNumber], [ErrorProcedure] AS 'Updated Value', [ErrorMessage] AS 'Deleted Value',[ErrorTime] From dbo.ErrorLog
ORDER BY [ErrorLogID] DESC
GO

SELECT * From Sales.Currency
GO

UPDATE Sales.Currency
SET [CurrencyCode] = 'AEE'
WHERE [CurrencyCode] = 'AED'; 
GO

CREATE TRIGGER ADventureWorks2019_Trigger  
ON Sales.Currency  
AFTER UPDATE   
AS 
BEGIN
    DECLARE @value_deleted  AS NCHAR(3) 
    DECLARE @value_Updated  AS NCHAR(3) 
    DECLARE @random_value   AS INT

    SELECT @value_deleted =  (SELECT CurrencyCode from deleted )
    SELECT @value_Updated =  (SELECT CurrencyCode from inserted )
    SELECT @random_value =   (CAST(RAND()*(1000-1)+1 AS INT))
    
    INSERT INTO dbo.ErrorLog
    ( 
    --  [ErrorLogID],
     [ErrorTime],[UserName],[ErrorNumber], [ErrorMessage], [ErrorProcedure]
    )
    VALUES
    ( 
    --  100,
     GETDATE(),CURRENT_USER, @random_value , @value_deleted, @value_Updated
    )
END;
GO  