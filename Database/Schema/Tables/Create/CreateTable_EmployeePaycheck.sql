PRINT 'Creating dbo.EmployeePaycheck...'
GO
CREATE TABLE dbo.EmployeePaycheck
(
  ID					INT IDENTITY (1, 1) NOT NULL ,
  EmpID					INT					NOT NULL ,
  FromDate				DATETIME			NOT NULL ,
  ToDate				DATETIME			NOT NULL ,  
  PaycheckAmount		DECIMAL(20, 2)		NOT NULL 
)
GO
ALTER TABLE dbo.EmployeePaycheck ADD CONSTRAINT PK_EmployeePaycheck PRIMARY KEY (ID)
GO
ALTER TABLE dbo.EmployeePaycheck ADD CONSTRAINT UK_EmployeePaycheck_1 UNIQUE (EmpID, FromDate)
GO
ALTER TABLE dbo.EmployeePaycheck ADD CONSTRAINT FK_EmployeePaycheck_EmpID FOREIGN KEY (EmpID) REFERENCES dbo.Employee(ID)
GO
PRINT 'Created dbo.EmployeePaycheck.'
GO

