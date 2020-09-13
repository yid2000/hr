PRINT 'Creating dbo.EmployeeSalary...'
GO
CREATE TABLE dbo.EmployeeSalary
(
  ID					INT IDENTITY (1, 1) NOT NULL ,
  EmpID					INT					NOT NULL ,
  FromDate				DATETIME			NOT NULL ,
  ToDate				DATETIME			NULL	 ,  
  YearlySalaryAmount	DECIMAL(20, 2)		NOT NULL 
)
GO
ALTER TABLE dbo.EmployeeSalary ADD CONSTRAINT PK_EmployeeSalary PRIMARY KEY (ID)
GO
ALTER TABLE dbo.EmployeeSalary ADD CONSTRAINT UK_EmployeeSalary_1 UNIQUE (EmpID, FromDate)
GO
ALTER TABLE dbo.EmployeeSalary ADD CONSTRAINT FK_EmployeeSalary_EmpID FOREIGN KEY (EmpID) REFERENCES dbo.Employee(ID)
GO
PRINT 'Created dbo.EmployeeSalary.'
GO

