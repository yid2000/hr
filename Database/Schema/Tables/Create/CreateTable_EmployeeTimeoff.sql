PRINT 'Creating dbo.EmployeeTimeoff...'
GO
CREATE TABLE dbo.EmployeeTimeoff
(
  ID					INT IDENTITY (1, 1) NOT NULL ,
  EmpID					INT					NOT NULL ,
  FromDate				DATETIME			NOT NULL ,
  ToDate				DATETIME			NOT NULL ,
  TimeOffID				INT					NOT NULL 
)
GO
ALTER TABLE dbo.EmployeeTimeoff ADD CONSTRAINT PK_EmployeeTimeoff PRIMARY KEY (ID)
GO
ALTER TABLE dbo.EmployeeTimeoff ADD CONSTRAINT UK_EmployeeTimeoff_1 UNIQUE (EmpID, FromDate)
GO
ALTER TABLE dbo.EmployeeTimeoff ADD CONSTRAINT FK_EmployeeTimeoff_EmpID FOREIGN KEY (EmpID) REFERENCES dbo.Employee(ID)
GO
ALTER TABLE dbo.EmployeeTimeoff ADD CONSTRAINT FK_EmployeeTimeoff_TimeOffID FOREIGN KEY (TimeOffID) REFERENCES dbo.TimeOffCode(ID)
GO
PRINT 'Created dbo.EmployeeTimeoff.'
GO

