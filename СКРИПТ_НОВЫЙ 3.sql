USE [master]
GO
/****** Object:  Database [DiscretMathBD]    Script Date: 21.06.2023 21:04:45 ******/
CREATE DATABASE [DiscretMathBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DiscretMathBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DiscretMathBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DiscretMathBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DiscretMathBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DiscretMathBD] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DiscretMathBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DiscretMathBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DiscretMathBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DiscretMathBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DiscretMathBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DiscretMathBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [DiscretMathBD] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DiscretMathBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DiscretMathBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DiscretMathBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DiscretMathBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DiscretMathBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DiscretMathBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DiscretMathBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DiscretMathBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DiscretMathBD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DiscretMathBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DiscretMathBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DiscretMathBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DiscretMathBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DiscretMathBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DiscretMathBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DiscretMathBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DiscretMathBD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DiscretMathBD] SET  MULTI_USER 
GO
ALTER DATABASE [DiscretMathBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DiscretMathBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DiscretMathBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DiscretMathBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DiscretMathBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DiscretMathBD] SET QUERY_STORE = OFF
GO
USE [DiscretMathBD]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 21.06.2023 21:04:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](1000) NOT NULL,
	[IsRight] [bit] NOT NULL,
	[QuestionId] [int] NOT NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chapter]    Script Date: 21.06.2023 21:04:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chapter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[IndexNumber] [int] NOT NULL,
 CONSTRAINT [PK_Chapter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ControlPoint]    Script Date: 21.06.2023 21:04:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ControlPoint](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TopicId] [int] NOT NULL,
	[TaskTitle] [nvarchar](1000) NULL,
	[AnswerTitle] [nvarchar](1000) NULL,
	[IndexNumber] [int] NOT NULL,
	[TaskLink] [nvarchar](100) NULL,
	[AnswerLink] [nvarchar](100) NULL,
 CONSTRAINT [PK_ControlPoint] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 21.06.2023 21:04:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](1000) NOT NULL,
	[Image] [nvarchar](1000) NULL,
	[Description] [nvarchar](1000) NULL,
	[TopicId] [int] NOT NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 21.06.2023 21:04:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Grade] [int] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentGroup]    Script Date: 21.06.2023 21:04:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_StudentGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 21.06.2023 21:04:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TopicId] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[IndexNumber] [int] NOT NULL,
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestProgress]    Script Date: 21.06.2023 21:04:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestProgress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[AnswerId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL,
	[TestId] [int] NOT NULL,
 CONSTRAINT [PK_TestProgress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestQuestion]    Script Date: 21.06.2023 21:04:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestQuestion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[TestId] [int] NOT NULL,
	[IndexNumber] [int] NOT NULL,
 CONSTRAINT [PK_TestQuestion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 21.06.2023 21:04:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[TotalHours] [int] NOT NULL,
	[ChapterId] [int] NOT NULL,
	[IndexNumber] [int] NOT NULL,
	[TopicTypeId] [int] NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TopicContent]    Script Date: 21.06.2023 21:04:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopicContent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TopicId] [int] NOT NULL,
	[TopicTitle] [nvarchar](max) NULL,
	[TopicLink] [nvarchar](1000) NULL,
	[IndexNumber] [int] NOT NULL,
 CONSTRAINT [PK_TopicContent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TopicType]    Script Date: 21.06.2023 21:04:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopicType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_TopicType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 21.06.2023 21:04:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Surname] [nvarchar](100) NULL,
	[Name] [nvarchar](100) NULL,
	[Patronymic] [nvarchar](100) NULL,
	[DateOfRegs] [date] NOT NULL,
	[StudentGroupId] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserControlPoint]    Script Date: 21.06.2023 21:04:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserControlPoint](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ControlPointId] [int] NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Answer] [nvarchar](max) NULL,
	[AnswerLink] [nvarchar](1000) NULL,
	[Result] [int] NULL,
 CONSTRAINT [PK_UserControlPoint] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTestResults]    Script Date: 21.06.2023 21:04:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTestResults](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TestId] [int] NOT NULL,
	[Result] [int] NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_TestResults] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTopicContent]    Script Date: 21.06.2023 21:04:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTopicContent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[TopicContentId] [int] NOT NULL,
	[IsStudied] [bit] NOT NULL,
 CONSTRAINT [PK_CourseProgress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (127, N'2', 0, 33)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (128, N'64', 0, 33)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (129, N'64^2', 0, 33)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (130, N'2^64', 1, 33)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (131, N'2', 1, 34)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (132, N'64', 0, 34)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (133, N'64^2', 0, 34)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (134, N'2^64', 0, 34)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (135, N'функция', 1, 35)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (136, N'алгебра', 0, 35)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (137, N'логика', 0, 35)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (138, N'ничто из перечисленного', 0, 35)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (139, N'в логике любое высказывание либо истинно, либо ложно; третьего не дано. ', 0, 36)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (140, N'в алгебре высказываний каждая из переменных принимает одно из двух значений, истина или ложь. Третьего не дано. ', 0, 36)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (141, N'в рамках любой математической теории, содержащей хотя бы арифметику, всегда можно сформулировать утверждение, которое нельзя ни опровергнуть, ни доказать. ', 0, 36)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (142, N'все утверждения верны', 1, 36)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (143, N'1', 0, 37)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (144, N'2', 1, 37)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (145, N'3', 0, 37)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (146, N'4', 0, 37)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (147, N'1', 1, 38)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (148, N'2', 0, 38)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (149, N'3', 0, 38)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (150, N'4', 0, 38)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (151, N'дизъюнкция ', 0, 39)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (152, N'конъюнкция ', 0, 39)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (153, N'эквивалентность ', 0, 39)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (154, N'ассоциативность ', 1, 39)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (155, N'дизъюнкция ', 0, 40)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (156, N'конъюнкция', 0, 40)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (157, N'сумма ', 0, 40)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (158, N'эквивалентность ', 1, 40)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (159, N'конъюнкция ', 0, 41)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (160, N'эквивалентность ', 0, 41)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (161, N'импликация', 0, 41)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (162, N'дизъюнкция', 1, 41)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (163, N'конъюнкция', 1, 42)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (164, N'штрих шеффера', 0, 42)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (165, N'стрелка пирса', 0, 42)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (166, N'сумма', 0, 42)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (167, N'штрих Шеффера представим как отрицание стрелки Пирса ', 0, 43)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (168, N'штрих Шеффера представим как отрицание конънкции ', 1, 43)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (169, N'штрих Шеффера представим как отрицание дизъюнкции ', 0, 43)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (170, N'стрелка Пирса представима как отрицание конънкции ', 0, 43)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (171, N'штрих Шеффера представим как отрицание стрелки Пирса ', 0, 44)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (172, N'штрих Шеффера представим как отрицание дизъюнкции ', 0, 44)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (173, N'стрелка Пирса представима как отрицание конънкции ', 0, 44)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (174, N'стрелка Пирса представима как отрицание дизъюнкции ', 1, 44)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (175, N'существует для любой функции алгебры логики ', 1, 45)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (176, N'не существует для функций алгебры логики, заданных табличным образом ', 0, 45)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (177, N'существует для всех функций алгебры логики, но только для первой переменной ', 0, 45)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (178, N'x1 & x2', 0, 46)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (179, N'x1 & ¬x2 V ¬x1 & x2', 0, 46)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (180, N'¬x1 & ¬x2', 0, 46)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (181, N'x1 & ¬x2 V ¬x1', 1, 46)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (182, N'x1 & ¬x2 V ¬x1 & x2', 0, 47)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (183, N'x1  & x2', 1, 47)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (184, N'¬x2 V ¬x1', 0, 47)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (185, N' ¬x2 V ¬x1 & x2', 0, 47)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (186, N'x1 & x2', 0, 48)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (187, N'x1 & ¬x2 V ¬x1 & x2', 0, 48)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (188, N'¬x1 & ¬x2', 1, 48)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (189, N'x1 & ¬x2 V ¬x1', 0, 48)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (190, N'x1 & x2', 0, 49)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (191, N'x1 & ¬x2 V ¬x1 & x2', 0, 49)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (192, N'¬x1 & ¬x2', 0, 49)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (193, N'x1 & ¬x2 V ¬x1', 1, 49)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (194, N'x & y V x & y & z', 1, 50)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (195, N'x & ¬y V ¬x', 0, 50)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (196, N'¬x & ¬y', 0, 50)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (197, N'¬x & y', 0, 50)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (198, N'существует для всех функций алгебры логики, кроме тождественного нуля ', 0, 51)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (199, N'определена для константы 0', 1, 51)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (200, N'определена для константы 1', 0, 51)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (201, N'позволяет задать любую функцию алгебры логики в виде формулы, содержащей операции только следующих видов: конъюнкцию, дизъюнкцию, отрицание ', 0, 51)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (202, N' позволяет представить любую заданную таблично функцию алгебры логики в виде формулы ', 1, 52)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (203, N' определена для константы 0', 0, 52)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (204, N'позволяет задать любую функцию алгебры логики в виде формулы, содержащей операции только следующих видов: конъюнкцию, дизъюнкцию, отрицание ', 0, 52)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (205, N'наиболее удобна для представления функции алгебры логики, в табличном представлении которой мало нулей и много единиц', 0, 52)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (206, N'определена для константы 0', 1, 53)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (207, N'определена для константы 1', 0, 53)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (208, N'позволяет представить любую заданную таблично функцию алгебры логики в виде формулы ', 0, 53)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (209, N' существует для всех функций алгебры логики, кроме тождественного нуля', 0, 53)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (210, N'определена для константы 1', 0, 54)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (211, N'наиболее удобна для представления функции алгебры логики, в табличном представлении которой мало нулей и много единиц', 0, 54)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (212, N'наиболее удобна для представления функции алгебры логики, в табличном представлении которой много нулей и мало единиц ', 0, 54)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (213, N'позволяет представить любую заданную таблично функцию алгебры логики в виде формулы ', 0, 54)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (214, N'¬x V y', 1, 55)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (215, N'x V ¬y', 0, 55)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (216, N'¬x & ¬y V ¬x & y V x & y', 0, 55)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (217, N'¬x & ¬y V ¬x & y', 0, 55)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (218, N'¬x V y', 0, 56)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (219, N'x V ¬y', 0, 56)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (220, N'¬x & ¬y V ¬x & y V x & y', 1, 56)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (221, N'¬x & ¬y V ¬x & y', 0, 56)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (222, N'полная система ', 0, 57)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (223, N'замкнутый класс ', 1, 57)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (224, N'полная система', 1, 58)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (225, N'замкнутый класс ', 0, 58)
GO
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (226, N'полной системы', 0, 59)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (227, N'замкнутого класса', 1, 59)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (228, N'можно', 0, 60)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (229, N'нельзя', 1, 60)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (230, N'x', 1, 61)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (231, N'¬x', 0, 61)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (232, N'¬x & y', 0, 61)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (233, N'1', 0, 61)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (234, N'1', 0, 62)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (235, N'¬x', 0, 62)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (236, N'x → y', 0, 62)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (237, N'x & y', 1, 62)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (238, N'примером замкнутого класса ', 1, 63)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (239, N'классом функций, сохраняющих единицу ', 0, 63)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (240, N'примером полной системы', 0, 63)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (241, N'x', 1, 64)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (242, N'0', 0, 64)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (243, N'x → y', 0, 64)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (244, N'x & y', 0, 64)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (245, N'полинома Жегалкина ', 1, 65)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (246, N'конъюнктивной нормальной формы', 0, 65)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (247, N'дизъюнктивной нормальной формы', 0, 65)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (248, N'суперпозиции немонотонной и несамодвойственной функции ', 0, 65)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (249, N'единственным образом ', 1, 66)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (250, N'n + 1 способами', 0, 66)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (251, N'2^n+1 способами', 0, 66)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (252, N'2^n-1 способами', 0, 66)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (253, N'все функции алгебры логики ', 1, 67)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (254, N'все несамодвойственные функции алгебры логики ', 0, 67)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (255, N'все функции алгебры логики, за исключением тождественного нуля и тождественной единицы ', 0, 67)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (256, N'все функции алгебры логики, существенно зависящие не менее, чем от трех переменных ', 0, 67)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (257, N'3', 0, 68)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (258, N'34', 0, 68)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (259, N'6', 0, 68)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (260, N'8', 1, 68)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (261, N'немонотонная ', 0, 69)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (262, N'нелинейная ', 1, 69)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (263, N'не самодвойственная', 0, 69)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (264, N'не сохраняющая единицу ', 0, 69)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (265, N'{¬x}', 0, 70)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (266, N'{0; x V y}', 0, 70)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (267, N'{0;1}', 0, 70)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (268, N'{x|y}', 1, 70)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (269, N'{0; x & y}', 0, 71)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (270, N'{x}', 0, 71)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (271, N'{x → y}', 0, 71)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (272, N'{x ↓ y}', 1, 71)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (273, N'x V y V 1', 0, 72)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (274, N'x & y V 1', 0, 72)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (275, N'x & y V x V y', 1, 72)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (276, N'x & y', 0, 72)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (277, N'1 V x V x & y', 1, 73)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (278, N'x V x & y', 0, 73)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (279, N'1 V x V y V x & y', 0, 73)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (280, N'x V y', 0, 73)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (281, N'x & y', 0, 74)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (282, N'x & y V 1', 1, 74)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (283, N'x V y V 1', 0, 74)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (284, N'x & y V x V y  V 1', 0, 74)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (285, N'x & y V 1', 0, 75)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (286, N'x V y V 1', 0, 75)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (287, N'x V y', 0, 75)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (288, N'x & y V x V y V 1', 1, 75)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (289, N'константа 0, константа 1, тождество ', 0, 76)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (290, N'константа 0, константа 1, отрицание ', 1, 76)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (291, N'константа 0, константа 1, конъюнкция ', 0, 76)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (292, N'константа 0, константа 1, дизъюнкция', 0, 76)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (293, N'наличие функции, сохраняющей ноль ', 0, 77)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (294, N'отсутствие функции, сохраняющей ноль ', 0, 77)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (295, N'наличие функции, не сохраняющей ноль ', 1, 77)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (296, N'наличие функции, сохраняющей единицу', 0, 77)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (297, N'отсутствие функции, сохраняющей единицу ', 0, 78)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (298, N'наличие функции, не сохраняющей единицу ', 1, 78)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (299, N'отсутствие функции, не сохраняющей единицу ', 0, 78)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (300, N'наличие функции, сохраняющей единицу ', 0, 78)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (301, N'наличие самодвойственной функции ', 0, 79)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (302, N'отсутствие самодвойственной функции ', 0, 79)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (303, N'отсутствие несамодвойственной функции', 0, 79)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (304, N'наличие несамодвойственной функции ', 1, 79)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (305, N'появление задач о структуре молекул ', 0, 80)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (306, N'появление статьи Эйлера о Кенигсбергских мостах', 1, 80)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (307, N'формулировка задач об электрических сетях', 0, 80)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (308, N'постановка проблемы четырех красок', 0, 80)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (309, N'выбор цветовой модели ', 0, 81)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (310, N'задача о карте Европы ', 0, 81)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (311, N'проблема четырех красок', 1, 81)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (312, N'задача коммивояжера ', 0, 81)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (313, N'задачи изучения электричеких цепей ', 0, 82)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (314, N'задача коммивояжера ', 0, 82)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (315, N'минимизация булевых функций ', 0, 82)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (316, N'все вышеперечисленное', 1, 82)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (317, N'страны изображаются в виде вершин, ребра соединяют вершины, если между соответствующими им странами имеется граница, отличная от точки  ', 1, 83)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (318, N'страны изображаются в виде вершин, ребра соединяют вершины, если соответствующие им страны окрашены на карте в одинаковый цвет', 0, 83)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (319, N' вершины изображают точки, где пересекаются границы трех и более государств, ребра соответствуют линиям границы между государствами ', 0, 83)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (320, N'17', 0, 84)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (321, N'5', 1, 84)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (322, N'50', 0, 84)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (323, N'500', 0, 84)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (324, N'задача поиска простого пути ', 0, 85)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (325, N'задача поиска циклов с целью устранения их ', 1, 85)
GO
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (326, N'задача о четырех красках ', 0, 85)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (327, N'множество слов длины n в алфавите из n символов ', 0, 86)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (328, N'множество слов длины n - 2 в алфавите из n символов ', 1, 86)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (329, N'множество слов длины n - 2 в алфавите из n - 2 символов', 0, 86)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (330, N'множество слов длины n в алфавите из n - 2 символов', 0, 86)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (331, N' метод полного перебора ', 0, 87)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (332, N'построение изоморфизма между множеством деревьев и некоторым другим множеством', 1, 87)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (333, N'рассуждение по индукции ', 0, 87)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (334, N'1', 0, 88)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (335, N'2', 0, 88)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (336, N'3', 1, 88)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (337, N'5', 0, 88)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (338, N'4', 0, 89)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (339, N'8', 1, 89)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (340, N'12', 0, 89)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (341, N'16', 0, 89)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (342, N'24 ', 0, 90)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (343, N'48', 0, 90)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (344, N'96', 0, 90)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (345, N'840', 1, 90)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (346, N'обойти все части города, разделенные рекой и соединенные мостами так, чтобы побывать в каждой части города ровно по 1 раз', 0, 91)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (347, N'обойти все части города, разделенные рекой и соединенные мостами так, чтобы пройти по каждому мосту ровно 1 раз, и вернуться в исходную точку путешествия ', 1, 91)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (348, N'обойти все части города, разделенные рекой и соединенные мостами так, чтобы пройти по каждому мосту ровно 1 раз ', 0, 91)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (349, N'части города обозначают вершинами, мосты - ребрами графа ', 1, 92)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (350, N'части города изображают ребрами графа, острова - вершинами графа ', 0, 92)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (351, N'мосты изображают вершинами графа, части города - ребрами ', 0, 92)
SET IDENTITY_INSERT [dbo].[Answer] OFF
GO
SET IDENTITY_INSERT [dbo].[Chapter] ON 

INSERT [dbo].[Chapter] ([Id], [Title], [Description], [IndexNumber]) VALUES (5, N'Алгебра логики', N'Функции алгебры логики, их представление таблицами истинности и формулами. Существенность переменных. Тождества, эквивалентные преобразования формул. Дизъюнктивные и конъюнктивные нормальные формы (ДНФ и КНФ). Полиномы Жегалкина. Полнота в алгебре логики. Замкнутые классы. Предполные классы.', 1)
INSERT [dbo].[Chapter] ([Id], [Title], [Description], [IndexNumber]) VALUES (6, N'Графы', N'Графы, их простейшие свойства. Связность. Деревья, остовные деревья. Планарность графов. Раскраски графов.', 2)
INSERT [dbo].[Chapter] ([Id], [Title], [Description], [IndexNumber]) VALUES (7, N'Коды', N'Кодирование. Алфавитные коды, их свойства. Однозначность (разделимость) алфавитных кодов. Оптимальность алфавитных кодов. Коды, обнаруживающие и исправляющие ошибки. Коды Хэмминга. Линейные коды.', 3)
INSERT [dbo].[Chapter] ([Id], [Title], [Description], [IndexNumber]) VALUES (8, N'Конечные автоматы.', N'Конечные автоматы-преобразователи и конечно-автоматные функции. Представления конечных автоматов и конечно-автоматных функций. Упрощение конечных автоматов.', 4)
INSERT [dbo].[Chapter] ([Id], [Title], [Description], [IndexNumber]) VALUES (9, N'Сложность.', N'Схемы из функциональных элементов (СФЭ), представление функций алгебры логики ими. Сумматор, оценка его сложности в СФЭ. Вычитатель, оценка его сложности в СФЭ. Умножитель, оценка его сложности в СФЭ.', 5)
INSERT [dbo].[Chapter] ([Id], [Title], [Description], [IndexNumber]) VALUES (10, N'Многозначные логики.', N'Функции многозначной логики, их представление нормальными формами и полиномами.', 6)
INSERT [dbo].[Chapter] ([Id], [Title], [Description], [IndexNumber]) VALUES (11, N'Литература', N'источники', 7)
INSERT [dbo].[Chapter] ([Id], [Title], [Description], [IndexNumber]) VALUES (12, N'Экзамен', N'экзамен', 8)
SET IDENTITY_INSERT [dbo].[Chapter] OFF
GO
SET IDENTITY_INSERT [dbo].[ControlPoint] ON 

INSERT [dbo].[ControlPoint] ([Id], [TopicId], [TaskTitle], [AnswerTitle], [IndexNumber], [TaskLink], [AnswerLink]) VALUES (29, 25, N'гл. 1. № 1.17(1,2, 3), 1.18(4), 1.19(1,2,3,4), 1.20(4,6,7,9) (решить разбором случаев), 1.28(1,2,3), 1.31(1,2,3), 1.33(1,2,3,4), 1.34(5,6), 1.35.', N'Загрузить ответ в PDF', 1, NULL, NULL)
INSERT [dbo].[ControlPoint] ([Id], [TopicId], [TaskTitle], [AnswerTitle], [IndexNumber], [TaskLink], [AnswerLink]) VALUES (30, 27, N'гл. 1. № 2.3(1,3,4,5), 2.12(1,2), 2.18(1,7), 2.4(3,4,5,6); гл. 9 № 2.1(1,2), 2.3(1,3,5,6).', N'Загрузить ответ в PDF', 1, NULL, NULL)
INSERT [dbo].[ControlPoint] ([Id], [TopicId], [TaskTitle], [AnswerTitle], [IndexNumber], [TaskLink], [AnswerLink]) VALUES (31, 28, N'гл. 1. № 2.22(5,6), 2.23(3,4,5,6,7,8), 2.27(1,2), 2.28, 2.29; гл. 2 № 1.5(1,2), 1.9(1,2,3,5,6,7,8,9), 1.6(1,2,3), 1.11, 3.1(4,6,7,8), 3.2(6,9,10,11), 3.3(4,5,6,7), 3.6, 3.7, 4.1(1,3), 4.2(1)..', N'Загрузить ответ в PDF', 1, NULL, NULL)
INSERT [dbo].[ControlPoint] ([Id], [TopicId], [TaskTitle], [AnswerTitle], [IndexNumber], [TaskLink], [AnswerLink]) VALUES (32, 30, N'гл. 2. № 2.1(1, 3), 2.2(3,5,7,8), 2.3(5,7), 2.7, 2.8(1,2,4), 4.3(2,3,4,5,6,7,10,11,17,18), 5.1(2,4,5,6), 5.2(7,8), 5.4(6,7), 5.5(4,5,8), 5.6(1), 5.21(1,2,3,4), 5.35.', N'Загрузить ответ в PDF', 1, NULL, NULL)
INSERT [dbo].[ControlPoint] ([Id], [TopicId], [TaskTitle], [AnswerTitle], [IndexNumber], [TaskLink], [AnswerLink]) VALUES (33, 31, N'гл. 2. № 6.1(2,3,4,5), 6.2(3,5), 6.3(1,2,5,6), 6.11, 6.12, 6.13, 6.15, 6.16, 6.4(2,4), 6.5(2,4), 6.8(3,4,7,8), 6.10(1,2,4).', N'Загрузить ответ в PDF', 1, NULL, NULL)
INSERT [dbo].[ControlPoint] ([Id], [TopicId], [TaskTitle], [AnswerTitle], [IndexNumber], [TaskLink], [AnswerLink]) VALUES (34, 32, N'гл. 6. № 1.34(рис. 6.1,6.2,6.3,6.4), 1.3, 1.5(1,2.3), 1.21(1,2,3,4), 1.10, 1.12, 1.13, 1.22, 1.26, 1.29(1,2,3,4), 1.27, 3.1(рис. 6.12а,б,в,г), 3.2(1,2,3,4), 3.10(1).', N'Загрузить ответ в PDF', 1, NULL, NULL)
INSERT [dbo].[ControlPoint] ([Id], [TopicId], [TaskTitle], [AnswerTitle], [IndexNumber], [TaskLink], [AnswerLink]) VALUES (35, 36, N'гл. 6. № 1.36(1,3), 2.1(рис. 6.5а,6.6в), 2.2, 2.8, 2.13, 2.17(1), 2.18(рис. 6.1а,6.5а,6.6в), 1.54, 1.60.', N'Загрузить ответ в PDF', 1, NULL, NULL)
INSERT [dbo].[ControlPoint] ([Id], [TopicId], [TaskTitle], [AnswerTitle], [IndexNumber], [TaskLink], [AnswerLink]) VALUES (36, 35, N'гл. 7. № 1.3(1), 1.2(1,3,5,6), 1.7(3,5), 1.6(1,3,5), 1.8, 2.1(1,3,5), 2.10(1,3).', N'Загрузить ответ в PDF', 1, NULL, NULL)
INSERT [dbo].[ControlPoint] ([Id], [TopicId], [TaskTitle], [AnswerTitle], [IndexNumber], [TaskLink], [AnswerLink]) VALUES (37, 37, N'гл. 7. № 3.18(1,3), 3.19(1,3), 3.20(1), 3.21(1,3,5), 3.22(1,5,8), 4.1, 4.9, 4.7(1в,г).', N'Загрузить ответ в PDF', 1, NULL, NULL)
INSERT [dbo].[ControlPoint] ([Id], [TopicId], [TaskTitle], [AnswerTitle], [IndexNumber], [TaskLink], [AnswerLink]) VALUES (38, 40, N'гл. 7. № 3.18(1,3), 3.19(1,3), 3.20(1), 3.21(1,3,5), 3.22(1,5,8), 4.1, 4.9, 4.7(1в,г).', N'Загрузить ответ в PDF', 1, NULL, NULL)
INSERT [dbo].[ControlPoint] ([Id], [TopicId], [TaskTitle], [AnswerTitle], [IndexNumber], [TaskLink], [AnswerLink]) VALUES (40, 44, N'гл. 4. № 2.1(1,3,4,14,16,24,27), в диаграммах Мура проверить отличимость состояний по теореме Мура, при необходимости диаграммы упростить, отождествив неотличимые состояния.', N'Загрузить ответ в PDF', 1, NULL, NULL)
INSERT [dbo].[ControlPoint] ([Id], [TopicId], [TaskTitle], [AnswerTitle], [IndexNumber], [TaskLink], [AnswerLink]) VALUES (41, 43, N'гл. 4. № 2.13(1,3,7), 2.14(2,3), 2.4(1,3) (построить приведенную диаграмму Мура), 2.2(3,4).', N'Загрузить ответ в PDF', 1, NULL, NULL)
INSERT [dbo].[ControlPoint] ([Id], [TopicId], [TaskTitle], [AnswerTitle], [IndexNumber], [TaskLink], [AnswerLink]) VALUES (42, 46, N'гл. 3. № 1.11(2,5,6,7,10,11), 2.7(1,2,3,6), 2.12(1,2,3,5)', N'Загрузить ответ в PDF', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ControlPoint] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (33, N'Некоторая функция алгебры логики зависит от 64 аргументов. Областью определения данной функции алгебры логики является множество с количеством элементов:', NULL, NULL, 25)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (34, N'Некоторая функция алгебры логики зависит от 64 аргументов. Количество элементов в множестве значений данной функции алгебры логики равно:', NULL, NULL, 25)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (35, N'Функция алгебры логики - это:', NULL, NULL, 25)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (36, N'Какие из перечисленных утверждений верны:', NULL, NULL, 25)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (37, N'Функция алгебры логики задана на двух аргументах. Количество элементов в множестве значений данной функции алгебры логики равно:', NULL, NULL, 25)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (38, N'Некоторая функция алгебры логики зависит от одного аргумента. Областью определения данной функции алгебры логики является множество с количеством элементов:', NULL, NULL, 25)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (39, N'Что из перечисленного ниже не вводится как функция алгебры логики:', NULL, NULL, 25)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (40, N'Какая из функций алгебры логики принимают значение истина при значениях аргументов x = ложь и y = ложь', NULL, NULL, 25)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (41, N'Какие из функций алгебры логики принимают значение истина при значениях аргументов x = истина и y = ложь', NULL, NULL, 25)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (42, N'Какая из функций алгебры логики принимают значение истина при значениях аргументов x = истина и y = истина', NULL, NULL, 25)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (43, N'Как связаны между собой элементарные функции алгебры логики:', NULL, NULL, 25)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (44, N'Как связаны между собой элементарные функции алгебры логики:', NULL, NULL, 25)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (45, N'Разложение функции алгебры логики в дизъюнктивную форму по одной переменной:', NULL, NULL, 27)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (46, N'Что является разложением функции алгебры логики x1 + x2 в дизъюнктивную форму по переменной x1', NULL, NULL, 27)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (47, N'Что является разложением функции алгебры логики x1 & x2 в дизъюнктивную форму по переменной x1', NULL, NULL, 27)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (48, N'Что является разложением функции алгебры логики x1 ↓ x2 в дизъюнктивную форму по переменной x1', NULL, NULL, 27)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (49, N'Что является разложением функции алгебры логики x1 | x2 в дизъюнктивную форму по переменной x1', NULL, NULL, 27)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (50, N'Какие из формул равносильны формуле', NULL, NULL, 27)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (51, N'Совершенная дизъюнктивная нормальная форма функции алгебры логики:', NULL, NULL, 27)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (52, N'Совершенная дизъюнктивная нормальная форма функции алгебры логики:', NULL, NULL, 27)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (53, N'Совершенная конъюнктивная нормальная форма функции алгебры логики:', NULL, NULL, 27)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (54, N'Совершенная конъюнктивная нормальная форма функции алгебры логики:', NULL, NULL, 27)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (55, N'Cовершенная конъюнктивная нормальная форма для импликации x → y имеет вид:', NULL, NULL, 27)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (56, N'Cовершенная дизъюнктивная нормальная форма для импликации x → y имеет вид:', NULL, NULL, 27)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (57, N'Если операциями суперпозиции и замены переменных из функций данной системы функций алгебры логики можно получить только функции, ей принадлежащие, и никаких других функций, то такая система функций:', NULL, NULL, 30)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (58, N'Если операциями суперпозиции и замены переменных из функций данной системы функций алгебры логики можно получить произвольную функцию алгебры логики, то такая система функций:', NULL, NULL, 30)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (59, N'Образ ямы, из которой нельзя вылезти с помощью операции суперпозиции и замены переменных, на поле всех функций алгебры логики от n переменных иллюстрирует понятие:', NULL, NULL, 30)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (60, N'Получить функцию алгебры логики от двух переменных, применяя операции суперпозиции и замены переменной над классом функций алгебры логики одной переменной:', NULL, NULL, 30)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (61, N'К классу функций алгебры логики, сохраняющих ноль, относятся:', NULL, NULL, 30)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (62, N'К классу функций алгебры логики, сохраняющих ноль, относится:', NULL, NULL, 30)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (63, N'Класс функций заданный как T0 = {f(x1,x2, ... , xn) | f{0,...0}} = 0 является', NULL, NULL, 28)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (64, N'К классу функций алгебры логики, сохраняющих единицу, относятся:', NULL, NULL, 28)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (65, N'Любая функция алгебры логики представима единственным образом в виде:', NULL, NULL, 29)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (66, N'Функция алгебры логики, зависящая от math переменных, представима в виде полинома Жегалкина:', NULL, NULL, 29)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (67, N'Укажите, какие функции алгебры логики могут быть представлены в виде полинома Жегалкина:', NULL, NULL, 29)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (68, N'Сколько коэффициентов в многочлене Жегалкина от трех переменных:', NULL, NULL, 29)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (69, N'Укажите функцию, представление которой в виде полинома Жегалкина содержит конъюнкцию с двумя или более переменными:', NULL, NULL, 29)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (70, N'Укажите полную систему функций:', NULL, NULL, 30)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (71, N'Укажите полную систему функций:', NULL, NULL, 30)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (72, N'Многочлен Жегалкина для функции x V y имеет вид:', NULL, NULL, 29)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (73, N'Многочлен Жегалкина для функции x → y имеет вид:', NULL, NULL, 29)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (74, N'Многочлен Жегалкина для функции x | y имеет вид:', NULL, NULL, 29)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (75, N'Многочлен Жегалкина для функции x ↓ y имеет вид:', NULL, NULL, 29)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (76, N'Основная лемма критерия полноты обосновывает возможность, при определенных условиях, получения функций:', NULL, NULL, 30)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (77, N'Укажите необходимое свойство системы функций, из которых можно получить набор функций {0,1, ¬x}', NULL, NULL, 30)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (78, N'Укажите необходимое свойство системы функций, из которых можно получить набор функций {0,1, ¬x}', NULL, NULL, 30)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (79, N'Укажите необходимое свойство системы функций, из которых можно получить набор функций {0,1, ¬x}', NULL, NULL, 30)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (80, N'Появление теории графов как математической дисциплины связывают с датой этого события', NULL, NULL, 32)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (81, N'Укажите название известной головоломки: "Можно ли произвольную географическую карту раскрасить в 4 цвета так, чтобы ни одни 2 государства, граница которых имеется и отлична от точки, не были окрашены в один и тот же цвет".', NULL, NULL, 32)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (82, N'Укажите приложения теории графов:', NULL, NULL, 32)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (83, N'Что соответствует вершинам и ребрам графа, который описывает "Задачу о четырех красках":', NULL, NULL, 32)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (84, N'Для графов с каким количеством вершин удобно их графическое представление в виде точек и соединяющих их линий:', NULL, NULL, 32)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (85, N'Какая задача в терминах теории графов решалась в связи с проблемой неплатежей после начала перестройки, при наличии списка должников:', NULL, NULL, 32)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (86, N'Укажите множество, с которым у множества деревьев с n вершинами имеется взаимнооднозначное соответствие:', NULL, NULL, 33)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (87, N'Какой способ наиболее эффективен при подсчете количества деревьев:', NULL, NULL, 33)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (88, N'Сколько существует деревьев на 3 вершинах с 2 концевыми вершинами:', NULL, NULL, 33)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (89, N'Сколько существует деревьев на 4 вершинах с 2 концевыми вершинами:', NULL, NULL, 33)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (90, N'Сколько существует деревьев на 6 вершинах с 4 концевыми вершинами:', NULL, NULL, 33)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (91, N'Какова первоначальная формулировка задачи о кенигсбергских мостах:', NULL, NULL, 33)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (92, N'В формулировке задачи о кенигсбергских мостах в терминах теории графов:', NULL, NULL, 33)
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Title], [Grade]) VALUES (1, N'студент', 0)
INSERT [dbo].[Role] ([Id], [Title], [Grade]) VALUES (2, N'преподаватель', 1)
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentGroup] ON 

