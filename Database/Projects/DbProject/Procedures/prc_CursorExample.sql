--EXECUTE dbo.prc_CursorExample
DROP PROCEDURE dbo.prc_CursorExample
GO
CREATE PROCEDURE dbo.prc_CursorExample
AS
BEGIN
	CREATE TABLE #Dummy
	(
		ID		INT IDENTITY(1,1) NOT NULL ,
		Num1	FLOAT	,
		Num2	FLOAT	,
		Result  FLOAT
	);
	INSERT INTO #Dummy (Num1, Num2) VALUES (10, 2), (25, 3), (62, 5);

	DECLARE 
		@ID		INT		,
		@Num1	FLOAT	,
		@Num2	FLOAT	,
		@Result	FLOAT	
		;
	DECLARE x CURSOR
	FOR 
	SELECT	ID		,
			Num1	,
			Num2
	FROM	#Dummy
	;	
	OPEN x;
	FETCH NEXT FROM x INTO @ID, @Num1, @Num2;

	WHILE @@FETCH_STATUS = 0
		BEGIN
			EXEC dbo.prc_TryCatchExample @Num1, @Num2, @Result OUT;
			UPDATE #Dummy
			SET		Result	= @Result
			WHERE	ID		= @ID
			;		
			FETCH NEXT FROM x INTO @ID, @Num1, @Num2;
		END;

	CLOSE x;
	DEALLOCATE x;

	SELECT * FROM #Dummy;

	DROP TABLE #Dummy;
END