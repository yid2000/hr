/*
DECLARE @RowCount INT;
EXEC dbo.prc_SearchByStudentFirstName 'ed', 1, @RowCount OUTPUT;
PRINT CONCAT('@RowCount=', @RowCount);
*/
--GRANT EXECUTE ON dbo.prc_SearchByStudentFirstName TO xxx;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'prc_SearchByStudentFirstName')
	BEGIN
		PRINT 'Dropping dbo.prc_SearchByStudentFirstName...';
		DROP PROCEDURE dbo.prc_SearchByStudentFirstName ;
		PRINT 'Dropped dbo.prc_SearchByStudentFirstName.';
	END
GO
PRINT 'Creating dbo.prc_SearchByStudentFirstName...'
GO
CREATE PROCEDURE dbo.prc_SearchByStudentFirstName
(
	@StudentFirstName					 VARCHAR(30)		,
	@StudentFirstNameSearchCriteriaFlag   TINYINT			,
	@RowCount							  INT			OUT	
)
AS

BEGIN
	SET NOCOUNT ON;
	PRINT '**** BEGIN dbo.prc_SearchByStudentFirstName ****';

	PRINT CONCAT('@StudentFirstName=', @StudentFirstName, '; @StudentFirstNameSearchCriteriaFlag=', @StudentFirstNameSearchCriteriaFlag);
	
	IF @StudentFirstNameSearchCriteriaFlag = 0
		 SELECT	st.StudentID			,
				CONCAT(st.FirstName, ' ', st.LastName) as StudentFullName ,
				cr.Grade								,
				cr.ClassRoomNo							
		FROM	dbo.Student st
		INNER JOIN  dbo.ClassRoom cr
			ON	st.ClassRoomID		=		cr.ClassRoomID
		WHERE  st.FirstName	LIKE CONCAT(@StudentFirstName, '%')
		;
	ELSE 
		IF @StudentFirstNameSearchCriteriaFlag = 1
			SELECT	st.StudentID			,
					CONCAT(st.FirstName, ' ', st.LastName) as StudentFullName ,
					cr.Grade								,
					cr.ClassRoomNo							
			FROM	dbo.Student st
			INNER JOIN  dbo.ClassRoom cr
				ON	st.ClassRoomID		=		cr.ClassRoomID
			WHERE  st.FirstName LIKE CONCAT('%', @StudentFirstName, '%')
			;
		ELSE
			IF @StudentFirstNameSearchCriteriaFlag = 2
				SELECT	st.StudentID			,
						CONCAT(st.FirstName, ' ', st.LastName) as StudentFullName ,
						cr.Grade								,
						cr.ClassRoomNo							
				FROM	dbo.Student st
				INNER JOIN  dbo.ClassRoom cr
					ON	st.ClassRoomID		=		cr.ClassRoomID
				WHERE  st.FirstName	LIKE CONCAT('%', @StudentFirstName)
				;
			ELSE
				BEGIN
					SET @RowCount = -1;
					RETURN;
				END

	SET @RowCount = @@ROWCOUNT;
	PRINT '**** END dbo.prc_SearchByStudentFirstName ****';
END


