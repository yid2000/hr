USE [HRDB]
GO
PRINT 'Creating dbo.OfficeLocation...'
GO
CREATE TABLE dbo.OfficeLocation
(
  ID				INT IDENTITY (1, 1) NOT NULL ,
  Code				NVARCHAR(10)		NOT NULL ,
  Description		NVARCHAR(100)		NOT NULL ,
  CityID			INT					NOT NULL 
)
GO
ALTER TABLE dbo.OfficeLocation ADD CONSTRAINT PK_OfficeLocation PRIMARY KEY (ID)
GO
ALTER TABLE dbo.OfficeLocation ADD CONSTRAINT UK_OfficeLocation_1 UNIQUE (Code)
GO
ALTER TABLE dbo.OfficeLocation ADD CONSTRAINT FK_OfficeLocation_CityID FOREIGN KEY (CityID) REFERENCES dbo.City(ID)
GO
PRINT 'Created dbo.OfficeLocation.'
GO
