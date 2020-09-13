IF EXISTS (SELECT * FROM sys.objects WHERE type = 'V' AND name = 'v_StudentDetails')
	BEGIN
		PRINT 'Dropping dbo.v_StudentDetails...';
		DROP VIEW dbo.v_StudentDetails ;		
		PRINT 'Dropped dbo.v_StudentDetails.';
	END
GO
PRINT 'Creating dbo.v_StudentDetails...'
GO

/*
	Provide list of all students following details:
	- Academic Year
	- Student ID
	- StudentFullName
	- RollNo
	- ClassRoomID
	- ClassRoomNo
	- Grade
*/
CREATE VIEW dbo.v_StudentDetails AS
SELECT   sy.AcademicYear														,
		 st.StudentID															,
		 dbo.fn_GetFullName(st.FirstName, st.MiddleInitial, st.LastName)	AS StudentFullName		,
		 sty.RollNo																,
		 sty.ClassRoomID														,
		 cr.ClassRoomNo															,
		 cr.Grade
FROM	dbo.Student st
INNER JOIN dbo.StudentYear sty
	ON	st.StudentID	=	sty.StudentID
INNER JOIN dbo.ClassRoom cr
	ON	sty.ClassRoomID	=	cr.ClassRoomID
INNER JOIN dbo.SchoolYear sy
	ON	cr.SchoolYearID	=	sy.SchoolYearID
GO


