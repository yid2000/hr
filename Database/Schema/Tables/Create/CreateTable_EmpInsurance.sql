USE HRDB
GO
DROP TABLE dbo.EmpInsurance
GO
PRINT 'creating dbo.EmpInsurance...'
GO
CREATE TABLE dbo.EmpInsurance
(
	ID           INT IDENTITY(1,1) NOT NULL	,
	Code         VARCHAR(5)		   NOT NULL	,
	Description  VARCHAR(50)	   NOT NULL
)
GO
ALTER TABLE dbo.EmpInsurance ADD CONSTRAINT PK_EmpInsurance PRIMARY KEY (ID)
GO
ALTER TABLE dbo.EmpInsurance ADD CONSTRAINT UK_EmpInsurance UNIQUE (Code)
GO
PRINT 'created dbo.EmpInsurance......'
GO