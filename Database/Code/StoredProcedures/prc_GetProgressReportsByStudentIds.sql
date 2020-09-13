--EXEC dbo.prc_GetProgressReportsByStudentIds '1,2,3';
--SELECT * FROM #StudentID
--GRANT EXECUTE ON dbo.prc_GetProgressReportsByStudentIds TO xxx;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'prc_GetProgressReportsByStudentIds')
	BEGIN
		PRINT 'Dropping dbo.prc_GetProgressReportsByStudentIds...';
		DROP PROCEDURE dbo.prc_GetProgressReportsByStudentIds ;
		PRINT 'Dropped dbo.prc_GetProgressReportsByStudentIds.';
	END
GO
PRINT 'Creating dbo.prc_GetProgressReportsByStudentIds...'
GO
/**
	Query Get Progress Reports by student ids
**/
CREATE PROCEDURE dbo.prc_GetProgressReportsByStudentIds
(
	@StudentIDs		VARCHAR(1000)
)
AS

BEGIN
	SET NOCOUNT ON;
	PRINT CONCAT('@StudentIDs=', @StudentIDs);

	CREATE TABLE #StudentID
	(
		StudentID	INT	NOT NULL PRIMARY KEY
	);

	INSERT INTO #StudentID 
	SELECT * FROM dbo.TFN_SplitInt(@StudentIDs)
	;

	--SELECT * FROM #StudentID;
	
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
	WHERE  st.StudentID	IN (SELECT tst.StudentID FROM #StudentID tst)
	;

	--DROP TABLE #StudentID;

END