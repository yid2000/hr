USE [HRDB]
GO
PRINT 'Creating dbo.TerminationReason...'
GO
CREATE TABLE dbo.TerminationReason
(
  ID				INT IDENTITY (1, 1) NOT NULL ,
  Code				NVARCHAR(10)		NOT NULL ,
  Description		NVARCHAR(100)		NOT NULL 
)
GO
ALTER TABLE dbo.TerminationReason ADD CONSTRAINT PK_TerminationReason PRIMARY KEY (ID)
GO
ALTER TABLE dbo.TerminationReason ADD CONSTRAINT UK_TerminationReason_1 UNIQUE (Code)
GO
PRINT 'Created dbo.TerminationReason.'
GO
