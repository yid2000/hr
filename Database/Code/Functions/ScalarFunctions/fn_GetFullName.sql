--SELECT dbo.fn_GetFullName('First', NULL, 'Last');
--SELECT *, dbo.fn_GetFullName(FirstName, MiddleInitial, LastName) AS FullName FROM dbo.Student
--GRANT SELECT ON dbo.fn_GetFullName TO xxx;
GO
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'FN' AND name = 'fn_GetFullName')
	BEGIN
		PRINT 'Dropping dbo.fn_GetFullName...';
		DROP FUNCTION dbo.fn_GetFullName ;
		PRINT 'Dropped dbo.fn_GetFullName.';
	END
GO
PRINT 'Creating dbo.fn_GetFullName...'
GO
/**
	Get person full name
**/
CREATE FUNCTION dbo.fn_GetFullName
(
	@FirstName			VARCHAR(50)	,
	@MiddleInitial		VARCHAR(1)	,
	@LastName			VARCHAR(50)	
)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @fullName VARCHAR(100);
	IF LEN(@FirstName) + LEN(ISNULL(@MiddleInitial, 0)) + LEN(@LastName) >= 100
		SET @fullName = CONCAT(SUBSTRING(CONCAT(@FirstName, ' ', CASE WHEN @MiddleInitial IS NOT NULL THEN CONCAT(@MiddleInitial, ' ') ELSE NULL END,  @LastName), 1, 96), '..');
	ELSE
		SET @fullName = CONCAT(@FirstName, ' ', CASE WHEN @MiddleInitial IS NOT NULL THEN CONCAT(@MiddleInitial, ' ') ELSE NULL END, @LastName);
	RETURN @fullName;
END
GO