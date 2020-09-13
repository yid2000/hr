/*
DECLARE @RowCount INT;
EXEC dbo.prc_SearchByStudentName 'ed', 1, NULL, NULL, @RowCount OUTPUT;
PRINT CONCAT('@RowCount=', @RowCount);
*/
--GRANT EXECUTE ON dbo.prc_SearchByStudentName TO xxx;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'prc_SearchByStudentName')
	BEGIN
		PRINT 'Dropping dbo.prc_SearchByStudentName...';
		DROP PROCEDURE dbo.prc_SearchByStudentName ;
		PRINT 'Dropped dbo.prc_SearchByStudentName.';
	END
GO
PRINT 'Creating dbo.prc_SearchByStudentName...'
GO
CREATE PROCEDURE dbo.prc_SearchByStudentName
(
	@StudentFirstName					  VARCHAR(30)		,
	@StudentFirstNameSearchCriteriaFlag   TINYINT			,
	@StudentLastName					  VARCHAR(30)		,
	@StudentLastNameSearchCriteriaFlag    TINYINT			,
	@RowCount							  INT			OUT	
)
AS

BEGIN
	SET NOCOUNT ON;
	DECLARE @startDateTime DATETIME = GETDATE();

	PRINT CONCAT(GETDATE(), ' : **** BEGIN dbo.prc_SearchByStudentName ****');
	PRINT CONCAT(GETDATE(), ' : @StudentFirstName=', @StudentFirstName, '; @StudentFirstNameSearchCriteriaFlag=', @StudentFirstNameSearchCriteriaFlag, '; @StudentLastName=', @StudentLastName, '; @StudentLastNameSearchCriteriaFlag=', @StudentLastNameSearchCriteriaFlag);

	IF @StudentFirstName IS NOT NULL
		EXEC dbo.prc_SearchByStudentFirstName 	@StudentFirstName, @StudentFirstNameSearchCriteriaFlag, @RowCount OUT;
	ELSE 
		IF @StudentLastName IS NOT NULL
			EXEC dbo.prc_SearchByStudentLastName 	@StudentLastName, @StudentLastNameSearchCriteriaFlag, @RowCount OUT;
		ELSE
			BEGIN
				SET @RowCount = -100;
				RETURN;
			END

	SET @RowCount = @@ROWCOUNT;

	DECLARE @endDateTime DATETIME = GETDATE();
	DECLARE @elapsedTime INT = DATEDIFF(ms, @startDateTime, @endDateTime);

	PRINT CONCAT(GETDATE(), ' : **** END dbo.prc_SearchByStudentName : elapsed time: ', @elapsedTime, ' (ms) ****');
END


