--SELECT * FROM dbo.Rating
--EXEC dbo.prc_DeleteRating 12;
--GRANT EXECUTE ON dbo.prc_DeleteRating TO xxx;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'prc_DeleteRating')
	BEGIN
		PRINT 'Dropping dbo.prc_DeleteRating...';
		DROP PROCEDURE dbo.prc_DeleteRating;
		PRINT 'Dropped dbo.prc_DeleteRating.';
	END
GO
PRINT 'Creating dbo.prc_DeleteRating...'
GO
CREATE PROCEDURE dbo.prc_DeleteRating
(
	@Number		TINYINT		
)
AS
BEGIN
	SET NOCOUNT ON;
	PRINT CONCAT('@Number=', @Number);

	DELETE FROM [dbo].[Rating]
	WHERE  Number	=	@Number
	;	
	PRINT CONCAT('@@ROWCOUNT=', @@ROWCOUNT);
END