INSERT [dbo].[StudentGroup] ([Id], [Title]) VALUES (1, N'7293-12')
INSERT [dbo].[StudentGroup] ([Id], [Title]) VALUES (2, N'197')
INSERT [dbo].[StudentGroup] ([Id], [Title]) VALUES (3, N'205')
INSERT [dbo].[StudentGroup] ([Id], [Title]) VALUES (4, N'207')
INSERT [dbo].[StudentGroup] ([Id], [Title]) VALUES (5, N'155')
SET IDENTITY_INSERT [dbo].[StudentGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[Test] ON 

INSERT [dbo].[Test] ([Id], [TopicId], [Title], [Description], [IndexNumber]) VALUES (15, 25, N'Основы алгебры логики', NULL, 1)
INSERT [dbo].[Test] ([Id], [TopicId], [Title], [Description], [IndexNumber]) VALUES (16, 27, N'ДНФ и КНФ', NULL, 1)
INSERT [dbo].[Test] ([Id], [TopicId], [Title], [Description], [IndexNumber]) VALUES (17, 28, N'Сокращенная ДНФ', NULL, 1)
INSERT [dbo].[Test] ([Id], [TopicId], [Title], [Description], [IndexNumber]) VALUES (18, 29, N'Полиномы Жегалкина', NULL, 1)
INSERT [dbo].[Test] ([Id], [TopicId], [Title], [Description], [IndexNumber]) VALUES (19, 30, N'Полные системы', NULL, 1)
INSERT [dbo].[Test] ([Id], [TopicId], [Title], [Description], [IndexNumber]) VALUES (20, 32, N'Графы', NULL, 1)
INSERT [dbo].[Test] ([Id], [TopicId], [Title], [Description], [IndexNumber]) VALUES (21, 33, N'Деревья', NULL, 1)
SET IDENTITY_INSERT [dbo].[Test] OFF
GO
SET IDENTITY_INSERT [dbo].[TestProgress] ON 

INSERT [dbo].[TestProgress] ([Id], [UserName], [AnswerId], [QuestionId], [TestId]) VALUES (10, N'user', 130, 33, 15)
INSERT [dbo].[TestProgress] ([Id], [UserName], [AnswerId], [QuestionId], [TestId]) VALUES (11, N'user', 131, 34, 15)
INSERT [dbo].[TestProgress] ([Id], [UserName], [AnswerId], [QuestionId], [TestId]) VALUES (12, N'user', 135, 35, 15)
INSERT [dbo].[TestProgress] ([Id], [UserName], [AnswerId], [QuestionId], [TestId]) VALUES (13, N'user', 142, 36, 15)
INSERT [dbo].[TestProgress] ([Id], [UserName], [AnswerId], [QuestionId], [TestId]) VALUES (14, N'user', 144, 37, 15)
INSERT [dbo].[TestProgress] ([Id], [UserName], [AnswerId], [QuestionId], [TestId]) VALUES (15, N'user', 148, 38, 15)
INSERT [dbo].[TestProgress] ([Id], [UserName], [AnswerId], [QuestionId], [TestId]) VALUES (16, N'user', 153, 39, 15)
INSERT [dbo].[TestProgress] ([Id], [UserName], [AnswerId], [QuestionId], [TestId]) VALUES (17, N'user', 158, 40, 15)
INSERT [dbo].[TestProgress] ([Id], [UserName], [AnswerId], [QuestionId], [TestId]) VALUES (18, N'user', 162, 41, 15)
INSERT [dbo].[TestProgress] ([Id], [UserName], [AnswerId], [QuestionId], [TestId]) VALUES (19, N'user', 163, 42, 15)
INSERT [dbo].[TestProgress] ([Id], [UserName], [AnswerId], [QuestionId], [TestId]) VALUES (20, N'user', 169, 43, 15)
INSERT [dbo].[TestProgress] ([Id], [UserName], [AnswerId], [QuestionId], [TestId]) VALUES (21, N'user', 174, 44, 15)
SET IDENTITY_INSERT [dbo].[TestProgress] OFF
GO
SET IDENTITY_INSERT [dbo].[TestQuestion] ON 

INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (49, 33, 15, 1)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (50, 34, 15, 2)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (51, 35, 15, 3)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (52, 36, 15, 4)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (53, 37, 15, 5)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (54, 38, 15, 6)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (55, 39, 15, 7)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (56, 40, 15, 8)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (57, 41, 15, 9)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (58, 42, 15, 10)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (59, 43, 15, 11)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (60, 44, 15, 12)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (61, 45, 16, 1)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (62, 46, 16, 2)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (63, 47, 16, 3)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (64, 48, 16, 4)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (65, 49, 16, 5)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (66, 50, 16, 6)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (67, 51, 16, 7)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (68, 52, 16, 8)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (69, 53, 16, 9)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (70, 54, 16, 10)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (71, 55, 16, 11)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (72, 56, 16, 12)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (73, 63, 17, 1)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (74, 64, 17, 2)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (75, 65, 18, 1)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (76, 66, 18, 2)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (77, 67, 18, 3)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (78, 68, 18, 4)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (79, 69, 18, 5)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (80, 72, 18, 6)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (81, 73, 18, 7)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (82, 74, 18, 8)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (83, 75, 18, 9)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (84, 57, 19, 1)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (85, 58, 19, 2)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (86, 59, 19, 3)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (87, 60, 19, 4)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (88, 61, 19, 5)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (89, 62, 19, 6)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (90, 70, 19, 7)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (91, 71, 19, 8)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (92, 76, 19, 9)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (93, 77, 19, 10)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (94, 78, 19, 11)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (95, 79, 19, 12)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (96, 80, 20, 1)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (97, 81, 20, 2)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (98, 82, 20, 3)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (99, 83, 20, 4)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (100, 84, 20, 5)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (101, 85, 20, 6)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (102, 86, 21, 1)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (103, 87, 21, 2)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (104, 88, 21, 3)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (105, 89, 21, 4)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (106, 90, 21, 5)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (107, 91, 21, 6)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (108, 92, 21, 7)
SET IDENTITY_INSERT [dbo].[TestQuestion] OFF
GO
SET IDENTITY_INSERT [dbo].[Topic] ON 

INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (25, N'Функции алгебры логики. Таблицы истинности. Существенные и несущественные переменные. Формулы. Тождества.', N' Функции алгебры логики, их представление таблицами истинности и формулами. Существенность переменных. Тождества, эквивалентные преобразования формул.', 2, 5, 1, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (26, N'Гаврилов Г.П., Сапоженко А.А. Задачи и упражнения по дискретной математике. М.: Физматлит, 2004.', N'Задачи', 2, 11, 22, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (27, N'Разложение функций по переменным. Дизъюнктивные и конъюнктивные нормальные формы (ДНФ и КНФ). Совершенная ДНФ и совершенная КНФ.', N'В теме разбираются разложение функций по переменным, дизъюнктивные и конъюнктивные нормальные формы (ДНФ и КНФ)', 2, 5, 2, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (28, N'Сокращенная ДНФ. Построение сокращенной ДНФ по КНФ.', N'В теме рассматриваются сокращенная ДНФ, построение сокращенной ДНФ по КНФ.', 2, 5, 3, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (29, N'Полиномы Жегалкина. Теорема Жегалкина. Построение полиномов Жегалкина.', N'Тема посвящена таким понятиям, как полиномы Жегалкина, теорема Жегалкина.', 2, 5, 4, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (30, N'Полные системы, полнота некоторых систем. Замыкание множества. Замкнутые классы. Замкнутость классов T_0, T_1, L, S, M.', N'В теме разбираются такие понятия, как полные системы, полнота некоторых систем, замыкание множества, замкнутые классы, замкнутость классов T_0, T_1, L, S, M.', 2, 5, 5, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (31, N'Леммы о несамодвойственной, немонотонной и нелинейной функциях. Полнота. Теорема Поста о полноте. Базисы в P_2. Теорема о числе функций в базисе P_2. Предполные классы. Теорема о предполных классах в P_2.', N'Леммы о несамодвойственной, немонотонной и нелинейной функциях. Полнота. Теорема Поста о полноте. Базисы в P_2. Теорема о числе функций в базисе P_2. Предполные классы. Теорема о предполных классах в P_2.', 2, 5, 6, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (32, N'Графы. Простейшие свойства графов. Пути и цепи. Циклы и связность. Удаление и добавление ребер в связных графах. Соотношение между числом вершин, числом ребер и числом компонент связности в графе. Орграфы.', N'Графы. Простейшие свойства графов. Пути и цепи. Циклы и связность. Удаление и добавление ребер в связных графах. Соотношение между числом вершин, числом ребер и числом компонент связности в графе. Орграфы.', 2, 6, 7, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (33, N'Деревья. Теорема о равносильных определениях дерева. Корневые деревья. Упорядоченные корневые деревья. Оценка числа деревьев с q ребрами.', N'Деревья. Теорема о равносильных определениях дерева. Корневые деревья. Упорядоченные корневые деревья. Оценка числа деревьев с q ребрами.', 2, 6, 8, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (34, N'Остовные деревья. Кратчайшие остовные деревья. Алгоритм построения кратчайшего остовного дерева.', N'Остовные деревья. Кратчайшие остовные деревья. Алгоритм построения кратчайшего остовного дерева.', 2, 6, 9, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (35, N'Геометрическое представление графов. Планарные графы. Формула Эйлера для планарных графов. Критерий планарности Понтрягина-Куратовского.', N'Геометрическое представление графов. Планарные графы. Формула Эйлера для планарных графов. Критерий планарности Понтрягина-Куратовского.', 2, 6, 10, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (36, N'Раскраски графов. Раскраски графов в два цвета. Раскраски планарных графов.', N'Раскраски графов. Раскраски графов в два цвета. Раскраски планарных графов.', 2, 6, 11, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (37, N'Кодирование. Алфавитные коды. Теорема об однозначности равномерного кода. Теорема об однозначности префиксного кода. Алгоритм распознавания однозначности алфавитного кода. Теорема Маркова.', N'Кодирование. Алфавитные коды. Теорема об однозначности равномерного кода. Теорема об однозначности префиксного кода. Алгоритм распознавания однозначности алфавитного кода. Теорема Маркова.', 2, 7, 12, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (38, N'Алфавитные коды. Неравенство Макмиллана. Теорема о существовании префиксного кода с заданными длинами кодовых слов. Дерево префиксного кода.', N'Алфавитные коды. Неравенство Макмиллана. Теорема о существовании префиксного кода с заданными длинами кодовых слов. Дерево префиксного кода.', 2, 7, 13, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (39, N'Алфавитные коды. Оптимальные коды (коды с минимальной избыточностью). Свойства оптимальных кодов. Теорема редукции. Метод Хаффмана построения оптимального кода.', N'Алфавитные коды. Оптимальные коды (коды с минимальной избыточностью). Свойства оптимальных кодов. Теорема редукции. Метод Хаффмана построения оптимального кода.', 2, 7, 14, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (40, N'Коды, обнаруживающие и исправляющие ошибки, их свойства. Мощность кода, исправляющего ошибки. Линейные коды и их свойства.', N'Коды, обнаруживающие и исправляющие ошибки, их свойства. Мощность кода, исправляющего ошибки. Линейные коды и их свойства.', 2, 7, 15, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (41, N' Коды, исправляющие одну ошибку. Коды Хэмминга и их свойства. Мощность кода, исправляющего одну ошибку.', N' Коды, исправляющие одну ошибку. Коды Хэмминга и их свойства. Мощность кода, исправляющего одну ошибку.', 2, 7, 16, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (42, N'Конечные автоматы. Способы их представления. Схемы из функциональных элементов с задержками (СФЭЗ) и представление конечных автоматов ими.', N'Конечные автоматы. Способы их представления. Схемы из функциональных элементов с задержками (СФЭЗ) и представление конечных автоматов ими.', 2, 8, 17, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (43, N'Конечные автоматы. Отличимость состояний конечного автомата. Оценка длины слова, отличающего два отличимых состояния конечного автомата. Упрощение автоматов.', N'Конечные автоматы. Отличимость состояний конечного автомата. Оценка длины слова, отличающего два отличимых состояния конечного автомата. Упрощение автоматов.', 2, 8, 18, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (44, N'Схемы из функциональных элементов (СФЭ). Схемы для сложения и вычитания, их сложность.', N'Схемы из функциональных элементов (СФЭ). Схемы для сложения и вычитания, их сложность.', 2, 9, 19, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (45, N'Схема для умножения. Сложность схемы для умножения по методу Карацубы.', N'Схема для умножения. Сложность схемы для умножения по методу Карацубы.', 2, 9, 20, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (46, N'Функции k-значной логики. Таблицы значений. Представление функций k-значной логики в 1-й и 2-й формах. Представление функций k-значной логики полиномами по модулю k.', N'Функции k-значной логики. Таблицы значений. Представление функций k-значной логики в 1-й и 2-й формах. Представление функций k-значной логики полиномами по модулю k.', 2, 10, 21, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (47, N'Экзамен', N'Экзамен планируется устный. В билете 2 вопроса (один из части А и один из части В) и задача.', 2, 12, 23, 2)
SET IDENTITY_INSERT [dbo].[Topic] OFF
GO
SET IDENTITY_INSERT [dbo].[TopicContent] ON 

INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (65, 25, N'Лекция 1', N'Lection_1.pdf', 1)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (66, 25, N'Видеолекция 1', N'dm1-1-21-02-10-l1.mp4', 2)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (68, 27, N'Лекция 2', N'Lection_2.pdf', 1)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (69, 27, N'Видеолекция 2', N'dm1-1-21-02-10-l2-1.mp4', 2)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (70, 28, N'Лекция 3', N'Lection_3.pdf', 1)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (71, 29, N'Лекция 4', N'Lection_4.pdf', 1)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (72, 30, N'Лекция 5', N'Lection_5.pdf', 1)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (73, 31, N'Лекция 6. Часть 1', N'Lection_6_1.pdf', 1)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (74, 31, N'Лекция 6. Часть 2', N'Lection_6_2.pdf', 2)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (75, 32, N'Лекция 7', N'Lection_7.pdf', 1)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (76, 33, N'Лекция 8', N'Lection_8.pdf', 1)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (77, 34, N'Лекция 9', N'Lection_9.pdf', 1)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (78, 35, N'Лекция 10', N'Lection_10.pdf', 1)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (79, 36, N'Лекция 11', N'Lection_11.pdf', 1)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (80, 37, N'Лекция 12', N'Lection_12.pdf', 1)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (81, 38, N'Лекция 13', N'Lection_13.pdf', 1)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (82, 39, N'Лекция 14', N'Lection_14.pdf', 1)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (83, 40, N'Лекция 15', N'Lection_15.pdf', 1)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (84, 41, N'Лекция 16', N'Lection_16.pdf', 1)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (85, 42, N'Лекция 17', N'Lection_17.pdf', 1)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (86, 43, N'Лекция 18', N'Lection_18.pdf', 1)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (87, 44, N'Лекция 19', N'Lection_19.pdf', 1)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (88, 45, N'Лекция 20', N'Lection_20.pdf', 1)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (89, 46, N'Лекция 30', N'Lection_21.pdf', 1)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (90, 47, N'Часть А.docx', N'Часть А.docx', 1)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (91, 47, N'Часть B.docx', N'Часть B.docx', 2)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (92, 47, N'Задачи к экзамену.docx', N'Задачи к экзамену.docx', 3)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (93, 28, N'Видеолекция 3', N'Видео_лекция_3.mp4', 2)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (115, 26, N'Задачник', N'Gavrilov_Zadachi_uprazhnenija_diskretnoj_matematike.pdf', 1)
SET IDENTITY_INSERT [dbo].[TopicContent] OFF
GO
SET IDENTITY_INSERT [dbo].[TopicType] ON 

INSERT [dbo].[TopicType] ([Id], [Title]) VALUES (1, N'Лекция')
INSERT [dbo].[TopicType] ([Id], [Title]) VALUES (2, N'Экзамен')
INSERT [dbo].[TopicType] ([Id], [Title]) VALUES (3, N'Семинар')
SET IDENTITY_INSERT [dbo].[TopicType] OFF
GO
INSERT [dbo].[User] ([UserName], [Password], [RoleId], [Surname], [Name], [Patronymic], [DateOfRegs], [StudentGroupId]) VALUES (N'adelina', N'1', 1, N'Грошева', N'Аделина', N'Айратовна', CAST(N'2023-05-06' AS Date), 2)
INSERT [dbo].[User] ([UserName], [Password], [RoleId], [Surname], [Name], [Patronymic], [DateOfRegs], [StudentGroupId]) VALUES (N'admin', N'1', 2, N'Кузнецов', N'Дмитрий', N'Борисович', CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[User] ([UserName], [Password], [RoleId], [Surname], [Name], [Patronymic], [DateOfRegs], [StudentGroupId]) VALUES (N'alex3069', N'1', 1, N'Конов', N'Александр', N'Николаевич', CAST(N'2023-05-05' AS Date), 2)
INSERT [dbo].[User] ([UserName], [Password], [RoleId], [Surname], [Name], [Patronymic], [DateOfRegs], [StudentGroupId]) VALUES (N'amir', N'1', 1, N'Адиятуллин', N'Сабир', N'Расимович', CAST(N'2023-05-06' AS Date), 2)
INSERT [dbo].[User] ([UserName], [Password], [RoleId], [Surname], [Name], [Patronymic], [DateOfRegs], [StudentGroupId]) VALUES (N'artem', N'1', 1, N'Федосеев', N'Артём', N'Альбертович', CAST(N'2023-05-06' AS Date), 1)
INSERT [dbo].[User] ([UserName], [Password], [RoleId], [Surname], [Name], [Patronymic], [DateOfRegs], [StudentGroupId]) VALUES (N'egor', N'1', 1, N'Голубцов', N'Егор', N'Владимирович', CAST(N'2023-05-06' AS Date), 2)
INSERT [dbo].[User] ([UserName], [Password], [RoleId], [Surname], [Name], [Patronymic], [DateOfRegs], [StudentGroupId]) VALUES (N'kamil', N'1', 1, N'Зарифуллин', N'Камиль', N'Айратович', CAST(N'2023-06-21' AS Date), 2)
INSERT [dbo].[User] ([UserName], [Password], [RoleId], [Surname], [Name], [Patronymic], [DateOfRegs], [StudentGroupId]) VALUES (N'lyudmila', N'1', 1, N'Белозёрова', N'Людмила', N'Владиславовна', CAST(N'2023-06-20' AS Date), 1)
INSERT [dbo].[User] ([UserName], [Password], [RoleId], [Surname], [Name], [Patronymic], [DateOfRegs], [StudentGroupId]) VALUES (N'robert', N'1', 1, N'Гузаеров', N'Роберт', N'Альфредович', CAST(N'2023-05-06' AS Date), 2)
INSERT [dbo].[User] ([UserName], [Password], [RoleId], [Surname], [Name], [Patronymic], [DateOfRegs], [StudentGroupId]) VALUES (N'roma', N'1', 1, N'Захаров', N'Роман', N'Романович', CAST(N'2023-06-14' AS Date), 2)
INSERT [dbo].[User] ([UserName], [Password], [RoleId], [Surname], [Name], [Patronymic], [DateOfRegs], [StudentGroupId]) VALUES (N'tanya', N'1', 1, N'Оленникова', N'Татьяна', N'Романовна', CAST(N'2023-06-14' AS Date), 1)
INSERT [dbo].[User] ([UserName], [Password], [RoleId], [Surname], [Name], [Patronymic], [DateOfRegs], [StudentGroupId]) VALUES (N'user', N'1', 1, N'Архипов', N'Артём', N'Геннадиевич', CAST(N'2023-05-06' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[UserTestResults] ON 

INSERT [dbo].[UserTestResults] ([Id], [TestId], [Result], [UserName]) VALUES (4, 15, 9, N'user')
SET IDENTITY_INSERT [dbo].[UserTestResults] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTopicContent] ON 

INSERT [dbo].[UserTopicContent] ([Id], [UserName], [TopicContentId], [IsStudied]) VALUES (34, N'user', 65, 1)
INSERT [dbo].[UserTopicContent] ([Id], [UserName], [TopicContentId], [IsStudied]) VALUES (35, N'user', 66, 1)
INSERT [dbo].[UserTopicContent] ([Id], [UserName], [TopicContentId], [IsStudied]) VALUES (36, N'user', 68, 1)
INSERT [dbo].[UserTopicContent] ([Id], [UserName], [TopicContentId], [IsStudied]) VALUES (37, N'user', 69, 1)
INSERT [dbo].[UserTopicContent] ([Id], [UserName], [TopicContentId], [IsStudied]) VALUES (38, N'user', 70, 1)
INSERT [dbo].[UserTopicContent] ([Id], [UserName], [TopicContentId], [IsStudied]) VALUES (39, N'user', 115, 1)
SET IDENTITY_INSERT [dbo].[UserTopicContent] OFF
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([Id])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
ALTER TABLE [dbo].[ControlPoint]  WITH CHECK ADD  CONSTRAINT [FK_ControlPoint_Topic] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topic] ([Id])
GO
ALTER TABLE [dbo].[ControlPoint] CHECK CONSTRAINT [FK_ControlPoint_Topic]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Topic] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topic] ([Id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Topic]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [FK_Test_Topic] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topic] ([Id])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [FK_Test_Topic]
GO
ALTER TABLE [dbo].[TestProgress]  WITH CHECK ADD  CONSTRAINT [FK_TestProgress_Answer] FOREIGN KEY([AnswerId])
REFERENCES [dbo].[Answer] ([Id])
GO
ALTER TABLE [dbo].[TestProgress] CHECK CONSTRAINT [FK_TestProgress_Answer]
GO
ALTER TABLE [dbo].[TestProgress]  WITH CHECK ADD  CONSTRAINT [FK_TestProgress_Question] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([Id])
GO
ALTER TABLE [dbo].[TestProgress] CHECK CONSTRAINT [FK_TestProgress_Question]
GO
ALTER TABLE [dbo].[TestProgress]  WITH CHECK ADD  CONSTRAINT [FK_TestProgress_Test] FOREIGN KEY([TestId])
REFERENCES [dbo].[Test] ([Id])
GO
ALTER TABLE [dbo].[TestProgress] CHECK CONSTRAINT [FK_TestProgress_Test]
GO
ALTER TABLE [dbo].[TestProgress]  WITH CHECK ADD  CONSTRAINT [FK_TestProgress_User] FOREIGN KEY([UserName])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[TestProgress] CHECK CONSTRAINT [FK_TestProgress_User]
GO
ALTER TABLE [dbo].[TestQuestion]  WITH CHECK ADD  CONSTRAINT [FK_TestQuestion_Question] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([Id])
GO
ALTER TABLE [dbo].[TestQuestion] CHECK CONSTRAINT [FK_TestQuestion_Question]
GO
ALTER TABLE [dbo].[TestQuestion]  WITH CHECK ADD  CONSTRAINT [FK_TestQuestion_Test] FOREIGN KEY([TestId])
REFERENCES [dbo].[Test] ([Id])
GO
ALTER TABLE [dbo].[TestQuestion] CHECK CONSTRAINT [FK_TestQuestion_Test]
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [FK_Topic_Chapter] FOREIGN KEY([ChapterId])
REFERENCES [dbo].[Chapter] ([Id])
GO
ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [FK_Topic_Chapter]
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [FK_Topic_TopicType] FOREIGN KEY([TopicTypeId])
REFERENCES [dbo].[TopicType] ([Id])
GO
ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [FK_Topic_TopicType]
GO
ALTER TABLE [dbo].[TopicContent]  WITH CHECK ADD  CONSTRAINT [FK_TopicContent_Topic] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topic] ([Id])
GO
ALTER TABLE [dbo].[TopicContent] CHECK CONSTRAINT [FK_TopicContent_Topic]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_StudentGroup] FOREIGN KEY([StudentGroupId])
REFERENCES [dbo].[StudentGroup] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_StudentGroup]
GO
ALTER TABLE [dbo].[UserControlPoint]  WITH CHECK ADD  CONSTRAINT [FK_UserControlPoint_ControlPoint] FOREIGN KEY([ControlPointId])
REFERENCES [dbo].[ControlPoint] ([Id])
GO
ALTER TABLE [dbo].[UserControlPoint] CHECK CONSTRAINT [FK_UserControlPoint_ControlPoint]
GO
ALTER TABLE [dbo].[UserControlPoint]  WITH CHECK ADD  CONSTRAINT [FK_UserControlPoint_User] FOREIGN KEY([UserName])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[UserControlPoint] CHECK CONSTRAINT [FK_UserControlPoint_User]
GO
ALTER TABLE [dbo].[UserTestResults]  WITH CHECK ADD  CONSTRAINT [FK_TestResults_Test] FOREIGN KEY([TestId])
REFERENCES [dbo].[Test] ([Id])
GO
ALTER TABLE [dbo].[UserTestResults] CHECK CONSTRAINT [FK_TestResults_Test]
GO
ALTER TABLE [dbo].[UserTestResults]  WITH CHECK ADD  CONSTRAINT [FK_TestResults_User] FOREIGN KEY([UserName])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[UserTestResults] CHECK CONSTRAINT [FK_TestResults_User]
GO
ALTER TABLE [dbo].[UserTopicContent]  WITH CHECK ADD  CONSTRAINT [FK_CourseProgress_User] FOREIGN KEY([UserName])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[UserTopicContent] CHECK CONSTRAINT [FK_CourseProgress_User]
GO
ALTER TABLE [dbo].[UserTopicContent]  WITH CHECK ADD  CONSTRAINT [FK_UserTopicContent_TopicContent] FOREIGN KEY([TopicContentId])
REFERENCES [dbo].[TopicContent] ([Id])
GO
ALTER TABLE [dbo].[UserTopicContent] CHECK CONSTRAINT [FK_UserTopicContent_TopicContent]
GO
USE [master]
GO
ALTER DATABASE [DiscretMathBD] SET  READ_WRITE 
GO
