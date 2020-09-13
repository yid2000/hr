PRINT 'Inserting data into EmployeePaycheck...'
GO
DECLARE @CurYear INT = DATEPART(YEAR, GETDATE());
WITH MonthNumbers AS
(
	SELECT	1 AS Month UNION ALL
	SELECT	2 AS Month UNION ALL
	SELECT	3 AS Month UNION ALL
	SELECT	4 AS Month UNION ALL
	SELECT	5 AS Month UNION ALL
	SELECT	6 AS Month UNION ALL
	SELECT	7 AS Month UNION ALL
	SELECT	8 AS Month UNION ALL
	SELECT	9 AS Month UNION ALL
	SELECT	10 AS Month UNION ALL
	SELECT	11 AS Month UNION ALL
	SELECT	12 AS Month
)
, PaycheckPeriods AS
(
	SELECT	CAST(CONCAT(@CurYear, '-', m.Month, '-01') AS DATETIME)	AS StartDate,
			CASE WHEN m.Month = 12 THEN CAST(CONCAT(@CurYear, '-', 12, '-31') AS DATETIME) ELSE DATEADD(DAY, -1, CAST(CONCAT(@CurYear, '-', m.Month + 1, '-01') AS DATETIME)) END 	AS EndDate
	FROM	MonthNumbers m
)
INSERT INTO dbo.EmployeePaycheck 
(
	EmpID				, 
	FromDate			,
	ToDate				,
	PaycheckAmount				
) 
SELECT	e.ID				,
		pp.StartDate		,
		pp.EndDate			,
		es.YearlySalaryAmount / 12
FROM	dbo.Employee e
INNER JOIN dbo.EmployeeSalary es
	ON	e.ID	=	es.EmpID
INNER JOIN PaycheckPeriods pp
	ON	es.FromDate	<=	pp.StartDate
;
GO
PRINT 'Inserted data into EmployeePaycheck.'
GO
