USE [SEDC_Homework]
GO


--ALTER TABLE [dbo].[GradeDetails] ADD CONSTRAINT [FK_GradeDetails_AchievementType] FOREIGN KEY ([AchievementTypeID]) REFERENCES [dbo].[AchievementType]([Id]);
--GO

EXEC dbo.usp_CreateGradeDetails
@GradeID = 20154, 
@AchievmentTypeID = 5555,  
@AchievementPoints = 84,
@AchievementMaxPoints = 100, 
@AchievementDate = '2019-05-21'
GO

CREATE OR ALTER PROCEDURE dbo.usp_CreateGradeDetails
(@GradeId int,
@AchievmentTypeID int,
@AchievementPoints tinyint,
@AchievementMaxPoints tinyint,
@AchievementDate date
)
AS
BEGIN
BEGIN TRY

INSERT INTO dbo.[GradeDetails]([GradeId],[AchievementTypeID],[AchievementPoints],[AchievementMaxPoints],[AchievementDate])
VALUES (@GradeId,@AchievmentTypeID,@AchievementPoints,@AchievementMaxPoints,@AchievementDate)

END TRY
BEGIN CATCH 
SELECT
    ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState  
    ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine  
    ,ERROR_MESSAGE() AS ErrorMessage;  
END CATCH
SELECT gd.GradeID, 
SUM(cast(gd.AchievementPoints as decimal (18,2))/cast(gd.AchievementMaxPoints as decimal (18,2)) * a.ParticipationRate) AS GradePoints
FROM dbo.[GradeDetails] AS gd
INNER JOIN dbo.AchievementType AS a ON gd.AchievementTypeID = a.Id
WHERE gd.GradeID = @GradeID
GROUP BY gd.GradeID
END




