/*
DECLARE @Format TINYINT = 2;
EXEC dbo.prc_EmployeePayCheckAmtDrilldown @Format
EXEC dbo.prc_EmployeePayCheckAmtDrilldown 2
*/
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'prc_EmployeePayCheckAmtDrilldown')
	BEGIN
		PRINT 'Dropping dbo.prc_EmployeePayCheckAmtDrilldown...';
		DROP PROCEDURE dbo.prc_EmployeePayCheckAmtDrilldown;
		PRINT 'Dropped dbo.prc_EmployeePayCheckAmtDrilldown.';
	END
GO
PRINT 'Creating dbo.prc_EmployeePayCheckAmtDrilldown...'
GO
/**
	
*/
CREATE PROCEDURE dbo.prc_EmployeePayCheckAmtDrilldown
(
	/*
		0 - Default. First Name<space>Middle Name<space>Last Name
		1 - First Name<space>Middle Initial<space>Last Name
		2 - Last Name<comma>First Name<space>Middle Name
	*/
	@FullNameFormat		TINYINT		=	0
)
AS

BEGIN
	SET NOCOUNT ON;
	PRINT CONCAT('@FullNameFormat=', @FullNameFormat);
	CREATE TABLE #epx
	(
		EmpId					INT	  NOT NULL PRIMARY KEY	,
		TotalPaycheckAmount		DECIMAL(20,2)	
	);
	INSERT INTO #epx
		SELECT	ep.EmpID	,
				SUM(ep.PaycheckAmount) AS TotalPaycheckAmount
		FROM	dbo.EmployeePaycheck ep		
		GROUP BY ep.EmpID
	;

	/*
	--CTE
	WITH epx AS
	(
		SELECT	ep.EmpID	,
				SUM(ep.PaycheckAmount) AS TotalPaycheckAmount
		FROM	dbo.EmployeePaycheck ep		
		GROUP BY ep.EmpID
	)
	*/
	SELECT	co.Name			AS	Continent_Name	,
			c.Name			AS	Country_Name	,
			s.Name			AS	State_Name		,
			ci.Name			AS	City_Name		,
			l.Description	AS	Location_Desc	,
			e.EmpNo								,
			dbo.fn_GetFullName(@FullNameFormat, e.FirstName, e.MiddleName, e.LastName)    AS FullName ,
			epx.TotalPaycheckAmount
	FROM	dbo.Employee e
	INNER JOIN dbo.OfficeLocation l
		ON	e.OfficeLocationID	=	l.ID
	INNER JOIN dbo.City ci
		ON	l.CityID	=	ci.ID
	INNER JOIN dbo.State s
		ON	ci.StateID	=	s.ID
	INNER JOIN dbo.Country c
		ON	s.CountryID	=	c.ID
	INNER JOIN dbo.Continent co
		ON	c.ContinentID	=	co.ID
	--INNER JOIN epx
	/* --Derived Table
	(
		SELECT	ep.EmpID	,
				SUM(ep.PaycheckAmount) AS TotalPaycheckAmount
		FROM	dbo.EmployeePaycheck ep		
		GROUP BY ep.EmpID
	) epx
	*/
	--    ON  epx.EmpID	=	e.ID
	INNER JOIN #epx epx
	    ON  epx.EmpID	=	e.ID
	;
	DROP TABLE #epx;
END