IF EXISTS (SELECT * FROM sys.objects WHERE type = 'TT' AND name LIKE 'TT_StudentInfo%')
	BEGIN
		PRINT 'Dropping dbo.StudentInfo...';
		DROP TYPE dbo.StudentInfo ;
		PRINT 'Dropped dbo.StudentInfo.';
	END
GO
PRINT 'Creating StudentInfo TYPE...'
GO
CREATE TYPE dbo.StudentInfo AS TABLE
(
	StudentID			INT	PRIMARY KEY		,
	StudentFullName		VARCHAR(100)	NOT	NULL	,
	Grade				TINYINT			NOT	NULL	,	
	ClassRoomNo			INT				NOT	NULL	
	INDEX ix_StudentInfo_StudentFullName (StudentFullName)
)
GO
PRINT 'Created StudentInfo TYPE.'
GO

