USE [SEDC_Homework]
GO

SELECT 
COUNT(g.Grade) as AllGrades
FROM dbo.[Grade] as g
GO

SELECT g.TeacherID,
COUNT(g.Grade) as GradePerTeacher
FROM dbo.[Grade] as g
GROUP BY g.TeacherID
GO

SELECT g.TeacherID,
COUNT(g.Grade) as GradePerTeacher
FROM dbo.[Grade] as g
WHERE g.StudentId < 100
GROUP BY g.TeacherID
GO

SELECT g.StudentId,
MAX(g.Grade) as GradeMax,
AVG(g.Grade) as GradeAvg
FROM dbo.[Grade] as g
GROUP BY g.StudentId
GO

SELECT g.TeacherID,
COUNT(g.Grade) as GradePerTeacher
FROM dbo.[Grade] as g
GROUP BY g.TeacherID
HAVING COUNT(g.Grade) > 200
GO

SELECT g.TeacherID,
COUNT(g.Grade) as GradePerTeacher
FROM dbo.[Grade] as g
WHERE g.StudentId < 100
GROUP BY g.TeacherID
HAVING COUNT(g.Grade) > 50
GO

SELECT g.StudentId,
COUNT(g.Grade) as GradeCount,
MAX(g.Grade) as GradeMax,
AVG(g.Grade) as GradeAvg
FROM dbo.[Grade] as g
GROUP BY g.StudentId
GO

SELECT s.Id, s.FirstName,s.LastName,
COUNT(g.Grade) as GradeCount,
MAX(g.Grade) as GradeMax,
AVG(g.Grade) as GradeAvg
FROM dbo.[Grade] as g
INNER JOIN dbo.[Student] as s on s.Id = g.StudentId
GROUP BY s.Id,s.FirstName,s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade)
GO

CREATE VIEW vv_StudentGrades
AS
SELECT s.Id, s.FirstName, s.LastName,
COUNT (g.Grade) as GradeCount
FROM dbo.[Student] as s
INNER JOIN dbo.[Grade] as g on g.StudentId = s.Id
GROUP BY s.Id, s.FirstName, s.LastName
GO

SELECT 
*
FROM vv_StudentGrades
GO

DROP VIEW vv_StudentGrades
GO

ALTER VIEW vv_StudentGrades
AS
SELECT s.FirstName,s.LastName,
COUNT(g.Grade) as GradeCount
FROM dbo.[Student] as s
INNER JOIN dbo.[Grade] as g on g.StudentId = s.Id
GROUP BY s.FirstName, s.LastName
GO

SELECT
*
FROM vv_StudentGrades as s
ORDER BY s.GradeCount DESC
GO

CREATE VIEW vv_StudentGradeDetails
AS
SELECT s.Id, s.FirstName, s.LastName,
COUNT(gd.AchievementTypeID) as PassedCourse 
FROM dbo.[GradeDetails] as gd
INNER JOIN dbo.[Grade] as g on g.Id = gd.GradeId
INNER JOIN dbo.[Student] as s on s.Id = g.StudentId
INNER JOIN dbo.[AchievementType] as at on gd.AchievementTypeID = at.Id
WHERE gd.AchievementTypeID = 5
GROUP BY s.Id, s.FirstName, s.LastName
GO

SELECT
*
FROM vv_StudentGradeDetails
GO

DROP VIEW vv_StudentGradeDetails
GO