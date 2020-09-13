PRINT 'Creating dbo.HolidayDate...'
GO
CREATE TABLE dbo.HolidayDate
(
  ID			INT IDENTITY (1, 1) NOT NULL ,
  HolidayID		INT					NOT NULL ,
  Date			DATETIME			NOT NULL 
)
GO
ALTER TABLE dbo.HolidayDate ADD CONSTRAINT PK_HolidayDate PRIMARY KEY (ID)
GO
ALTER TABLE dbo.HolidayDate ADD CONSTRAINT UK_HolidayDate_1 UNIQUE (Date)
GO
PRINT 'Created dbo.HolidayDate.'
GO

