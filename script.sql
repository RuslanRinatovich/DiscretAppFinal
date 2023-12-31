/*    ==Параметры сценариев==

    Версия исходного сервера : SQL Server 2017 (14.0.1000)
    Выпуск исходного ядра СУБД : Выпуск Microsoft SQL Server Express Edition
    Тип исходного ядра СУБД : Изолированный SQL Server

    Версия целевого сервера : SQL Server 2017
    Выпуск целевого ядра СУБД : Выпуск Microsoft SQL Server Standard Edition
    Тип целевого ядра СУБД : Изолированный SQL Server
*/
USE [master]
GO
/****** Object:  Database [DiscretMathBD]    Script Date: 20.06.2023 16:21:37 ******/
CREATE DATABASE [DiscretMathBD]

GO
USE [DiscretMathBD]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 20.06.2023 16:21:37 ******/
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
/****** Object:  Table [dbo].[Chapter]    Script Date: 20.06.2023 16:21:37 ******/
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
/****** Object:  Table [dbo].[ControlPoint]    Script Date: 20.06.2023 16:21:37 ******/
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
/****** Object:  Table [dbo].[Question]    Script Date: 20.06.2023 16:21:37 ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 20.06.2023 16:21:37 ******/
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
/****** Object:  Table [dbo].[StudentGroup]    Script Date: 20.06.2023 16:21:37 ******/
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
/****** Object:  Table [dbo].[Test]    Script Date: 20.06.2023 16:21:37 ******/
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
/****** Object:  Table [dbo].[TestProgress]    Script Date: 20.06.2023 16:21:37 ******/
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
/****** Object:  Table [dbo].[TestQuestion]    Script Date: 20.06.2023 16:21:37 ******/
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
/****** Object:  Table [dbo].[Topic]    Script Date: 20.06.2023 16:21:37 ******/
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
/****** Object:  Table [dbo].[TopicContent]    Script Date: 20.06.2023 16:21:37 ******/
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
/****** Object:  Table [dbo].[TopicType]    Script Date: 20.06.2023 16:21:37 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 20.06.2023 16:21:38 ******/
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
/****** Object:  Table [dbo].[UserControlPoint]    Script Date: 20.06.2023 16:21:38 ******/
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
/****** Object:  Table [dbo].[UserTestResults]    Script Date: 20.06.2023 16:21:38 ******/
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
/****** Object:  Table [dbo].[UserTopicContent]    Script Date: 20.06.2023 16:21:38 ******/
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

INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (58, N'С = A∩B  ', 0, 13)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (59, N'С = A\B  ', 1, 13)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (60, N'С = A∪B ', 0, 13)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (61, N'С = B\A ', 0, 13)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (62, N'С = A∩B ', 1, 14)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (63, N'С = A\B', 0, 14)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (64, N'С = A∪B ', 0, 14)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (65, N'С = B\A', 0, 14)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (66, N'С = A∩B', 0, 15)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (67, N'С = A\B', 0, 15)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (68, N'С = A∪B', 0, 15)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (69, N'С = B\A  ', 1, 15)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (70, N'8 элементов', 0, 16)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (71, N'7 элементов', 0, 16)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (72, N'5 элементов', 1, 16)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (73, N'6 элементов', 0, 16)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (74, N'6 элементов', 0, 17)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (75, N'8 элементов', 1, 17)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (76, N'5 элементов', 0, 17)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (77, N'3 элемента', 0, 17)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (78, N'A = B', 0, 18)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (79, N'B = C', 0, 18)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (80, N'A = C', 1, 18)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (81, N'A = B', 0, 19)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (82, N'B = C', 1, 19)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (83, N'A = C', 0, 19)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (84, N'{1, 2, 3, 4}', 0, 20)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (85, N'{1, 2, 3}', 1, 20)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (86, N'{2, 3, 4}', 0, 20)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (87, N'{1, 3, 4}', 0, 20)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (88, N'{1, 2, 3, 4} ', 0, 21)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (89, N'{1, 2, 2, 1}', 0, 21)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (90, N'{1, 3, 4, 1} ', 0, 21)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (91, N'{3, 3, 4, 1}', 1, 21)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (92, N'{1, 2, 3, 4} ', 0, 22)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (93, N'{1, 2, 4}  ', 1, 22)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (94, N'{1, 3, 4}  ', 0, 22)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (95, N'{1,3, 2, 4}  ', 0, 22)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (96, N'{1, 2, 3, 4}', 0, 23)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (97, N'{1, 4}', 0, 23)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (98, N'{2, 3}', 1, 23)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (99, N'{a, b, c, e}', 0, 24)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (100, N'{a, b, e}  ', 1, 24)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (101, N'{a, c}  ', 0, 24)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (102, N'Д. Буль', 1, 25)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (103, N'К. Линней', 0, 25)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (104, N'М. Ромм', 0, 25)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (105, N'алгебра физики', 0, 26)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (106, N'алгебра логики', 1, 26)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (107, N'теория логики', 0, 26)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (108, N'6', 0, 27)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (109, N'12', 0, 27)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (110, N'15', 1, 27)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (111, N'30', 0, 27)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (112, N'5', 0, 28)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (113, N'8', 1, 28)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (114, N'10', 0, 28)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (115, N'25', 0, 28)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (116, N'5', 0, 29)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (117, N'12', 1, 29)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (118, N'7', 0, 29)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (119, N'123', 0, 29)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (120, N'5', 0, 30)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (121, N'6', 1, 30)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (122, N'12', 0, 30)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (123, N'7', 0, 30)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (124, N'11', 0, 31)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (125, N'222', 0, 31)
INSERT [dbo].[Answer] ([Id], [Title], [IsRight], [QuestionId]) VALUES (126, N'444', 1, 31)
SET IDENTITY_INSERT [dbo].[Answer] OFF
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
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (13, N'Даны множества A = {a,b,d,e,f}, B = {b,c,e,g}, С = {a,d,f}.', NULL, NULL, 28)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (14, N'Даны множества A = {a,b,d,e,f}, B = {b,c,d,e,g}, С = {b,c,e}. Отметьте верное равенство:', NULL, NULL, 25)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (15, N'Даны множества A = {a,b,d,e}, B = {b,c,e,f,g}, С = {c,f,g}. Отметьте верное равенство:', NULL, NULL, 25)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (16, N'Множество A содержит 5 элементов,  множество B содержит 8 элементов. Сколько элементов может содержать их пересечение?', NULL, NULL, 25)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (17, N'Множество A содержит 6 элементов, множество B содержит 7 элементов. Сколько элементов может содержать их объединение?', NULL, NULL, 26)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (18, N'Множества A, B, C выражены через три других множества D, E, F следующими равенствами(знак пересечения опущен): A = D\(E∪F), B = DE∪DF, C = (D\E)∩(D\F). Отметьте верное равенство:', NULL, NULL, 32)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (19, N'Множества A, B, C выражены через три других множества D, E, F следующими равенствами (знак пересечения опущен): A = D∪EF, B = ((D\E)∪E)F, С = DF∪EF. Отметьте верное равенство:', NULL, NULL, 32)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (20, N' Чему равна проекция множества A = {(1,2),(1,3),(2,3),(3,4)} на первую координату?', NULL, NULL, 32)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (21, N'Чему равна проекция множества A = {(1,3),(2,3),(2,4),(3,1)} на вторую координату?', NULL, N'множества', 26)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (22, N' Чему равна проекция множества A = {(1,4),(2,1),(2,3),(4,3)} на первую координату?', NULL, N'множества', 25)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (23, N'Соответствие G между множествами A = {a,b,c,d,e} и B = {1,2,3,4} задано множеством пар G = {(a,1),(b,2),(b,3),(c,1),(c,4),(e,3)}. Какое из множеств является образом элемента b при этом соответствии?', NULL, NULL, 26)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (24, N'Соответствие G между множествами A = {a,b,c,d,e} и B = {1,2,3,4} задано множеством пар G = {(a,2),(a,3),(b,3),(c,1),(e,3),(e,4)}. Какое из множеств является прообразом элемента 3 при этом соответствии?', NULL, NULL, 27)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (25, N'Кто является основоположником алгебры логики?', NULL, NULL, 38)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (26, N'Как называется раздел математики, изучающий высказывания с точки зрения их логических значений?', NULL, NULL, 38)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (27, N'Встретились 6 друзей, и каждый пожал руку каждому.  Сколько всего было рукопожатий?', NULL, NULL, 38)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (28, N'Сколько четных двузначных чисел можно составить из цифр 2,3,6,7,9 (каждую цифру в числе можно использовать только 1 раз)?', NULL, NULL, 46)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (29, N'Сколько нечетных двузначных чисел можно составить из цифр 1,2,5,7,8 (цифры можно использовать только 1 раз)?', NULL, NULL, 45)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (30, N'Сколькими способами можно выбрать гласную и согласную буквы  из слова «схема»?', NULL, NULL, 45)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (31, N'1', NULL, N'1', 39)
INSERT [dbo].[Question] ([Id], [Title], [Image], [Description], [TopicId]) VALUES (32, N'1', NULL, N'1', 28)
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Title], [Grade]) VALUES (1, N'студент', 0)
INSERT [dbo].[Role] ([Id], [Title], [Grade]) VALUES (2, N'преподаватель', 1)
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[StudentGroup] ON 

