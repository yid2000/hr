USE [HRDB]
GO
PRINT 'Creating dbo.Department...'
GO
CREATE TABLE dbo.Department
(
  ID				INT IDENTITY (1, 1) NOT NULL ,
  Code				NVARCHAR(10)		NOT NULL ,
  Description		NVARCHAR(100)		NOT NULL 
)
GO
ALTER TABLE dbo.Department ADD CONSTRAINT PK_Department PRIMARY KEY (ID)
GO
ALTER TABLE dbo.Department ADD CONSTRAINT UK_Department_1 UNIQUE (Code)
GO
PRINT 'Created dbo.Department.'
GO
