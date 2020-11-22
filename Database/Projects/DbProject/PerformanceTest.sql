--SELECT COUNT(e.No) FROM dbo.EmployeeTest e
GO
DROP INDEX ix_EmployeeTest_No ON dbo.EmployeeTest
GO
DROP TABLE dbo.EmployeeTest
GO
CREATE TABLE dbo.EmployeeTest
(
	--ID			INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	No			INT NOT NULL	,
	FullName	NVARCHAR(1000)
)
CREATE INDEX ix_EmployeeTest_No ON dbo.EmployeeTest(No)
GO
DECLARE @i INT = 0;
SET NOCOUNT ON;
WHILE @i < 100000
	BEGIN
		SET @i = @i + 1;
		INSERT INTO dbo.EmployeeTest 
		(
			No				, 
			FullName		
		) 
		SELECT
			1000 + @i						,
			CONCAT(1000 + @i, ':', 'FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName_FullName')
		;
	END
GO