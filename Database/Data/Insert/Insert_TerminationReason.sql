PRINT 'Inserting data into TerminationReason...'
GO
INSERT INTO dbo.TerminationReason (Code, Description) VALUES ('VT', 'Voluntary Leave');
GO
INSERT INTO dbo.TerminationReason (Code, Description) VALUES ('GEN_LAYOFF', 'General Layoff');
GO
INSERT INTO dbo.TerminationReason (Code, Description) VALUES ('PERF', 'Laid off due to performance reasons');
GO
INSERT INTO dbo.TerminationReason (Code, Description) VALUES ('MISCONDUCT', 'Laid off due to bad conduct');
GO
PRINT 'Inserted data into TerminationReason.'
GO
