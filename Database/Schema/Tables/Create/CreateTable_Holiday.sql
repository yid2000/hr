PRINT 'Creating dbo.Holiday...'
GO
CREATE TABLE dbo.Holiday
(
  ID			INT IDENTITY (1, 1) NOT NULL ,
  Code			NVARCHAR(20)		NOT NULL ,
  Description	NVARCHAR(100)		NOT NULL 
)
GO
ALTER TABLE dbo.Holiday ADD CONSTRAINT PK_Holiday PRIMARY KEY (ID)
GO
ALTER TABLE dbo.Holiday ADD CONSTRAINT UK_Holiday_1 UNIQUE (Code)
GO
PRINT 'Created dbo.Holiday.'
GO

