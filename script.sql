USE [master]
GO
/****** Object:  Database [DiscretMathBD]    Script Date: 12.06.2023 0:02:25 ******/
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
/****** Object:  Table [dbo].[Answer]    Script Date: 12.06.2023 0:02:25 ******/
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
/****** Object:  Table [dbo].[Chapter]    Script Date: 12.06.2023 0:02:25 ******/
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
/****** Object:  Table [dbo].[ControlPoint]    Script Date: 12.06.2023 0:02:25 ******/
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
/****** Object:  Table [dbo].[Question]    Script Date: 12.06.2023 0:02:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](1000) NOT NULL,
	[Image] [nvarchar](1000) NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12.06.2023 0:02:25 ******/
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
/****** Object:  Table [dbo].[StudentGroup]    Script Date: 12.06.2023 0:02:25 ******/
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
/****** Object:  Table [dbo].[Test]    Script Date: 12.06.2023 0:02:25 ******/
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
/****** Object:  Table [dbo].[TestProgress]    Script Date: 12.06.2023 0:02:25 ******/
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
/****** Object:  Table [dbo].[TestQuestion]    Script Date: 12.06.2023 0:02:25 ******/
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
/****** Object:  Table [dbo].[Topic]    Script Date: 12.06.2023 0:02:25 ******/
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
/****** Object:  Table [dbo].[TopicContent]    Script Date: 12.06.2023 0:02:25 ******/
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
/****** Object:  Table [dbo].[TopicType]    Script Date: 12.06.2023 0:02:25 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 12.06.2023 0:02:25 ******/
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
/****** Object:  Table [dbo].[UserControlPoint]    Script Date: 12.06.2023 0:02:25 ******/
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
/****** Object:  Table [dbo].[UserTestResults]    Script Date: 12.06.2023 0:02:25 ******/
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
/****** Object:  Table [dbo].[UserTopicContent]    Script Date: 12.06.2023 0:02:25 ******/
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

INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (44, N'{1,2,2,3,4,4,5,6} ', 0, 9)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (45, N'{1,2,3,4,5,6} ', 1, 9)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (46, N'{1,3} ', 0, 9)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (47, N'{1,2,3} ', 0, 9)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (48, N'{1,2,3,5,6} ', 0, 10)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (49, N'{1,2,4,5,6} ', 0, 10)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (50, N'{1,2,3,4,5,6,7} ', 1, 10)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (51, N'{1,2}', 0, 10)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (52, N'{3,5,7} ', 0, 11)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (53, N'Пустое множество', 0, 11)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (54, N'{1,2,3,4,5,6,7}', 1, 11)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (55, N'{2,4,5}', 0, 11)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (56, N'Да', 1, 12)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (57, N'Нет', 0, 12)
SET IDENTITY_INSERT [dbo].[Answer] OFF
GO
SET IDENTITY_INSERT [dbo].[Chapter] ON 

INSERT [dbo].[Chapter] ([Id], [Title], [Description], [IndexNumber]) VALUES (1, N'Теория множеств', NULL, 1)
INSERT [dbo].[Chapter] ([Id], [Title], [Description], [IndexNumber]) VALUES (2, N'Теория отношений', NULL, 2)
INSERT [dbo].[Chapter] ([Id], [Title], [Description], [IndexNumber]) VALUES (3, N'Элементы математической логики', NULL, 3)
INSERT [dbo].[Chapter] ([Id], [Title], [Description], [IndexNumber]) VALUES (4, N'Элементы теории графов и сетевое планирование', NULL, 4)
SET IDENTITY_INSERT [dbo].[Chapter] OFF
GO
SET IDENTITY_INSERT [dbo].[ControlPoint] ON 

