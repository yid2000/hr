PRINT 'Inserting data into HolidayDate...'
GO
INSERT INTO dbo.HolidayDate (HolidayID, Date) SELECT ID, CAST('2020-01-01' AS DATETIME) FROM dbo.Holiday WHERE Code = 'NEW_YEAR'
GO
INSERT INTO dbo.HolidayDate (HolidayID, Date) SELECT ID, CAST('2020-01-20' AS DATETIME) FROM dbo.Holiday WHERE Code = 'KING_DAY'
GO
INSERT INTO dbo.HolidayDate (HolidayID, Date) SELECT ID, CAST('2020-02-17' AS DATETIME) FROM dbo.Holiday WHERE Code = 'PRESIDENTS_DAY'
GO
INSERT INTO dbo.HolidayDate (HolidayID, Date) SELECT ID, CAST('2020-05-25' AS DATETIME) FROM dbo.Holiday WHERE Code = 'MEMORIAL_DAY'
GO
INSERT INTO dbo.HolidayDate (HolidayID, Date) SELECT ID, CAST('2020-07-03' AS DATETIME) FROM dbo.Holiday WHERE Code = 'INDE_DAY'
GO
INSERT INTO dbo.HolidayDate (HolidayID, Date) SELECT ID, CAST('2020-09-07' AS DATETIME) FROM dbo.Holiday WHERE Code = 'LABOR_DAY'
GO
INSERT INTO dbo.HolidayDate (HolidayID, Date) SELECT ID, CAST('2020-10-07' AS DATETIME) FROM dbo.Holiday WHERE Code = 'COL_DAY'
GO
INSERT INTO dbo.HolidayDate (HolidayID, Date) SELECT ID, CAST('2020-11-11' AS DATETIME) FROM dbo.Holiday WHERE Code = 'VET_DAY'
GO
INSERT INTO dbo.HolidayDate (HolidayID, Date) SELECT ID, CAST('2020-11-26' AS DATETIME) FROM dbo.Holiday WHERE Code = 'THANKS_DAY'
GO
INSERT INTO dbo.HolidayDate (HolidayID, Date) SELECT ID, CAST('2020-12-25' AS DATETIME) FROM dbo.Holiday WHERE Code = 'XMAS_DAY'
GO
PRINT 'Inserted data into HolidayDate.'
GO

