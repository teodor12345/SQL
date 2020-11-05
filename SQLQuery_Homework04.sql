USE [SEDC_Homework]
GO

DECLARE @FirstName nvarchar(50)
SET @FirstName = 'Antonio'

SELECT
*
FROM dbo.[Student] as s
WHERE s.FirstName = @FirstName
GO

DECLARE @StudentInfo TABLE
(
StudentId int,
StudentName nvarchar(50),
DateofBirth date
)
INSERT INTO @StudentInfo
SELECT s.Id,s.FirstName,s.DateOfBirth
FROM dbo.[Student] as s
WHERE s.Gender = 'F'

SELECT
*
FROM @StudentInfo
GO

CREATE TABLE #StudentInfo2
(
LastName nvarchar(50),
EnrolledDate date
)
INSERT INTO #StudentInfo2
SELECT s.LastName,s.EnrolledDate
FROM dbo.[Student] as s
WHERE s.FirstName like 'A%' AND s.Gender = 'M'

SELECT s.LastName
FROM #StudentInfo2 as s
WHERE LEN(s.LastName) = 7

SELECT
*
FROM #StudentInfo2

DROP TABLE #StudentInfo2
GO

SELECT *
FROM dbo.[Teacher] as t
WHERE LEN(t.FirstName) < 5
AND LEFT(t.FirstName,3) = LEFT (t.LastName,3)
GO

CREATE FUNCTION fn_FormatStudentName
(
@StudentId int
)
RETURNS nvarchar(50)
AS
BEGIN

DECLARE @RESULT nvarchar(50)

SELECT @RESULT = 
SUBSTRING(s.StudentCardNumber,4,
LEN(s.StudentCardNumber)) + '-' +
LEFT(s.FirstName,1) + '.' +
s.LastName
FROM dbo.[Student] as s
WHERE s.Id = @StudentId
RETURN @RESULT
END
GO

SELECT  dbo.fn_FormatStudentName(1) as FunctionOuput
SELECT  dbo.fn_FormatStudentName(2) as FunctionOuput
GO





