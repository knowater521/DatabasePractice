USE [master]
GO
/****** Object:  Database [FirstDB]    Script Date: 2018/6/10 19:41:29 ******/
CREATE DATABASE [FirstDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FirstDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\FirstDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FirstDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\FirstDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FirstDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FirstDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FirstDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FirstDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FirstDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FirstDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FirstDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FirstDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FirstDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FirstDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FirstDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FirstDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FirstDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FirstDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FirstDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FirstDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FirstDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FirstDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FirstDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FirstDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FirstDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FirstDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FirstDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FirstDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FirstDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FirstDB] SET  MULTI_USER 
GO
ALTER DATABASE [FirstDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FirstDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FirstDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FirstDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FirstDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FirstDB] SET QUERY_STORE = OFF
GO
USE [FirstDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [FirstDB]
GO
/****** Object:  Table [dbo].[area]    Script Date: 2018/6/10 19:41:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[area](
	[area_id] [int] IDENTITY(1,1) NOT NULL,
	[area_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book]    Script Date: 2018/6/10 19:41:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book](
	[ISBN] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](100) NOT NULL,
	[price] [money] NOT NULL,
	[sale_count] [int] NOT NULL,
	[download_link] [varchar](1000) NOT NULL,
	[username] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[engage]    Script Date: 2018/6/10 19:41:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[engage](
	[area_id] [int] NOT NULL,
	[instructor_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[area_id] ASC,
	[instructor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[include]    Script Date: 2018/6/10 19:41:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[include](
	[order_id] [int] NOT NULL,
	[ISBN] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instructor]    Script Date: 2018/6/10 19:41:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instructor](
	[instructor_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[prof_title] [varchar](100) NULL,
	[sex] [char](2) NULL,
	[telephone] [varchar](50) NULL,
	[address] [varchar](100) NULL,
	[email] [varchar](100) NULL,
	[school_name] [varchar](20) NOT NULL,
	[major_name] [varchar](20) NOT NULL,
	[homepage] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[instructor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[major]    Script Date: 2018/6/10 19:41:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[major](
	[school_name] [varchar](20) NOT NULL,
	[major_name] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[school_name] ASC,
	[major_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[message]    Script Date: 2018/6/10 19:41:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[message](
	[message_id] [int] IDENTITY(1,1) NOT NULL,
	[content] [varchar](1000) NOT NULL,
	[release_date] [varchar](30) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[post_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[message_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 2018/6/10 19:41:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[order_date] [varchar](30) NOT NULL,
	[order_money] [money] NOT NULL,
	[status] [int] NOT NULL,
	[username] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post]    Script Date: 2018/6/10 19:41:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post](
	[post_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](500) NOT NULL,
	[content] [varchar](8000) NOT NULL,
	[post_date] [varchar](30) NOT NULL,
	[star_count] [int] NOT NULL,
	[username] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 2018/6/10 19:41:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[username] [varchar](20) NOT NULL,
	[passwd] [varchar](20) NOT NULL,
	[sex] [char](2) NULL,
	[birthday] [varchar](10) NULL,
	[telephone] [varchar](20) NULL,
	[email] [varchar](20) NULL,
	[score] [int] NOT NULL,
	[mem_level] [int] NOT NULL,
	[school_name] [varchar](20) NULL,
	[major_name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[area] ON 

INSERT [dbo].[area] ([area_id], [area_name]) VALUES (1, N'计算机视觉')
INSERT [dbo].[area] ([area_id], [area_name]) VALUES (2, N'自然语言处理')
INSERT [dbo].[area] ([area_id], [area_name]) VALUES (4, N'机器学习')
SET IDENTITY_INSERT [dbo].[area] OFF
SET IDENTITY_INSERT [dbo].[book] ON 

INSERT [dbo].[book] ([ISBN], [title], [price], [sale_count], [download_link], [username]) VALUES (7, N'计算机网络知识点总结', 5.0000, 8, N'https://baike.baidu.com/item/%E8%AE%A1%E7%AE%97%E6%9C%BA%E7%BD%91%E7%BB%9C%EF%BC%88%E7%AC%AC7%E7%89%88%EF%BC%89/22206553?fr=aladdin', N'fd1')
INSERT [dbo].[book] ([ISBN], [title], [price], [sale_count], [download_link], [username]) VALUES (8, N'数据结构知识点总结', 5.0000, 3, N'https://baike.baidu.com/item/%E6%95%B0%E6%8D%AE%E7%BB%93%E6%9E%84/1450', N'fd1')
INSERT [dbo].[book] ([ISBN], [title], [price], [sale_count], [download_link], [username]) VALUES (9, N'计算机组成知识点总结', 5.0000, 3, N'https://baike.baidu.com/item/%E8%AE%A1%E7%AE%97%E6%9C%BA%E7%BB%84%E6%88%90/9237940', N'fd1')
INSERT [dbo].[book] ([ISBN], [title], [price], [sale_count], [download_link], [username]) VALUES (10, N'高等数学知识点总结', 5.0000, 1, N'https://baike.baidu.com/item/%E9%AB%98%E7%AD%89%E6%95%B0%E5%AD%A6/1182', N'fd1')
INSERT [dbo].[book] ([ISBN], [title], [price], [sale_count], [download_link], [username]) VALUES (11, N'操作系统知识点总结', 5.0000, 0, N'https://baike.baidu.com/item/%E6%93%8D%E4%BD%9C%E7%B3%BB%E7%BB%9F/192', N'fd1')
INSERT [dbo].[book] ([ISBN], [title], [price], [sale_count], [download_link], [username]) VALUES (13, N'计网知识点', 5.0000, 0, N'https://baike.baidu.com/item/%E8%AE%A1%E7%AE%97%E6%9C%BA%E7%BD%91%E7%BB%9C/18763', N'ecnu1')
INSERT [dbo].[book] ([ISBN], [title], [price], [sale_count], [download_link], [username]) VALUES (14, N'数据结构知识点', 5.0000, 0, N'https://baike.baidu.com/item/%E6%95%B0%E6%8D%AE%E7%BB%93%E6%9E%84/1450', N'ecnu1')
INSERT [dbo].[book] ([ISBN], [title], [price], [sale_count], [download_link], [username]) VALUES (15, N'计组知识点', 5.0000, 0, N'https://baike.baidu.com/item/%E8%AE%A1%E7%AE%97%E6%9C%BA%E7%BB%84%E6%88%90/9237940', N'ecnu1')
INSERT [dbo].[book] ([ISBN], [title], [price], [sale_count], [download_link], [username]) VALUES (16, N'高数知识点', 5.0000, 1, N'https://baike.baidu.com/item/%E9%AB%98%E7%AD%89%E6%95%B0%E5%AD%A6/1182', N'ecnu1')
INSERT [dbo].[book] ([ISBN], [title], [price], [sale_count], [download_link], [username]) VALUES (17, N'操作系统知识点', 5.0000, 0, N'https://baike.baidu.com/item/%E6%93%8D%E4%BD%9C%E7%B3%BB%E7%BB%9F/192', N'ecnu1')
INSERT [dbo].[book] ([ISBN], [title], [price], [sale_count], [download_link], [username]) VALUES (18, N'计算机网络', 5.0000, 0, N'https://baike.baidu.com/item/%E8%AE%A1%E7%AE%97%E6%9C%BA%E7%BD%91%E7%BB%9C%EF%BC%88%E7%AC%AC7%E7%89%88%EF%BC%89/22206553?fr=aladdin', N'fd2')
INSERT [dbo].[book] ([ISBN], [title], [price], [sale_count], [download_link], [username]) VALUES (19, N'数据结构', 5.0000, 0, N'https://baike.baidu.com/item/%E6%95%B0%E6%8D%AE%E7%BB%93%E6%9E%84/1450', N'fd2')
INSERT [dbo].[book] ([ISBN], [title], [price], [sale_count], [download_link], [username]) VALUES (20, N'计算机组成', 5.0000, 0, N'https://baike.baidu.com/item/%E8%AE%A1%E7%AE%97%E6%9C%BA%E7%BB%84%E6%88%90/9237940', N'fd2')
INSERT [dbo].[book] ([ISBN], [title], [price], [sale_count], [download_link], [username]) VALUES (21, N'高等数学', 5.0000, 0, N'https://baike.baidu.com/item/%E9%AB%98%E7%AD%89%E6%95%B0%E5%AD%A6/1182', N'fd2')
INSERT [dbo].[book] ([ISBN], [title], [price], [sale_count], [download_link], [username]) VALUES (22, N'操作系统', 5.0000, 0, N'https://baike.baidu.com/item/%E6%93%8D%E4%BD%9C%E7%B3%BB%E7%BB%9F/192', N'fd2')
INSERT [dbo].[book] ([ISBN], [title], [price], [sale_count], [download_link], [username]) VALUES (23, N'计网', 5.0000, 0, N'https://baike.baidu.com/item/%E8%AE%A1%E7%AE%97%E6%9C%BA%E7%BD%91%E7%BB%9C/18763', N'ecnu2')
INSERT [dbo].[book] ([ISBN], [title], [price], [sale_count], [download_link], [username]) VALUES (24, N'数据结构', 5.0000, 0, N'https://baike.baidu.com/item/%E6%95%B0%E6%8D%AE%E7%BB%93%E6%9E%84/1450', N'ecnu2')
INSERT [dbo].[book] ([ISBN], [title], [price], [sale_count], [download_link], [username]) VALUES (25, N'计组', 5.0000, 2, N'https://baike.baidu.com/item/%E8%AE%A1%E7%AE%97%E6%9C%BA%E7%BB%84%E6%88%90/9237940', N'ecnu2')
INSERT [dbo].[book] ([ISBN], [title], [price], [sale_count], [download_link], [username]) VALUES (26, N'高数', 5.0000, 0, N'https://baike.baidu.com/item/%E9%AB%98%E7%AD%89%E6%95%B0%E5%AD%A6/1182', N'ecnu2')
INSERT [dbo].[book] ([ISBN], [title], [price], [sale_count], [download_link], [username]) VALUES (27, N'操作系统', 5.0000, 0, N'https://baike.baidu.com/item/%E6%93%8D%E4%BD%9C%E7%B3%BB%E7%BB%9F/192', N'ecnu2')
SET IDENTITY_INSERT [dbo].[book] OFF
INSERT [dbo].[engage] ([area_id], [instructor_id]) VALUES (1, 10)
INSERT [dbo].[engage] ([area_id], [instructor_id]) VALUES (1, 11)
INSERT [dbo].[engage] ([area_id], [instructor_id]) VALUES (1, 12)
INSERT [dbo].[engage] ([area_id], [instructor_id]) VALUES (1, 13)
INSERT [dbo].[engage] ([area_id], [instructor_id]) VALUES (1, 14)
INSERT [dbo].[engage] ([area_id], [instructor_id]) VALUES (1, 15)
INSERT [dbo].[engage] ([area_id], [instructor_id]) VALUES (1, 16)
INSERT [dbo].[engage] ([area_id], [instructor_id]) VALUES (2, 11)
INSERT [dbo].[engage] ([area_id], [instructor_id]) VALUES (2, 12)
INSERT [dbo].[engage] ([area_id], [instructor_id]) VALUES (2, 13)
INSERT [dbo].[engage] ([area_id], [instructor_id]) VALUES (2, 14)
INSERT [dbo].[engage] ([area_id], [instructor_id]) VALUES (2, 15)
INSERT [dbo].[engage] ([area_id], [instructor_id]) VALUES (2, 16)
INSERT [dbo].[engage] ([area_id], [instructor_id]) VALUES (4, 11)
INSERT [dbo].[engage] ([area_id], [instructor_id]) VALUES (4, 12)
INSERT [dbo].[engage] ([area_id], [instructor_id]) VALUES (4, 14)
INSERT [dbo].[engage] ([area_id], [instructor_id]) VALUES (4, 15)
INSERT [dbo].[engage] ([area_id], [instructor_id]) VALUES (4, 16)
SET IDENTITY_INSERT [dbo].[instructor] ON 

INSERT [dbo].[instructor] ([instructor_id], [name], [prof_title], [sex], [telephone], [address], [email], [school_name], [major_name], [homepage]) VALUES (10, N'黄萱菁', N'教授、博导', N'女', N'86-21-51355525', N'复旦大学张江校区计算机楼410-1室（201203）', N'xjhuang@fudan.edu.cn', N'复旦大学', N'计算机科学与技术', NULL)
INSERT [dbo].[instructor] ([instructor_id], [name], [prof_title], [sex], [telephone], [address], [email], [school_name], [major_name], [homepage]) VALUES (11, N'韩伟力', N'教授、硕导', N'男', N'86-21-51355388', N'复旦大学张江校区软件楼111房间', N'wlhan@fudan.edu.cn', N'复旦大学', N'计算机科学与技术', NULL)
INSERT [dbo].[instructor] ([instructor_id], [name], [prof_title], [sex], [telephone], [address], [email], [school_name], [major_name], [homepage]) VALUES (12, N'姜育刚', N'教授、博导', N'男', N'86-21-51355532', N'复旦大学张江校区计算机楼413-5室（201203）', N'ygj@fudan.edu.cn', N'复旦大学', N'计算机科学与技术', NULL)
INSERT [dbo].[instructor] ([instructor_id], [name], [prof_title], [sex], [telephone], [address], [email], [school_name], [major_name], [homepage]) VALUES (13, N'金城', N'教授、博导', N'男', N'86-21-51355535', N'复旦大学张江校区计算机楼306-4 (201203)', N'jc@fudan.edu.cn', N'复旦大学', N'计算机科学与技术', NULL)
INSERT [dbo].[instructor] ([instructor_id], [name], [prof_title], [sex], [telephone], [address], [email], [school_name], [major_name], [homepage]) VALUES (14, N'金玲飞', N'副教授，硕导', N'女', N'86-21-51355555', N'复旦大学张江校区软件楼316室（201203）', N'lfjin@fudan.edu.cn', N'复旦大学', N'计算机科学与技术', NULL)
INSERT [dbo].[instructor] ([instructor_id], [name], [prof_title], [sex], [telephone], [address], [email], [school_name], [major_name], [homepage]) VALUES (15, N'荆一楠', N'讲师、专业学位硕导', N'男', N'86-51-35555555', N'复旦大学张江校区软件楼109室（201203）', N'jingyn@fudan.edu.cn', N'复旦大学', N'计算机科学与技术', NULL)
INSERT [dbo].[instructor] ([instructor_id], [name], [prof_title], [sex], [telephone], [address], [email], [school_name], [major_name], [homepage]) VALUES (16, N'阚海斌', N'教授、博导', N'男', N'86-21-55665245', N'复旦大学邯郸校区逸夫楼504-2室(邮编：200433)', N'hbkan@fudan.edu.cn', N'复旦大学', N'计算机科学与技术', NULL)
SET IDENTITY_INSERT [dbo].[instructor] OFF
INSERT [dbo].[major] ([school_name], [major_name]) VALUES (N'复旦大学', N'计算机科学与技术')
INSERT [dbo].[major] ([school_name], [major_name]) VALUES (N'华东师范大学', N'计算机科学与技术')
INSERT [dbo].[major] ([school_name], [major_name]) VALUES (N'华东师范大学', N'软件工程')
SET IDENTITY_INSERT [dbo].[post] ON 

INSERT [dbo].[post] ([post_id], [title], [content], [post_date], [star_count], [username]) VALUES (18, N'2008华师大计算机考研经验', N'测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本', N'2018-05-29 17:19:18.677', 100, N'ecnu1')
INSERT [dbo].[post] ([post_id], [title], [content], [post_date], [star_count], [username]) VALUES (19, N'2009华师大计算机考研经验', N'测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本', N'2018-05-29 17:19:18.677', 90, N'ecnu2')
INSERT [dbo].[post] ([post_id], [title], [content], [post_date], [star_count], [username]) VALUES (20, N'2010华师大计算机考研经验', N'测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本', N'2018-05-29 17:19:18.677', 80, N'ecnu3')
INSERT [dbo].[post] ([post_id], [title], [content], [post_date], [star_count], [username]) VALUES (21, N'2011华师大计算机考研经验', N'测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本', N'2018-05-29 17:19:18.677', 70, N'ecnu4')
INSERT [dbo].[post] ([post_id], [title], [content], [post_date], [star_count], [username]) VALUES (22, N'2012华师大计算机考研经验', N'测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本', N'2018-05-29 17:19:18.677', 60, N'ecnu5')
INSERT [dbo].[post] ([post_id], [title], [content], [post_date], [star_count], [username]) VALUES (23, N'2013华师大计算机考研经验', N'测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本', N'2018-05-29 17:19:18.677', 50, N'ecnu6')
INSERT [dbo].[post] ([post_id], [title], [content], [post_date], [star_count], [username]) VALUES (24, N'2014华师大计算机考研经验', N'测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本', N'2018-05-29 17:19:18.677', 40, N'ecnu7')
INSERT [dbo].[post] ([post_id], [title], [content], [post_date], [star_count], [username]) VALUES (25, N'2015华师大计算机考研经验', N'测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本', N'2018-05-29 17:19:18.677', 30, N'ecnu8')
INSERT [dbo].[post] ([post_id], [title], [content], [post_date], [star_count], [username]) VALUES (26, N'2016华师大计算机考研经验', N'测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本', N'2018-05-29 17:19:18.677', 20, N'ecnu9')
INSERT [dbo].[post] ([post_id], [title], [content], [post_date], [star_count], [username]) VALUES (27, N'2017华师大计算机考研经验', N'测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本', N'2018-05-29 17:19:18.677', 10, N'ecnu10')
INSERT [dbo].[post] ([post_id], [title], [content], [post_date], [star_count], [username]) VALUES (28, N'2008复旦计算机考研经验', N'测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本', N'2018-05-29 17:19:18.677', 132, N'fd1')
INSERT [dbo].[post] ([post_id], [title], [content], [post_date], [star_count], [username]) VALUES (29, N'2009复旦计算机考研经验', N'测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本', N'2018-05-29 17:19:18.677', 101, N'fd2')
INSERT [dbo].[post] ([post_id], [title], [content], [post_date], [star_count], [username]) VALUES (30, N'2010复旦计算机考研经验', N'测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本', N'2018-05-29 17:19:18.677', 107, N'fd3')
INSERT [dbo].[post] ([post_id], [title], [content], [post_date], [star_count], [username]) VALUES (31, N'2011复旦计算机考研经验', N'测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本', N'2018-05-29 17:19:18.677', 76, N'fd4')
INSERT [dbo].[post] ([post_id], [title], [content], [post_date], [star_count], [username]) VALUES (32, N'2012复旦计算机考研经验', N'测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本', N'2018-05-29 17:19:18.677', 62, N'fd5')
INSERT [dbo].[post] ([post_id], [title], [content], [post_date], [star_count], [username]) VALUES (33, N'2013复旦计算机考研经验', N'测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本', N'2018-05-29 17:19:18.677', 51, N'fd6')
INSERT [dbo].[post] ([post_id], [title], [content], [post_date], [star_count], [username]) VALUES (34, N'2014复旦计算机考研经验', N'测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本', N'2018-05-29 17:19:18.677', 41, N'fd7')
INSERT [dbo].[post] ([post_id], [title], [content], [post_date], [star_count], [username]) VALUES (35, N'2015复旦计算机考研经验', N'测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本', N'2018-05-29 17:19:18.677', 31, N'fd8')
INSERT [dbo].[post] ([post_id], [title], [content], [post_date], [star_count], [username]) VALUES (36, N'2016复旦计算机考研经验', N'测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本', N'2018-05-29 17:19:18.677', 21, N'fd9')
INSERT [dbo].[post] ([post_id], [title], [content], [post_date], [star_count], [username]) VALUES (37, N'2017复旦计算机考研经验', N'测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本', N'2018-05-29 17:19:18.677', 12, N'fd10')
SET IDENTITY_INSERT [dbo].[post] OFF
INSERT [dbo].[user] ([username], [passwd], [sex], [birthday], [telephone], [email], [score], [mem_level], [school_name], [major_name]) VALUES (N'ecnu1', N'1', N'男', N'19971220', NULL, NULL, 0, 0, N'华东师范大学', N'计算机科学与技术')
INSERT [dbo].[user] ([username], [passwd], [sex], [birthday], [telephone], [email], [score], [mem_level], [school_name], [major_name]) VALUES (N'ecnu10', N'1', NULL, NULL, NULL, NULL, 0, 0, N'华东师范大学', N'计算机科学与技术')
INSERT [dbo].[user] ([username], [passwd], [sex], [birthday], [telephone], [email], [score], [mem_level], [school_name], [major_name]) VALUES (N'ecnu2', N'1', NULL, NULL, NULL, NULL, 0, 0, N'华东师范大学', N'计算机科学与技术')
INSERT [dbo].[user] ([username], [passwd], [sex], [birthday], [telephone], [email], [score], [mem_level], [school_name], [major_name]) VALUES (N'ecnu3', N'1', NULL, NULL, NULL, NULL, 0, 0, N'华东师范大学', N'计算机科学与技术')
INSERT [dbo].[user] ([username], [passwd], [sex], [birthday], [telephone], [email], [score], [mem_level], [school_name], [major_name]) VALUES (N'ecnu4', N'1', NULL, NULL, NULL, NULL, 0, 0, N'华东师范大学', N'计算机科学与技术')
INSERT [dbo].[user] ([username], [passwd], [sex], [birthday], [telephone], [email], [score], [mem_level], [school_name], [major_name]) VALUES (N'ecnu5', N'1', NULL, NULL, NULL, NULL, 0, 0, N'华东师范大学', N'计算机科学与技术')
INSERT [dbo].[user] ([username], [passwd], [sex], [birthday], [telephone], [email], [score], [mem_level], [school_name], [major_name]) VALUES (N'ecnu6', N'1', NULL, NULL, NULL, NULL, 0, 0, N'华东师范大学', N'计算机科学与技术')
INSERT [dbo].[user] ([username], [passwd], [sex], [birthday], [telephone], [email], [score], [mem_level], [school_name], [major_name]) VALUES (N'ecnu7', N'1', NULL, NULL, NULL, NULL, 0, 0, N'华东师范大学', N'计算机科学与技术')
INSERT [dbo].[user] ([username], [passwd], [sex], [birthday], [telephone], [email], [score], [mem_level], [school_name], [major_name]) VALUES (N'ecnu8', N'1', NULL, NULL, NULL, NULL, 0, 0, N'华东师范大学', N'计算机科学与技术')
INSERT [dbo].[user] ([username], [passwd], [sex], [birthday], [telephone], [email], [score], [mem_level], [school_name], [major_name]) VALUES (N'ecnu9', N'1', NULL, NULL, NULL, NULL, 0, 0, N'华东师范大学', N'计算机科学与技术')
INSERT [dbo].[user] ([username], [passwd], [sex], [birthday], [telephone], [email], [score], [mem_level], [school_name], [major_name]) VALUES (N'fd1', N'1', NULL, NULL, NULL, NULL, 0, 0, N'复旦大学', N'计算机科学与技术')
INSERT [dbo].[user] ([username], [passwd], [sex], [birthday], [telephone], [email], [score], [mem_level], [school_name], [major_name]) VALUES (N'fd10', N'1', NULL, NULL, NULL, NULL, 0, 0, N'复旦大学', N'计算机科学与技术')
INSERT [dbo].[user] ([username], [passwd], [sex], [birthday], [telephone], [email], [score], [mem_level], [school_name], [major_name]) VALUES (N'fd2', N'1', NULL, NULL, NULL, NULL, 0, 0, N'复旦大学', N'计算机科学与技术')
INSERT [dbo].[user] ([username], [passwd], [sex], [birthday], [telephone], [email], [score], [mem_level], [school_name], [major_name]) VALUES (N'fd3', N'1', NULL, NULL, NULL, NULL, 0, 0, N'复旦大学', N'计算机科学与技术')
INSERT [dbo].[user] ([username], [passwd], [sex], [birthday], [telephone], [email], [score], [mem_level], [school_name], [major_name]) VALUES (N'fd4', N'1', NULL, NULL, NULL, NULL, 0, 0, N'复旦大学', N'计算机科学与技术')
INSERT [dbo].[user] ([username], [passwd], [sex], [birthday], [telephone], [email], [score], [mem_level], [school_name], [major_name]) VALUES (N'fd5', N'1', NULL, NULL, NULL, NULL, 0, 0, N'复旦大学', N'计算机科学与技术')
INSERT [dbo].[user] ([username], [passwd], [sex], [birthday], [telephone], [email], [score], [mem_level], [school_name], [major_name]) VALUES (N'fd6', N'1', NULL, NULL, NULL, NULL, 0, 0, N'复旦大学', N'计算机科学与技术')
INSERT [dbo].[user] ([username], [passwd], [sex], [birthday], [telephone], [email], [score], [mem_level], [school_name], [major_name]) VALUES (N'fd7', N'1', NULL, NULL, NULL, NULL, 0, 0, N'复旦大学', N'计算机科学与技术')
INSERT [dbo].[user] ([username], [passwd], [sex], [birthday], [telephone], [email], [score], [mem_level], [school_name], [major_name]) VALUES (N'fd8', N'1', NULL, NULL, NULL, NULL, 0, 0, N'复旦大学', N'计算机科学与技术')
INSERT [dbo].[user] ([username], [passwd], [sex], [birthday], [telephone], [email], [score], [mem_level], [school_name], [major_name]) VALUES (N'fd9', N'1', NULL, NULL, NULL, NULL, 0, 0, N'复旦大学', N'计算机科学与技术')
ALTER TABLE [dbo].[book]  WITH CHECK ADD  CONSTRAINT [FK_book_user] FOREIGN KEY([username])
REFERENCES [dbo].[user] ([username])
GO
ALTER TABLE [dbo].[book] CHECK CONSTRAINT [FK_book_user]
GO
ALTER TABLE [dbo].[engage]  WITH CHECK ADD  CONSTRAINT [FK_engage_area] FOREIGN KEY([area_id])
REFERENCES [dbo].[area] ([area_id])
GO
ALTER TABLE [dbo].[engage] CHECK CONSTRAINT [FK_engage_area]
GO
ALTER TABLE [dbo].[engage]  WITH CHECK ADD  CONSTRAINT [FK_engage_instructor] FOREIGN KEY([instructor_id])
REFERENCES [dbo].[instructor] ([instructor_id])
GO
ALTER TABLE [dbo].[engage] CHECK CONSTRAINT [FK_engage_instructor]
GO
ALTER TABLE [dbo].[include]  WITH CHECK ADD  CONSTRAINT [FK_include_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([order_id])
GO
ALTER TABLE [dbo].[include] CHECK CONSTRAINT [FK_include_order]
GO
ALTER TABLE [dbo].[instructor]  WITH CHECK ADD FOREIGN KEY([school_name], [major_name])
REFERENCES [dbo].[major] ([school_name], [major_name])
GO
ALTER TABLE [dbo].[message]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[user] ([username])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[user] ([username])
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[user] ([username])
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_major] FOREIGN KEY([school_name], [major_name])
REFERENCES [dbo].[major] ([school_name], [major_name])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_major]
GO
ALTER TABLE [dbo].[book]  WITH CHECK ADD CHECK  (([sale_count]>=(0)))
GO
ALTER TABLE [dbo].[instructor]  WITH CHECK ADD CHECK  (([sex]='女' OR [sex]='男'))
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD CHECK  (([star_count]>=(0)))
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD CHECK  (([mem_level]>=(0) AND [mem_level]<=(3)))
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD CHECK  (([score]>=(0) AND [score]<=(300)))
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD CHECK  (([sex]='女' OR [sex]='男'))
GO
/****** Object:  StoredProcedure [dbo].[major2post]    Script Date: 2018/6/10 19:41:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[major2post]
@school_name varchar(20),
@major_name varchar(20)
as
begin
	select post_id as 帖子编号,title as 帖子标题,star_count as 帖子热度
	from [user] join post on [user].username = post.username
	where school_name = @school_name and major_name = @major_name
	order by star_count desc
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateInfo]    Script Date: 2018/6/10 19:41:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateInfo]
@p1 int,
@p2 varchar(20)
as
begin
	update [user] set score = score + @p1 where username = @p2
	update [user] set mem_level = case when score>0 and score<20 then 1
									   when score>=20 and score<50 then 2
									   when score>=50 then 3
									   else 0 end
	update [order] set status = 1 where username = @p2 and status = 0
end
GO
USE [master]
GO
ALTER DATABASE [FirstDB] SET  READ_WRITE 
GO
