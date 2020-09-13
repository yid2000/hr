--SELECT * FROM dbo.Rating
--EXEC dbo.prc_DeleteRatingRange 10, 12;
--GRANT EXECUTE ON dbo.prc_DeleteRatingRange TO xxx;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'prc_DeleteRatingRange')
	BEGIN
		PRINT 'Dropping dbo.prc_DeleteRatingRange...';
		DROP PROCEDURE dbo.prc_DeleteRatingRange;
		PRINT 'Dropped dbo.prc_DeleteRatingRange.';
	END
GO
PRINT 'Creating dbo.prc_DeleteRatingRange...'
GO
CREATE PROCEDURE dbo.prc_DeleteRatingRange
(
	@Number1		TINYINT		,
	@Number2		TINYINT		
)
AS
BEGIN
	SET NOCOUNT ON;
	PRINT CONCAT('@Number1=', @Number1, '; @Number2=', @Number2);

	DELETE FROM [dbo].[Rating]
	WHERE  Number	BETWEEN	@Number1 AND @Number2
	;	
	PRINT CONCAT('@@ROWCOUNT=', @@ROWCOUNT);
END
