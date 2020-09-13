PRINT 'Inserting data into EmployeeSalary...'
GO
INSERT INTO dbo.EmployeeSalary 
(
	EmpID				, 
	FromDate			,
	ToDate				,
	YearlySalaryAmount				
) 
SELECT	e.ID		,
		e.HireDate	,
		NULL		,
		e.EmpNo * 100   
FROM	dbo.Employee e
;
GO
PRINT 'Inserted data into EmployeeSalary.'
GO
