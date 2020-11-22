DROP TABLE dbo.EmployeeTest
GO
CREATE TABLE dbo.EmployeeTest
(
	No			INT NOT NULL	PRIMARY KEY ,
	MgrNo		INT		NULL	FOREIGN KEY REFERENCES dbo.EmployeeTest(No),
	FullName	NVARCHAR(100)
)
GO

INSERT INTO dbo.EmployeeTest VALUES (1, NULL, 'CEO Boss')
GO
INSERT INTO dbo.EmployeeTest VALUES (101, 1, 'Manager 1')
GO
INSERT INTO dbo.EmployeeTest VALUES (102, 1, 'Manager 2')
GO

INSERT INTO dbo.EmployeeTest VALUES (2001, 101, 'Employee 1: Mgr1')
GO
INSERT INTO dbo.EmployeeTest VALUES (2002, 101, 'Employee 2: Mgr1')
GO
INSERT INTO dbo.EmployeeTest VALUES (2003, 101, 'Employee 3: Mgr1')
GO

INSERT INTO dbo.EmployeeTest VALUES (3001, 102, 'Employee 1: Mgr2')
GO
INSERT INTO dbo.EmployeeTest VALUES (3002, 102, 'Employee 2: Mgr2')
GO

SELECT * FROM dbo.EmployeeTest
GO
--normal CTE/WITH clause
WITH emp_cte AS 
(
    SELECT	No			, 
			FullName	,	
			MgrNo
    FROM	dbo.EmployeeTest
    WHERE	MgrNo IS NULL
)
SELECT * FROM emp_cte;
GO
--recursive CTE/WITH clause
WITH emp_cte AS 
(
    SELECT	No			AS	EmpNo		, 
			FullName	AS  EmpFullName	,	
			MgrNo		AS  EmpMgrNo	,
			CAST(NULL AS INT)		AS	MgrNo		, 
			CAST(NULL AS NVARCHAR(100))		AS	MgrFullName	,	
			CAST(NULL AS INT)		AS	MgrMgrNo	
    FROM	dbo.EmployeeTest
    WHERE	MgrNo IS NULL
    UNION ALL
    SELECT	e.No			, 
			e.FullName		,	
			e.MgrNo			,
			m.EmpNo			AS	MgrNo		,
			m.EmpFullName	AS	MgrFullName	,
			m.EmpMgrNo		AS	MgrMgrNo	
    FROM	dbo.EmployeeTest e
    INNER JOIN emp_cte m
        ON e.MgrNo	=	m.EmpNo
)
SELECT * FROM emp_cte;