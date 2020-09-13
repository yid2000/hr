IF EXISTS (SELECT * FROM sys.objects WHERE type = 'V' AND name = 'v_StudentTeacherDetails')
	BEGIN
		PRINT 'Dropping dbo.v_StudentTeacherDetails...';
		DROP VIEW dbo.v_StudentTeacherDetails ;		
		PRINT 'Dropped dbo.v_StudentTeacherDetails.';
	END
GO
PRINT 'Creating dbo.v_StudentTeacherDetails...'
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
	- Teacher Staff ID
	- Teacher Staff #
	- Teacher Full Name
*/
CREATE VIEW dbo.v_StudentTeacherDetails AS
SELECT   sy.AcademicYear														,
		 st.StudentID															,
		 dbo.fn_GetFullName(st.FirstName, st.MiddleInitial, st.LastName)	AS StudentFullName		,
		 sty.RollNo																,
		 sty.ClassRoomID															,
		 cr.ClassRoomNo															,
		 cr.Grade																,
		 sf.StaffID																,
		 sf.StaffNo																,
		 dbo.fn_GetFullName(sf.FirstName, sf.MiddleInitial, sf.LastName)	AS TeacherFullName		
FROM	dbo.Student st
INNER JOIN dbo.StudentYear sty
	ON	st.StudentID	=	sty.StudentID
INNER JOIN dbo.ClassRoom cr
	ON	sty.ClassRoomID	=	cr.ClassRoomID
INNER JOIN dbo.SchoolYear sy
	ON	sy.SchoolYearID	=	cr.SchoolYearID
INNER JOIN dbo.ClassRoomTeacher crt
	ON	cr.ClassRoomID	=	crt.ClassRoomID
INNER JOIN dbo.Staff sf
	ON	crt.ClassRoomTeacherID	=	sf.StaffID
GO


