USE [master]
GO
/****** Object:  Database [CzarCms]    Script Date: 2019/3/13 16:27:59 ******/
CREATE DATABASE [CzarCms] ON  PRIMARY 
( NAME = N'CzarCms', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\CzarCms.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CzarCms_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\CzarCms_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CzarCms] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CzarCms].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CzarCms] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CzarCms] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CzarCms] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CzarCms] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CzarCms] SET ARITHABORT OFF 
GO
ALTER DATABASE [CzarCms] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CzarCms] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CzarCms] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CzarCms] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CzarCms] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CzarCms] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CzarCms] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CzarCms] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CzarCms] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CzarCms] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CzarCms] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CzarCms] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CzarCms] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CzarCms] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CzarCms] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CzarCms] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CzarCms] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CzarCms] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CzarCms] SET RECOVERY FULL 
GO
ALTER DATABASE [CzarCms] SET  MULTI_USER 
GO
ALTER DATABASE [CzarCms] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CzarCms] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CzarCms', N'ON'
GO
USE [CzarCms]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 2019/3/13 16:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Article](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Title] [varchar](128) NOT NULL,
	[ImageUrl] [varchar](128) NULL,
	[Content] [text] NULL,
	[ViewCount] [int] NOT NULL,
	[Sort] [int] NOT NULL,
	[Author] [varchar](64) NULL,
	[Source] [varchar](128) NULL,
	[SeoTitle] [varchar](128) NULL,
	[SeoKeyword] [varchar](256) NULL,
	[SeoDescription] [varchar](512) NULL,
	[AddManagerId] [int] NOT NULL,
	[AddTime] [datetime] NOT NULL,
	[ModifyManagerId] [int] NULL,
	[ModifyTime] [datetime] NULL,
	[IsTop] [bit] NOT NULL,
	[IsSlide] [bit] NOT NULL,
	[IsRed] [bit] NOT NULL,
	[IsPublish] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArticleCategory]    Script Date: 2019/3/13 16:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArticleCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](128) NOT NULL,
	[ParentId] [int] NOT NULL,
	[ClassList] [varchar](128) NULL,
	[ClassLayer] [int] NULL,
	[Sort] [int] NOT NULL,
	[ImageUrl] [varchar](128) NULL,
	[SeoTitle] [varchar](128) NULL,
	[SeoKeywords] [varchar](256) NULL,
	[SeoDescription] [varchar](512) NULL,
	[IsDeleted] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 2019/3/13 16:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Manager](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[UserName] [varchar](32) NOT NULL,
	[Password] [varchar](128) NOT NULL,
	[Avatar] [varchar](256) NULL,
	[NickName] [varchar](32) NULL,
	[Mobile] [varchar](16) NULL,
	[Email] [varchar](128) NULL,
	[LoginCount] [int] NULL,
	[LoginLastIp] [varchar](64) NULL,
	[LoginLastTime] [datetime] NULL,
	[AddManagerId] [int] NOT NULL,
	[AddTime] [datetime] NOT NULL,
	[ModifyManagerId] [int] NULL,
	[ModifyTime] [datetime] NULL,
	[IsLock] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[Remark] [varchar](128) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManagerLog]    Script Date: 2019/3/13 16:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManagerLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActionType] [varchar](32) NULL,
	[AddManageId] [int] NOT NULL,
	[AddManagerNickName] [varchar](64) NULL,
	[AddTime] [datetime] NOT NULL,
	[AddIp] [varchar](64) NULL,
	[Remark] [varchar](256) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManagerRole]    Script Date: 2019/3/13 16:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManagerRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](64) NOT NULL,
	[RoleType] [int] NOT NULL,
	[IsSystem] [bit] NOT NULL,
	[AddManagerId] [int] NOT NULL,
	[AddTime] [datetime] NOT NULL,
	[ModifyManagerId] [int] NULL,
	[ModifyTime] [datetime] NULL,
	[IsDelete] [bit] NOT NULL,
	[Remark] [varchar](128) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2019/3/13 16:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NOT NULL,
	[Name] [varchar](32) NOT NULL,
	[DisplayName] [varchar](128) NULL,
	[IconUrl] [varchar](128) NULL,
	[LinkUrl] [varchar](128) NULL,
	[Sort] [int] NULL,
	[Permission] [varchar](256) NULL,
	[IsDisplay] [bit] NOT NULL,
	[IsSystem] [bit] NOT NULL,
	[AddManagerId] [int] NOT NULL,
	[AddTime] [datetime] NOT NULL,
	[ModifyManagerId] [int] NULL,
	[ModifyTime] [datetime] NULL,
	[IsDelete] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NLog]    Script Date: 2019/3/13 16:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Application] [nvarchar](50) NULL,
	[Logged] [datetime] NULL,
	[Level] [nvarchar](50) NULL,
	[Message] [nvarchar](max) NULL,
	[Logger] [nvarchar](250) NULL,
	[Callsite] [nvarchar](512) NULL,
	[Exception] [nvarchar](max) NULL,
 CONSTRAINT [PK_NLOG] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RolePermission]    Script Date: 2019/3/13 16:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RolePermission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[MenuId] [int] NOT NULL,
	[Permission] [varchar](128) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaskInfo]    Script Date: 2019/3/13 16:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaskInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](128) NOT NULL,
	[Group] [varchar](128) NOT NULL,
	[Description] [varchar](256) NULL,
	[Assembly] [varchar](256) NOT NULL,
	[ClassName] [varchar](256) NOT NULL,
	[Status] [int] NOT NULL,
	[Cron] [varchar](128) NOT NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[NextTime] [datetime] NULL,
	[AddTime] [datetime] NULL,
	[AddManagerId] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_TASKINFO] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Manager] ON 

