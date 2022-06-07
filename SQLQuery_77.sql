-- SQL -- Variables 

-- Types of Variables
-- Local variables     @
-- Global variables    @@

Select @@VERSION
GO

----

DECLARE @x INT = 5;
PRINT @x
GO

DECLARE @x INT;
SET @x = 50
PRINT @x
GO

DECLARE @total_record INT;
SET @total_record = (
    select COUNT(*) from Sales
)
IF @total_record = 5
    print 'low sales'
ELSE
    BEGIN
        IF @total_record = 6
            PRINT 'medium sales'
        ELSE
            print 'best sales'
    END
--print 'total sales :' + cast(@total_record as nvarchar(max));
GO 


