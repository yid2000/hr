PRINT 'Inserting data into TimeoffCode...'
GO
INSERT INTO dbo.TimeoffCode (Code, Description) VALUES ('PTO', 'Paid Time Off');
GO
INSERT INTO dbo.TimeoffCode (Code, Description) VALUES ('UPTO', 'Unpaid Time Off');
GO
PRINT 'Inserted data into TimeoffCode.'
GO
