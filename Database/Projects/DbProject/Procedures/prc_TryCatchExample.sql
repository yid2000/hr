/*
DECLARE	@Result		FLOAT 
EXEC dbo.prc_TryCatchExample 50, 2.5, @Result OUT;
PRINT CONCAT('@Result=', @Result);
*/
DROP PROCEDURE dbo.prc_TryCatchExample
GO
CREATE PROCEDURE dbo.prc_TryCatchExample
(
	@i_Num1		FLOAT	,
	@i_Num2		FLOAT	,
	@o_Result   FLOAT OUTPUT
) 
AS
BEGIN
	BEGIN TRY
		SET @o_Result = @i_Num1 / @i_Num2;
	END TRY
	BEGIN CATCH
		PRINT CONCAT('Caught exception: Error Code:', ERROR_NUMBER(), '; Error Message:', ERROR_MESSAGE());
		SET @o_Result =  @i_Num1;
	END CATCH
END