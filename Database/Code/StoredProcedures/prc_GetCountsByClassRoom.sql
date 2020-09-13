--EXEC dbo.prc_GetCountsByClassRoom 4;
--GRANT EXECUTE ON dbo.prc_GetCountsByClassRoom TO xxx;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'prc_GetCountsByClassRoom')
	BEGIN
		PRINT 'Dropping dbo.prc_GetCountsByClassRoom...';
		DROP PROCEDURE dbo.prc_GetCountsByClassRoom;
		PRINT 'Dropped dbo.prc_GetCountsByClassRoom.';
	END
GO
PRINT 'Creating dbo.prc_GetCountsByClassRoom...'
GO
/**
	Query count of teachers and students in a given grade with following details
		- Grade
		- Class Room#
		- Number of students in the class
		- Number of teachers in the class
**/
CREATE PROCEDURE dbo.prc_GetCountsByClassRoom
(
	@Grade	TINYINT		
)
AS

BEGIN
	SET NOCOUNT ON;
	PRINT CONCAT('@Grade=', @Grade);
	
	IF @Grade IS NOT NULL
		SELECT  cr.Grade								,
				cr.ClassRoomNo							,
				COUNT(DISTINCT sf.StaffID)     AS NoOfTeachers		,		
				COUNT(DISTINCT sty.StudentID)  AS NoOfStudents			
		FROM dbo.ClassRoom cr
		INNER JOIN dbo.StudentYear sty
			ON	sty.ClassRoomID	=	cr.ClassRoomID
		INNER JOIN dbo.ClassRoomTeacher crt
			ON	cr.ClassRoomID	=	crt.ClassRoomID
		INNER JOIN dbo.Staff sf
			ON	sf.StaffID		=	crt.TeacherID
		WHERE	cr.Grade	=	@Grade
		GROUP BY	cr.Grade								,
					cr.ClassRoomNo	
		;											   
	ELSE
		SELECT  cr.Grade								,
				cr.ClassRoomNo							,
				COUNT(DISTINCT sf.StaffID)     AS NoOfTeachers		,		
				COUNT(DISTINCT sty.StudentID)   AS NoOfStudents			
		FROM dbo.ClassRoom cr
		INNER JOIN dbo.StudentYear sty
			ON	sty.ClassRoomID	=	cr.ClassRoomID
		INNER JOIN dbo.ClassRoomTeacher crt
			ON	cr.ClassRoomID	=	crt.ClassRoomID
		INNER JOIN dbo.Staff sf
			ON	sf.StaffID		=	crt.TeacherID
		GROUP BY	cr.Grade								,
					cr.ClassRoomNo	
		;											   
END
