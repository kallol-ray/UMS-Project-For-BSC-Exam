USE [master]
GO
/****** Object:  Database [UniversityManagementDB]    Script Date: 25/04/17 12:20:24 AM ******/
CREATE DATABASE [UniversityManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityManagementDB', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UniversityManagementDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UniversityManagementDB_log', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UniversityManagementDB_1.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversityManagementDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityManagementDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UniversityManagementDB]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Credit] [decimal](2, 1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Semester] [varchar](50) NOT NULL,
	[TeacherId] [int] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Days]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Days](
	[Name] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designations]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designations](
	[Name] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EnrollCourses]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EnrollCourses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Grade] [varchar](50) NULL,
 CONSTRAINT [PK_EnrollCourse] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Grades]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grades](
	[Name] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoomAllocation]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoomAllocation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[RoomNo] [varchar](50) NOT NULL,
	[Day] [varchar](50) NOT NULL,
	[StartTime] [time](0) NOT NULL,
	[EndTime] [time](0) NOT NULL,
 CONSTRAINT [PK_RoomAllocation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoomNos]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoomNos](
	[Name] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Semesters]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Semesters](
	[Name] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Students]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegistrationNo] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[Date] [date] NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_AllocateClassrooms]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_AllocateClassrooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentCode] [nvarchar](50) NULL,
	[CourseId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[DayName] [nvarchar](50) NULL,
	[TimeFrom] [nvarchar](50) NULL,
	[TimeTo] [nvarchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_t_AllocateClassrooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_AssignCourse]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_AssignCourse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentCode] [nvarchar](50) NULL,
	[TeacherId] [int] NOT NULL,
	[AllowcateCredit] [decimal](18, 2) NOT NULL,
	[CourseId] [int] NOT NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_t_AssignCourse] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_Course]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[Credit] [decimal](18, 2) NULL,
	[Description] [nvarchar](500) NULL,
	[DepartmentCode] [nvarchar](50) NULL,
	[SemesterId] [int] NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_t_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_Department]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](150) NULL,
 CONSTRAINT [PK_t_Department_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_Designation]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_Designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_t_Designation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_EnrolledCourses]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_EnrolledCourses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [nvarchar](50) NOT NULL,
	[CourseId] [int] NOT NULL,
	[Date] [nvarchar](50) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_EnrolledCourses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_Result]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_Result](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[CourseId] [int] NULL,
	[Grade] [nvarchar](50) NULL,
 CONSTRAINT [PK_t_Result] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_Room]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_Room](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_t_Room] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_Semester]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_Semester](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_t_Semester] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_Student]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegNo] [varchar](15) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NULL,
	[ContactNo] [varchar](15) NULL,
	[Date] [varchar](15) NULL,
	[Address] [nvarchar](300) NULL,
	[DepartmentCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_t_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_Teacher]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Address] [nvarchar](300) NULL,
	[Email] [nvarchar](100) NULL,
	[ContactNo] [nchar](15) NULL,
	[DesignationId] [int] NOT NULL,
	[DepartmentCode] [nvarchar](50) NULL,
	[CreditToBeTaken] [decimal](18, 2) NULL,
 CONSTRAINT [PK_t_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teachers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ContactNo] [varchar](11) NOT NULL,
	[Designation] [varchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CreditToBeTaken] [decimal](18, 1) NOT NULL,
	[RemainingCredit] [decimal](18, 1) NOT NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tmpRAKIB]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpRAKIB](
	[DepartmentCode] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[Semester] [nvarchar](50) NULL,
	[status] [int] NULL,
	[ScheduleInfo] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[VW_ClassSchedule]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_ClassSchedule]
AS
SELECT     a.DepartmentCode, a.CourseId, b.Code, b.Name AS CourseName, a.DayName, a.TimeFrom + ' - ' + a.TimeTo AS Time, a.RoomId, c.Name
FROM         dbo.t_AllocateClassrooms AS a INNER JOIN
                      dbo.t_Course AS b ON a.CourseId = b.Id INNER JOIN
                      dbo.t_Room AS c ON a.RoomId = c.Id AND a.Status = 1

