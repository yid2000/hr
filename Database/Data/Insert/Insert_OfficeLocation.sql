PRINT 'Inserting data into OfficeLocation...'
GO
INSERT INTO dbo.OfficeLocation (Code, Description, CityID) SELECT 'FMT1', 'Fremont Office 1', ID FROM dbo.City c WHERE c.Name = 'Fremont'
GO
INSERT INTO dbo.OfficeLocation (Code, Description, CityID) SELECT 'SFO1', 'San Francisco Office 1', ID FROM dbo.City c WHERE c.Name = 'San Francisco'
GO
INSERT INTO dbo.OfficeLocation (Code, Description, CityID) SELECT 'SFO2', 'San Francisco Office 2', ID FROM dbo.City c WHERE c.Name = 'San Francisco'
GO
PRINT 'Inserted data into OfficeLocation.'
GO