INSERT [dbo].[Manager] ([Id], [RoleId], [UserName], [Password], [Avatar], [NickName], [Mobile], [Email], [LoginCount], [LoginLastIp], [LoginLastTime], [AddManagerId], [AddTime], [ModifyManagerId], [ModifyTime], [IsLock], [IsDelete], [Remark]) VALUES (3, 1, N'admin', N'AGq/ucAkhJvACA0qOnHS8A==', N'/upload/20190312/201903122159059093173.jpg', N'超级管理员', N'17730213419', N'1015657114@qq.com', 37, N'::1', CAST(0x0000AA0F00FB7777 AS DateTime), 1, CAST(0x0000A9C80166C9DF AS DateTime), 3, CAST(0x0000AA0E016A4F41 AS DateTime), 0, 0, N'超级管理员,系统只能有一个这样的用户')
SET IDENTITY_INSERT [dbo].[Manager] OFF
SET IDENTITY_INSERT [dbo].[ManagerLog] ON 

INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (1, N'SignIn', 3, N'超级管理员', CAST(0x0000A9DE00D506BC AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (2, N'SignIn', 3, N'超级管理员', CAST(0x0000A9DE00E93068 AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (3, N'SignIn', 3, N'超级管理员', CAST(0x0000A9DE0106031E AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (4, N'SignIn', 3, N'超级管理员', CAST(0x0000A9DF017A4ADF AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (5, N'SignIn', 3, N'超级管理员', CAST(0x0000A9E000A7E453 AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (6, N'SignIn', 3, N'超级管理员', CAST(0x0000A9E000AD487B AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (8, N'SignIn', 3, N'超级管理员', CAST(0x0000A9E3016D7CD8 AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (9, N'SignIn', 3, N'超级管理员', CAST(0x0000A9E30175AFAB AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (10, N'SignIn', 3, N'超级管理员', CAST(0x0000A9F800CF2EFE AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (11, N'SignIn', 3, N'超级管理员', CAST(0x0000A9F800DEBBDE AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (12, N'SignIn', 3, N'超级管理员', CAST(0x0000A9F800DFDDC7 AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (13, N'SignIn', 3, N'超级管理员', CAST(0x0000A9F800E0FDF2 AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (14, N'SignIn', 3, N'超级管理员', CAST(0x0000A9F800EE48A9 AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (15, N'SignIn', 3, N'超级管理员', CAST(0x0000A9F800F69B0A AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (16, N'SignIn', 3, N'超级管理员', CAST(0x0000A9F80107C36B AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (17, N'SignIn', 3, N'超级管理员', CAST(0x0000A9F801080676 AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (18, N'SignIn', 3, N'超级管理员', CAST(0x0000A9F80113192E AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (19, N'SignIn', 3, N'超级管理员', CAST(0x0000A9F8011E6A57 AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (20, N'SignIn', 3, N'超级管理员', CAST(0x0000A9F8012392AF AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (21, N'SignIn', 3, N'超级管理员', CAST(0x0000A9F80136062A AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (22, N'SignIn', 3, N'超级管理员', CAST(0x0000AA070169E0E0 AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (23, N'SignIn', 3, N'超级管理员', CAST(0x0000AA070172E41F AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (1022, N'SignIn', 3, N'超级管理员', CAST(0x0000AA0E00C5749D AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (1023, N'SignIn', 3, N'超级管理员', CAST(0x0000AA0E00D09CC2 AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (1024, N'SignIn', 3, N'超级管理员', CAST(0x0000AA0E00DC5727 AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (1025, N'SignIn', 3, N'超级管理员', CAST(0x0000AA0E00F26B2A AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (1026, N'SignIn', 3, N'超级管理员', CAST(0x0000AA0E00F6CA47 AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (1027, N'SignIn', 3, N'超级管理员', CAST(0x0000AA0E0100D495 AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (1028, N'SignIn', 3, N'超级管理员', CAST(0x0000AA0E01053F86 AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (1029, N'SignIn', 3, N'超级管理员', CAST(0x0000AA0E010BE89A AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (1030, N'SignIn', 3, N'超级管理员', CAST(0x0000AA0E011381CC AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (1031, N'SignIn', 3, N'超级1管理员', CAST(0x0000AA0E0154FB87 AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (1032, N'SignIn', 3, N'超级管理员', CAST(0x0000AA0E01661243 AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (1033, N'SignIn', 3, N'超级管理员', CAST(0x0000AA0E01674D1B AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (1034, N'SignIn', 3, N'超级管理员', CAST(0x0000AA0F00CFC90B AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (1035, N'SignIn', 3, N'超级管理员', CAST(0x0000AA0F00FB7783 AS DateTime), N'::1', N'用户登录')
INSERT [dbo].[ManagerLog] ([Id], [ActionType], [AddManageId], [AddManagerNickName], [AddTime], [AddIp], [Remark]) VALUES (7, N'SignIn', 3, N'超级管理员', CAST(0x0000A9E000DB6E67 AS DateTime), N'::1', N'用户登录')
SET IDENTITY_INSERT [dbo].[ManagerLog] OFF
SET IDENTITY_INSERT [dbo].[ManagerRole] ON 

INSERT [dbo].[ManagerRole] ([Id], [RoleName], [RoleType], [IsSystem], [AddManagerId], [AddTime], [ModifyManagerId], [ModifyTime], [IsDelete], [Remark]) VALUES (1, N'超级管理员', 1, 0, 1, CAST(0x0000A9C601060613 AS DateTime), 1, CAST(0x0000AA0F00D02391 AS DateTime), 0, N'超级管理员，拥有系统最高权限，Bug般的存在')
INSERT [dbo].[ManagerRole] ([Id], [RoleName], [RoleType], [IsSystem], [AddManagerId], [AddTime], [ModifyManagerId], [ModifyTime], [IsDelete], [Remark]) VALUES (2, N'系统管理员', 2, 1, 1, CAST(0x0000A9C6010DBB2D AS DateTime), NULL, NULL, 0, N'系统管理员，顾名思义CMS系统的管理员，可以对系统管理员进行相关权限的个性化配置')
INSERT [dbo].[ManagerRole] ([Id], [RoleName], [RoleType], [IsSystem], [AddManagerId], [AddTime], [ModifyManagerId], [ModifyTime], [IsDelete], [Remark]) VALUES (3, N'编辑', 2, 0, 1, CAST(0x0000A9C601444105 AS DateTime), 1, CAST(0x0000A9C60168A394 AS DateTime), 0, N'拥有文章内容编辑权限')
INSERT [dbo].[ManagerRole] ([Id], [RoleName], [RoleType], [IsSystem], [AddManagerId], [AddTime], [ModifyManagerId], [ModifyTime], [IsDelete], [Remark]) VALUES (4, N'编辑2', 2, 0, 1, CAST(0x0000A9C6014539D1 AS DateTime), 1, CAST(0x0000A9C7011A035E AS DateTime), 0, N'编辑2')
INSERT [dbo].[ManagerRole] ([Id], [RoleName], [RoleType], [IsSystem], [AddManagerId], [AddTime], [ModifyManagerId], [ModifyTime], [IsDelete], [Remark]) VALUES (8, N'编辑6', 2, 0, 1, CAST(0x0000A9C601473F14 AS DateTime), NULL, NULL, 0, N'编辑6')
INSERT [dbo].[ManagerRole] ([Id], [RoleName], [RoleType], [IsSystem], [AddManagerId], [AddTime], [ModifyManagerId], [ModifyTime], [IsDelete], [Remark]) VALUES (11, N'编辑9', 2, 0, 1, CAST(0x0000A9C60153ACBC AS DateTime), 1, CAST(0x0000A9C601686C30 AS DateTime), 0, N'编辑9')
INSERT [dbo].[ManagerRole] ([Id], [RoleName], [RoleType], [IsSystem], [AddManagerId], [AddTime], [ModifyManagerId], [ModifyTime], [IsDelete], [Remark]) VALUES (12, N'编辑10', 2, 0, 1, CAST(0x0000A9C6017C6BE6 AS DateTime), NULL, NULL, 0, N'编辑10')
INSERT [dbo].[ManagerRole] ([Id], [RoleName], [RoleType], [IsSystem], [AddManagerId], [AddTime], [ModifyManagerId], [ModifyTime], [IsDelete], [Remark]) VALUES (15, N'编辑11', 2, 0, 1, CAST(0x0000A9D700F7C5BF AS DateTime), 1, CAST(0x0000A9D801766926 AS DateTime), 0, N'编辑11')
INSERT [dbo].[ManagerRole] ([Id], [RoleName], [RoleType], [IsSystem], [AddManagerId], [AddTime], [ModifyManagerId], [ModifyTime], [IsDelete], [Remark]) VALUES (5, N'编辑3', 2, 0, 1, CAST(0x0000A9C601460DBE AS DateTime), 1, CAST(0x0000A9C601689820 AS DateTime), 0, N'编辑3')
INSERT [dbo].[ManagerRole] ([Id], [RoleName], [RoleType], [IsSystem], [AddManagerId], [AddTime], [ModifyManagerId], [ModifyTime], [IsDelete], [Remark]) VALUES (6, N'编辑4', 2, 0, 1, CAST(0x0000A9C601467722 AS DateTime), NULL, NULL, 0, N'编辑4')
INSERT [dbo].[ManagerRole] ([Id], [RoleName], [RoleType], [IsSystem], [AddManagerId], [AddTime], [ModifyManagerId], [ModifyTime], [IsDelete], [Remark]) VALUES (9, N'编辑7', 2, 0, 1, CAST(0x0000A9C60147C86B AS DateTime), 1, CAST(0x0000A9C601687D67 AS DateTime), 0, N'编辑7')
INSERT [dbo].[ManagerRole] ([Id], [RoleName], [RoleType], [IsSystem], [AddManagerId], [AddTime], [ModifyManagerId], [ModifyTime], [IsDelete], [Remark]) VALUES (10, N'编辑8', 2, 0, 1, CAST(0x0000A9C60148E1C5 AS DateTime), NULL, NULL, 0, N'编辑8')
INSERT [dbo].[ManagerRole] ([Id], [RoleName], [RoleType], [IsSystem], [AddManagerId], [AddTime], [ModifyManagerId], [ModifyTime], [IsDelete], [Remark]) VALUES (7, N'编辑5', 2, 0, 1, CAST(0x0000A9C60146D965 AS DateTime), 1, CAST(0x0000A9C700D08E69 AS DateTime), 0, N'编辑5')
SET IDENTITY_INSERT [dbo].[ManagerRole] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Id], [ParentId], [Name], [DisplayName], [IconUrl], [LinkUrl], [Sort], [Permission], [IsDisplay], [IsSystem], [AddManagerId], [AddTime], [ModifyManagerId], [ModifyTime], [IsDelete]) VALUES (6, 0, N'system_setting', N'系统管理', N'&#xe620;', NULL, 99, NULL, 1, 1, 1, CAST(0x0000A9CC0134FFF2 AS DateTime), 1, CAST(0x0000A9CF00EAB154 AS DateTime), 0)
INSERT [dbo].[Menu] ([Id], [ParentId], [Name], [DisplayName], [IconUrl], [LinkUrl], [Sort], [Permission], [IsDisplay], [IsSystem], [AddManagerId], [AddTime], [ModifyManagerId], [ModifyTime], [IsDelete]) VALUES (7, 0, N'content_manage', N'内容管理', N'&#xe63c;', NULL, 99, NULL, 1, 1, 1, CAST(0x0000A9CC01356260 AS DateTime), 1, CAST(0x0000A9CF00EA5227 AS DateTime), 0)
INSERT [dbo].[Menu] ([Id], [ParentId], [Name], [DisplayName], [IconUrl], [LinkUrl], [Sort], [Permission], [IsDisplay], [IsSystem], [AddManagerId], [AddTime], [ModifyManagerId], [ModifyTime], [IsDelete]) VALUES (1006, 6, N'user_manage', N'用户管理', N'&#xe612;', N'/Manager/Index', 99, NULL, 1, 1, 1, CAST(0x0000A9CF00EA23A2 AS DateTime), 1, CAST(0x0000A9D00170E00E AS DateTime), 0)
INSERT [dbo].[Menu] ([Id], [ParentId], [Name], [DisplayName], [IconUrl], [LinkUrl], [Sort], [Permission], [IsDisplay], [IsSystem], [AddManagerId], [AddTime], [ModifyManagerId], [ModifyTime], [IsDelete]) VALUES (1007, 6, N'role_manager', N'角色管理', N'icon-vip', N'/ManagerRole/Index', 99, NULL, 1, 1, 1, CAST(0x0000A9CF00EBCD32 AS DateTime), 1, CAST(0x0000A9D00170D759 AS DateTime), 0)
INSERT [dbo].[Menu] ([Id], [ParentId], [Name], [DisplayName], [IconUrl], [LinkUrl], [Sort], [Permission], [IsDisplay], [IsSystem], [AddManagerId], [AddTime], [ModifyManagerId], [ModifyTime], [IsDelete]) VALUES (1008, 6, N'menu_manager', N'菜单管理', N'icon-caidan', N'/Menu/Index', 99, NULL, 1, 1, 1, CAST(0x0000A9CF00EBFE4D AS DateTime), 1, CAST(0x0000A9E30170D2CD AS DateTime), 0)
INSERT [dbo].[Menu] ([Id], [ParentId], [Name], [DisplayName], [IconUrl], [LinkUrl], [Sort], [Permission], [IsDisplay], [IsSystem], [AddManagerId], [AddTime], [ModifyManagerId], [ModifyTime], [IsDelete]) VALUES (1009, 6, N'task_info', N'任务管理', N'&#xe620;', N'/TaskInfo/Index', 99, NULL, 1, 1, 1, CAST(0x0000AA0F00D005B8 AS DateTime), 1, CAST(0x0000AA0F00D0159E AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[NLog] ON 

INSERT [dbo].[NLog] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (1, N'Czar.Cms.Admin', CAST(0x0000AA0E00C50E2D AS DateTime), N'Error', N'System.Data.SqlClient.SqlException (0x80131904): 列名 ''RoleName'' 无效。
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in C:\projects\dapper\Dapper\SqlMapper.cs:line 1053
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in C:\projects\dapper\Dapper\SqlMapper.cs:line 1081
   at System.Collections.Generic.List`1.AddEnumerable(IEnumerable`1 enumerable)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in C:\projects\dapper\Dapper\SqlMapper.cs:line 723
   at Dapper.SimpleCRUD.GetList[T](IDbConnection connection, String conditions, Object parameters, IDbTransaction transaction, Nullable`1 commandTimeout) in C:\Users\ericc\Documents\GitHub\Dapper.SimpleCRUD\Dapper.SimpleCRUD\SimpleCRUD.cs:line 224
   at Czar.Cms.Core.Repository.BaseRepository`2.GetList(String conditions, Object parameters) in E:\workspace\vs2017\Czar.Cms\src\Czar.Cms.Core\Repository\BaseRepository.cs:line 45
   at Czar.Cms.Services.ManagerService.SignIn(LoginModel model) in E:\workspace\vs2017\Czar.Cms\src\Czar.Cms.Services\ManagerService.cs:line 186
   at Czar.Cms.Admin.Controllers.AccountController.SignInAsync(LoginModel model) in E:\workspace\vs2017\Czar.Cms\src\Czar.Cms.Admin\Controllers\AccountController.cs:line 79
   at lambda_method(Closure , Object )
   at Microsoft.Extensions.Internal.ObjectMethodExecutorAwaitable.Awaiter.GetResult()
   at Microsoft.AspNetCore.Mvc.Internal.ActionMethodExecutor.AwaitableObjectResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at System.Threading.Tasks.ValueTask`1.get_Result()
   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.InvokeNextActionFilterAsync()
   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.Rethrow(ActionExecutedContext context)
   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.InvokeInnerFilterAsync()
   at Microsoft.AspNetCore.Mvc.Internal.ResourceInvoker.InvokeNextExceptionFilterAsync()
ClientConnectionId:33a8f1ec-5a64-421b-9069-c67929f58a81
Error Number:207,State:1,Class:16', N'Czar.Cms.Admin.Filter.GlobalExceptionFilter', N'Czar.Cms.Admin.Filter.GlobalExceptionFilter.OnException(E:\workspace\vs2017\Czar.Cms\src\Czar.Cms.Admin\Filter\GlobalExceptionFilter.cs:32)', N'System.Data.SqlClient.SqlException (0x80131904): 列名 ''RoleName'' 无效。
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in C:\projects\dapper\Dapper\SqlMapper.cs:line 1053
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in C:\projects\dapper\Dapper\SqlMapper.cs:line 1081
   at System.Collections.Generic.List`1.AddEnumerable(IEnumerable`1 enumerable)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in C:\projects\dapper\Dapper\SqlMapper.cs:line 723
   at Dapper.SimpleCRUD.GetList[T](IDbConnection connection, String conditions, Object parameters, IDbTransaction transaction, Nullable`1 commandTimeout) in C:\Users\ericc\Documents\GitHub\Dapper.SimpleCRUD\Dapper.SimpleCRUD\SimpleCRUD.cs:line 224
   at Czar.Cms.Core.Repository.BaseRepository`2.GetList(String conditions, Object parameters) in E:\workspace\vs2017\Czar.Cms\src\Czar.Cms.Core\Repository\BaseRepository.cs:line 45
   at Czar.Cms.Services.ManagerService.SignIn(LoginModel model) in E:\workspace\vs2017\Czar.Cms\src\Czar.Cms.Services\ManagerService.cs:line 186
   at Czar.Cms.Admin.Controllers.AccountController.SignInAsync(LoginModel model) in E:\workspace\vs2017\Czar.Cms\src\Czar.Cms.Admin\Controllers\AccountController.cs:line 79
   at lambda_method(Closure , Object )
   at Microsoft.Extensions.Internal.ObjectMethodExecutorAwaitable.Awaiter.GetResult()
   at Microsoft.AspNetCore.Mvc.Internal.ActionMethodExecutor.AwaitableObjectResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at System.Threading.Tasks.ValueTask`1.get_Result()
   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.InvokeNextActionFilterAsync()
   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.Rethrow(ActionExecutedContext context)
   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.InvokeInnerFilterAsync()
   at Microsoft.AspNetCore.Mvc.Internal.ResourceInvoker.InvokeNextExceptionFilterAsync()
ClientConnectionId:33a8f1ec-5a64-421b-9069-c67929f58a81
Error Number:207,State:1,Class:16')
INSERT [dbo].[NLog] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (2, N'Czar.Cms.Admin', CAST(0x0000AA0E00C58E88 AS DateTime), N'Error', N'System.Data.SqlClient.SqlException (0x80131904): 列名 ''IsDelete'' 不明确。
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in C:\projects\dapper\Dapper\SqlMapper.cs:line 1053
   at Dapper.SqlMapper.QueryRowImpl[T](IDbConnection cnn, Row row, CommandDefinition& command, Type effectiveType) in C:\projects\dapper\Dapper\SqlMapper.cs:line 1179
   at Dapper.SqlMapper.QueryFirstOrDefault[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Nullable`1 commandTimeout, Nullable`1 commandType) in C:\projects\dapper\Dapper\SqlMapper.cs:line 763
   at Czar.Cms.Repository.SqlServer.ManagerRepository.GetManagerContainRoleNameById(Int32 id) in E:\workspace\vs2017\Czar.Cms\src\Czar.Cms.Repository.SqlServer\ManagerRepository.cs:line 119
   at Czar.Cms.Services.ManagerService.GetManagerContainRoleNameById(Int32 id) in E:\workspace\vs2017\Czar.Cms\src\Czar.Cms.Services\ManagerService.cs:line 245
   at Czar.Cms.Admin.Controllers.ManagerController.ManagerInfo() in E:\workspace\vs2017\Czar.Cms\src\Czar.Cms.Admin\Controllers\ManagerController.cs:line 126
   at lambda_method(Closure , Object , Object[] )
   at Microsoft.Extensions.Internal.ObjectMethodExecutor.Execute(Object target, Object[] parameters)
   at Microsoft.AspNetCore.Mvc.Internal.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.InvokeNextActionFilterAsync()
   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.Rethrow(ActionExecutedContext context)
   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.InvokeInnerFilterAsync()
   at Microsoft.AspNetCore.Mvc.Internal.ResourceInvoker.InvokeNextExceptionFilterAsync()
ClientConnectionId:c2e73322-055d-4942-bbb0-0278d78ad4d3
Error Number:209,State:1,Class:16', N'Czar.Cms.Admin.Filter.GlobalExceptionFilter', N'Czar.Cms.Admin.Filter.GlobalExceptionFilter.OnException(E:\workspace\vs2017\Czar.Cms\src\Czar.Cms.Admin\Filter\GlobalExceptionFilter.cs:32)', N'System.Data.SqlClient.SqlException (0x80131904): 列名 ''IsDelete'' 不明确。
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in C:\projects\dapper\Dapper\SqlMapper.cs:line 1053
   at Dapper.SqlMapper.QueryRowImpl[T](IDbConnection cnn, Row row, CommandDefinition& command, Type effectiveType) in C:\projects\dapper\Dapper\SqlMapper.cs:line 1179
   at Dapper.SqlMapper.QueryFirstOrDefault[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Nullable`1 commandTimeout, Nullable`1 commandType) in C:\projects\dapper\Dapper\SqlMapper.cs:line 763
   at Czar.Cms.Repository.SqlServer.ManagerRepository.GetManagerContainRoleNameById(Int32 id) in E:\workspace\vs2017\Czar.Cms\src\Czar.Cms.Repository.SqlServer\ManagerRepository.cs:line 119
   at Czar.Cms.Services.ManagerService.GetManagerContainRoleNameById(Int32 id) in E:\workspace\vs2017\Czar.Cms\src\Czar.Cms.Services\ManagerService.cs:line 245
   at Czar.Cms.Admin.Controllers.ManagerController.ManagerInfo() in E:\workspace\vs2017\Czar.Cms\src\Czar.Cms.Admin\Controllers\ManagerController.cs:line 126
   at lambda_method(Closure , Object , Object[] )
   at Microsoft.Extensions.Internal.ObjectMethodExecutor.Execute(Object target, Object[] parameters)
   at Microsoft.AspNetCore.Mvc.Internal.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.InvokeNextActionFilterAsync()
   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.Rethrow(ActionExecutedContext context)
   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.InvokeInnerFilterAsync()
   at Microsoft.AspNetCore.Mvc.Internal.ResourceInvoker.InvokeNextExceptionFilterAsync()
ClientConnectionId:c2e73322-055d-4942-bbb0-0278d78ad4d3
Error Number:209,State:1,Class:16')
SET IDENTITY_INSERT [dbo].[NLog] OFF
SET IDENTITY_INSERT [dbo].[RolePermission] ON 

INSERT [dbo].[RolePermission] ([Id], [RoleId], [MenuId], [Permission]) VALUES (14, 15, 6, N'')
INSERT [dbo].[RolePermission] ([Id], [RoleId], [MenuId], [Permission]) VALUES (15, 15, 1006, N'')
INSERT [dbo].[RolePermission] ([Id], [RoleId], [MenuId], [Permission]) VALUES (16, 15, 1007, N'')
INSERT [dbo].[RolePermission] ([Id], [RoleId], [MenuId], [Permission]) VALUES (17, 15, 1008, N'')
INSERT [dbo].[RolePermission] ([Id], [RoleId], [MenuId], [Permission]) VALUES (18, 15, 7, N'')
INSERT [dbo].[RolePermission] ([Id], [RoleId], [MenuId], [Permission]) VALUES (1020, 1, 6, N'')
INSERT [dbo].[RolePermission] ([Id], [RoleId], [MenuId], [Permission]) VALUES (1021, 1, 1006, N'')
INSERT [dbo].[RolePermission] ([Id], [RoleId], [MenuId], [Permission]) VALUES (1022, 1, 1007, N'')
INSERT [dbo].[RolePermission] ([Id], [RoleId], [MenuId], [Permission]) VALUES (1023, 1, 1008, N'')
INSERT [dbo].[RolePermission] ([Id], [RoleId], [MenuId], [Permission]) VALUES (1024, 1, 1009, N'')
INSERT [dbo].[RolePermission] ([Id], [RoleId], [MenuId], [Permission]) VALUES (1025, 1, 7, N'')
SET IDENTITY_INSERT [dbo].[RolePermission] OFF
/****** Object:  Index [PK_ARTICLE]    Script Date: 2019/3/13 16:27:59 ******/
ALTER TABLE [dbo].[Article] ADD  CONSTRAINT [PK_ARTICLE] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_ARTICLECATEGORY]    Script Date: 2019/3/13 16:27:59 ******/
ALTER TABLE [dbo].[ArticleCategory] ADD  CONSTRAINT [PK_ARTICLECATEGORY] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_MANAGER]    Script Date: 2019/3/13 16:27:59 ******/
ALTER TABLE [dbo].[Manager] ADD  CONSTRAINT [PK_MANAGER] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Relationship_3_FK]    Script Date: 2019/3/13 16:27:59 ******/
CREATE NONCLUSTERED INDEX [Relationship_3_FK] ON [dbo].[Manager]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_MANAGERLOG]    Script Date: 2019/3/13 16:27:59 ******/
ALTER TABLE [dbo].[ManagerLog] ADD  CONSTRAINT [PK_MANAGERLOG] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_MANAGERROLE]    Script Date: 2019/3/13 16:27:59 ******/
ALTER TABLE [dbo].[ManagerRole] ADD  CONSTRAINT [PK_MANAGERROLE] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_MENU]    Script Date: 2019/3/13 16:27:59 ******/
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [PK_MENU] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_ROLEPERMISSION]    Script Date: 2019/3/13 16:27:59 ******/
ALTER TABLE [dbo].[RolePermission] ADD  CONSTRAINT [PK_ROLEPERMISSION] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Relationship_1_FK]    Script Date: 2019/3/13 16:27:59 ******/
CREATE NONCLUSTERED INDEX [Relationship_1_FK] ON [dbo].[RolePermission]
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Relationship_2_FK]    Script Date: 2019/3/13 16:27:59 ******/
CREATE NONCLUSTERED INDEX [Relationship_2_FK] ON [dbo].[RolePermission]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Article] ADD  DEFAULT (getdate()) FOR [AddTime]
GO
ALTER TABLE [dbo].[Article] ADD  DEFAULT ((0)) FOR [IsTop]
GO
ALTER TABLE [dbo].[Article] ADD  DEFAULT ((0)) FOR [IsSlide]
GO
ALTER TABLE [dbo].[Article] ADD  DEFAULT ((0)) FOR [IsRed]
GO
ALTER TABLE [dbo].[Article] ADD  DEFAULT ((0)) FOR [IsPublish]
GO
ALTER TABLE [dbo].[Article] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ArticleCategory] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Manager] ADD  DEFAULT (getdate()) FOR [AddTime]
GO
ALTER TABLE [dbo].[Manager] ADD  DEFAULT ((0)) FOR [IsLock]
GO
ALTER TABLE [dbo].[Manager] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[ManagerLog] ADD  DEFAULT (getdate()) FOR [AddTime]
GO
ALTER TABLE [dbo].[ManagerRole] ADD  DEFAULT (getdate()) FOR [AddTime]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_Sort]  DEFAULT ((0)) FOR [Sort]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_IsDisplay]  DEFAULT ((1)) FOR [IsDisplay]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_IsSystem]  DEFAULT ((0)) FOR [IsSystem]
GO
ALTER TABLE [dbo].[Menu] ADD  DEFAULT (getdate()) FOR [AddTime]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_ARTICLE_RELATIONS_ARTICLEC] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[ArticleCategory] ([Id])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_ARTICLE_RELATIONS_ARTICLEC]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [FK_MANAGER_RELATIONS_MANAGERR] FOREIGN KEY([RoleId])
REFERENCES [dbo].[ManagerRole] ([Id])
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [FK_MANAGER_RELATIONS_MANAGERR]
GO
ALTER TABLE [dbo].[ManagerLog]  WITH CHECK ADD  CONSTRAINT [FK_MANAGERL_RELATIONS_MANAGER] FOREIGN KEY([AddManageId])
REFERENCES [dbo].[Manager] ([Id])
GO
ALTER TABLE [dbo].[ManagerLog] CHECK CONSTRAINT [FK_MANAGERL_RELATIONS_MANAGER]
GO
ALTER TABLE [dbo].[RolePermission]  WITH CHECK ADD  CONSTRAINT [FK_ROLEPERM_RELATIONS_MANAGERR] FOREIGN KEY([RoleId])
REFERENCES [dbo].[ManagerRole] ([Id])
GO
ALTER TABLE [dbo].[RolePermission] CHECK CONSTRAINT [FK_ROLEPERM_RELATIONS_MANAGERR]
GO
ALTER TABLE [dbo].[RolePermission]  WITH CHECK ADD  CONSTRAINT [FK_ROLEPERM_RELATIONS_MENU] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Menu] ([Id])
GO
ALTER TABLE [dbo].[RolePermission] CHECK CONSTRAINT [FK_ROLEPERM_RELATIONS_MENU]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文章标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'ImageUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文章内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'ViewCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'Author'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'来源' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'SeoTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO关键字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'SeoKeyword'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'SeoDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'AddManagerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'AddTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'ModifyManagerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'ModifyTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否置顶' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'IsTop'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否轮播显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'IsSlide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否热门' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'IsRed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否发布' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'IsPublish'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article', @level2type=N'COLUMN',@level2name=N'IsDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文章' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Article'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ArticleCategory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ArticleCategory', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父分类ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ArticleCategory', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别ID列表(逗号分隔开)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ArticleCategory', @level2type=N'COLUMN',@level2name=N'ClassList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别深度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ArticleCategory', @level2type=N'COLUMN',@level2name=N'ClassLayer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ArticleCategory', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ArticleCategory', @level2type=N'COLUMN',@level2name=N'ImageUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类SEO标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ArticleCategory', @level2type=N'COLUMN',@level2name=N'SeoTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类SEO关键字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ArticleCategory', @level2type=N'COLUMN',@level2name=N'SeoKeywords'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类SEO描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ArticleCategory', @level2type=N'COLUMN',@level2name=N'SeoDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ArticleCategory', @level2type=N'COLUMN',@level2name=N'IsDeleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文章分类' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ArticleCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager', @level2type=N'COLUMN',@level2name=N'Avatar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager', @level2type=N'COLUMN',@level2name=N'NickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager', @level2type=N'COLUMN',@level2name=N'Mobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager', @level2type=N'COLUMN',@level2name=N'LoginCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后一次登录IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager', @level2type=N'COLUMN',@level2name=N'LoginLastIp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后一次登录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager', @level2type=N'COLUMN',@level2name=N'LoginLastTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager', @level2type=N'COLUMN',@level2name=N'AddManagerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager', @level2type=N'COLUMN',@level2name=N'AddTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager', @level2type=N'COLUMN',@level2name=N'ModifyManagerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager', @level2type=N'COLUMN',@level2name=N'ModifyTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否锁定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager', @level2type=N'COLUMN',@level2name=N'IsLock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager', @level2type=N'COLUMN',@level2name=N'IsDelete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'后台管理员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagerLog', @level2type=N'COLUMN',@level2name=N'ActionType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagerLog', @level2type=N'COLUMN',@level2name=N'AddManageId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagerLog', @level2type=N'COLUMN',@level2name=N'AddManagerNickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagerLog', @level2type=N'COLUMN',@level2name=N'AddTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagerLog', @level2type=N'COLUMN',@level2name=N'AddIp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagerLog', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作日志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagerLog'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagerRole', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagerRole', @level2type=N'COLUMN',@level2name=N'RoleName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色类型1超管2系管' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagerRole', @level2type=N'COLUMN',@level2name=N'RoleType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否系统默认' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagerRole', @level2type=N'COLUMN',@level2name=N'IsSystem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagerRole', @level2type=N'COLUMN',@level2name=N'AddManagerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagerRole', @level2type=N'COLUMN',@level2name=N'AddTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagerRole', @level2type=N'COLUMN',@level2name=N'ModifyManagerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagerRole', @level2type=N'COLUMN',@level2name=N'ModifyTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagerRole', @level2type=N'COLUMN',@level2name=N'IsDelete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagerRole', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'后台管理员角色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ManagerRole'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父菜单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'DisplayName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'IconUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'链接地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'LinkUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序数字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作权限（按钮权限时使用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'Permission'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'IsDisplay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否系统默认' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'IsSystem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'AddManagerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'AddTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'ModifyManagerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'ModifyTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'IsDelete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'后台管理菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RolePermission', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RolePermission', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RolePermission', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作类型（功能权限）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RolePermission', @level2type=N'COLUMN',@level2name=N'Permission'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色权限表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RolePermission'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'定时任务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TaskInfo'
GO
USE [master]
GO
ALTER DATABASE [CzarCms] SET  READ_WRITE 
GO
