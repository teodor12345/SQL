USE [SEDC_Homework]
GO

CREATE OR ALTER PROCEDURE dbo.usp_CreateGrade
(
@StudentId int,
@CourseId smallint,
@TeacherId smallint,
@Grade tinyint,
@Comment nvarchar (100),
@CreatedDate date
)
AS
BEGIN

INSERT INTO dbo.[Grade] ([StudentId],[CourseId],[TeacherID],[Grade],[Comment],[CreatedDate])
VALUES(@StudentId,@CourseId,@TeacherId,@Grade,@Comment,@CreatedDate)

SELECT
COUNT(*) as TotalGrades
FROM [dbo].[Grade]
WHERE
StudentId = @StudentId

SELECT
MAX(Grade) as TotalOrderPrice
FROM [dbo].[Grade]
WHERE
StudentId = @StudentId
AND TeacherID = @TeacherId
END
GO



EXEC dbo.usp_CreateGrade 
@StudentID = 10,
@CourseID  = 10,
@TeacherID  = 10,
@Grade  = 6,
@Comment = 'NONE',
@CreatedDate = '2010-01-06'
GO

EXEC dbo.usp_CreateGrade 
@StudentID = 19,
@CourseID  = 1,
@TeacherID  = 20,
@Grade  = 8,
@Comment = 'N/A',
@CreatedDate = '2000-03-08'
GO

SELECT
	top (10) * 
FROM
	[dbo].[Grade]
order by
	Id desc
GO

CREATE OR ALTER PROCEDURE dbo.usp_CreateGradeDetails
(@GradeId int,
@AchievmentTypeID smallint,
@AchievementPoints tinyint,
@AchievementMaxPoints tinyint,
@AchievementDate date
)
AS
BEGIN

INSERT INTO dbo.[GradeDetails]([GradeId],[AchievementTypeID],[AchievementPoints],[AchievementMaxPoints],[AchievementDate])
VALUES (@GradeId,@AchievmentTypeID,@AchievementPoints,@AchievementMaxPoints,@AchievementDate)


SELECT gd.GradeID, 
SUM(cast(gd.AchievementPoints as decimal (18,2))/cast(gd.AchievementMaxPoints as decimal (18,2)) * a.ParticipationRate) AS GradePoints
FROM dbo.[GradeDetails] AS gd
INNER JOIN dbo.AchievementType AS a ON gd.AchievementTypeID = a.Id
WHERE gd.GradeID = @GradeID
GROUP BY gd.GradeID
END
GO

EXEC dbo.usp_CreateGradeDetails
@GradeID = 122, 
@AchievmentTypeID = 10,  
@AchievementPoints = 55,
@AchievementMaxPoints = 100, 
@AchievementDate = '2017-03-11'
GO

EXEC dbo.usp_CreateGradeDetails
@GradeID = 2013, 
@AchievmentTypeID = 15,  
@AchievementPoints = 94,
@AchievementMaxPoints = 100, 
@AchievementDate = '2018-01-21'
GO

select * from dbo.[Grade] 
where id = 122