INSERT [dbo].[StudentGroup] ([Id], [Title]) VALUES (1, N'7293-12')
INSERT [dbo].[StudentGroup] ([Id], [Title]) VALUES (2, N'197')
INSERT [dbo].[StudentGroup] ([Id], [Title]) VALUES (3, N'205')
INSERT [dbo].[StudentGroup] ([Id], [Title]) VALUES (4, N'207')
INSERT [dbo].[StudentGroup] ([Id], [Title]) VALUES (5, N'155')
SET IDENTITY_INSERT [dbo].[StudentGroup] OFF
SET IDENTITY_INSERT [dbo].[Test] ON 

INSERT [dbo].[Test] ([Id], [TopicId], [Title], [Description], [IndexNumber]) VALUES (12, 25, N'Алгебра логики', N'1', 1)
INSERT [dbo].[Test] ([Id], [TopicId], [Title], [Description], [IndexNumber]) VALUES (13, 32, N'Тест 1', N'1', 1)
INSERT [dbo].[Test] ([Id], [TopicId], [Title], [Description], [IndexNumber]) VALUES (14, 28, N'ДНФ', NULL, 1)
SET IDENTITY_INSERT [dbo].[Test] OFF
SET IDENTITY_INSERT [dbo].[TestProgress] ON 

INSERT [dbo].[TestProgress] ([Id], [UserName], [AnswerId], [QuestionId], [TestId]) VALUES (7, N'user', 59, 13, 12)
INSERT [dbo].[TestProgress] ([Id], [UserName], [AnswerId], [QuestionId], [TestId]) VALUES (8, N'user', 103, 25, 12)
INSERT [dbo].[TestProgress] ([Id], [UserName], [AnswerId], [QuestionId], [TestId]) VALUES (9, N'user', 106, 26, 12)
SET IDENTITY_INSERT [dbo].[TestProgress] OFF
SET IDENTITY_INSERT [dbo].[TestQuestion] ON 

INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (36, 13, 12, 1)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (37, 25, 12, 2)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (38, 26, 12, 3)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (39, 27, 13, 1)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (40, 29, 13, 2)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (41, 28, 13, 3)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (44, 14, 14, 1)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (45, 16, 14, 2)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (46, 22, 14, 3)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (47, 15, 14, 4)
INSERT [dbo].[TestQuestion] ([Id], [QuestionId], [TestId], [IndexNumber]) VALUES (48, 25, 14, 5)
SET IDENTITY_INSERT [dbo].[TestQuestion] OFF
SET IDENTITY_INSERT [dbo].[Topic] ON 

INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (25, N'Функции алгебры логики. Таблицы истинности. Существенные и несущественные переменные. Формулы. Тождества.', N' Функции алгебры логики, их представление таблицами истинности и формулами. Существенность переменных. Тождества, эквивалентные преобразования формул.', 2, 5, 1, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (26, N'Гаврилов Г.П., Сапоженко А.А. Задачи и упражнения по дискретной математике. М.: Физматлит, 2004.', N'Задачи', 2, 11, 22, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (27, N'Разложение функций по переменным. Дизъюнктивные и конъюнктивные нормальные формы (ДНФ и КНФ). Совершенная ДНФ и совершенная КНФ.', N'Разложение функций по переменным. Дизъюнктивные и конъюнктивные нормальные формы (ДНФ и КНФ). Совершенная ДНФ и совершенная КНФ.', 2, 5, 2, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (28, N'Сокращенная ДНФ. Построение сокращенной ДНФ по КНФ.', N'Сокращенная ДНФ. Построение сокращенной ДНФ по КНФ.', 2, 5, 3, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (29, N'Полиномы Жегалкина. Теорема Жегалкина. Построение полиномов Жегалкина.', N'Полиномы Жегалкина. Теорема Жегалкина. Построение полиномов Жегалкина.', 2, 5, 4, 1)
INSERT [dbo].[Topic] ([Id], [Title], [Description], [TotalHours], [ChapterId], [IndexNumber], [TopicTypeId]) VALUES (30, N'Полные системы, полнота некоторых систем. Замыкание множества. Замкнутые классы. Замкнутость классов T_0, T_1, L, S, M.', N'Полные системы, полнота некоторых систем. Замыкание множества. Замкнутые классы. Замкнутость классов T_0, T_1, L, S, M.', 2, 5, 5, 1)
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
SET IDENTITY_INSERT [dbo].[TopicContent] ON 

INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (65, 25, N'Лекция 1', N'Lection_1.pdf', 1)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (66, 25, N'Видеолекция 1', N'dm1-1-21-02-10-l1.mp4', 2)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (67, 26, N'Задачник', N'Gavrilov_Zadachi_uprazhnenija_diskretnoj_matematike.pdf', 1)
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
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (95, 27, N'Задачник', N'Gavrilov_Zadachi_uprazhnenija_diskretnoj_matematike.pdf', 3)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (96, 28, N'Задачник', N'Gavrilov_Zadachi_uprazhnenija_diskretnoj_matematike.pdf', 2)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (97, 29, N'Задачник', N'Gavrilov_Zadachi_uprazhnenija_diskretnoj_matematike.pdf', 2)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (98, 30, N'Задачник', N'Gavrilov_Zadachi_uprazhnenija_diskretnoj_matematike.pdf', 2)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (99, 31, N'Задачник', N'Gavrilov_Zadachi_uprazhnenija_diskretnoj_matematike.pdf', 3)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (100, 32, N'Задачник', N'Gavrilov_Zadachi_uprazhnenija_diskretnoj_matematike.pdf', 2)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (101, 33, N'Задачник', N'Gavrilov_Zadachi_uprazhnenija_diskretnoj_matematike.pdf', 2)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (102, 34, N'Задачник', N'Gavrilov_Zadachi_uprazhnenija_diskretnoj_matematike.pdf', 2)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (103, 35, N'Задачник', N'Gavrilov_Zadachi_uprazhnenija_diskretnoj_matematike.pdf', 2)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (104, 36, N'Задачник', N'Gavrilov_Zadachi_uprazhnenija_diskretnoj_matematike.pdf', 2)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (105, 37, N'Задачник', N'Gavrilov_Zadachi_uprazhnenija_diskretnoj_matematike.pdf', 2)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (106, 38, N'Задачник', N'Gavrilov_Zadachi_uprazhnenija_diskretnoj_matematike.pdf', 2)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (107, 39, N'Задачник', N'Gavrilov_Zadachi_uprazhnenija_diskretnoj_matematike.pdf', 2)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (108, 40, N'Задачник', N'Gavrilov_Zadachi_uprazhnenija_diskretnoj_matematike.pdf', 2)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (109, 41, N'Задачник', N'Gavrilov_Zadachi_uprazhnenija_diskretnoj_matematike.pdf', 2)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (110, 42, N'Задачник', N'Gavrilov_Zadachi_uprazhnenija_diskretnoj_matematike.pdf', 2)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (111, 43, N'Задачник', N'Gavrilov_Zadachi_uprazhnenija_diskretnoj_matematike.pdf', 2)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (112, 44, N'Задачник', N'Gavrilov_Zadachi_uprazhnenija_diskretnoj_matematike.pdf', 2)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (113, 45, N'Задачник', N'Gavrilov_Zadachi_uprazhnenija_diskretnoj_matematike.pdf', 2)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (114, 46, N'Задачник', N'Gavrilov_Zadachi_uprazhnenija_diskretnoj_matematike.pdf', 2)
INSERT [dbo].[TopicContent] ([Id], [TopicId], [TopicTitle], [TopicLink], [IndexNumber]) VALUES (115, 25, N'Задачник', N'Gavrilov_Zadachi_uprazhnenija_diskretnoj_matematike.pdf', 3)
SET IDENTITY_INSERT [dbo].[TopicContent] OFF
SET IDENTITY_INSERT [dbo].[TopicType] ON 

INSERT [dbo].[TopicType] ([Id], [Title]) VALUES (1, N'Лекция')
INSERT [dbo].[TopicType] ([Id], [Title]) VALUES (2, N'Экзамен')
INSERT [dbo].[TopicType] ([Id], [Title]) VALUES (3, N'Семинар')
SET IDENTITY_INSERT [dbo].[TopicType] OFF
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
INSERT [dbo].[User] ([UserName], [Password], [RoleId], [Surname], [Name], [Patronymic], [DateOfRegs], [StudentGroupId]) VALUES (N'user', N'1', 1, N'Архипов', N'Афиноген', N'Геннадиевич', CAST(N'2023-05-06' AS Date), 1)
SET IDENTITY_INSERT [dbo].[UserTestResults] ON 

INSERT [dbo].[UserTestResults] ([Id], [TestId], [Result], [UserName]) VALUES (3, 12, 2, N'user')
SET IDENTITY_INSERT [dbo].[UserTestResults] OFF
SET IDENTITY_INSERT [dbo].[UserTopicContent] ON 

INSERT [dbo].[UserTopicContent] ([Id], [UserName], [TopicContentId], [IsStudied]) VALUES (34, N'user', 65, 1)
INSERT [dbo].[UserTopicContent] ([Id], [UserName], [TopicContentId], [IsStudied]) VALUES (35, N'user', 66, 1)
INSERT [dbo].[UserTopicContent] ([Id], [UserName], [TopicContentId], [IsStudied]) VALUES (36, N'user', 68, 1)
INSERT [dbo].[UserTopicContent] ([Id], [UserName], [TopicContentId], [IsStudied]) VALUES (37, N'user', 69, 1)
INSERT [dbo].[UserTopicContent] ([Id], [UserName], [TopicContentId], [IsStudied]) VALUES (38, N'user', 70, 1)
INSERT [dbo].[UserTopicContent] ([Id], [UserName], [TopicContentId], [IsStudied]) VALUES (39, N'user', 115, 1)
SET IDENTITY_INSERT [dbo].[UserTopicContent] OFF
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
