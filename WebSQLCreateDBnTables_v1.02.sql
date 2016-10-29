USE [master]
GO

/****** Object:  Database [WebSQL]    Script Date: 29.10.2016 9:31:34 ******/
CREATE DATABASE [WebSQL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebSQL', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.LOCALSERVER125\MSSQL\DATA\WebSQL.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WebSQL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.LOCALSERVER125\MSSQL\DATA\WebSQL_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [WebSQL] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebSQL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [WebSQL] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [WebSQL] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [WebSQL] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [WebSQL] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [WebSQL] SET ARITHABORT OFF 
GO

ALTER DATABASE [WebSQL] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [WebSQL] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [WebSQL] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [WebSQL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [WebSQL] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [WebSQL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [WebSQL] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [WebSQL] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [WebSQL] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [WebSQL] SET  DISABLE_BROKER 
GO

ALTER DATABASE [WebSQL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [WebSQL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [WebSQL] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [WebSQL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [WebSQL] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [WebSQL] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [WebSQL] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [WebSQL] SET RECOVERY FULL 
GO

ALTER DATABASE [WebSQL] SET  MULTI_USER 
GO

ALTER DATABASE [WebSQL] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [WebSQL] SET DB_CHAINING OFF 
GO

ALTER DATABASE [WebSQL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [WebSQL] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [WebSQL] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [WebSQL] SET  READ_WRITE 
GO


USE [WebSQL]
GO

USE [WebSQL]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 29.10.2016 10:40:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nchar](30) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Master_Services]    Script Date: 29.10.2016 10:40:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Services](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[service_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[price] [money] NULL,
 CONSTRAINT [PK_Master_Services] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 29.10.2016 10:40:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[client_id] [int] NOT NULL,
	[master_service] [int] NOT NULL,
	[date] [datetime] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Services]    Script Date: 29.10.2016 10:40:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[service_id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NOT NULL,
	[service_name] [nchar](30) NOT NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Type]    Script Date: 29.10.2016 10:40:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[type_id] [int] NOT NULL,
	[type_name] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 29.10.2016 10:40:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[first_name] [nchar](20) NOT NULL,
	[last_name] [nchar](20) NOT NULL,
	[type_id] [int] NOT NULL,
	[e-mail] [nchar](30) NOT NULL,
	[password] [nchar](20) NOT NULL,
	[description] [nchar](1000) NULL,
	[work_time] [nchar](20) NULL,
	[user_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (1, N'IT                            ')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (2, N'Сантехніка                    ')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (3, N'Електрика                     ')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (4, N'Садівництво                   ')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (5, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Master_Services] ON 

INSERT [dbo].[Master_Services] ([id], [service_id], [user_id], [price]) VALUES (1, 6, 6, 100.0000)
INSERT [dbo].[Master_Services] ([id], [service_id], [user_id], [price]) VALUES (2, 1, 6, 120.0000)
INSERT [dbo].[Master_Services] ([id], [service_id], [user_id], [price]) VALUES (3, 6, 11, 50.0000)
SET IDENTITY_INSERT [dbo].[Master_Services] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [client_id], [master_service], [date]) VALUES (6, 9, 2, CAST(N'2016-09-14T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([service_id], [category_id], [service_name]) VALUES (1, 1, N'встановлення шиндовс          ')
INSERT [dbo].[Services] ([service_id], [category_id], [service_name]) VALUES (4, 1, N'ремонт монітора               ')
INSERT [dbo].[Services] ([service_id], [category_id], [service_name]) VALUES (5, 2, N'встановлення унітазів         ')
INSERT [dbo].[Services] ([service_id], [category_id], [service_name]) VALUES (6, 2, N'прокладка труб                ')
INSERT [dbo].[Services] ([service_id], [category_id], [service_name]) VALUES (7, 3, N'вкрутка розетки               ')
INSERT [dbo].[Services] ([service_id], [category_id], [service_name]) VALUES (9, 3, N'заміна проводки               ')
SET IDENTITY_INSERT [dbo].[Services] OFF
INSERT [dbo].[Type] ([type_id], [type_name]) VALUES (1, N'Client    ')
INSERT [dbo].[Type] ([type_id], [type_name]) VALUES (2, N'Specialist')
INSERT [dbo].[Type] ([type_id], [type_name]) VALUES (3, N'Admin     ')
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'Тарас               ', N'Роман               ', 2, N'taras.roman                   ', N'123456              ', N'майстер ломайстер                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ', N'завжди              ', 6)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'Олег                ', N'Пелішок             ', 1, N'oleg_pelishok@com             ', N'123456              ', NULL, NULL, 9)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'Олег                ', N'Сохан               ', 1, N'oleg.sokhan@...               ', N'123456              ', NULL, NULL, 10)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'Джамшуд             ', N'Рахмадович          ', 2, N'12                            ', N'12                  ', NULL, NULL, 11)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'рл                  ', N'ло                  ', 1, N'ол                            ', N'ло                  ', NULL, NULL, 25)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'Зохан               ', N'Зохан               ', 1, N'ол@mail                       ', N'ло65897             ', NULL, NULL, 26)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'mi                  ', N'mi                  ', 1, N'im                            ', N'im                  ', NULL, NULL, 27)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'ui                  ', N'mi                  ', 1, N'kio                           ', N'ol                  ', NULL, NULL, 28)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'ui77                ', N'mi77                ', 2, N'kio77                         ', N'ol77                ', NULL, NULL, 29)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'd                   ', N'dv                  ', 2, N'df                            ', N'vfd                 ', NULL, NULL, 30)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'Ololo               ', N'ololo               ', 1, N'ololo@olol                    ', N'lol                 ', NULL, NULL, 31)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'Dexter              ', N'Shmexter            ', 2, N'aqlcohol@yahoo!!!             ', N'111                 ', NULL, NULL, 32)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'Dexter01            ', N'Shmexter01          ', 1, N'aqlcohol@yahoo!!!jjj          ', N'sash                ', NULL, NULL, 33)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'Valik               ', N'Valik               ', 1, N'valentin@krevetko             ', N'ya_krevetko88       ', NULL, NULL, 34)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'bt                  ', N'bty                 ', 2, N'byt                           ', N'yt                  ', NULL, NULL, 35)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'Ololol              ', N'Ololoid             ', 2, N'olol@loi.com                  ', N'123456789           ', NULL, NULL, 36)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'1                   ', N'2                   ', 1, N'3                             ', N'4                   ', NULL, NULL, 37)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'1                   ', N'2                   ', 1, N'3                             ', N'4                   ', NULL, NULL, 38)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'1                   ', N'2                   ', 1, N'3                             ', N'4                   ', NULL, NULL, 39)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'1                   ', N'2                   ', 1, N'3                             ', N'4                   ', NULL, NULL, 40)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'trololo             ', N'lalka               ', 2, N'100500                        ', N'azaza               ', NULL, NULL, 41)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'sa                  ', N'sa                  ', 1, N'sa@sa.sa                      ', N'sa123               ', NULL, NULL, 1032)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'sa2                 ', N'sa2                 ', 1, N'2sa@sa.sa                     ', N'sa1231              ', NULL, NULL, 1033)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'sa2                 ', N'sa2                 ', 2, N'2sa@sa.sa                     ', N'sa1231              ', NULL, NULL, 1034)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'br                  ', N'br                  ', 1, N'br                            ', N'br                  ', NULL, NULL, 1035)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'nt                  ', N'nttn                ', 1, N'nt                            ', N'nyny                ', NULL, NULL, 1036)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'плшукопл            ', N'пупу                ', 1, N'пукпкуп                       ', N'пукпку              ', NULL, NULL, 1037)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'Коліс               ', N'Колісніченко        ', 1, N'Kolis@kolis.com               ', N'kolos88             ', NULL, NULL, 1038)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'ивива               ', N'иваив               ', 2, N'иавиав                        ', N'иавиваи             ', NULL, NULL, 1039)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'Slavko              ', N'ZK                  ', 1, N'test                          ', N'TEST                ', NULL, NULL, 1040)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'Slavko              ', N'ZK                  ', 1, N'test                          ', N'TEST                ', NULL, NULL, 1041)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'Slavko              ', N'ZK                  ', 1, N'test                          ', N'TEST                ', NULL, NULL, 1042)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'qwer                ', N'qwert               ', 1, N'wqwrwe                        ', N'111111              ', NULL, NULL, 1044)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'Support             ', N'IT                  ', 1, N'911@meest-group.com           ', N'sash5845            ', NULL, NULL, 1045)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'Slavko              ', N'Sraka               ', 1, N'Some@mail.net                 ', N'000000              ', NULL, NULL, 1046)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'Valik               ', N'Krevetko            ', 1, N'Valik@valk.com                ', N'000000              ', NULL, NULL, 1047)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'111111              ', N'111111              ', 1, N'111111                        ', N'111111              ', NULL, NULL, 1049)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'222222              ', N'222222              ', 2, N'222222                        ', N'222222              ', NULL, NULL, 1050)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'ggg                 ', N'hhhh                ', 2, N'no no no                      ', N'999999              ', NULL, NULL, 1051)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'qqqq                ', N'qqqq                ', 1, N'qqq                           ', N'qqqqqq              ', NULL, NULL, 1052)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'уууу                ', N'уууу                ', 2, N'еитет                         ', N'111111              ', NULL, NULL, 1053)
INSERT [dbo].[User] ([first_name], [last_name], [type_id], [e-mail], [password], [description], [work_time], [user_id]) VALUES (N'бшбшб               ', N'бшбш                ', 2, N'хуй@k.j                       ', N'111111              ', NULL, NULL, 1054)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Master_Services]  WITH CHECK ADD  CONSTRAINT [FK_Master_Services_Services] FOREIGN KEY([service_id])
REFERENCES [dbo].[Services] ([service_id])
GO
ALTER TABLE [dbo].[Master_Services] CHECK CONSTRAINT [FK_Master_Services_Services]
GO
ALTER TABLE [dbo].[Master_Services]  WITH CHECK ADD  CONSTRAINT [FK_Master_Services_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Master_Services] CHECK CONSTRAINT [FK_Master_Services_User]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Master_Services] FOREIGN KEY([master_service])
REFERENCES [dbo].[Master_Services] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Master_Services]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_User] FOREIGN KEY([client_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_User]
GO
ALTER TABLE [dbo].[Services]  WITH CHECK ADD  CONSTRAINT [FK_Services_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[Services] CHECK CONSTRAINT [FK_Services_Category]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Type] FOREIGN KEY([type_id])
REFERENCES [dbo].[Type] ([type_id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Type]
GO
