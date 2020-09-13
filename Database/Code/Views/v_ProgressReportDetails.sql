IF EXISTS (SELECT * FROM sys.objects WHERE type = 'V' AND name = 'v_ProgressReportDetails')
	BEGIN
		PRINT 'Dropping dbo.v_ProgressReportDetails...';
		DROP VIEW dbo.v_ProgressReportDetails ;		
		PRINT 'Dropped dbo.v_ProgressReportDetails.';
	END
GO
PRINT 'Creating dbo.v_ProgressReportDetails...'
GO
/*
	Provide list of all progress reports with following details:
	- Academic Year
	- Student ID
	- Student Full Name
	- Grade
	- Class Room#
	- Roll#
	- Quarter Code
	- Subject Name
	- Rating Description
*/
CREATE VIEW dbo.v_ProgressReportDetails AS
SELECT  sy.AcademicYear							,
		st.StudentID							,
		dbo.fn_GetFullName(st.FirstName, st.MiddleInitial, st.LastName) AS StudentFullName	,
		sty.RollNo								,
		cr.ClassRoomID							,
		cr.Grade								,
		cr.ClassRoomNo							,
		q.Code			AS  QuarterCode			,
		su.SubjectID							,
		su.Name			AS  SubjectName			,
		r.RatingID								,
		r.Description   AS  RatingDescription	
FROM	dbo.ProgressReport pr
INNER JOIN  dbo.StudentYear sty
	ON	pr.StudentYearID	=		sty.StudentYearID		
INNER JOIN  dbo.ClassRoom cr
	ON	sty.ClassRoomID		=		cr.ClassRoomID
INNER JOIN  dbo.SchoolYear sy
	ON	cr.SchoolYearID	=		sy.SchoolYearID	
INNER JOIN  dbo.Student st
	ON	sty.StudentID		=	st.StudentID
INNER JOIN dbo.Subject su
	ON  su.SubjectID		=		pr.SubjectID
INNER JOIN dbo.Quarter q
	ON  q.QuarterID			=		pr.QuarterID
INNER JOIN dbo.Rating r
	ON  r.RatingID			=		pr.RatingID
GO