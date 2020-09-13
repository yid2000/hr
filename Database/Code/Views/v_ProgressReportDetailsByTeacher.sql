IF EXISTS (SELECT * FROM sys.objects WHERE type = 'V' AND name = 'v_ProgressReportDetailsByTeacher')
	BEGIN
		PRINT 'Dropping dbo.v_ProgressReportDetailsByTeacher...';
		DROP VIEW dbo.v_ProgressReportDetailsByTeacher ;		
		PRINT 'Dropped dbo.v_ProgressReportDetailsByTeacher.';
	END
GO
PRINT 'Creating dbo.v_ProgressReportDetailsByTeacher...'
GO
/*
	Provide list of all progress reports with following details:
	- Academic Year
	- Student First Name
	- Student Last Name
	- Grade
	- Class Room#
	- Roll#
	- Teacher Staff #
	- Teacher First Name
	- Teacher Last Name
	- Quarter Code
	- Subject Name
	- Rating Description
*/
--SELECT * FROM dbo.v_ProgressReportDetailsByTeacher
CREATE VIEW dbo.v_ProgressReportDetailsByTeacher AS
SELECT  v.*										,
		td.StaffID								,
		td.StaffNo								,
		td.TeacherFullName
FROM dbo.v_ProgressReportDetails v
INNER JOIN  dbo.v_TeacherDetails  td
	ON  v.ClassRoomID		=		td.ClassRoomID
;