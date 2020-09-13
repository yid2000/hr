PRINT 'Creating dbo.TimeoffCode...'
GO
CREATE TABLE dbo.TimeoffCode
(
  ID			INT IDENTITY (1, 1) NOT NULL ,
  Code			NVARCHAR(10)		NOT NULL ,
  Description	NVARCHAR(100)		NOT NULL 
)
GO
ALTER TABLE dbo.TimeoffCode ADD CONSTRAINT PK_TimeoffCode PRIMARY KEY (ID)
GO
ALTER TABLE dbo.TimeoffCode ADD CONSTRAINT UK_TimeoffCode_1 UNIQUE (Code)
GO
PRINT 'Created dbo.TimeoffCode.'
GO

