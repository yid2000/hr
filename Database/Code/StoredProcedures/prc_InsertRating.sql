--SELECT * FROM dbo.Rating
--DROP PROCEDURE dbo.prc_InsertRating;
--EXEC dbo.prc_InsertRating 11, 'Rating 11';
--GRANT EXECUTE ON dbo.prc_InsertRating TO xxx;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'prc_InsertRating')
	BEGIN
		PRINT 'Dropping dbo.prc_InsertRating...';
		DROP PROCEDURE dbo.prc_InsertRating;
		PRINT 'Dropped dbo.prc_InsertRating.';
	END
GO
PRINT 'Creating dbo.prc_InsertRating...'
GO
CREATE PROCEDURE dbo.prc_InsertRating
(
	@Number			TINYINT		,
	@Description	VARCHAR(30)	
)
AS

BEGIN
	SET NOCOUNT ON;
	PRINT CONCAT('@Number=', @Number, '; @Description=', @Description);
	
	/*
	IF NOT (@Number BETWEEN 1 AND 10)
		RAISERROR('Rating should be between 1 to 10', 18, 1);
	*/

	INSERT INTO [dbo].[Rating]
	(
		[Number]		,
		[Description] 
	)
	VALUES
	(
		@Number			,
		@Description
	);
END
