/*
DECLARE @RowCount INT;
EXEC dbo.prc_SearchByStudentLastName 'ed', 1, @RowCount OUTPUT;
PRINT CONCAT('@RowCount=', @RowCount);
*/
--GRANT EXECUTE ON dbo.prc_SearchByStudentLastName TO xxx;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'prc_SearchByStudentLastName')
	BEGIN
		PRINT 'Dropping dbo.prc_SearchByStudentLastName...';
		DROP PROCEDURE dbo.prc_SearchByStudentLastName ;
		PRINT 'Dropped dbo.prc_SearchByStudentLastName.';
	END
GO
PRINT 'Creating dbo.prc_SearchByStudentLastName...'
GO
CREATE PROCEDURE dbo.prc_SearchByStudentLastName
(
	@StudentLastName					 VARCHAR(30)		,
	@StudentLastNameSearchCriteriaFlag   TINYINT			,
	@RowCount							  INT			OUT	
)
AS

BEGIN
	SET NOCOUNT ON;
	PRINT CONCAT('@StudentLastName=', @StudentLastName, '; @StudentLastNameSearchCriteriaFlag=', @StudentLastNameSearchCriteriaFlag);
	
	IF @StudentLastNameSearchCriteriaFlag = 0
		 SELECT	st.StudentID			,
				CONCAT(st.FirstName, ' ', st.LastName) as StudentFullName ,
				cr.Grade								,
				cr.ClassRoomNo							
		FROM	dbo.Student st
		INNER JOIN  dbo.ClassRoom cr
			ON	st.ClassRoomID		=		cr.ClassRoomID
		WHERE  st.LastName	LIKE CONCAT(@StudentLastName, '%')
		;
	ELSE 
		IF @StudentLastNameSearchCriteriaFlag = 1
			SELECT	st.StudentID			,
					CONCAT(st.FirstName, ' ', st.LastName) as StudentFullName ,
					cr.Grade								,
					cr.ClassRoomNo							
			FROM	dbo.Student st
			INNER JOIN  dbo.ClassRoom cr
				ON	st.ClassRoomID		=		cr.ClassRoomID
			WHERE  st.LastName LIKE CONCAT('%', @StudentLastName, '%')
			;
		ELSE
			IF @StudentLastNameSearchCriteriaFlag = 2
				SELECT	st.StudentID			,
						CONCAT(st.FirstName, ' ', st.LastName) as StudentFullName ,
						cr.Grade								,
						cr.ClassRoomNo							
				FROM	dbo.Student st
				INNER JOIN  dbo.ClassRoom cr
					ON	st.ClassRoomID		=		cr.ClassRoomID
				WHERE  st.LastName	LIKE CONCAT('%', @StudentLastName)
				;
			ELSE
				BEGIN
					SET @RowCount = -1;
					RETURN;
				END

	SET @RowCount = @@ROWCOUNT;
END


