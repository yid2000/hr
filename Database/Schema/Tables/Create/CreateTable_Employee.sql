PRINT 'Creating dbo.Employee...'
GO
CREATE TABLE dbo.Employee
(
  ID					INT IDENTITY (1, 1) NOT NULL ,
  EmpNo					INT					NOT NULL ,
  FirstName				NVARCHAR(100)		NOT NULL ,	
  MiddleName			NVARCHAR(100)		NULL	 ,	
  LastName				NVARCHAR(100)		NOT NULL ,	
  WorkAddress			NVARCHAR(1000)		NOT NULL ,	
  HomeAddress			NVARCHAR(1000)		NOT NULL ,	
  DeptID				INT					NOT NULL ,		
  EmploymentTypeID		INT					NOT NULL ,		
  OfficeLocationID		INT					NOT NULL ,		
  HireDate				DATETIME			NOT NULL ,	
  TerminationDate		DATETIME			NULL	 ,	
  TerminationReasonID	INT					NULL	 	
)
GO
ALTER TABLE dbo.Employee ADD CONSTRAINT PK_Employee PRIMARY KEY (ID)
GO
ALTER TABLE dbo.Employee ADD CONSTRAINT UK_Employee_1 UNIQUE (EmpNo)
GO
ALTER TABLE dbo.Employee ADD CONSTRAINT FK_Employee_DeptID FOREIGN KEY (DeptID) REFERENCES dbo.Department(ID)
GO
ALTER TABLE dbo.Employee ADD CONSTRAINT FK_Employee_OfficeLocationID FOREIGN KEY (OfficeLocationID) REFERENCES dbo.OfficeLocation(ID)
GO
ALTER TABLE dbo.Employee ADD CONSTRAINT FK_Employee_EmploymentTypeID FOREIGN KEY (EmploymentTypeID) REFERENCES dbo.EmploymentType(ID)
GO
ALTER TABLE dbo.Employee ADD CONSTRAINT FK_Employee_TerminationReasonID FOREIGN KEY (TerminationReasonID) REFERENCES dbo.TerminationReason(ID)
GO
PRINT 'Created dbo.Employee.'
GO