INSERT [dbo].[ControlPoint] ([Id], [TopicId], [TaskTitle], [AnswerTitle], [IndexNumber], [TaskLink], [AnswerLink]) VALUES (16, 3, N'Дайте определение понятию  - счетное множество ', N'Счетное множество — это такое множество А, все элементы которого могут быть занумерованы в последовательность (м.б. бесконечную) а1, а2, а3, ..., аn, ... так, чтобы при этом каждый элемент получил ишь один номер n и каждое натуральное число n было бы в качестве номера дано одному и лишь одному элементу нашего множества.', 1, NULL, NULL)
INSERT [dbo].[ControlPoint] ([Id], [TopicId], [TaskTitle], [AnswerTitle], [IndexNumber], [TaskLink], [AnswerLink]) VALUES (17, 3, N'Что такое множество?', N'Множеством называется совокупность определенных вполне различаемых объектов, рассматриваемых как единое целое. Создатель теории множеств Георг Кантор давал следующее определение множества — «множество есть многое, мыслимое нами как целое».', 2, NULL, NULL)
INSERT [dbo].[ControlPoint] ([Id], [TopicId], [TaskTitle], [AnswerTitle], [IndexNumber], [TaskLink], [AnswerLink]) VALUES (19, 3, N'Задание в файле', N'Ответ 1', 3, N'Задание 1.pdf', NULL)
INSERT [dbo].[ControlPoint] ([Id], [TopicId], [TaskTitle], [AnswerTitle], [IndexNumber], [TaskLink], [AnswerLink]) VALUES (20, 16, N'', N'esdfd', 1, N'3.pdf', NULL)
INSERT [dbo].[ControlPoint] ([Id], [TopicId], [TaskTitle], [AnswerTitle], [IndexNumber], [TaskLink], [AnswerLink]) VALUES (21, 5, N'', N'', 1, N'1555.pdf', N'114.pdf')
SET IDENTITY_INSERT [dbo].[ControlPoint] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([Id], [Title], [Image], [Description]) VALUES (9, N'Дано универсальное множество U={1,2,3,4,5,6,7} и в нем подмножества A={x| x < 5}, B={2,4,5,6}, C={1,3,5,6}.  Найти A V B (Указать правильные варианты ответов).', N'21.jpg', N'Найти множества')
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description]) VALUES (10, N'Дано универсальное множество U={1,2,3,4,5,6,7} и в нем подмножества A={x| x < 4}, B={2,4,5,7}, C={1,2,5,6}. Найдите С V B', N'22.jpg', N'Найти множества')
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description]) VALUES (11, N'Дано универсальное множество U={1,2,3,4,5,6,7} и в нем подмножества A={x| x > 4}, B={3,5,7}, C={1,2,4,6}. Найти B V C', N'23.jpg', N'Найти множество')
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description]) VALUES (12, N'Справедлив ли дистрибутивный закон A(B - C) = AB - AC?', NULL, N'логика')
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Title], [Grade]) VALUES (1, N'студент', 0)
INSERT [dbo].[Role] ([Id], [Title], [Grade]) VALUES (2, N'администратор', 1)
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentGroup] ON 

