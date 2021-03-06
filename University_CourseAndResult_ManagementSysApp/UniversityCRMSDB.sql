USE [master]
GO
/****** Object:  Database [UniversityCourseResult_MS_DB]    Script Date: 7/22/2017 11:43:54 PM ******/
CREATE DATABASE [UniversityCourseResult_MS_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityCourseResult_MS_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\UniversityCourseResult_MS_DB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UniversityCourseResult_MS_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\UniversityCourseResult_MS_DB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityCourseResult_MS_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'UniversityCourseResult_MS_DB', N'ON'
GO
USE [UniversityCourseResult_MS_DB]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 7/22/2017 11:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Credit] [decimal](18, 2) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Semester] [varchar](300) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseAssign]    Script Date: 7/22/2017 11:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseAssign](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[TeacherId] [int] NULL,
	[CourseId] [int] NULL,
 CONSTRAINT [PK_CourseAssign] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 7/22/2017 11:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](7) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 7/22/2017 11:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Email] [varchar](150) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[Date] [date] NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[RegNo] [varchar](150) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 7/22/2017 11:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[ContactNo] [int] NOT NULL,
	[Designation] [varchar](150) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CreditToBeTaken] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[CourseAssignView]    Script Date: 7/22/2017 11:43:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[CourseAssignView]
as
SELECT        d.Id AS DepartmentId, t.Id AS TeacherId, c.Id AS CourseId, t.Name AS TeacherName, c.Name AS CourseName, c.Code AS CourseCode, c.Credit AS CourseCredit, 
                         c.Semester AS CourseSemester, c.DepartmentId AS CourseDepartment
