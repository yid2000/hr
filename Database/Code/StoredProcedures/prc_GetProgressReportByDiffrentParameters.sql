--EXEC dbo.prc_GetProgressReportByDiffrentParameters NULL, NULL, 1002;
--GRANT EXECUTE ON dbo.prc_GetProgressReportByDiffrentParameters TO xxx;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'TF' AND name = 'prc_GetProgressReportByDiffrentParameters')
	BEGIN
		PRINT 'Dropping dbo.prc_GetProgressReportByDiffrentParameters...';
		DROP PROCEDURE dbo.prc_GetProgressReportByDiffrentParameters ;
		PRINT 'Dropped dbo.prc_GetProgressReportByDiffrentParameters.';
	END
GO
PRINT 'Creating dbo.prc_GetProgressReportByDiffrentParameters...'
GO
/**
	Query Get Progress Report By Diffrent Parameters Grade, ClassRoom, Teacher
		- Grade
		- Class Room#
		- Number of students in the class
		- Number of teachers in the class
**/
CREATE PROCEDURE dbo.prc_GetProgressReportByDiffrentParameters
(
	@Grade			    TINYINT	= NULL ,
	@ClassRoomNo		INT		= NULL ,
	@TeacherStaffNo		INT     = NULL
)
AS

BEGIN
	SET NOCOUNT ON;
	PRINT CONCAT('@Grade=', @Grade, '; @ClassRoomNo=', @ClassRoomNo, '; @TeacherStaffNo=', @TeacherStaffNo);
	
	IF @Grade IS NOT NULL
		 SELECT	st.StudentID							,
				st.RollNo								,
				cr.Grade								,
				cr.ClassRoomNo							,
				q.Code			AS  QuarterCode			,
				su.Name			AS  SubjectName			,
				r.Description   AS  RatingDescription	,
				CONCAT(sf.FirstName , ' ' , sf.LastName) as TeachersFullName ,
				CONCAT(st.FirstName , ' ' , st.LastName) as StudentFullName 
		FROM	dbo.Student st
		INNER JOIN  dbo.ClassRoom cr
			ON	st.ClassRoomID		=		cr.ClassRoomID
		INNER JOIN dbo.ClassRoomTeacher crt
			ON  crt.ClassRoomID		=		cr.ClassRoomID
		INNER JOIN dbo.Staff sf
			ON  sf.StaffID			=		crt.TeacherID
		INNER JOIN dbo.ProgressReport pr	
			ON  st.StudentID		=		pr.StudentID
		INNER JOIN dbo.Subject su
			ON  su.SubjectID		=		pr.SubjectID
		INNER JOIN dbo.Quarter q
			ON  q.QuarterID			=		pr.QuarterID
		INNER JOIN dbo.Rating r
			ON  r.RatingID			=		pr.RatingID
		WHERE  cr.Grade	=	 @Grade
		;
	ELSE
		IF @ClassRoomNo IS NOT NULL
			SELECT	st.StudentID							,
					st.RollNo								,
					cr.Grade								,
					cr.ClassRoomNo							,
					q.Code			AS  QuarterCode			,
					su.Name			AS  SubjectName			,
					r.Description   AS  RatingDescription	,
					CONCAT(sf.FirstName , ' ' , sf.LastName) as TeachersFullName ,
					CONCAT(st.FirstName , ' ' , st.LastName) as StudentFullName 
			FROM	dbo.Student st
			INNER JOIN  dbo.ClassRoom cr
				ON	st.ClassRoomID		=		cr.ClassRoomID
			INNER JOIN dbo.ClassRoomTeacher crt
				ON  crt.ClassRoomID		=		cr.ClassRoomID
			INNER JOIN dbo.Staff sf
				ON  sf.StaffID			=		crt.TeacherID
			INNER JOIN dbo.ProgressReport pr	
				ON  st.StudentID		=		pr.StudentID
			INNER JOIN dbo.Subject su
				ON  su.SubjectID		=		pr.SubjectID
			INNER JOIN dbo.Quarter q
				ON  q.QuarterID			=		pr.QuarterID
			INNER JOIN dbo.Rating r
				ON  r.RatingID			=		pr.RatingID
			WHERE	cr.ClassRoomNo	=	@ClassRoomNo
			;
		ELSE
			SELECT	st.StudentID							,
					st.RollNo								,
					cr.Grade								,
					cr.ClassRoomNo							,
					q.Code			AS  QuarterCode			,
					su.Name			AS  SubjectName			,
					r.Description   AS  RatingDescription	,
					CONCAT(sf.FirstName , ' ' , sf.LastName) as TeachersFullName ,
					CONCAT(st.FirstName , ' ' , st.LastName) as StudentFullName 
			FROM	dbo.Student st
			INNER JOIN  dbo.ClassRoom cr
				ON	st.ClassRoomID		=		cr.ClassRoomID
			INNER JOIN dbo.ClassRoomTeacher crt
				ON  crt.ClassRoomID		=		cr.ClassRoomID
			INNER JOIN dbo.Staff sf
				ON  sf.StaffID			=		crt.TeacherID
			INNER JOIN dbo.ProgressReport pr	
				ON  st.StudentID		=		pr.StudentID
			INNER JOIN dbo.Subject su
				ON  su.SubjectID		=		pr.SubjectID
			INNER JOIN dbo.Quarter q
				ON  q.QuarterID			=		pr.QuarterID
			INNER JOIN dbo.Rating r
				ON  r.RatingID			=		pr.RatingID
			WHERE	sf.StaffNo			=		@TeacherStaffNo
			;
	END