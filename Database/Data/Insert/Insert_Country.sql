PRINT 'Inserting data into Country...'
GO
INSERT INTO dbo.Country (Code, Name, ContinentID) SELECT 'IND', 'India', ID FROM dbo.Continent c WHERE c.Name = 'Asia'
GO
INSERT INTO dbo.Country (Code, Name, ContinentID) SELECT 'CHI', 'China', ID FROM dbo.Continent c WHERE c.Name = 'Asia'
GO
INSERT INTO dbo.Country (Code, Name, ContinentID) SELECT 'SNG', 'Singapore', ID FROM dbo.Continent c WHERE c.Name = 'Asia'
GO
INSERT INTO dbo.Country (Code, Name, ContinentID) SELECT 'USA', 'United States Of America', ID FROM dbo.Continent c WHERE c.Name = 'North America'
GO
INSERT INTO dbo.Country (Code, Name, ContinentID) SELECT 'CAN', 'Canada', ID FROM dbo.Continent c WHERE c.Name = 'North America'
GO
INSERT INTO dbo.Country (Code, Name, ContinentID) SELECT 'MEX', 'Mexico', ID FROM dbo.Continent c WHERE c.Name = 'North America'
GO
PRINT 'Inserted data into Country.'
GO