INSERT [dbo].[StudentGroup] ([Id], [Title]) VALUES (1, N'195')
INSERT [dbo].[StudentGroup] ([Id], [Title]) VALUES (2, N'197')
INSERT [dbo].[StudentGroup] ([Id], [Title]) VALUES (3, N'205')
INSERT [dbo].[StudentGroup] ([Id], [Title]) VALUES (4, N'207')
INSERT [dbo].[StudentGroup] ([Id], [Title]) VALUES (5, N'155')
SET IDENTITY_INSERT [dbo].[StudentGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[Test] ON 

INSERT [dbo].[Test] ([Id], [TopicId], [Title], [Description], [IndexNumber]) VALUES (9, 3, N'Операции над множествами', N'теория множеств', 1)
INSERT [dbo].[Test] ([Id], [TopicId], [Title], [Description], [IndexNumber]) VALUES (10, 3, N'Основные понятия множеств', N'множества', 2)
INSERT [dbo].[Test] ([Id], [TopicId], [Title], [Description], [IndexNumber]) VALUES (11, 16, N'1', N'1', 1)
SET IDENTITY_INSERT [dbo].[Test] OFF
GO
SET IDENTITY_INSERT [dbo].[TestProgress] ON 

INSERT [dbo].[TestProgress] ([Id], [UserName], [AnswerId], [QuestionId], [TestId]) VALUES (107, N'god', 56, 12, 9)
INSERT [dbo].[TestProgress] ([Id], [UserName], [AnswerId], [QuestionId], [TestId]) VALUES (108, N'god', 50, 10, 9)
INSERT [dbo].[TestProgress] ([Id], [UserName], [AnswerId], [QuestionId], [TestId]) VALUES (109, N'god', 45, 9, 9)
INSERT [dbo].[TestProgress] ([Id], [UserName], [AnswerId], [QuestionId], [TestId]) VALUES (110, N'god', 53, 11, 9)
INSERT [dbo].[TestProgress] ([Id], [UserName], [AnswerId], [QuestionId], [TestId]) VALUES (118, N'user', 56, 12, 9)
INSERT [dbo].[TestProgress] ([Id], [UserName], [AnswerId], [QuestionId], [TestId]) VALUES (119, N'user', 49, 10, 9)
INSERT [dbo].[TestProgress] ([Id], [UserName], [AnswerId], [QuestionId], [TestId]) VALUES (120, N'user', 45, 9, 9)
INSERT [dbo].[TestProgress] ([Id], [UserName], [AnswerId], [QuestionId], [TestId]) VALUES (121, N'user', 54, 11, 9)
INSERT [dbo].[TestProgress] ([Id], [UserName], [AnswerId], [QuestionId], [TestId]) VALUES (122, N'user', 49, 10, 10)
INSERT [dbo].[TestProgress] ([Id], [UserName], [AnswerId], [QuestionId], [TestId]) VALUES (123, N'user', 54, 11, 10)
INSERT [dbo].[TestProgress] ([Id], [UserName], [AnswerId], [QuestionId], [TestId]) VALUES (124, N'user', 45, 9, 10)
SET IDENTITY_INSERT [dbo].[TestProgress] OFF
GO
SET IDENTITY_INSERT [dbo].[TestQuestion] ON 

INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (25, 9, 10, 3)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (26, 11, 10, 2)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (27, 10, 10, 1)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (28, 12, 9, 1)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (29, 10, 9, 2)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (30, 9, 9, 3)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (31, 11, 9, 4)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (32, 9, 11, 1)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (33, 11, 11, 2)
SET IDENTITY_INSERT [dbo].[TestQuestion] OFF
GO
SET IDENTITY_INSERT [dbo].[Topic] ON 

INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (3, N'Основные понятия теории множеств', N'Множества. Способы задания множеств. Операции над множествами. Алгебра множеств (Булева алгебра). Свойства множеств и операций над ними.', 4, 1, 1, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (5, N'Бинарные отношения и соответствия', N'Отношения. Методы представление отношений. Свойства отношений. Композиция отношений. Транзитивное замыкание. Типы отношений. Отношение эквивалентности и его свойства. Отношение частичного порядка, частично упорядоченное множество. Отношение линейного порядка. Изоморфизм частично упорядоченных множеств.', 5, 2, 3, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (6, N'Основные классы функций', N'Функции. Область определения и область значений функции. Сюрьективная функция. Инъективная функция. Биективная функция. Композиция функций. Единичная функция, n-местная функция. Способы задания функция. Табличное задание функций. Композиция, подстановка функций, суперпозиция. Формула. ', 2, 3, 5, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (7, N'Полнота и замкнутость систем логических функций', N'Логическая функция. Эквивалентные, равносильные формулы. Эквивалентные преобразования формул. Тождества булевой алгебры для операций конъюнкции, дизъюнкции и отрицания. Правило подстановки формулы вместо переменной. Методы упрощения формул: поглощение, склеивание, обобщенное склеивание.
Формула как суперпозиция функций. Полнота и замкнутость систем логических функций. Функционально полные системы логических функций, примеры.
', 1, 3, 7, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (8, N'Нормальные формы', N'Нормальные формы. Дизъюнктивная нормальная форма (днф). Совершенная дизъюнктивная нормальная форма (сднф). Конъюнктивная нормальная форма (кнф). Совершенная конъюнктивная нормальная форма (скнф). Построение сднф и скнф по таблице истинности. ', 1, 3, 8, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (9, N'Применение теории булевых функций к электрическим (контактным) схемам', N'Применение теории булевых функций к электрическим (контактным схемам). Минимизация контактных схем.', 1, 3, 9, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (11, N'Элементы теории графов', N'Ориентированные и неориентированные графы. Путь (маршрут), цикл. Простые пути и циклы. Связность вершин, графов, компоненты связности.   Степень   вершины   в   ориентированном и   неориентированном графах. Четные, нечетные, изолированные, висячие вершины. Полустепени захода и исхода. Теоремы о степенях вершин графов. Мосты. Деревья, лес. ', 2, 4, 10, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (13, N'Комбинаторная алгебра на графах', N'Комбинаторика. Размещения. Перестановки. Множества с повторениями. Алгоритмы на графах.', 1, 4, 11, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (14, N'Сетевые графики и сетевое планирование', N'Сетевые графики и сетевое планирование. Этапы сетевого планирования, построение сетевого графика. Расчет времен наступления событий и работ. Определение резервов времени. Поиск кратчайшего пути.', 1, 4, 12, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (16, N'Решение задач на преобразование  выражений алгебры множеств и
 доказательства тождеств
', N'Решение задач на преобразование     выражений     алгебры     множеств     и
доказательства тождеств
', 9, 1, 2, 2)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (17, N'Исследование взаимосвязи между
отношениями разного типа. Изучение    операций    над    отношениями.
Композиция      и      транзитивное      замыкание      отношений.
', N'Исследование взаимосвязи между
отношениями    разного    типа.    Изучение    операций    над    отношениями.
Композиция      и      транзитивное      замыкание      отношений.
', 9, 2, 4, 2)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (18, N'Использование операций над функциями.
Композиция и суперпозиция функций.
', N'Использование операций над функциями.
Композиция и суперпозиция функций.
', 2, 3, 6, 2)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (20, N'Графы', N'Граф', 2, 4, 13, 1)
SET IDENTITY_INSERT [dbo].[Topic] OFF
GO
SET IDENTITY_INSERT [dbo].[TopicContent] ON 

INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (12, 3, N'Основные понятия теории множеств.pdf', N'Основные понятия теории множеств.pdf', 1)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (14, 3, N'Doc1.pdf', N'Doc1.pdf', 2)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (15, 3, N'A.2.0 Дискретная математика. Введение.mp4', N'A.2.0 Дискретная математика. Введение.mp4', 3)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (17, 16, N'1.pdf', N'1.pdf', 1)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (18, 16, N'2.pdf', N'2.pdf', 2)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (19, 5, N'Гаранин.pptx', N'Гаранин.pptx', 1)
SET IDENTITY_INSERT [dbo].[TopicContent] OFF
GO
SET IDENTITY_INSERT [dbo].[TopicType] ON 

INSERT [dbo].[TopicType] ([Id], [Title]) VALUES (1, N'Лекция')
INSERT [dbo].[TopicType] ([Id], [Title]) VALUES (2, N'Практическое занятие')
INSERT [dbo].[TopicType] ([Id], [Title]) VALUES (3, N'Лабораторная работа')
INSERT [dbo].[TopicType] ([Id], [Title]) VALUES (4, N'СРС1')
SET IDENTITY_INSERT [dbo].[TopicType] OFF
GO
INSERT [dbo].[User] ([UserName], [Password], [RoleId], [Surname], [Name], [Patronymic], [DateOfRegs], [StudentGroupId]) VALUES (N'admin', N'1', 2, N'Bill', N'Gates', NULL, CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[User] ([UserName], [Password], [RoleId], [Surname], [Name], [Patronymic], [DateOfRegs], [StudentGroupId]) VALUES (N'akus', N'1', 1, N'Иванова ', N'Светлана', NULL, CAST(N'2023-06-08' AS Date), 2)
INSERT [dbo].[User] ([UserName], [Password], [RoleId], [Surname], [Name], [Patronymic], [DateOfRegs], [StudentGroupId]) VALUES (N'god', N'11', 1, N'Петров', N'Дмитрий', N'Андреевич', CAST(N'2023-06-08' AS Date), 3)
INSERT [dbo].[User] ([UserName], [Password], [RoleId], [Surname], [Name], [Patronymic], [DateOfRegs], [StudentGroupId]) VALUES (N'ivan', N'1', 1, N'Иванов', N'Иван', NULL, CAST(N'2023-05-17' AS Date), 1)
INSERT [dbo].[User] ([UserName], [Password], [RoleId], [Surname], [Name], [Patronymic], [DateOfRegs], [StudentGroupId]) VALUES (N'leisan', N'1', 2, N'Сафиулина', N'Лейсан', N'Маратовна', CAST(N'2023-05-19' AS Date), NULL)
INSERT [dbo].[User] ([UserName], [Password], [RoleId], [Surname], [Name], [Patronymic], [DateOfRegs], [StudentGroupId]) VALUES (N'user', N'1', 1, N'Маск', N'Илон', N'Рив', CAST(N'2023-05-06' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[UserControlPoint] ON 

INSERT [dbo].[UserControlPoint] ([Id], [ControlPointId], [UserName], [Answer], [AnswerLink], [Result]) VALUES (17, 16, N'user', N'Счётное множество — бесконечное множество, элементы которого возможно пронумеровать натуральными числами. ', NULL, 5)
INSERT [dbo].[UserControlPoint] ([Id], [ControlPointId], [UserName], [Answer], [AnswerLink], [Result]) VALUES (19, 19, N'user', N'', N'11.pdf', 5)
INSERT [dbo].[UserControlPoint] ([Id], [ControlPointId], [UserName], [Answer], [AnswerLink], [Result]) VALUES (20, 17, N'user', N'', N'12.pdf', 5)
INSERT [dbo].[UserControlPoint] ([Id], [ControlPointId], [UserName], [Answer], [AnswerLink], [Result]) VALUES (21, 20, N'user', N'dsadsa', NULL, 3)
SET IDENTITY_INSERT [dbo].[UserControlPoint] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTestResults] ON 

INSERT [dbo].[UserTestResults] ([Id], [TestId], [Result], [UserName]) VALUES (38, 9, 3, N'god')
INSERT [dbo].[UserTestResults] ([Id], [TestId], [Result], [UserName]) VALUES (41, 9, 3, N'user')
INSERT [dbo].[UserTestResults] ([Id], [TestId], [Result], [UserName]) VALUES (42, 10, 2, N'user')
SET IDENTITY_INSERT [dbo].[UserTestResults] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTopicContent] ON 

INSERT [dbo].[UserTopicContent] ([Id], [UserName], [TopicContentId], [IsStudied]) VALUES (5, N'akus', 12, 1)
INSERT [dbo].[UserTopicContent] ([Id], [UserName], [TopicContentId], [IsStudied]) VALUES (6, N'akus', 14, 1)
INSERT [dbo].[UserTopicContent] ([Id], [UserName], [TopicContentId], [IsStudied]) VALUES (29, N'user', 12, 1)
INSERT [dbo].[UserTopicContent] ([Id], [UserName], [TopicContentId], [IsStudied]) VALUES (30, N'user', 14, 1)
INSERT [dbo].[UserTopicContent] ([Id], [UserName], [TopicContentId], [IsStudied]) VALUES (31, N'user', 15, 1)
INSERT [dbo].[UserTopicContent] ([Id], [UserName], [TopicContentId], [IsStudied]) VALUES (32, N'user', 17, 1)
INSERT [dbo].[UserTopicContent] ([Id], [UserName], [TopicContentId], [IsStudied]) VALUES (33, N'user', 18, 1)
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
