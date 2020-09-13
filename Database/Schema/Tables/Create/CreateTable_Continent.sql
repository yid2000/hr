USE [HRDB]
GO
PRINT 'Creating dbo.Continent...'
GO
CREATE TABLE dbo.Continent
(
  ID				INT IDENTITY (1, 1) NOT NULL ,
  Name				NVARCHAR(30)		NOT NULL 
)
GO
ALTER TABLE dbo.Continent ADD CONSTRAINT PK_Continent PRIMARY KEY (ID)
GO
ALTER TABLE dbo.Continent ADD CONSTRAINT UK_Continent_1 UNIQUE (Name)
GO
PRINT 'Created dbo.Continent.'
GO
