USE [SEDC_Homework]
GO

SELECT *
FROM dbo.Student 
WHERE FirstName = 'Antonio'
GO

SELECT *
FROM dbo.Student 
WHERE DateOfBirth > '01.01.1999'
GO

SELECT *
FROM dbo.Student 
WHERE Gender = 'M'
GO

SELECT *
FROM dbo.Student
WHERE LastName like 'T%'
GO

SELECT *
FROM dbo.Student 
WHERE  MONTH(EnrolledDate) = 1 AND YEAR(EnrolledDate) = 1998
GO

SELECT *
FROM dbo.Student 
WHERE  MONTH(EnrolledDate) = 1 
AND YEAR(EnrolledDate) = 1998
AND LastName like 'J%'
GO

SELECT *
FROM dbo.Student 
WHERE FirstName = 'ANTONIO'
ORDER BY LastName ASC
GO

SELECT *
FROM dbo.Student 
ORDER BY FirstName ASC
GO

SELECT *
FROM dbo.Student 
WHERE Gender = 'M'
ORDER BY EnrolledDate DESC
GO

SELECT FirstName
FROM dbo.Teacher 
UNION ALL
SELECT FirstName
FROM dbo.Student 
GO

SELECT LastName
FROM dbo.Teacher 
UNION 
SELECT LastName
FROM dbo.Student 
GO

SELECT FirstName
FROM dbo.Teacher 
INTERSECT
SELECT FirstName
FROM dbo.Student 
GO

ALTER TABLE dbo.GradeDetails
ADD CONSTRAINT DF_AchievementMaxPoints_GradeDetails
DEFAULT 100 FOR AchievementMaxPoints
GO

ALTER TABLE dbo.GradeDetails
 ADD CONSTRAINT [CHK_AchievementPoints_GradeDetails]
 CHECK (AchievementPoints BETWEEN 0 AND AchievementMaxPoints)
 GO


ALTER TABLE dbo.AchievementType WITH CHECK 
ADD CONSTRAINT UC_Name_AchievementType
UNIQUE ([Name])
GO

ALTER TABLE dbo.Grade WITH CHECK
 ADD CONSTRAINT [FK_StudentID_Grade] 
 FOREIGN KEY (StudentID)
 REFERENCES  dbo.[Student] (ID)
 GO

 ALTER TABLE dbo.Grade WITH CHECK
 ADD CONSTRAINT [FK_CourseID_Grade]
 FOREIGN KEY (CourseID) 
 REFERENCES  dbo.[Course] (ID)
 GO

 ALTER TABLE dbo.Grade WITH CHECK
 ADD CONSTRAINT [FK_TeacherID_Grade] 
 FOREIGN KEY (TeacherID)
 REFERENCES  dbo.[Teacher] (ID)
 GO


 ALTER TABLE dbo.GradeDetails WITH CHECK
 ADD CONSTRAINT [FK_Grade_GradeDetails] 
 FOREIGN KEY (GradeID) REFERENCES dbo.Grade (Id)
 GO


SELECT c.[Name] AS CourseName, a.Name AS AchievementTypeName
FROM dbo.Course as c
CROSS JOIN dbo.AchievementType as a
GO

SELECT DISTINCT t.FirstName, t.LastName
FROM dbo.Teacher as t
INNER JOIN dbo.Grade as g ON t.Id = g.TeacherID
GO

SELECT DISTINCT t.FirstName, t.LastName
FROM dbo.Teacher as t
LEFT JOIN dbo.Grade as g ON t.Id = g.TeacherID
WHERE g.id IS NULL
GO

SELECT s.FirstName, s.LastName
FROM dbo.Grade AS g 
RIGHT JOIN dbo.Student AS s ON s.Id = g.StudentID
WHERE g.id IS NULL
GO


