PRINT 'Inserting data into City...'
GO
INSERT INTO dbo.City (Name, StateID) SELECT 'Fremont', ID FROM dbo.State c WHERE c.Code = 'CA'
GO
INSERT INTO dbo.City (Name, StateID) SELECT 'San Francisco', ID FROM dbo.State c WHERE c.Code = 'CA'
GO
INSERT INTO dbo.City (Name, StateID) SELECT 'San Jose', ID FROM dbo.State c WHERE c.Code = 'USA'
GO
PRINT 'Inserted data into City.'
GO
