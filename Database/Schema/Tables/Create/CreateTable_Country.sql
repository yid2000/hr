USE [HRDB]
GO
PRINT 'Creating dbo.Country...'
GO
CREATE TABLE dbo.Country
(
  ID				INT IDENTITY (1, 1) NOT NULL ,
  Code				NVARCHAR(10)		NOT NULL ,
  Name				NVARCHAR(100)		NOT NULL ,
  ContinentID		INT					NOT NULL 
)
GO
ALTER TABLE dbo.Country ADD CONSTRAINT PK_Country PRIMARY KEY (ID)
GO
ALTER TABLE dbo.Country ADD CONSTRAINT UK_Country_1 UNIQUE (Code)
GO
ALTER TABLE dbo.Country ADD CONSTRAINT FK_Country_ContinentID FOREIGN KEY (ContinentID) REFERENCES dbo.Continent(ID)
GO
PRINT 'Created dbo.Country.'
GO