GO
/****** Object:  View [dbo].[VW_ClassScheduleFinal]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_ClassScheduleFinal]
AS

SELECT    a.CourseId,a.DepartmentCode, a.Code, a.CourseName, substring
                          ((SELECT     ',' + ' R. No : ' + Name + ', ' + LEFT(DayName, 3) + ', ' + TIME AS [text()]
                              FROM         VW_ClassSchedule b
                              WHERE     b.Code = a.Code
                              ORDER BY b.DepartmentCode FOR XML PATH('')), 2, 1000) ScheduleInfo
FROM         VW_ClassSchedule a
GROUP BY a.DepartmentCode, a.Code, CourseName,a.CourseId

GO
/****** Object:  View [dbo].[GetAllCoursesWithTeacher]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[GetAllCoursesWithTeacher]
AS
SELECT c.Code,c.Name,c.Semester,c.DepartmentId,t.Name AssignedTo FROM Courses c LEFT OUTER JOIN Teachers t ON c.teacherId=t.Id




GO
/****** Object:  View [dbo].[GetAllEnrollCourseWithGrade]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetAllEnrollCourseWithGrade]
AS
SELECT e.StudentId,e.CourseId,c.Code,c.Name,e.Grade FROM EnrollCourses e INNER JOIN Courses c ON e.CourseId=c.Id


GO
/****** Object:  View [dbo].[GetAllStudentsWithDepartment]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetAllStudentsWithDepartment]
AS
SELECT s.Id,s.RegistrationNo,s.Name,s.Email,s.DepartmentId,d.Name Department FROM Students s INNER JOIN Departments d ON s.DepartmentId=d.Id


GO
/****** Object:  View [dbo].[VW_GetSumOfCredit]    Script Date: 25/04/17 12:20:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_GetSumOfCredit]
AS
Select a.TeacherId,SUM(b.Credit) AS TotCredit 
From t_AssignCourse a
INNER JOIN t_Course b
ON a.CourseId=b.Id
GROUP BY a.teacherId
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester], [TeacherId]) VALUES (1, N'CSE-101', N'Computer Fundamental', CAST(3.5 AS Decimal(2, 1)), N'About Computer Fundamental', 1, N'1st', 0)
INSERT [dbo].[Courses] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester], [TeacherId]) VALUES (2, N'EEE-101', N'Basic Electronics', CAST(2.5 AS Decimal(2, 1)), N'About Basic Electronics', 2, N'1st', 0)
INSERT [dbo].[Courses] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester], [TeacherId]) VALUES (3, N'EEE-102', N'Data Communication', CAST(4.5 AS Decimal(2, 1)), N'About Data Communication', 2, N'2nd', 0)
INSERT [dbo].[Courses] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester], [TeacherId]) VALUES (4, N'CSE-102', N'Data Structure', CAST(3.0 AS Decimal(2, 1)), N'About Data Structure', 1, N'2nd', 0)
INSERT [dbo].[Courses] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester], [TeacherId]) VALUES (5, N'CMS-101', N'Fundamentals of Communication', CAST(1.5 AS Decimal(2, 1)), N'About Fundamentals of Communication', 3, N'1st', 0)
INSERT [dbo].[Courses] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester], [TeacherId]) VALUES (6, N'BFA-101', N'Basic Drawing', CAST(2.5 AS Decimal(2, 1)), N'About Basic Drawing', 4, N'1st', 0)
SET IDENTITY_INSERT [dbo].[Courses] OFF
INSERT [dbo].[Days] ([Name]) VALUES (N'Sat')
INSERT [dbo].[Days] ([Name]) VALUES (N'Sun')
INSERT [dbo].[Days] ([Name]) VALUES (N'Mon')
INSERT [dbo].[Days] ([Name]) VALUES (N'Tue')
INSERT [dbo].[Days] ([Name]) VALUES (N'Wed')
INSERT [dbo].[Days] ([Name]) VALUES (N'Thu')
INSERT [dbo].[Days] ([Name]) VALUES (N'Fri')
INSERT [dbo].[Days] ([Name]) VALUES (N'Sat')
INSERT [dbo].[Days] ([Name]) VALUES (N'Sun')
INSERT [dbo].[Days] ([Name]) VALUES (N'Mon')
INSERT [dbo].[Days] ([Name]) VALUES (N'Tue')
INSERT [dbo].[Days] ([Name]) VALUES (N'Wed')
INSERT [dbo].[Days] ([Name]) VALUES (N'Thu')
INSERT [dbo].[Days] ([Name]) VALUES (N'Fri')
INSERT [dbo].[Days] ([Name]) VALUES (N'Sat')
INSERT [dbo].[Days] ([Name]) VALUES (N'Sun')
INSERT [dbo].[Days] ([Name]) VALUES (N'Mon')
INSERT [dbo].[Days] ([Name]) VALUES (N'Tue')
INSERT [dbo].[Days] ([Name]) VALUES (N'Wed')
INSERT [dbo].[Days] ([Name]) VALUES (N'Thu')
INSERT [dbo].[Days] ([Name]) VALUES (N'Fri')
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([Id], [Code], [Name]) VALUES (1, N'CSE', N'Computer Science & Engineering')
INSERT [dbo].[Departments] ([Id], [Code], [Name]) VALUES (2, N'EEE', N'Electrical & Electronics Engineering')
INSERT [dbo].[Departments] ([Id], [Code], [Name]) VALUES (3, N'CMS', N'Communication & Media Studies')
INSERT [dbo].[Departments] ([Id], [Code], [Name]) VALUES (4, N'BFA', N'Fine Arts')
SET IDENTITY_INSERT [dbo].[Departments] OFF
INSERT [dbo].[Designations] ([Name]) VALUES (N'Lecturer')
INSERT [dbo].[Designations] ([Name]) VALUES (N'Senior Lecturer')
INSERT [dbo].[Designations] ([Name]) VALUES (N'Assistant Professor')
INSERT [dbo].[Designations] ([Name]) VALUES (N'Professor')
INSERT [dbo].[Designations] ([Name]) VALUES (N'Lecturer')
INSERT [dbo].[Designations] ([Name]) VALUES (N'Senior Lecturer')
INSERT [dbo].[Designations] ([Name]) VALUES (N'Assistant Professor')
INSERT [dbo].[Designations] ([Name]) VALUES (N'Professor')
INSERT [dbo].[Designations] ([Name]) VALUES (N'Lecturer')
INSERT [dbo].[Designations] ([Name]) VALUES (N'Senior Lecturer')
INSERT [dbo].[Designations] ([Name]) VALUES (N'Assistant Professor')
INSERT [dbo].[Designations] ([Name]) VALUES (N'Professor')
SET IDENTITY_INSERT [dbo].[EnrollCourses] ON 

INSERT [dbo].[EnrollCourses] ([Id], [StudentId], [CourseId], [Date], [Grade]) VALUES (1, 1, 1, CAST(0x083B0B00 AS Date), N'A+')
INSERT [dbo].[EnrollCourses] ([Id], [StudentId], [CourseId], [Date], [Grade]) VALUES (2, 1, 4, CAST(0x143B0B00 AS Date), NULL)
INSERT [dbo].[EnrollCourses] ([Id], [StudentId], [CourseId], [Date], [Grade]) VALUES (3, 2, 1, CAST(0x083B0B00 AS Date), N'A-')
SET IDENTITY_INSERT [dbo].[EnrollCourses] OFF
INSERT [dbo].[Grades] ([Name]) VALUES (N'A+')
INSERT [dbo].[Grades] ([Name]) VALUES (N'A')
INSERT [dbo].[Grades] ([Name]) VALUES (N'A-')
INSERT [dbo].[Grades] ([Name]) VALUES (N'B+')
INSERT [dbo].[Grades] ([Name]) VALUES (N'B')
INSERT [dbo].[Grades] ([Name]) VALUES (N'B-')
INSERT [dbo].[Grades] ([Name]) VALUES (N'C+')
INSERT [dbo].[Grades] ([Name]) VALUES (N'C')
INSERT [dbo].[Grades] ([Name]) VALUES (N'C-')
INSERT [dbo].[Grades] ([Name]) VALUES (N'D+')
INSERT [dbo].[Grades] ([Name]) VALUES (N'D')
INSERT [dbo].[Grades] ([Name]) VALUES (N'D-')
INSERT [dbo].[Grades] ([Name]) VALUES (N'F')
INSERT [dbo].[Grades] ([Name]) VALUES (N'A+')
INSERT [dbo].[Grades] ([Name]) VALUES (N'A')
INSERT [dbo].[Grades] ([Name]) VALUES (N'A-')
INSERT [dbo].[Grades] ([Name]) VALUES (N'B+')
INSERT [dbo].[Grades] ([Name]) VALUES (N'B')
INSERT [dbo].[Grades] ([Name]) VALUES (N'B-')
INSERT [dbo].[Grades] ([Name]) VALUES (N'C+')
INSERT [dbo].[Grades] ([Name]) VALUES (N'C')
INSERT [dbo].[Grades] ([Name]) VALUES (N'C-')
INSERT [dbo].[Grades] ([Name]) VALUES (N'D+')
INSERT [dbo].[Grades] ([Name]) VALUES (N'D')
INSERT [dbo].[Grades] ([Name]) VALUES (N'D-')
INSERT [dbo].[Grades] ([Name]) VALUES (N'F')
INSERT [dbo].[Grades] ([Name]) VALUES (N'A+')
INSERT [dbo].[Grades] ([Name]) VALUES (N'A')
INSERT [dbo].[Grades] ([Name]) VALUES (N'A-')
INSERT [dbo].[Grades] ([Name]) VALUES (N'B+')
INSERT [dbo].[Grades] ([Name]) VALUES (N'B')
INSERT [dbo].[Grades] ([Name]) VALUES (N'B-')
INSERT [dbo].[Grades] ([Name]) VALUES (N'C+')
INSERT [dbo].[Grades] ([Name]) VALUES (N'C')
INSERT [dbo].[Grades] ([Name]) VALUES (N'C-')
INSERT [dbo].[Grades] ([Name]) VALUES (N'D+')
INSERT [dbo].[Grades] ([Name]) VALUES (N'D')
INSERT [dbo].[Grades] ([Name]) VALUES (N'D-')
INSERT [dbo].[Grades] ([Name]) VALUES (N'F')
INSERT [dbo].[RoomNos] ([Name]) VALUES (N'A-101')
INSERT [dbo].[RoomNos] ([Name]) VALUES (N'A-102')
INSERT [dbo].[RoomNos] ([Name]) VALUES (N'B-201')
INSERT [dbo].[RoomNos] ([Name]) VALUES (N'B-202')
INSERT [dbo].[RoomNos] ([Name]) VALUES (N'A-101')
INSERT [dbo].[RoomNos] ([Name]) VALUES (N'A-102')
INSERT [dbo].[RoomNos] ([Name]) VALUES (N'B-201')
INSERT [dbo].[RoomNos] ([Name]) VALUES (N'B-202')
INSERT [dbo].[RoomNos] ([Name]) VALUES (N'A-101')
INSERT [dbo].[RoomNos] ([Name]) VALUES (N'A-102')
INSERT [dbo].[RoomNos] ([Name]) VALUES (N'B-201')
INSERT [dbo].[RoomNos] ([Name]) VALUES (N'B-202')
INSERT [dbo].[Semesters] ([Name]) VALUES (N'1st')
INSERT [dbo].[Semesters] ([Name]) VALUES (N'2nd')
INSERT [dbo].[Semesters] ([Name]) VALUES (N'3rd')
INSERT [dbo].[Semesters] ([Name]) VALUES (N'4th')
INSERT [dbo].[Semesters] ([Name]) VALUES (N'5th')
INSERT [dbo].[Semesters] ([Name]) VALUES (N'6th')
INSERT [dbo].[Semesters] ([Name]) VALUES (N'7th')
INSERT [dbo].[Semesters] ([Name]) VALUES (N'8th')
INSERT [dbo].[Semesters] ([Name]) VALUES (N'1st')
INSERT [dbo].[Semesters] ([Name]) VALUES (N'2nd')
INSERT [dbo].[Semesters] ([Name]) VALUES (N'3rd')
INSERT [dbo].[Semesters] ([Name]) VALUES (N'4th')
INSERT [dbo].[Semesters] ([Name]) VALUES (N'5th')
INSERT [dbo].[Semesters] ([Name]) VALUES (N'6th')
INSERT [dbo].[Semesters] ([Name]) VALUES (N'7th')
INSERT [dbo].[Semesters] ([Name]) VALUES (N'8th')
INSERT [dbo].[Semesters] ([Name]) VALUES (N'1st')
INSERT [dbo].[Semesters] ([Name]) VALUES (N'2nd')
INSERT [dbo].[Semesters] ([Name]) VALUES (N'3rd')
INSERT [dbo].[Semesters] ([Name]) VALUES (N'4th')
INSERT [dbo].[Semesters] ([Name]) VALUES (N'5th')
INSERT [dbo].[Semesters] ([Name]) VALUES (N'6th')
INSERT [dbo].[Semesters] ([Name]) VALUES (N'7th')
INSERT [dbo].[Semesters] ([Name]) VALUES (N'8th')
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [RegistrationNo], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId]) VALUES (1, N'CSE-2016-001', N'Abid', N'abid@y.com', N'01681456511', CAST(0x133B0B00 AS Date), N'Dhaka', 1)
INSERT [dbo].[Students] ([Id], [RegistrationNo], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId]) VALUES (2, N'CSE-2016-002', N'Himaloy', N'himaloy@y.com', N'01922225555', CAST(0x083B0B00 AS Date), N'Dhaka', 1)
INSERT [dbo].[Students] ([Id], [RegistrationNo], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId]) VALUES (3, N'CSE-2017-001', N'Evan', N'evan@y.com', N'01544444444', CAST(0x083C0B00 AS Date), N'Dhaka', 1)
INSERT [dbo].[Students] ([Id], [RegistrationNo], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId]) VALUES (4, N'CSE-2017-002', N'Pavel', N'pavel@y.com', N'01711111111', CAST(0x683C0B00 AS Date), N'Dhaka', 1)
INSERT [dbo].[Students] ([Id], [RegistrationNo], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId]) VALUES (5, N'EEE-2016-001', N'Shoeb', N'shoeb@y.com', N'01787654321', CAST(0x083B0B00 AS Date), N'Comilla', 2)
INSERT [dbo].[Students] ([Id], [RegistrationNo], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId]) VALUES (6, N'EEE-2016-002', N'Mahmud', N'mahmud@y.com', N'0187654321', CAST(0x083B0B00 AS Date), N'Sirajgonj', 2)
SET IDENTITY_INSERT [dbo].[Students] OFF
SET IDENTITY_INSERT [dbo].[t_AllocateClassrooms] ON 

INSERT [dbo].[t_AllocateClassrooms] ([Id], [DepartmentCode], [CourseId], [RoomId], [DayName], [TimeFrom], [TimeTo], [Status]) VALUES (26, N'CSE', 15, 1, N'Sunday', N'09:00 AM', N'12:00 PM', 0)
INSERT [dbo].[t_AllocateClassrooms] ([Id], [DepartmentCode], [CourseId], [RoomId], [DayName], [TimeFrom], [TimeTo], [Status]) VALUES (27, N'CSE', 15, 3, N'Sunday', N'11:00 AM', N'05:30 PM', 0)
INSERT [dbo].[t_AllocateClassrooms] ([Id], [DepartmentCode], [CourseId], [RoomId], [DayName], [TimeFrom], [TimeTo], [Status]) VALUES (28, N'CSE', 15, 3, N'Saturday', N'09:00 AM', N'05:00 PM', 0)
INSERT [dbo].[t_AllocateClassrooms] ([Id], [DepartmentCode], [CourseId], [RoomId], [DayName], [TimeFrom], [TimeTo], [Status]) VALUES (29, N'CSE', 16, 10, N'Saturday', N'09:00 AM', N'01:00 PM', 0)
INSERT [dbo].[t_AllocateClassrooms] ([Id], [DepartmentCode], [CourseId], [RoomId], [DayName], [TimeFrom], [TimeTo], [Status]) VALUES (30, N'CSE', 16, 1, N'Sunday', N'09:00 AM', N'05:00 PM', 1)
SET IDENTITY_INSERT [dbo].[t_AllocateClassrooms] OFF
SET IDENTITY_INSERT [dbo].[t_AssignCourse] ON 

INSERT [dbo].[t_AssignCourse] ([Id], [DepartmentCode], [TeacherId], [AllowcateCredit], [CourseId], [status]) VALUES (19, N'CSE', 17, CAST(4.00 AS Decimal(18, 2)), 15, 0)
INSERT [dbo].[t_AssignCourse] ([Id], [DepartmentCode], [TeacherId], [AllowcateCredit], [CourseId], [status]) VALUES (20, N'CSE', 17, CAST(3.00 AS Decimal(18, 2)), 16, 0)
INSERT [dbo].[t_AssignCourse] ([Id], [DepartmentCode], [TeacherId], [AllowcateCredit], [CourseId], [status]) VALUES (21, N'CSE', 18, CAST(4.00 AS Decimal(18, 2)), 15, 1)
SET IDENTITY_INSERT [dbo].[t_AssignCourse] OFF
SET IDENTITY_INSERT [dbo].[t_Course] ON 

INSERT [dbo].[t_Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentCode], [SemesterId], [Status]) VALUES (15, N'CSE-201', N'Software Engineering', CAST(4.00 AS Decimal(18, 2)), NULL, N'CSE', 1, 1)
INSERT [dbo].[t_Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentCode], [SemesterId], [Status]) VALUES (17, N'CSE-309', N'Digital Electronics', CAST(3.00 AS Decimal(18, 2)), N'asd', N'CSE', 1, 1)
INSERT [dbo].[t_Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentCode], [SemesterId], [Status]) VALUES (18, N'CSE-121', N'Data Structure', CAST(3.00 AS Decimal(18, 2)), NULL, N'CSE', 2, 1)
INSERT [dbo].[t_Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentCode], [SemesterId], [Status]) VALUES (19, N'CSE-127', N'Discrete Mathematics', CAST(3.00 AS Decimal(18, 2)), NULL, N'CSE', 2, 1)
INSERT [dbo].[t_Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentCode], [SemesterId], [Status]) VALUES (20, N'CSE-112', N'Programming Language', CAST(3.00 AS Decimal(18, 2)), NULL, N'CSE', 1, 1)
INSERT [dbo].[t_Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentCode], [SemesterId], [Status]) VALUES (21, N'CSE-211', N'Object Oriented Programming', CAST(3.00 AS Decimal(18, 2)), NULL, N'CSE', 3, 1)
INSERT [dbo].[t_Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentCode], [SemesterId], [Status]) VALUES (22, N'CSE-213', N'Operationg System', CAST(3.00 AS Decimal(18, 2)), NULL, N'CSE', 3, 1)
INSERT [dbo].[t_Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentCode], [SemesterId], [Status]) VALUES (23, N'CSE-221', N'Algorithm Design', CAST(3.00 AS Decimal(18, 2)), NULL, N'CSE', 4, 1)
INSERT [dbo].[t_Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentCode], [SemesterId], [Status]) VALUES (24, N'CSE-223', N'Database Management System', CAST(3.00 AS Decimal(18, 2)), NULL, N'CSE', 4, 1)
INSERT [dbo].[t_Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentCode], [SemesterId], [Status]) VALUES (25, N'CSE-311', N'Theory of Computation', CAST(3.00 AS Decimal(18, 2)), NULL, N'CSE', 5, 1)
INSERT [dbo].[t_Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentCode], [SemesterId], [Status]) VALUES (26, N'CSE-315', N'Sociology', CAST(3.00 AS Decimal(18, 2)), NULL, N'CSE', 5, 1)
INSERT [dbo].[t_Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentCode], [SemesterId], [Status]) VALUES (27, N'CSE-326', N'Compiler Design', CAST(3.00 AS Decimal(18, 2)), NULL, N'CSE', 6, 1)
INSERT [dbo].[t_Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentCode], [SemesterId], [Status]) VALUES (28, N'CSE-325', N'Computer Graphics & Multimedia', CAST(3.00 AS Decimal(18, 2)), NULL, N'CSE', 6, 1)
INSERT [dbo].[t_Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentCode], [SemesterId], [Status]) VALUES (29, N'CSE-411', N'Computer Networking', CAST(3.00 AS Decimal(18, 2)), NULL, N'CSE', 7, 1)
INSERT [dbo].[t_Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentCode], [SemesterId], [Status]) VALUES (30, N'CSE-417', N'Digital Signal Processing', CAST(3.00 AS Decimal(18, 2)), NULL, N'CSE', 7, 1)
INSERT [dbo].[t_Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentCode], [SemesterId], [Status]) VALUES (31, N'CSE-421', N'Web Engineering', CAST(3.00 AS Decimal(18, 2)), NULL, N'CSE', 8, 1)
INSERT [dbo].[t_Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentCode], [SemesterId], [Status]) VALUES (32, N'CSE-499', N'Project', CAST(3.00 AS Decimal(18, 2)), NULL, N'CSE', 8, 1)
INSERT [dbo].[t_Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentCode], [SemesterId], [Status]) VALUES (33, N'ECE-010', N'English', CAST(3.00 AS Decimal(18, 2)), NULL, N'ECE', 1, 1)
INSERT [dbo].[t_Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentCode], [SemesterId], [Status]) VALUES (34, N'ECE-102', N'Phisics-I', CAST(3.00 AS Decimal(18, 2)), NULL, N'ECE', 1, 1)
INSERT [dbo].[t_Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentCode], [SemesterId], [Status]) VALUES (35, N'ECE-113', N'Electrical Circuits-I', CAST(3.00 AS Decimal(18, 2)), NULL, N'ECE', 2, 1)
SET IDENTITY_INSERT [dbo].[t_Course] OFF
SET IDENTITY_INSERT [dbo].[t_Department] ON 

INSERT [dbo].[t_Department] ([Id], [Code], [Name]) VALUES (16, N'CSE', N'Computer Science And Engineering')
INSERT [dbo].[t_Department] ([Id], [Code], [Name]) VALUES (17, N'EEE', N'Electronics And Electrical Engineering')
INSERT [dbo].[t_Department] ([Id], [Code], [Name]) VALUES (18, N'BBA', N'Bachelor Of Business Administration')
INSERT [dbo].[t_Department] ([Id], [Code], [Name]) VALUES (19, N'ECE', N'Electronic And Communication Engineering')
SET IDENTITY_INSERT [dbo].[t_Department] OFF
SET IDENTITY_INSERT [dbo].[t_Designation] ON 

INSERT [dbo].[t_Designation] ([Id], [Name]) VALUES (1, N'Chairman')
INSERT [dbo].[t_Designation] ([Id], [Name]) VALUES (2, N'Vice-Chancellor')
INSERT [dbo].[t_Designation] ([Id], [Name]) VALUES (3, N'Academic Advisor')
INSERT [dbo].[t_Designation] ([Id], [Name]) VALUES (4, N'Treasurer')
INSERT [dbo].[t_Designation] ([Id], [Name]) VALUES (5, N'Registar')
INSERT [dbo].[t_Designation] ([Id], [Name]) VALUES (6, N'Controller of Examinations')
INSERT [dbo].[t_Designation] ([Id], [Name]) VALUES (7, N'Proctor')
INSERT [dbo].[t_Designation] ([Id], [Name]) VALUES (8, N'Professor')
INSERT [dbo].[t_Designation] ([Id], [Name]) VALUES (9, N'Lecturer')
INSERT [dbo].[t_Designation] ([Id], [Name]) VALUES (10, N'Asst Professor')
INSERT [dbo].[t_Designation] ([Id], [Name]) VALUES (11, N'Head Of The Department')
INSERT [dbo].[t_Designation] ([Id], [Name]) VALUES (12, N'System Administrator')
SET IDENTITY_INSERT [dbo].[t_Designation] OFF
SET IDENTITY_INSERT [dbo].[t_EnrolledCourses] ON 

INSERT [dbo].[t_EnrolledCourses] ([Id], [StudentId], [CourseId], [Date], [Status]) VALUES (9, N'21', 15, N'28-01-2016', 0)
INSERT [dbo].[t_EnrolledCourses] ([Id], [StudentId], [CourseId], [Date], [Status]) VALUES (10, N'21', 16, N'30-01-2016', 0)
INSERT [dbo].[t_EnrolledCourses] ([Id], [StudentId], [CourseId], [Date], [Status]) VALUES (11, N'22', 15, N'06-04-2017', 0)
SET IDENTITY_INSERT [dbo].[t_EnrolledCourses] OFF
SET IDENTITY_INSERT [dbo].[t_Result] ON 

INSERT [dbo].[t_Result] ([Id], [StudentId], [CourseId], [Grade]) VALUES (9, 21, 15, N'A+')
SET IDENTITY_INSERT [dbo].[t_Result] OFF
SET IDENTITY_INSERT [dbo].[t_Room] ON 

INSERT [dbo].[t_Room] ([Id], [Name]) VALUES (1, N'R-201')
INSERT [dbo].[t_Room] ([Id], [Name]) VALUES (2, N'R-202')
INSERT [dbo].[t_Room] ([Id], [Name]) VALUES (3, N'R-203')
INSERT [dbo].[t_Room] ([Id], [Name]) VALUES (4, N'R-204')
INSERT [dbo].[t_Room] ([Id], [Name]) VALUES (5, N'R-301')
INSERT [dbo].[t_Room] ([Id], [Name]) VALUES (6, N'R-302')
INSERT [dbo].[t_Room] ([Id], [Name]) VALUES (7, N'R-303')
INSERT [dbo].[t_Room] ([Id], [Name]) VALUES (8, N'R-401')
INSERT [dbo].[t_Room] ([Id], [Name]) VALUES (9, N'R-501')
INSERT [dbo].[t_Room] ([Id], [Name]) VALUES (10, N'R-502')
SET IDENTITY_INSERT [dbo].[t_Room] OFF
SET IDENTITY_INSERT [dbo].[t_Semester] ON 

INSERT [dbo].[t_Semester] ([Id], [Name]) VALUES (1, N'1st Semester')
INSERT [dbo].[t_Semester] ([Id], [Name]) VALUES (2, N'2nd Semester')
INSERT [dbo].[t_Semester] ([Id], [Name]) VALUES (3, N'3rd Semester')
INSERT [dbo].[t_Semester] ([Id], [Name]) VALUES (4, N'4th Semester')
INSERT [dbo].[t_Semester] ([Id], [Name]) VALUES (5, N'5th Semester')
INSERT [dbo].[t_Semester] ([Id], [Name]) VALUES (6, N'6th Semester')
INSERT [dbo].[t_Semester] ([Id], [Name]) VALUES (7, N'7th Semester')
INSERT [dbo].[t_Semester] ([Id], [Name]) VALUES (8, N'8th Semester')
SET IDENTITY_INSERT [dbo].[t_Semester] OFF
SET IDENTITY_INSERT [dbo].[t_Student] ON 

INSERT [dbo].[t_Student] ([Id], [RegNo], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentCode]) VALUES (21, N'CSE-2016-001', N'MdKhalid Ibne Mahmud', N'rakibbubt33@gmail.com', N'01722182387', N'30-01-2016', N's', N'CSE')
INSERT [dbo].[t_Student] ([Id], [RegNo], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentCode]) VALUES (22, N'CSE-2017-002', N'Kallol Ray', N'kallolray94@gmail.com', N'01727379068', N'05-04-2017', N'East Rampura, Zaker Road, Dhaka-1219.', N'CSE')
SET IDENTITY_INSERT [dbo].[t_Student] OFF
SET IDENTITY_INSERT [dbo].[t_Teacher] ON 

INSERT [dbo].[t_Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentCode], [CreditToBeTaken]) VALUES (17, N'Gazi Golam Rosul', NULL, N'gazi@gmail.com', N'017525252      ', 9, N'CSE', CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[t_Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentCode], [CreditToBeTaken]) VALUES (18, N'Azizul Bahar', N'Banasree', N'azizulbahar@hotmail.com', N'01717165359    ', 11, N'CSE', CAST(90.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[t_Teacher] OFF
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [DepartmentId], [CreditToBeTaken], [RemainingCredit]) VALUES (1, N'Tarek Hasan', N'Dhaka', N'tarek@y.com', N'01911111111', N'Lecturer', 1, CAST(20.0 AS Decimal(18, 1)), CAST(20.0 AS Decimal(18, 1)))
INSERT [dbo].[Teachers] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [DepartmentId], [CreditToBeTaken], [RemainingCredit]) VALUES (2, N'Aneek Hossain', N'Dhaka', N'aneek@y.com', N'01711111111', N'Senior Lecturer', 1, CAST(15.0 AS Decimal(18, 1)), CAST(15.0 AS Decimal(18, 1)))
INSERT [dbo].[Teachers] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [DepartmentId], [CreditToBeTaken], [RemainingCredit]) VALUES (3, N'Foysol Islam', N'Khulna', N'foysol@y.com', N'01811111111', N'Professor', 2, CAST(18.0 AS Decimal(18, 1)), CAST(18.0 AS Decimal(18, 1)))
INSERT [dbo].[Teachers] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [DepartmentId], [CreditToBeTaken], [RemainingCredit]) VALUES (4, N'Bably Rahman', N'Dinajpur', N'bably@y.com', N'01822222222', N'Senior Lecturer', 3, CAST(12.0 AS Decimal(18, 1)), CAST(12.0 AS Decimal(18, 1)))
INSERT [dbo].[Teachers] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [DepartmentId], [CreditToBeTaken], [RemainingCredit]) VALUES (5, N'Nadia Akter', N'Chittagong', N'nadia@y.com', N'01544443333', N'Lecturer', 4, CAST(10.0 AS Decimal(18, 1)), CAST(10.0 AS Decimal(18, 1)))
SET IDENTITY_INSERT [dbo].[Teachers] OFF
INSERT [dbo].[tmpRAKIB] ([DepartmentCode], [Code], [Name], [Semester], [status], [ScheduleInfo]) VALUES (N'CSE', N'CSE-201', N'Software Engineering', N'1st Semester', 1, N' R. No : R-201, Sun, 09:00 AM -  12:00 PM, R. No : R-203, Sun, 11:00 AM -  05:30 PM')
INSERT [dbo].[tmpRAKIB] ([DepartmentCode], [Code], [Name], [Semester], [status], [ScheduleInfo]) VALUES (N'CSE', N'CSE-201', N'Software Engineering', N'1st Semester', 1, N' R. No : R-201, Sun, 09:00 AM -  12:00 PM, R. No : R-203, Sun, 11:00 AM -  05:30 PM')
INSERT [dbo].[tmpRAKIB] ([DepartmentCode], [Code], [Name], [Semester], [status], [ScheduleInfo]) VALUES (N'CSE', N'CMAT-201', N'Anaysis of math', N'1st Semester', NULL, N' Not Schedule Yet')
ALTER TABLE [dbo].[t_AllocateClassrooms] ADD  CONSTRAINT [DF_t_AllocateClassrooms_CourseId]  DEFAULT ((0)) FOR [CourseId]
GO
ALTER TABLE [dbo].[t_AllocateClassrooms] ADD  CONSTRAINT [DF_t_AllocateClassrooms_RoomId]  DEFAULT ((0)) FOR [RoomId]
GO
ALTER TABLE [dbo].[t_AssignCourse] ADD  CONSTRAINT [DF_t_AssignCourse_DepartmentId]  DEFAULT ((0)) FOR [DepartmentCode]
GO
ALTER TABLE [dbo].[t_AssignCourse] ADD  CONSTRAINT [DF_t_AssignCourse_TeacherId]  DEFAULT ((0)) FOR [TeacherId]
GO
ALTER TABLE [dbo].[t_AssignCourse] ADD  CONSTRAINT [DF_t_AssignCourse_AllowcateCredit]  DEFAULT ((0)) FOR [AllowcateCredit]
GO
ALTER TABLE [dbo].[t_AssignCourse] ADD  CONSTRAINT [DF_t_AssignCourse_CourseId]  DEFAULT ((0)) FOR [CourseId]
GO
ALTER TABLE [dbo].[t_AssignCourse] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[t_Course] ADD  CONSTRAINT [DF_t_Course_SemesterId]  DEFAULT ((0)) FOR [SemesterId]
GO
ALTER TABLE [dbo].[t_EnrolledCourses] ADD  CONSTRAINT [DF_t_EnrolledCourses_CourseId]  DEFAULT ((0)) FOR [CourseId]
GO
ALTER TABLE [dbo].[t_EnrolledCourses] ADD  CONSTRAINT [DF_EnrolledCourses_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[t_Result] ADD  CONSTRAINT [DF_t_Result_StudentId]  DEFAULT ((0)) FOR [StudentId]
GO
ALTER TABLE [dbo].[t_Course]  WITH CHECK ADD  CONSTRAINT [FK_t_Course_t_Semester] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[t_Semester] ([Id])
GO
ALTER TABLE [dbo].[t_Course] CHECK CONSTRAINT [FK_t_Course_t_Semester]
GO
ALTER TABLE [dbo].[t_Teacher]  WITH CHECK ADD  CONSTRAINT [FK_t_Teacher_t_Designation] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[t_Designation] ([Id])
GO
ALTER TABLE [dbo].[t_Teacher] CHECK CONSTRAINT [FK_t_Teacher_t_Designation]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[34] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 247
               Bottom = 125
               Right = 418
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 654
               Bottom = 95
               Right = 814
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ClassSchedule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ClassSchedule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[16] 4[19] 2[28] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ClassScheduleFinal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ClassScheduleFinal'
GO
USE [master]
GO
ALTER DATABASE [UniversityManagementDB] SET  READ_WRITE 
GO
