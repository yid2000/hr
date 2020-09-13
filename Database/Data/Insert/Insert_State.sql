PRINT 'Inserting data into State...'
GO
INSERT INTO dbo.State (Code, Name, CountryID) SELECT 'CA', 'California', ID FROM dbo.Country c WHERE c.Code = 'USA'
GO
INSERT INTO dbo.State (Code, Name, CountryID) SELECT 'NJ', 'New Jersey', ID FROM dbo.Country c WHERE c.Code = 'USA'
GO
INSERT INTO dbo.State (Code, Name, CountryID) SELECT 'OR', 'Oregon', ID FROM dbo.Country c WHERE c.Code = 'USA'
GO
PRINT 'Inserted data into State.'
GO
