PRINT 'Inserting data into EmployeeTimeoff...'
GO
DECLARE @ID TABLE (ID INT)
DECLARE @empId  INT = 0;
DECLARE @i  INT = 0;
WHILE @i < 20
BEGIN
	SET @i = @i + 1;
	DELETE FROM @ID;
	INSERT INTO dbo.EmployeeTimeoff 
	(
		EmpID				, 
		FromDate			,
		ToDate				,
		TimeOffID			
	) 
	OUTPUT INSERTED.EmpID INTO @ID
	SELECT	TOP 1 
			e.ID		,
			DATEADD(DAY, 40, e.HireDate)	,
			DATEADD(DAY, 60, e.HireDate)	,
			(SELECT tc.ID FROM dbo.TimeOffCode tc WHERE tc.Code = 'PTO')
	FROM	dbo.Employee e
	WHERE	e.ID	>	@empId
	ORDER BY ID
	;
	SELECT TOP 1 @empId = ID FROM @ID;
END
GO
PRINT 'Inserted data into EmployeeTimeoff.'
GO
