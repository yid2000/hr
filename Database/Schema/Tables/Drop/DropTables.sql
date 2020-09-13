IF EXISTS (SELECT * FROM sys.objects WHERE type = 'U' AND name = 'EmployeePaycheck')
	BEGIN
		PRINT 'Dropping dbo.EmployeePaycheck...';
		DROP TABLE dbo.EmployeePaycheck;
		PRINT 'Dropped dbo.EmployeePaycheck.';
	END
GO


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'U' AND name = 'EmployeeSalary')
	BEGIN
		PRINT 'Dropping dbo.EmployeeSalary...';
		DROP TABLE dbo.EmployeeSalary;
		PRINT 'Dropped dbo.EmployeeSalary.';
	END
GO


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'U' AND name = 'EmployeeTimeoff')
	BEGIN
		PRINT 'Dropping dbo.EmployeeTimeoff...';
		DROP TABLE dbo.EmployeeTimeoff;
		PRINT 'Dropped dbo.EmployeeTimeoff.';
	END
GO


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'U' AND name = 'Employee')
	BEGIN
		PRINT 'Dropping dbo.Employee...';
		DROP TABLE dbo.Employee;
		PRINT 'Dropped dbo.Employee.';
	END
GO


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'U' AND name = 'TimeoffCode')
	BEGIN
		PRINT 'Dropping dbo.TimeoffCode...';
		DROP TABLE dbo.TimeoffCode;
		PRINT 'Dropped dbo.TimeoffCode.';
	END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'U' AND name = 'HolidayDate')
	BEGIN
		PRINT 'Dropping dbo.HolidayDate...';
		DROP TABLE dbo.HolidayDate;
		PRINT 'Dropped dbo.HolidayDate.';
	END
GO


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'U' AND name = 'Holiday')
	BEGIN
		PRINT 'Dropping dbo.Holiday...';
		DROP TABLE dbo.Holiday;
		PRINT 'Dropped dbo.Holiday.';
	END
GO


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'U' AND name = 'TerminationReason')
	BEGIN
		PRINT 'Dropping dbo.TerminationReason...';
		DROP TABLE dbo.TerminationReason;
		PRINT 'Dropped dbo.TerminationReason.';
	END
GO


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'U' AND name = 'EmploymentType')
	BEGIN
		PRINT 'Dropping dbo.EmploymentType...';
		DROP TABLE dbo.EmploymentType;
		PRINT 'Dropped dbo.EmploymentType.';
	END
GO


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'U' AND name = 'Department')
	BEGIN
		PRINT 'Dropping dbo.Department...';
		DROP TABLE dbo.Department;
		PRINT 'Dropped dbo.Department.';
	END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'U' AND name = 'OfficeLocation')
	BEGIN
		PRINT 'Dropping dbo.OfficeLocation...';
		DROP TABLE dbo.OfficeLocation;
		PRINT 'Dropped dbo.OfficeLocation.';
	END
GO


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'U' AND name = 'City')
	BEGIN
		PRINT 'Dropping dbo.City...';
		DROP TABLE dbo.City;
		PRINT 'Dropped dbo.City.';
	END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'U' AND name = 'State')
	BEGIN
		PRINT 'Dropping dbo.State...';
		DROP TABLE dbo.State;
		PRINT 'Dropped dbo.State.';
	END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'U' AND name = 'Country')
	BEGIN
		PRINT 'Dropping dbo.Country...';
		DROP TABLE dbo.Country;
		PRINT 'Dropped dbo.Country.';
	END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'U' AND name = 'Continent')
	BEGIN
		PRINT 'Dropping dbo.Continent...';
		DROP TABLE dbo.Continent;
		PRINT 'Dropped dbo.Continent.';
	END
GO
