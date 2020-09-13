IF EXISTS (SELECT * FROM sys.objects WHERE type = 'TR' AND name = 'trg_ProgressReport')
	BEGIN
		PRINT 'Dropping dbo.trg_ProgressReport...';
		DROP TRIGGER dbo.trg_ProgressReport ;
		PRINT 'Dropped dbo.trg_ProgressReport.';
	END
GO
PRINT 'Creating dbo.trg_ProgressReport...'
GO
CREATE TRIGGER dbo.trg_ProgressReport ON dbo.ProgressReport
AFTER INSERT 
AS
BEGIN
    SET NOCOUNT ON;
	INSERT INTO dbo.ProgressReportAudit 
	(
		ProgressReportId		,
		Action					,
		CreatedOn					
	)
	SELECT	ProgressReportId	,
			'I'					,
			GETDATE()
	FROM	INSERTED
	;		
END