USE [SEDC_Homework]
GO

DROP TABLE dbo.GradeDetails
DROP TABLE dbo.Grade
DROP TABLE dbo.AchievementType
DROP TABLE dbo.Course
DROP TABLE dbo.Student
DROP TABLE dbo.Teacher
GO


CREATE TABLE [dbo].[Teacher](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50)  NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date]  NULL,
	[AcademicRank] [nvarchar](50)  NULL,
	[HireDate] [date]  NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))
GO

CREATE TABLE [dbo].[Grade](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int]   NULL,
	[CourseId] [smallint]  NULL,
	[TeacherID] [smallint]  NULL,
	[Grade] [tinyint]  NULL,
	[Comment] [nvarchar] (100)  NULL,
	[CreatedDate] [datetime]  NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))
GO

CREATE TABLE [dbo].[GradeDetails](
	[Id] [int] IDENTITY(1,1)NOT NULL,
	[GradeId] [int]   NULL,
	[AchievementTypeID] [smallint]  NULL,
	[AchievementPoints] [decimal] (18,2)  NULL,
	[AchievementMaxPoints] [decimal] (18,2)  NULL,
	[AchievementDate] [date]  NULL,
 CONSTRAINT [PK_GradeDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))
GO


CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1)NOT NULL,
	[FirstName] [nvarchar](50)  NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date]  NULL,
	[EnrolledDate] [date]  NULL,
	[Gender] [nchar] (1)  NULL,
	[NationalIdNumber] [nvarchar] (20) NULL,
	[StudentCardNumber] [nvarchar] (20)  NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))
GO

CREATE TABLE [dbo].[Course](
[Id] [smallint] IDENTITY(1,1) NOT NULL,
[Name] [nvarchar](50) NOT NULL UNIQUE,
[Credit]  [tinyint] NOT NULL DEFAULT 1,
[AcademicYear] [tinyint] NULL,
[Semester] [tinyint] NULL,
CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
[Id] ASC
))
GO

CREATE TABLE [dbo].[AchievementType] (
[Id] [int]IDENTITY(1,1) NOT NULL,
[Name] [nvarchar] (50)  NULL,
[Description] [nvarchar](MAX)  NULL,
[ParticipationRate] [decimal] (18,2)  NULL,
CONSTRAINT [PK_AchievementType] PRIMARY KEY CLUSTERED 
(
[Id] ASC
))
GO

