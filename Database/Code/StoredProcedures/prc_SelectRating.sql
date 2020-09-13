--SELECT * FROM dbo.Rating
--DROP PROCEDURE dbo.prc_SelectRating;
--EXEC dbo.prc_SelectRating NULL;
--GRANT EXECUTE ON dbo.prc_SelectRating TO xxx;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'prc_SelectRating')
	BEGIN
		PRINT 'Dropping dbo.prc_SelectRating...';
		DROP PROCEDURE dbo.prc_SelectRating;
		PRINT 'Dropped dbo.prc_SelectRating.';
	END
GO
PRINT 'Creating dbo.prc_SelectRating...'
GO
CREATE PROCEDURE dbo.prc_SelectRating
(
	@Number			TINYINT	
)
AS

BEGIN
	SET NOCOUNT ON;
	PRINT CONCAT('@Number=', @Number);
	
	IF @Number IS NOT NULL
		SELECT	* 
		FROM	[dbo].[Rating] 
		WHERE	Number	=	@Number
		;
	ELSE
		SELECT	* 
		FROM	[dbo].[Rating] 
		;
END
