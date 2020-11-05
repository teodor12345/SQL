USE [SEDC_Homework]
GO

CREATE FUNCTION dbo.fn_PassedStudents (@TeacherID int, @CourseID int)
RETURNS @PassedStudents TABLE( FirstName nvarchar(50), LastName nvarchar(50), Grade tinyint, CreateDate date)
AS
BEGIN
INSERT INTO @PassedStudents
SELECT s.FirstName as StudenFirstName, s.LastName as StudentLastName, g.Grade, g.CreatedDate 
FROM dbo.[GradeDetails] AS gd
INNER JOIN dbo.[Grade] AS g ON gd.GradeID = g.Id
INNER JOIN dbo.[Student] AS s ON g.StudentID = s.Id
AND g.TeacherID = @TeacherID 
AND g.CourseID = @CourseID
GROUP BY s.FirstName, s.LastName, g.Grade, g.CreatedDate 

RETURN
END
GO

SELECT *
FROM dbo.fn_PassedStudents(1,1)
GO

DROP FUNCTION IF EXISTS fn_PassedStudents
GO