/*--xxx
SELECT * FROM Department
SELECT * FROM EmploymentType
SELECT * FROM TerminationReason
SELECT * FROM Holiday
SELECT * FROM HolidayDate
SELECT * FROM TimeoffCode
*/
SELECT * FROM Employee
SELECT * FROM EmployeeTimeoff
SELECT * FROM EmployeeSalary
SELECT * FROM EmployeePaycheck;

WITH PayCheckSummary AS
(
SELECT	ep.EmpID	,
		SUM(ep.PayCheckAmount) AS TotalPaidAmount 
FROM	EmployeePaycheck ep
GROUP BY ep.EmpID
)
SELECT	e.EmpNo		AS	EmpNo	,
		CONCAT(e.FirstName, ' ', e.MiddleName, ' ', e.LastName) AS FullName	,
		pcs.TotalPaidAmount
FROM	PayCheckSummary pcs
INNER JOIN dbo.Employee e
	ON	pcs.EmpID	=	e.ID
ORDER BY e.EmpNo

DECLARE @EmpNo	INT	= 1001;

SELECT	e.EmpNo		,
		CONCAT(e.FirstName, ' ', e.MiddleName, ' ', e.LastName) AS FullName	,
		et.Description		AS EmploymentType,
		e.HireDate			,
		e.TerminationDate	,
		tr.Description		AS TerminationReason
FROM	dbo.Employee e
INNER JOIN dbo.EmploymentType et
	ON	e.EmploymentTypeID	=	et.ID
LEFT JOIN dbo.TerminationReason tr
	ON	e.TerminationReasonID	=	tr.ID
WHERE	e.EmpNo	=	@EmpNo


SELECT	e.EmpNo		,
		CONCAT(e.FirstName, ' ', e.MiddleName, ' ', e.LastName) AS FullName	,
		et.Description		AS EmploymentType,
		e.HireDate			,
		e.TerminationDate	,
		tr.Description		AS TerminationReason	,
		d.Code				AS Dept_Code			, 	
		d.Description		AS Dept_Description		, 	
		l.Code				AS Location_Code		, 	
		l.Description		AS Location_Description		
FROM	dbo.Employee e
INNER JOIN dbo.EmploymentType et
	ON	e.EmploymentTypeID	=	et.ID
LEFT JOIN dbo.TerminationReason tr
	ON	e.TerminationReasonID	=	tr.ID
INNER JOIN dbo.Department d
	ON	e.DeptID	=	d.ID
INNER JOIN dbo.OfficeLocation l
	ON	e.OfficeLocationID	=	l.ID



SELECT	CONCAT(e.EmpNo, ' : ', e.FirstName, ' ', e.MiddleName, ' ', e.LastName) AS EmpID_FullName	,
		FORMAT(ep.FromDate, 'MMMM') AS Month	,
		ep.PaycheckAmount
FROM	dbo.Employee e
INNER JOIN EmployeePaycheck ep
	ON	e.ID	=	ep.EmpID
ORDER BY e.EmpNo




SELECT	co.Name			AS	Continent_Name	,
		c.Name			AS	Country_Name	,
		s.Name			AS	State_Name		,
		ci.Name			AS	City_Name		,
		l.Description	AS	Location_Desc	,
		e.EmpNo								,
		CONCAT(e.FirstName, ' ', e.MiddleName, ' ', e.LastName) AS FullName	
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



SELECT	COUNT(DISTINCT ep.EmpID)	AS	EmployeeCount			,
		SUM(ep.PaycheckAmount)		AS	TotalPaycheckAmount		
FROM	dbo.EmployeePaycheck ep


