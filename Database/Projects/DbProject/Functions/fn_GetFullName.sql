--SELECT dbo.fn_GetFullName(2, 'First', 'Middle', 'Last');
--SELECT *, dbo.fn_GetFullName(2, FirstName, MiddleName, LastName) AS FullName FROM dbo.Employee
--GRANT SELECT ON dbo.fn_GetFullName TO xxx;
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'FN' AND name = 'fn_GetFullName')
	BEGIN
		PRINT 'Dropping dbo.fn_GetFullName..';
		DROP FUNCTION dbo.fn_GetFullName ;
		PRINT 'Dropped dbo.fn_GetFullName';
	END
GO
PRINT 'Creating dbo.fn_GetFullName..'
GO
/**
	Get person full name
**/
CREATE FUNCTION dbo.fn_GetFullName
(  
    @FullNameFormat TINYINT			,
	@FirstName		VARCHAR(100)	,
	@MiddleName		VARCHAR(100)	,
	@LastName		VARCHAR(100)	
)
RETURNS VARCHAR(300)
AS
BEGIN
	RETURN  CASE WHEN @FullNameFormat =	0	THEN CONCAT(@FirstName, ' ', @MiddleName, ' ', @LastName) 
				 WHEN @FullNameFormat = 1	THEN CONCAT(@FirstName, ' ', SUBSTRING(@MiddleName, 1, 1), ' ', @LastName) 
				 WHEN @FullNameFormat = 2	THEN CONCAT(@LastName, ', ', @FirstName, ' ', @MiddleName)
				 ELSE CONCAT(@FirstName, ' ', @MiddleName, ' ', @LastName)
			END
END
GO