FROM            dbo.Department AS d RIGHT OUTER JOIN
                         dbo.CourseAssign AS ca ON d.Id = ca.DepartmentId RIGHT OUTER JOIN
                         dbo.Teacher AS t ON t.Id = ca.TeacherId RIGHT OUTER JOIN
                         dbo.Course AS c ON c.Id = ca.CourseId
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (1, N'CSE4033', N'Web & Internet Programming', CAST(3.00 AS Decimal(18, 2)), N'We can learn PHP and basics of web related terms.', 1, N'7th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (2, N'CSE2015', N'Programming Language II (Java)', CAST(3.00 AS Decimal(18, 2)), N'We can learn java language in this course properly and also learn some basics of android.', 1, N'3rd Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (3, N'CSE2016', N'Java Lab', CAST(1.00 AS Decimal(18, 2)), N'Practically we can learn java language in this course', 1, N'3rd Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (4, N'CSE1011', N'C Programming', CAST(3.00 AS Decimal(18, 2)), N'We can learn basics of programming language C here.', 1, N'1st Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (5, N'CSE2021', N'Algorithm', CAST(3.00 AS Decimal(18, 2)), N'We can learn some basic algorithm which is necessary for CS engineer.', 1, N'3rd Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (6, N'EEE124', N'Fundamentals of Electrical Engineering', CAST(4.00 AS Decimal(18, 2)), N'We can learn fundamentals of electrical engineering in this course.', 2, N'1st Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (7, N'EEE223', N'Digital System Design', CAST(3.00 AS Decimal(18, 2)), N'We learn digital system design from this course', 2, N'6th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (8, N'EEE414', N'Digital Electronics', CAST(3.00 AS Decimal(18, 2)), N'We learn EDigital Electronics  from this Course', 2, N'8th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (9, N'BBA215', N'Marketting', CAST(3.00 AS Decimal(18, 2)), N'we can learn about marketting here', 5, N'3rd Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (10, N'BBA4015', N'Accounting', CAST(3.00 AS Decimal(18, 2)), N'Mathematical related course', 5, N'7th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (11, N'ETE1057', N'Data Communication', CAST(3.00 AS Decimal(18, 2)), N'Theoritical subject', 3, N'5th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (12, N'ETE2034', N'Networking', CAST(3.00 AS Decimal(18, 2)), N'All about computer networking .', 3, N'4th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (13, N'TE1023', N'Mathematics for Textile', CAST(3.00 AS Decimal(18, 2)), N'mathematics for textile engineers', 4, N'3rd Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (14, N'ARCH4501', N'Architectural Construction and Computation', CAST(3.00 AS Decimal(18, 2)), N'Architectural Construction and Computation', 6, N'6th Semester')
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[CourseAssign] ON 

INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (1, 1, 1, 2)
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (2, 1, 1, 1)
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (3, 1, 1, 3)
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (4, 2, 2, 6)
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (5, 3, 3, 12)
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (6, 2, 2, 8)
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (7, 4, 4, 13)
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (8, 5, 5, 10)
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (9, 5, 5, 9)
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (10, 6, 6, 14)
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (11, 1, 7, 4)
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (12, 1, 7, 5)
SET IDENTITY_INSERT [dbo].[CourseAssign] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (1, N'CSE', N'Computer Science & Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (2, N'EEE', N'Electrical & Electronics Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (3, N'ETE', N'Electronic & Telecommunication Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (4, N'TE', N'Department of Textile Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (5, N'BBA', N'Bachelor of Business Administration')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (6, N'ARCH', N'Department of Architecture')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegNo]) VALUES (1, N'Giyasuddin Shimul', N'shimul.cse012@gmail.com', N'01748545749', CAST(N'2017-07-22' AS Date), N'Mohakhali wireless gate', 1, N'CSE-2017-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegNo]) VALUES (2, N'Mahfuz', N'mahfuz@gmail.com', N'01873487384', CAST(N'2017-07-22' AS Date), N'Mirpur', 1, N'CSE-2017-002')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegNo]) VALUES (3, N'Shuvo', N'shuvo@gmail.com', N'01374836843', CAST(N'2017-07-10' AS Date), N'Banani', 2, N'EEE-2017-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegNo]) VALUES (4, N'Jalish Mahmud', N'jalis@gmail.com', N'013984739847', CAST(N'2017-05-24' AS Date), N'banaripara, Barishal', 2, N'EEE-2017-002')
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [DepartmentId], [CreditToBeTaken]) VALUES (1, N'Monirul Hasan', N'Banani', N'kmhasan@gmail.com', 1834634334, N'AP', 1, CAST(12.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [DepartmentId], [CreditToBeTaken]) VALUES (2, N'Asaduzzaman', N'Rajshahi', N'asad@gmail.com', 0, N'SL', 2, CAST(9.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [DepartmentId], [CreditToBeTaken]) VALUES (3, N'Ashik Rahman', N'Jessore', N'ashik@gmail.com', 1736473474, N'AP', 3, CAST(14.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [DepartmentId], [CreditToBeTaken]) VALUES (4, N'Motahar Rahman', N'Khulna', N'mota@gmail.com', 0, N'L', 4, CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [DepartmentId], [CreditToBeTaken]) VALUES (5, N'Md Ridoy Islam', N'Chittagong', N'ridoy@gmail.com', 1623364634, N'P', 5, CAST(14.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [DepartmentId], [CreditToBeTaken]) VALUES (6, N'Hasanuzzaman', N'Dhaka', N'hasan@gmail.com', 0, N'P', 6, CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [DepartmentId], [CreditToBeTaken]) VALUES (7, N'Shahriar Manzoor', N'Dhaka', N'manzoor@gmail.com', 0, N'P', 1, CAST(9.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Teacher] OFF
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Department]
GO
ALTER TABLE [dbo].[CourseAssign]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssign_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[CourseAssign] CHECK CONSTRAINT [FK_CourseAssign_Course]
GO
ALTER TABLE [dbo].[CourseAssign]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssign_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[CourseAssign] CHECK CONSTRAINT [FK_CourseAssign_Department]
GO
ALTER TABLE [dbo].[CourseAssign]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssign_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[CourseAssign] CHECK CONSTRAINT [FK_CourseAssign_Teacher]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Department] FOREIGN KEY([Id])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Department]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Department]
GO
USE [master]
GO
ALTER DATABASE [UniversityCourseResult_MS_DB] SET  READ_WRITE 
GO
