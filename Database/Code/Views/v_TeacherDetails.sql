IF EXISTS (SELECT * FROM sys.objects WHERE type = 'V' AND name = 'v_TeacherDetails')
	BEGIN
		PRINT 'Dropping dbo.v_TeacherDetails...';
		DROP VIEW dbo.v_TeacherDetails ;		
		PRINT 'Dropped dbo.v_TeacherDetails.';
	END
GO
PRINT 'Creating dbo.v_TeacherDetails...'
GO
/*
	Provide list of all teachers following details:
	- School Year	
	- Staff ID
	- Staff #
	- First Name
	- Last Name
	- Class Room#
	- Grade
*/
CREATE VIEW dbo.v_TeacherDetails AS
SELECT   sy.AcademicYear						,
		 st.StaffID								,
         st.StaffNo								,
		 dbo.fn_GetFullName(st.FirstName, st.MiddleInitial, st.LastName) AS TeacherFullName ,
		 cr.ClassRoomID							,
		 cr.ClassRoomNo							,
		 cr.Grade							 
FROM dbo.Staff st
INNER JOIN dbo.ClassRoomTeacher crt
	ON		crt.ClassRoomTeacherID		=		st.StaffID
INNER JOIN dbo.ClassRoom cr
	ON		cr.ClassRoomID				=		crt.ClassRoomID
INNER JOIN dbo.SchoolYear sy
	ON		cr.SchoolYearID				=		sy.SchoolYearID
GO


