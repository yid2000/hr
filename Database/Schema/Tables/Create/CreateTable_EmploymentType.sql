USE [HRDB]
GO
PRINT 'Creating dbo.EmploymentType...'
GO
CREATE TABLE dbo.EmploymentType
(
  ID				INT IDENTITY (1, 1) NOT NULL ,
  Code				NVARCHAR(10)		NOT NULL ,
  Description		NVARCHAR(100)		NOT NULL 
)
GO
ALTER TABLE dbo.EmploymentType ADD CONSTRAINT PK_EmploymentType PRIMARY KEY (ID)
GO
ALTER TABLE dbo.EmploymentType ADD CONSTRAINT UK_EmploymentType_1 UNIQUE (Code)
GO
PRINT 'Created dbo.EmploymentType.'
GO
