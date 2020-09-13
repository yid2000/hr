PRINT 'Inserting data into Employee...'
GO
DECLARE @i  INT = 0;
WHILE @i < 100
BEGIN
	SET @i = @i + 1;
	INSERT INTO dbo.Employee 
	(
		EmpNo				, 
		FirstName			,
		MiddleName			,
		LastName			,
		WorkAddress			,
		HomeAddress			,		
		DeptID				,
		EmploymentTypeID	,
		OfficeLocationID	,	
		HireDate			,
		TerminationDate		,
		TerminationReasonID
	) 
	SELECT
			1000 + @i						,
			CONCAT('FirstName:', @i)		, 
			NULL							,
			CONCAT('LastName:', @i)			, 
			CONCAT(@i, ' Work St. WorkTown, XX 99999')	,
			CONCAT(@i, ' Home St. HomeTown, XX 11111')	,
			d.ID							,
			(SELECT et.ID FROM dbo.EmploymentType et WHERE et.Code = CASE WHEN @i <= 70 THEN 'FT'
																		  ELSE 'PT'
																	END		
			),
			(SELECT ID FROM dbo.OfficeLocation WHERE Code = 'SFO1')	,
			CASE WHEN @i <= 20 THEN CAST('2020-01-01' AS DATETIME)
				 WHEN @i > 20 AND @i <= 40 THEN CAST('2020-02-01' AS DATETIME)
				 WHEN @i > 41 AND @i <= 60 THEN CAST('2020-03-01' AS DATETIME)
				 WHEN @i > 61 AND @i <= 80 THEN CAST('2020-04-01' AS DATETIME)
				 ELSE CAST('2020-05-01' AS DATETIME)
			END	,
			NULL	,
			NULL	
	FROM	dbo.Department d
	WHERE	d.Code = CASE WHEN @i <= 90 THEN 'IT'  
						  WHEN @i > 91 AND @i < 95 THEN 'FIN'  
						  WHEN @i > 95 AND @i < 97 THEN 'HR'  
						  ELSE 'ADMIN'
					 END
END
GO
PRINT 'Inserted data into Employee.'
GO
