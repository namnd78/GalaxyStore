USE [master]
GO
/****** Object:  Database [ProjectSWP391_2]    Script Date: 11/14/2022 9:26:38 PM ******/
CREATE DATABASE [ProjectSWP391_2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectSWP391', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DNAM\MSSQL\DATA\ProjectSWP391_2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjectSWP391_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DNAM\MSSQL\DATA\ProjectSWP391_2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProjectSWP391_2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectSWP391_2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectSWP391_2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectSWP391_2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectSWP391_2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectSWP391_2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectSWP391_2] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectSWP391_2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProjectSWP391_2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectSWP391_2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectSWP391_2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectSWP391_2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectSWP391_2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectSWP391_2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectSWP391_2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectSWP391_2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectSWP391_2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProjectSWP391_2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectSWP391_2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectSWP391_2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectSWP391_2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectSWP391_2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectSWP391_2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectSWP391_2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectSWP391_2] SET RECOVERY FULL 
GO
ALTER DATABASE [ProjectSWP391_2] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectSWP391_2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectSWP391_2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectSWP391_2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectSWP391_2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjectSWP391_2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProjectSWP391_2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProjectSWP391_2', N'ON'
GO
ALTER DATABASE [ProjectSWP391_2] SET QUERY_STORE = OFF
GO
USE [ProjectSWP391_2]
GO
/****** Object:  Table [dbo].[account]    Script Date: 11/14/2022 9:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[fullname] [nvarchar](255) NULL,
	[dob] [date] NULL,
	[phone] [nvarchar](20) NULL,
	[avatar] [nvarchar](255) NULL,
	[roleId] [int] NULL,
	[statusId] [int] NULL,
	[storeId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[accountStatus]    Script Date: 11/14/2022 9:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accountStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[blog]    Script Date: 11/14/2022 9:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[thumbnail] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[createdDate] [datetime] NOT NULL,
	[authorId] [int] NOT NULL,
	[topicId] [int] NOT NULL,
	[statusId] [int] NULL,
 CONSTRAINT [PK__blog__3213E83FB8609E95] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[blogStatus]    Script Date: 11/14/2022 9:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blogStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brand]    Script Date: 11/14/2022 9:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 11/14/2022 9:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contact]    Script Date: 11/14/2022 9:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[phone] [nvarchar](20) NULL,
	[message] [nvarchar](max) NULL,
	[date] [datetime] NULL,
	[statusId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactStatus]    Script Date: 11/14/2022 9:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 11/14/2022 9:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedback](
	[id] [int] NOT NULL,
	[productId] [int] NULL,
	[accountId] [int] NULL,
	[content] [nvarchar](max) NULL,
	[datecreated] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[help]    Script Date: 11/14/2022 9:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[help](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
	[content] [varchar](max) NULL,
	[image] [varchar](50) NULL,
	[created_date] [date] NULL,
	[tab] [nvarchar](50) NULL,
	[target] [nvarchar](50) NULL,
	[state] [nchar](10) NULL,
 CONSTRAINT [PK__help__3213E83F6BB508DF] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[image]    Script Date: 11/14/2022 9:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image] [nvarchar](255) NULL,
	[productId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 11/14/2022 9:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[accountId] [int] NULL,
	[stateId] [int] NULL,
	[address] [nvarchar](500) NULL,
	[transportId] [int] NULL,
	[orderTime] [datetime] NULL,
	[total] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderDetail]    Script Date: 11/14/2022 9:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NULL,
	[productId] [int] NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
	[discount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderStatus]    Script Date: 11/14/2022 9:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 11/14/2022 9:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[categoryId] [int] NULL,
	[brandId] [int] NULL,
	[releaseDate] [date] NULL,
	[description] [nvarchar](max) NULL,
	[specification] [nvarchar](max) NULL,
	[price] [money] NULL,
	[discount] [int] NULL,
	[quantity] [int] NULL,
	[stateId] [int] NULL,
	[storeId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 11/14/2022 9:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[state]    Script Date: 11/14/2022 9:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[state](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[store]    Script Date: 11/14/2022 9:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[store](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[address] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[topic]    Script Date: 11/14/2022 9:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[topic](
	[id] [int] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transport]    Script Date: 11/14/2022 9:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transport](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[price] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([id], [username], [password], [email], [fullname], [dob], [phone], [avatar], [roleId], [statusId], [storeId]) VALUES (1, N'namnd1', N'123456', N'nam2998nam@gmail.com', N'Nguyen Duy Nam', CAST(N'2000-01-01' AS Date), N'0386179544', N'default.png', 2, 2, 0)
INSERT [dbo].[account] ([id], [username], [password], [email], [fullname], [dob], [phone], [avatar], [roleId], [statusId], [storeId]) VALUES (2, N'namnd2', N'123456', N'nguyenduynam068@gmail.com', N'Tran Tuan Anh', CAST(N'2000-01-01' AS Date), N'0386179561', N'3.png', 2, 1, 1)
INSERT [dbo].[account] ([id], [username], [password], [email], [fullname], [dob], [phone], [avatar], [roleId], [statusId], [storeId]) VALUES (3, N'namnd3', N'123456', N'namndhe163785@fpt.edu.vn', N'Nguyen Duy Nam', CAST(N'2000-01-07' AS Date), N'1234567899', N'2.png', 3, 1, 0)
INSERT [dbo].[account] ([id], [username], [password], [email], [fullname], [dob], [phone], [avatar], [roleId], [statusId], [storeId]) VALUES (4, N'huynq1', N'123456', N'huynd@gmail.com', N'Nguyen Quang Huy', CAST(N'2000-01-11' AS Date), N'0351789439', N'default.png', 2, 2, 2)
INSERT [dbo].[account] ([id], [username], [password], [email], [fullname], [dob], [phone], [avatar], [roleId], [statusId], [storeId]) VALUES (5, N'huynq3', N'123456', N'huynd3@gmail.com', N'Nguyen Quang Huy', CAST(N'2000-11-11' AS Date), N'0351721449', N'default.png', 2, 1, 3)
INSERT [dbo].[account] ([id], [username], [password], [email], [fullname], [dob], [phone], [avatar], [roleId], [statusId], [storeId]) VALUES (6, N'huynq2', N'123456', N'huynd2@gmail.com', N'Nguyen Quang Huy', CAST(N'2000-11-11' AS Date), N'0331721449', N'default.png', 2, 1, 4)
INSERT [dbo].[account] ([id], [username], [password], [email], [fullname], [dob], [phone], [avatar], [roleId], [statusId], [storeId]) VALUES (7, N'namnd4', N'123456789', N'namndhe167785@fpt.edu.vn', N'Nguyen Nam', CAST(N'2002-09-29' AS Date), N'0386223163', N'4.png', 1, 1, 0)
INSERT [dbo].[account] ([id], [username], [password], [email], [fullname], [dob], [phone], [avatar], [roleId], [statusId], [storeId]) VALUES (8, N'longnv1', N'123456', N'abcd@gmail.com', N'Nguyen Van Long', CAST(N'2000-01-01' AS Date), N'0321579146', N'default.png', 1, 1, 5)
INSERT [dbo].[account] ([id], [username], [password], [email], [fullname], [dob], [phone], [avatar], [roleId], [statusId], [storeId]) VALUES (9, N'binhnv1', N'123456', N'abcsd@gmail.com', N'Nguyen Van Binh', CAST(N'2000-01-01' AS Date), N'0321579046', N'default.png', 1, 1, 7)
INSERT [dbo].[account] ([id], [username], [password], [email], [fullname], [dob], [phone], [avatar], [roleId], [statusId], [storeId]) VALUES (10, N'hoangnv1', N'123456', N'abcss@gmail.com', N'Nguyen Van Hoang', CAST(N'2000-01-11' AS Date), N'0321579556', N'default.png', 1, 1, 9)
INSERT [dbo].[account] ([id], [username], [password], [email], [fullname], [dob], [phone], [avatar], [roleId], [statusId], [storeId]) VALUES (11, N'aaaaa', N'123456', N'12245', N'a', CAST(N'2000-01-01' AS Date), N'1', N'0', 1, 1, 0)
INSERT [dbo].[account] ([id], [username], [password], [email], [fullname], [dob], [phone], [avatar], [roleId], [statusId], [storeId]) VALUES (12, N'asdasdasda', N'123456', N'a@a.com', N'qweqwe', CAST(N'2021-01-13' AS Date), N'1234567891', N'4.png', 1, 1, 0)
INSERT [dbo].[account] ([id], [username], [password], [email], [fullname], [dob], [phone], [avatar], [roleId], [statusId], [storeId]) VALUES (13, N'asdasdasdaa', N'123456', N'a@a1.com', N'qweqwe', CAST(N'2021-01-21' AS Date), N'1234567199', N'4.png', 1, 1, 0)
INSERT [dbo].[account] ([id], [username], [password], [email], [fullname], [dob], [phone], [avatar], [roleId], [statusId], [storeId]) VALUES (14, N'asasdaa', N'123456', N'a@a2.com', N'qweqwe', CAST(N'2021-01-22' AS Date), N'1231547199', N'4.png', 1, 1, 0)
INSERT [dbo].[account] ([id], [username], [password], [email], [fullname], [dob], [phone], [avatar], [roleId], [statusId], [storeId]) VALUES (15, N'bbbbbbb', N'123456', N'a@mma.com', N'qweqwe', CAST(N'2021-01-22' AS Date), N'1200567899', N'default.png', 1, 1, 0)
INSERT [dbo].[account] ([id], [username], [password], [email], [fullname], [dob], [phone], [avatar], [roleId], [statusId], [storeId]) VALUES (16, N'nvanb123', N'123456', N'a@nvanb.com', N'Nguyen Van B', CAST(N'2003-01-15' AS Date), N'0671975481', N'4.png', 2, 1, 0)
INSERT [dbo].[account] ([id], [username], [password], [email], [fullname], [dob], [phone], [avatar], [roleId], [statusId], [storeId]) VALUES (17, N'hoangnh', N'123456', N'hoang@gmail.com', N'Nguyen Huy Hoang', CAST(N'2002-01-08' AS Date), N'0789135478', N'2.png', 3, 1, 0)
INSERT [dbo].[account] ([id], [username], [password], [email], [fullname], [dob], [phone], [avatar], [roleId], [statusId], [storeId]) VALUES (18, N'namnd5', N'123456', N'tienhuy@gmail.com', N'Trần Tiến Huy', CAST(N'1999-01-03' AS Date), N'0571679452', N'default.png', 4, 1, 0)
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[accountStatus] ON 

INSERT [dbo].[accountStatus] ([id], [name]) VALUES (1, N'Active')
INSERT [dbo].[accountStatus] ([id], [name]) VALUES (2, N'Blocked')
SET IDENTITY_INSERT [dbo].[accountStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[blog] ON 

INSERT [dbo].[blog] ([id], [title], [thumbnail], [description], [content], [createdDate], [authorId], [topicId], [statusId]) VALUES (1, N'Move Over, Google: Samsung Wants to Reinvent the Phone Call, Too', N'https://www.cnet.com/a/img/resize/cc54b4ea7bf3867524004f4770dc39f56f843932/hub/2022/02/22/1c27500c-62d8-4746-a0a1-5ebb98cc230f/samsung-galaxy-s22-and-s22-plus-and-s22-ultra-compared-006.jpg?auto=webp&fit=crop&height=675&width=1200', N'Samsung''s Bixby virtual assistant will let you answer a phone call via text!', N'<p><img alt="The Galaxy S22 (left), Galaxy S22 Plus (middle) and Galaxy S22 Ultra (right)" src="https://www.cnet.com/a/img/resize/cc54b4ea7bf3867524004f4770dc39f56f843932/hub/2022/02/22/1c27500c-62d8-4746-a0a1-5ebb98cc230f/samsung-galaxy-s22-and-s22-plus-and-s22-ultra-compared-006.jpg?auto=webp&amp;fit=crop&amp;height=675&amp;width=1200" style="height:675px; width:1200px" /></p>

<p>The Galaxy S22 (left) Galaxy S22 Plus (middle) and Galaxy S22 Ultra (right).</p>

<p>Samsung is taking a page from the&nbsp;<a href="https://www.cnet.com/tech/mobile/google-pixel-7-review-slightly-better-pixel-599-price/">Google Pixel</a>&nbsp;playbook with its upcoming&nbsp;<a href="https://www.cnet.com/tech/services-and-software/samsung-touts-a-better-connected-smart-home-with-blockchain-security/">One UI 5</a>&nbsp;software update, which will be adding a new way to take calls on&nbsp;<a href="https://www.cnet.com/tech/mobile/best-samsung-galaxy-phone/">Galaxy phones</a>. The Bixby Text Call feature will bring the ability to answer a phone call by texting, with the Bixby assistant transcribing between voice and text on both ends.&nbsp;</p>

<p>The feature is only available in Korean to start, but it&#39;s part of Samsung&#39;s effort to make multitasking on Galaxy devices easier in the future -- a theme it&#39;s leaning into throughout One UI 5 to further differentiate its devices from Apple&#39;s and Google&#39;s. The company plans to expand into other languages, including English, next year.&nbsp;</p>

<p>Samsung isn&#39;t the only one experimenting with ways to enhance the basic phone-calling experience. Google has rolled out a suite of new phone-centric features to&nbsp;<a href="https://www.cnet.com/tech/mobile/google-pixel-tricks-to-make-your-phone-even-better/">Pixel devices</a>&nbsp;that can screen calls on your behalf, wait on hold for you and even predict wait times when dialing toll-free numbers. Bixby Text Call is Samsung&#39;s most prominent answer yet to Google&#39;s ambitions to modernize phone calls.&nbsp;</p>

<p>&quot;Bixby has evolved over many years as a specialized voice control agent,&quot; Sally Jeong, vice president and head of the Framework Research and Development Group for Samsung&#39;s Mobile Experience Business, said via a translator. &quot;And it requires a lot of training of Bixby so that it can actually identify and understand the voices during phone calls.&quot;</p>

<p>However, Samsung&#39;s approach differs from Google&#39;s. Rather than having Bixby take over a phone call, it assists with your call by transcribing between voice and text for situations where it might not be suitable to answer a phone call. It&#39;s essentially blending texting and phone calls together.&nbsp;</p>

<p><img alt="Bixby on the Galaxy S10" src="https://www.cnet.com/a/img/resize/b4afe1c687259d6c219993ebd9cfef056ea809ca/hub/2019/03/01/dc0f0868-e1a9-4219-93e9-bc1929a2ea89/bixby-s10.jpg?auto=webp&amp;width=1200" style="height:800px; width:1200px" /></p>

<p>Samsung&#39;s Bixby, as seen here on the Galaxy S10, has had limited success compared to other virtual assistants like Alexa and Google Assistant.</p>

<p>Jason Cipriani/CNET</p>

<p>Part of why this feature is only launching now, roughly five years after Bixby&#39;s debut, is because the technology has reached a point where it can accurately understand colloquial speech. Differentiating between speech being received through the phone&#39;s microphone and the caller on the other end is another technical challenge that Samsung had to perfect before launching this feature.</p>

<p>&quot;We have identified phone calls as the most effective or useful scenario for leveraging the technology,&quot; Jeong said in reference to how Bixby&#39;s speech recognition has progressed. &quot;Because as you know, we all have experienced the pain points of having to leave the room to take an unexpected phone call.&quot;</p>

<p>When using Bixby Text Call, you&#39;ll be able to type a text message to answer an incoming call, which Bixby will then translate to speech for the caller on the other end. The caller will hear an automated message alerting them that the call is being answered through Bixby. After that, Bixby will translate the caller&#39;s speech to text for the recipient. The feature works on-device, meaning it&#39;s not sent to the cloud for processing, and the conversation transcript is saved in the Samsung call app. The audio itself is deleted right after the recognition process takes place, Samsung says.</p>

<p>Samsung sees an opportunity to further expand this technology in the future. Jeong said Samsung intends to eventually have Bixby screen for spam calls, similar to&nbsp;<a href="https://www.cnet.com/tech/services-and-software/googles-call-screen-feature-can-tell-spam-callers-to-get-lost-heres-how/">how the Google Assistant does this</a>&nbsp;on Pixel phones in the US.&nbsp;</p>

<p><img alt="Call Screen on Pixel phones" src="https://www.cnet.com/a/img/resize/2dc8f62e426c0432d69929fe158ad92fed57c6c5/hub/2020/10/09/961006c4-d6cb-4d7d-905d-fe1c7fe7d839/call-screen.png?auto=webp&amp;width=270" style="height:572px; width:270px" /></p>

<p>The Bixby spam filtering feature could be similar to the one seen on Pixel phones, which can intercept potential spam calls before they reach you.</p>

<p>Google</p>

<p>&quot;Filtering spam calls will definitely be one direction that we&#39;ll explore in addition to using your speech to turn it into text and vice versa,&quot; Jeong said, although she couldn&#39;t provide a timeline.&nbsp;</p>

<p>Samsung&#39;s Bixby voice assistant&nbsp;<a href="https://www.cnet.com/tech/mobile/samsung-bixby-galaxy-s8-ai-digital-voice-assistant/">launched in 2017</a>, but it hasn&#39;t gained as much traction as Apple&#39;s Siri, the Google Assistant and Amazon Alexa. A 2020 report from&nbsp;<a href="https://voicebot.ai/2020/11/05/voice-assistant-use-on-smartphones-rise-siri-maintains-top-spot-for-total-users-in-the-u-s/" target="_blank">Voicebot.ai</a>&nbsp;examining voice assistant adoption among US adults found that Samsung&#39;s Bixby only accounts for 6.7% of the phone-based voice assistant market, while Siri leads the pack at 45.1%. The Google Assistant placed in second with 29.9%, while Amazon&#39;s Alexa claimed 18.3%.&nbsp;</p>

<p>But Bixby usage has grown since 2018. That same report indicates that Samsung&#39;s market share jumped from 4.7% in 2018 to 6.7% in 2020, while Apple and Google&#39;s respective slices had slightly shrunk.</p>

<p>It remains to be seen whether features like Bixby Text Call will help bring Samsung&#39;s digital helper up to speed with alternatives from Apple and Google. But what is clear is that Apple, Google and Samsung are using their virtual assistants in attempts to improve the phone-calling experience.&nbsp;</p>

<p>Google, for example, just updated its Direct My Call feature, which uses the Google Assistant to transcribe automated phone menus. With&nbsp;<a href="https://www.cnet.com/tech/mobile/google-pixel-7-review-slightly-better-pixel-599-price/">the Pixel 7</a>, the Google Assistant will transcribe those menus before they&#39;re spoken. Apple also added the ability to have Siri hang up a call hands-free and automatically send texts without requiring a confirmation in iOS 16.</p>
', CAST(N'2022-10-12T10:31:31.317' AS DateTime), 18, 1, 2)
INSERT [dbo].[blog] ([id], [title], [thumbnail], [description], [content], [createdDate], [authorId], [topicId], [statusId]) VALUES (2, N'Don''t Drop Your Old Pixel for the Pixel 7 Before Reading Our Comparison', N'https://www.cnet.com/a/img/resize/ac541379cc157cdf6406b3e26e6db443487dcf7e/hub/2022/10/11/aae85cab-f3c9-48f9-978e-b97e3ed5bc43/pixel-7-pro-watch-lanxon-promo-52.jpg?auto=webp&fit=crop&height=173&width=308', N'Yes, the Pixel 7 and Pro models have some new advancements, but one benefit on older Pixel phones is worth noting.', N'<p>Google&#39;s flagship&nbsp;<a href="https://www.cnet.com/tech/mobile/google-pixel-7-review-slightly-better-pixel-599-price/">Pixel 7</a>&nbsp;and&nbsp;<a href="https://www.cnet.com/tech/mobile/pixel-7-pro-review-googles-best-flagship-phone-gets-better/">Pixel 7 Pro</a>&nbsp;phones are here, and both carry exclusive new features that may be enticing to Pixel phone owners who may be wondering if it&#39;s time to upgrade.&nbsp;</p>

<p>Both the $599 (&pound;599, AU$999) Pixel 7 and $899 (&pound;849, AU$1,299) Pixel 7 Pro include the&nbsp;<a href="https://www.cnet.com/tech/mobile/googles-tensor-g2-chip-is-key-to-many-pixel-7-ai-powered-abilities/">Tensor G2</a>&nbsp;chip, which is the second-edition of Google&#39;s in-house processor. They also offer new software features like Photo Unblur for resurrecting out-of-focus pictures and call quality improvements like the upcoming Clear Calling for filtering out background noise.</p>

<p>However, a big benefit for earlier Pixel owners is that Google offers at least three years of software and security updates, and certain older models even include unlimited cloud storage for pictures using Google Photos&#39; Storage Saver quality. That last benefit isn&#39;t offered on the Pixel 7 and 7 Pro and gives anyone with an older Pixel a lot to consider before upgrading.</p>

<p>To help you decide, we compare what the Pixel 7 and 7 Pro are packing to each previous Pixel phone generation while taking into consideration any remaining perks that could be lost from upgrading.</p>

<p><a href="https://www.dpbolvw.net/click-3586864-15356972?sid=cn-___COM_CLICK_ID___-dtp___OPTOUT___" target="_blank"><img alt="" src="https://www.cnet.com/a/img/resize/641389b4545212d61a8d20ef4e1efaf6588841e4/hub/2022/10/05/1324201e-dee1-4e2a-9a85-238bb8aed9cd/pixel-7-obsidian-gold.jpg?auto=webp&amp;fit=crop&amp;height=362&amp;width=644" style="height:362px; width:644px" /></a></p>

<h2>Pixel 7 and 7 Pro vs. Pixel 6A, 6, 6 Pro</h2>

<p>The Pixel 7 and 7 Pro have a slightly upgraded design, the new Tensor G2 processor and camera improvements. A free VPN service will eventually come to the Pixel 7 and 7 Pro, too. Both phones run Android 13 and also support face unlock. But if you already have a&nbsp;<a href="https://www.cnet.com/tech/mobile/google-pixel-6-review/">Pixel 6</a>, it&#39;s too soon to upgrade.</p>

<p>The Pixel 7&#39;s upgrades are appreciated but incremental. Unless you can get a new Pixel for free through a trade-in program, the differences aren&#39;t drastic enough to justify spending money for a year-over-year upgrade.</p>

<p>The Pixel 6 family runs on the first-generation Tensor processor, which is still fast enough for most everyday tasks. Google also issued software updates to fix certain bugs some users experienced with the fingerprint sensor and screen earlier this year.</p>

<p>The 7 and 7 Pro&#39;s screen sizes are almost exactly the same as on last year&#39;s devices, except the Pixel 7&#39;s 6.3-inch display is slightly smaller than the 6.4-inch one on the Pixel 6. Both the Pixel 7 Pro and&nbsp;<a href="https://www.cnet.com/tech/mobile/pixel-7-pro-review-googles-best-flagship-phone-gets-better/">6 Pro</a>&nbsp;have 6.7-inch screens.</p>

<p>The new phones also have very similar camera systems to last year&#39;s Pixel 6 and 6 Pro. The Pixel 7 and 7 Pro both have a 50-megapixel main camera and 12-megapixel ultra wide camera, similar to the Pixel 6 and 6 Pro. The high-end Pixel 7 Pro, like last year&#39;s 6 Pro, also has a 48-megapixel telephoto camera.&nbsp;</p>

<p><img alt="The Pixel 6 and Pixel 6 Pro" src="https://www.cnet.com/a/img/resize/e41f91fb3484877447226e6e38234c48456842cc/hub/2021/10/25/192ac3f1-54f3-41c2-81d8-9c90c365e04a/pixel-6-pro-cnet-review-hoyle-39.jpg?auto=webp&amp;width=1200" style="height:800px; width:1200px" /></p>

<p>The Pixel 6 and Pixel 6 Pro.</p>

<p>&nbsp;</p>

<p>The biggest camera change you get with the Pixel 7 Pro is an improved zoom that is longer and has better image quality. Google made some behind-the-scenes improvements to the way the image sensor crops the scene when zooming. The Pixel 7 Pro also fuses data from the main and telephoto lenses when zooming between 2.5x and 5x for better clarity.</p>

<p>Both phones get a longer digital zoom range of 8x for the regular Pixel 7 and 30x for the 7 Pro that let you frame your subject tighter. Compare that to the 7x and 20x magnifications for the Pixel 6 and 6 Pro respectively.</p>

<p>Both new phones also have a tool called Photo Unblur for sharpening older photos, even pictures taken with other phones and cameras. Photo Unblur is exclusive to the Pixel 7 and 7 Pro since it requires the new G2 processor and builds off the Pixel 6 and 6 Pro&#39;s Face Unblur tool.</p>

<p>The Pixel 7 Pro also has a new macro photography mode for taking closeup shots, and both new Pixels have a cinematic video mode that blurs the background much like Portrait mode for photos.</p>

<p><img alt="Google''s Pixel 6A phone lock screen" src="https://www.cnet.com/a/img/resize/ccacee8d2c3032678754631ebd80c9e74ea2a3e9/hub/2022/07/18/e4c35b56-b93a-4927-95a5-1d716c962f32/google-pixel-6a-4135.jpg?auto=webp&amp;width=1200" style="height:675px; width:1200px" /></p>

<p>Google&#39;s Pixel 6A costs $449.</p>

<p>&nbsp;</p>

<p>These are commendable improvements, but they aren&#39;t significant enough to justify an upgrade. That&#39;s especially true since Google upgrades older phones with new features over time. The Pixel 6 and 6 Pro, for example, will get new features such as Clear Calling, Guided Frame (the feature that provides auditory and haptic cues to help those who are blind or low vision take selfies) and the ability to transcribe audio messages.&nbsp;</p>

<p>The Pixel 7 and 7 Pro each have larger screens and superior cameras compared to the 6.1-inch&nbsp;<a href="https://www.cnet.com/tech/mobile/google-pixel-6a-review-the-best-budget-pixel-yet/">Pixel 6A</a>, which has a 12.2-megapixel main camera and 12-megapixel ultrawide sensor. But the Pixel 6A just launched in July at $449, meaning if you purchased one it&#39;s still likely in great condition. Unless you really need a sharper camera and a larger screen, it&#39;s definitely worth holding onto the Pixel 6A for another year.</p>

<p><strong>The bottom line</strong>: Don&#39;t upgrade yet if you have a Pixel 6, 6A or 6 Pro. These phones are still fairly new and have plenty to offer.</p>

<p><img alt="Google Pixel 5" src="https://www.cnet.com/a/img/resize/8372cb42f5700a761f7114de89cc4d333be1ac85/hub/2020/10/14/1ba0f9e0-c86c-4938-8636-5b32e6b46839/00000img-00000-burst20201011020441413-cover.jpg?auto=webp&amp;width=1200" style="height:675px; width:1200px" /></p>

<p>The Google Pixel 5.</p>

<p>&nbsp;</p>

<h2>Pixel 7 and 7 Pro vs. Pixel 5 and 5A</h2>

<p>There&#39;s a lot that&#39;s different between the&nbsp;<a href="https://www.cnet.com/tech/mobile/google-pixel-5-review-new-flagship-smartphone-hasnt-pulled-ahead-rivals/">Pixel 5</a>&nbsp;generation and the Pixel 7 lineup. Google&#39;s new Pixel phones have larger screens, bigger batteries, more advanced cameras, Google&#39;s Tensor G2 processor and a new glass and aluminum design. Whether those changes justify an upgrade, however, depends on your phone&#39;s condition and what matters to you most in a smartphone.&nbsp;</p>

<p>The Pixel 5 falls into a sort of middle ground that makes the question of whether it&#39;s time to upgrade a difficult one to answer. The Pixel 7&#39;s changes are dramatic enough to make a noticeable difference, particularly when it comes to the design and camera. But the Pixel 5 is also new enough to feel fast and relevant for at least another year or two.</p>

<p>As is typically the case with today&#39;s new smartphones, the Pixel 7&#39;s biggest upgrades can be found in the camera. The Pixel 7 and 7 Pro each have a higher-resolution 50-megapixel main sensor compared to the 12.2-megapixel main sensors found on the Pixel 5 and&nbsp;<a href="https://www.cnet.com/tech/mobile/google-pixel-5a-review-snappy-performance-and-design/">5A</a>. But what might be more significant are the new camera modes and tools powered by Google&#39;s Tensor processor, which you can&#39;t get on the Pixel 5 and 5A since those phones run on Qualcomm processors.</p>

<p>The Pixel 7 and 7 Pro have features like Magic Eraser, which lets you remove unwanted objects from the background of a photo, Face Unblur or keeping faces crisp even when the subject of a photo is moving and Real Tone, which portrays different skin tones and complexions more equitably.&nbsp;</p>

<p><img alt="Google Pixel 5A" src="https://www.cnet.com/a/img/resize/f5a3fef2ce59e5831de18885132aeea1bb43d35d/hub/2021/08/16/e6206c10-666f-497a-b741-fb70b672edca/google-pixel-5a-cnet-review-2021-15.jpg?auto=webp&amp;width=1200" style="height:801px; width:1200px" /></p>

<p>The Google Pixel 5A.</p>

<p>&nbsp;</p>

<p>If you&#39;re upgrading from the standard 6.1-inch Pixel 5, you&#39;ll also get a larger screen whether you choose the 6.3-inch Pixel 7 or 6.7-inch Pixel 7 Pro. The Pixel 5A, however, is the same size as the Pixel 7.&nbsp;</p>

<p>There are several other smaller changes that come together to make the Pixel 7 generation feel new and different. The Pixel 7 and 7 Pro have a refreshed design with more durable Gorilla Glass Victus back panels and metal camera bars stretching across the device. Overall the 7 and 7 Pro feel more premium than the Pixel 5 and 5A. The new phones also have an in-screen fingerprint reader compared to the rear-mounted one on the Pixel 5.&nbsp;</p>

<p>But the best time to upgrade is when you feel like you need it. If your Pixel 5 or 5A is in good condition, you won&#39;t miss out on anything critical by holding onto your device for a while longer. Google supports the Pixel 5 with new Android software versions and security updates until at least October 2023, while the Pixel 5A will get the same support through August 2024. The Pixel 5 is also the last Pixel phone to get unlimited cloud storage for pictures at the Storage Saver quality, but the Pixel 5A does not have this benefit.</p>

<p><strong>The bottom line:&nbsp;</strong>If your Pixel 5 or 5A is still working well, you can hold onto it for another year. But there&#39;s also enough that&#39;s new with the Pixel 7 lineup to justify an upgrade if you&#39;re in the market for a new phone.</p>

<p><img alt="Google Pixel 4" src="https://www.cnet.com/a/img/resize/c9c974b795802c7eccdeef1d7a84fd272e93f13c/hub/2020/06/01/8117e839-19a4-47c7-9d84-bd75ee4d1f91/hoyle-promo-google-pixel-4.jpg?auto=webp&amp;width=1200" style="height:800px; width:1200px" /></p>

<p>Google&#39;s Pixel 4.</p>

<p>&nbsp;</p>

<h2>Pixel 7 and Pixel 7 Pro vs. Pixel 4A, 4A with 5G, 4 and 4 XL</h2>

<p>The Pixel 7 and Pixel 7 Pro arrive just as the&nbsp;<a href="https://www.cnet.com/reviews/google-pixel-4-review-great-camera-astrophotography-high-price-battery-life-review/">Pixel 4</a>&nbsp;and&nbsp;<a href="https://www.cnet.com/reviews/google-pixel-4-xl-review-same-pros-cons-pixel-4-camera-battery-price-review/">4 XL</a>&nbsp;hit the end of their guaranteed software and security update timeline. The 4 and 4 XL&#39;s update to&nbsp;<a href="https://blog.google/products/android/android-13/" target="_blank">Android 13</a>&nbsp;will be the final major software update planned for the phones. And there&#39;s no guarantee that Google will continue to provide security updates to either device, which could mean that the phones&nbsp;<a href="https://www.cnet.com/tech/mobile/is-that-old-used-refurbished-android-phone-safe-use-what-you-should-know-security/">become vulnerable to exploits</a>&nbsp;as time goes on.</p>

<p>That&#39;s not all bad, as you do get&nbsp;<a href="https://www.cnet.com/tech/services-and-software/android-13-every-new-feature-revealed-at-google-io/">Android 13 features</a>&nbsp;like the Material You interface, the redesigned music player, improved continuity such as copying and pasting content between devices and additional security features like automatically deleting your phone&#39;s clipboard history. The Pixel 4 and 4 XL also both retain Google&#39;s unlimited cloud storage for photos and videos benefit, as long as that media is uploaded in Storage Saver quality.</p>

<p>Note that&nbsp;<a href="https://www.cnet.com/tech/mobile/google-pixel-4a-in-depth-review-budget-phone-2020-best-phone-camera-for-the-cost/">Pixel 4A</a>&nbsp;and&nbsp;<a href="https://www.cnet.com/tech/mobile/google-pixel-4a-5g-specs-review-499-dollars-smartphone-affordable-5g-is-here/">4A with 5G</a>&nbsp;owners will continue to get updates until August 2023 and November 2023, respectively, so there&#39;s still plenty of time and support left for both.</p>

<p>On the hardware side, moving to the Pixel 7 or 7 Pro is a leap. The most noticeable trade-up will be with the phone&#39;s camera, in which you&#39;ll move up from the Pixel 4&#39;s 12.2-megapixel main camera and 16-megapixel telephoto to the 50-megapixel main camera and 12-megapixel ultrawide camera that&#39;s available on both the Pixel 7 and 7 Pro. If you step up to the 7 Pro, you also get a 48-megapixel telephoto camera. This comparison is largely the same for the Pixel 4A and 4A 5G, since both have the same main 12.2-megapixel camera as the 4 and 4 XL.</p>

<p><img alt="Pixel 4A 5G" src="https://www.cnet.com/a/img/resize/2b04317c01d4ed7a644783ecc9580fc8f597f164/hub/2020/10/14/a0abcd1f-8bed-4f9d-b486-78b1f3f33f55/img-20201009-031426.jpg?auto=webp&amp;width=1200" style="height:675px; width:1200px" /></p>

<p>Google&#39;s Pixel 4A with 5G.</p>

<p>&nbsp;</p>

<p>Upgrading from the Pixel 4 series -- which run on the Qualcomm Snapdragon 855 processor -- to Pixel 7 series&#39; Tensor G2 chip brings a wealth of AI-powered photography enhancements like Photo Unblur and Real Tone. The Pixel 4A and 4A 5G with their less powerful Snapdragon 730G and 765G chips, respectively, also pale in comparison to the new Tensor G2 chip.</p>

<p>Other than losing the photo storage benefit, upgrading from the 4 and 4 XL also means you say goodbye to the phones&#39; Motion Sense features. At the time, the 4 and 4 XL touted a sensor chip named Soli, which allowed for facial recognition similar to Apple&#39;s Face ID along with other gestures meant for controlling the phone. The features proved unpopular though, and largely disappeared from later Pixel phones. The Pixel 7 does introduce Face Unlock, but it&#39;s not as secure as Apple&#39;s Face ID nor what was previously used on the Pixel 4 series.</p>

<p><strong>The bottom line:</strong>&nbsp;If you have the Pixel 4 and 4 XL, the end of software and security updates means it&#39;s a great time to upgrade to the Pixel 7 or 7 Pro. You&#39;ll see big improvements to the phone&#39;s power, camera performance and software. If you aren&#39;t ready to give up Pixel 4 exclusives like Motion Sense or the unlimited cloud storage, hold onto your phone a bit longer.</p>

<p>If you have the Pixel 4A or 4A 5G, you have roughly a year left of software and security updates for each phone, which should give plenty of time to wind down your time with this phone. If you choose to upgrade to the 7, 7 Pro or even the Tensor-equipped $449 Pixel 6A, you&#39;ll see a lot of noticeable improvements to the phone experience.</p>

<p><img alt="The Pixel 3 and Pixel 3 XL" src="https://www.cnet.com/a/img/resize/8291e8151f8a3c8e87e31fcb891716d8b525ca01/hub/2019/06/18/eb891ca1-e52d-4d12-a9e1-d82cbad20f3f/google-pixel-3-google-pixel-3xl-3.jpg?auto=webp&amp;width=1200" style="height:801px; width:1200px" /></p>

<p>Google&#39;s Pixel 3 and 3 XL.</p>

<p>&nbsp;</p>

<h2>Pixel 7 and Pixel 7 Pro vs. Pixel 3A and earlier</h2>

<p>If you are still holding onto the&nbsp;<a href="https://www.cnet.com/products/google-pixel-3a/">Pixel 3A</a>&nbsp;or earlier, it&#39;s definitely time to move up to a newer Pixel phone if you can. The&nbsp;<a href="https://www.cnet.com/reviews/google-pixel-3-2019-review/">Pixel 3</a>&nbsp;and&nbsp;<a href="https://www.cnet.com/reviews/google-pixel-3-xl-review/">3 XL&#39;s</a>&nbsp;software and security updates ended in 2021, and the&nbsp;<a href="https://www.cnet.com/products/google-pixel-3a/">Pixel 3A</a>&nbsp;and&nbsp;<a href="https://www.cnet.com/products/google-pixel-3a-xl/">3A XL</a>&nbsp;each received their final update in September, according to&nbsp;<a href="https://9to5google.com/2022/09/06/pixel-3a-final-update/" target="_blank">9to5Google</a>. All four of the Pixel 3 phones can run Android 12, but won&#39;t be receiving Android 13. While the phones do retain the benefit of unlimited cloud storage for photos and videos uploaded at Storage Saver quality, the phones could become vulnerable to exploits or similar issues.</p>

<p>If you don&#39;t want to spend $599 or up for the Pixel 7, remember that you can consider the $449 Pixel 6A, which includes many of the best software features seen on the Pixel 6 and Pixel 7. You might also be able to catch the Pixel 6 and Pixel 6 Pro on sale, now that both phones are replaced by the Pixel 7 series.</p>

<p><img alt="Google Pixel and Pixel XL" src="https://www.cnet.com/a/img/resize/a42a88776bda5a5ad3c1506de930ea4ea7640db9/hub/2016/10/14/48399c27-0269-4d07-b725-e0507b84c6af/google-pixel-xl-9066-012.jpg?auto=webp&amp;width=1200" style="height:800px; width:1200px" /></p>

<p>The original Google Pixel and Pixel XL.</p>

<p>&nbsp;</p>

<p>One interesting note for those still holding onto the original&nbsp;<a href="https://www.cnet.com/reviews/google-pixel-phone-review/">Google Pixel</a>&nbsp;and&nbsp;<a href="https://www.cnet.com/reviews/google-pixel-xl-review/">Pixel XL</a>&nbsp;from 2016: Those two phones are the only Pixel phones to retain unlimited cloud storage for photos and videos in Original quality. As a result, you might want to continue holding onto the phone as either a dedicated camera or -- if you are particularly patient and passionate about making the most of this perk -- consider using the Pixel as a way to upload media from other devices. A proposed method using a number of different file transfer apps was&nbsp;<a href="https://www.reddit.com/r/GooglePixel/comments/l9m6nk/how_to_use_og_pixel_as_an_unlimited_google_photos/" target="_blank">posted on Reddit</a>, which appears to serve the purpose of transferring photos over to the Pixel for uploading. CNET hasn&#39;t verified nor endorses the method -- again, the phone no longer receives security updates. But if you have the phone on hand and it still turns on, it could be a fun experiment for occasional use.</p>

<p><strong>The bottom line:</strong>&nbsp;The Pixel 3 series will no longer receive software or security updates, making the phones a potential liability moving forward. While the phones are running Android 12 and will continue to otherwise function, it&#39;s best to move onto a newer phone as soon as you can.</p>
', CAST(N'2022-10-13T10:36:31.317' AS DateTime), 18, 2, 2)
INSERT [dbo].[blog] ([id], [title], [thumbnail], [description], [content], [createdDate], [authorId], [topicId], [statusId]) VALUES (3, N'Pokemon Go Giratina Raid Guide: Best Counters, Weaknesses and Moveset', N'https://www.cnet.com/a/img/resize/dee3337e1582ae5395998fda43bedf1bf777d1db/hub/2021/09/27/cfb8f318-b5f8-4fb2-ae6f-e847fae8b54a/pokemon-go-altered-giratina.jpg?auto=webp&fit=crop&height=675&width=1200', N'Giratina is back for Pokemon Go''s Halloween event. Here are some tips to help you beat and catch it.', N'<p><img alt="pokemon-go-altered-giratina" src="https://www.cnet.com/a/img/resize/dee3337e1582ae5395998fda43bedf1bf777d1db/hub/2021/09/27/cfb8f318-b5f8-4fb2-ae6f-e847fae8b54a/pokemon-go-altered-giratina.jpg?auto=webp&amp;fit=crop&amp;height=675&amp;width=1200" style="height:675px; width:1200px" /></p>

<p>Pokemon Go&#39;s&nbsp;<a href="https://www.cnet.com/tech/gaming/pokemon-go-halloween-2022-event-featured-pokemon-bonuses-and-more/">Halloween 2022 event</a>&nbsp;is now underway, and it&#39;s brought back a legendary ghost Pokemon. Giratina is appearing in raids through the end of the month, giving you another chance to catch both its Altered and Origin forms. The former will be appearing during the first part of the event, while the latter will be available during the second part.</p>

<p>Here are some more tips to help you beat and catch Giratina before it leaves raids again.</p>

<h2>Giratina weaknesses</h2>

<p>Regardless of which form it takes, Giratina is a ghost/dragon type, which makes it vulnerable to&nbsp;<strong>dark</strong>,&nbsp;<strong>fairy</strong>,&nbsp;<strong>ice</strong>&nbsp;and other&nbsp;<strong>ghost</strong>&nbsp;and&nbsp;<strong>dragon</strong>&nbsp;Pokemon. Dark and fairy types in particular will be the most effective against Giratina, as they resist ghost- and dragon-type attacks, respectively, which will help them last longer in battle.&nbsp;</p>

<p>Dragon and ghost Pokemon will also be helpful against Giratina, as they&#39;re some of the best attackers in the game. However, keep in mind that these Pokemon are weak against their own types, so any that you use against Giratina will take super-effective damage in return.</p>

<h2>Best Giratina counters</h2>

<p>Here are some recommended Pokemon and moves to use against Giratina:</p>

<p><strong>Dark</strong></p>

<ul>
	<li><strong>Mega Houndoom:</strong>&nbsp;Snarl, Crunch.</li>
	<li><strong>Tyranitar:</strong>&nbsp;Bite, Crunch.</li>
	<li><strong>Absol:</strong>&nbsp;Snarl, Dark Pulse.</li>
	<li><strong>Weavile:</strong>&nbsp;Snarl, Avalanche.</li>
	<li><strong>Darkrai:</strong>&nbsp;Snarl, Dark Pulse.</li>
	<li><strong>Zoroark:</strong>&nbsp;Snarl, Foul Play.</li>
</ul>

<p><strong>Ice</strong></p>

<ul>
	<li><strong>Mamoswine:</strong>&nbsp;Powder Snow, Avalanche.</li>
	<li><strong>Galarian Darmanitan:</strong>&nbsp;Ice Fang, Avalanche.</li>
</ul>

<p><strong>Fairy</strong></p>

<ul>
	<li><strong>Clefable:</strong>&nbsp;Charm, Dazzling Gleam.</li>
	<li><strong>Alolan Ninetales:</strong>&nbsp;Charm, Dazzling Gleam.</li>
	<li><strong>Granbull:</strong>&nbsp;Charm, Play Rough.</li>
	<li><strong>Gardevoir:</strong>&nbsp;Charm, Dazzling Gleam.</li>
	<li><strong>Togekiss:</strong>&nbsp;Charm, Dazzling Gleam.</li>
	<li><strong>Sylveon:</strong>&nbsp;Charm, Moonblast.</li>
</ul>

<p><strong>Ghost</strong></p>

<ul>
	<li><strong>Mega Gengar:</strong>&nbsp;Lick, Shadow Ball.</li>
	<li><strong>Mega Banette:</strong>&nbsp;Hex, Shadow Ball.</li>
	<li><strong>Origin Forme Giratina:</strong>&nbsp;Shadow Claw, Shadow Ball.</li>
	<li><strong>Chandelure:</strong>&nbsp;Hex, Shadow Ball.</li>
</ul>

<p><strong>Dragon</strong></p>

<ul>
	<li><strong>Dragonite:</strong>&nbsp;Dragon Tail, Draco Meteor.</li>
	<li><strong>Salamence:</strong>&nbsp;Dragon Tail, Outrage.</li>
	<li><strong>Rayquaza:</strong>&nbsp;Dragon Tail, Outrage.</li>
	<li><strong>Garchomp:</strong>&nbsp;Dragon Tail, Outrage.</li>
	<li><strong>Palkia:</strong>&nbsp;Dragon Tail, Draco Meteor.</li>
	<li><strong>Reshiram:</strong>&nbsp;Dragon Breath, Draco Meteor.</li>
	<li><strong>Zekrom:</strong>&nbsp;Dragon Breath, Outrage.</li>
</ul>

<h2>Best moveset for Giratina</h2>

<p>Altered Forme Giratina&#39;s stats are geared more toward defense than Origin Forme Giratina, so this form isn&#39;t quite as strong. That said, it can still pack a punch, particularly when it uses ghost- and dragon-type attacks. To make the most out of the monster offensively, you&#39;ll want to teach it the Fast Attack&nbsp;<strong>Shadow Claw</strong>&nbsp;and the Charged Attack&nbsp;<strong>Dragon Claw</strong>.</p>

<p>Altered Forme Giratina will be available in raids until Oct. 27, when it&#39;ll be replaced by Origin Forme Giratina. You can catch up on all the other events and activities going on in the game this month in our Pokemon Go&nbsp;<a href="https://www.cnet.com/tech/gaming/pokemon-go-october-2022-events-halloween-litwick-community-day-and-more/">October events roundup</a>.</p>

<h3>More on Pokemon Go</h3>

<ul>
	<li><a href="https://www.cnet.com/tech/gaming/pokemon-go-beginners-guide-how-to-play-how-to-get-candy-and-more-tips/">Pokemon Go Beginner&#39;s Guide</a></li>
	<li><a href="https://www.cnet.com/tech/gaming/pokemon-go-mega-banette-raid-guide-best-counters-weaknesses-and-moveset/">Pokemon Go Mega Banette Raid Guide: Best Counters, Weaknesses and Moveset</a></li>
	<li><a href="https://www.cnet.com/tech/gaming/pokemon-gos-november-community-day-will-add-ursaluna/">Pokemon Go&#39;s November Community Day Will Add Ursaluna</a></li>
	<li><a href="https://www.cnet.com/tech/gaming/pokemon-home-how-to-transfer-your-pokemon-between-games/">Pokemon Home: How to Transfer Your Pokemon Between Games</a></li>
</ul>
', CAST(N'2022-10-13T10:10:31.317' AS DateTime), 18, 4, 3)
INSERT [dbo].[blog] ([id], [title], [thumbnail], [description], [content], [createdDate], [authorId], [topicId], [statusId]) VALUES (6, N'Epic Games Accuses Google of Destroying Evidence as Lawsuit Continues', N'https://www.cnet.com/a/img/resize/b5935978c1f75acc7bd9b87cc61117f71df383dd/hub/2022/04/27/2da2f37f-1758-4bcb-a612-1ab6eb678aef/fortnite-logo-2022-492.jpg?auto=webp&fit=crop&height=675&width=1200', N'Fortnite''s parent company is asking a judge to sanction Google, saying it intentionally deleted conversations germane to the case.', N'<p><img alt="Fortnite logo" src="https://www.cnet.com/a/img/resize/b5935978c1f75acc7bd9b87cc61117f71df383dd/hub/2022/04/27/2da2f37f-1758-4bcb-a612-1ab6eb678aef/fortnite-logo-2022-492.jpg?auto=webp&amp;fit=crop&amp;height=675&amp;width=1200" style="height:675px; width:1200px" /></p>

<p>&nbsp;</p>

<p>Fortnite publisher Epic Games has accused Google of deleting employee chats that it alleges would have served as evidence in the&nbsp;<a href="https://www.cnet.com/tech/mobile/fortnite-maker-epic-games-says-google-pushed-competitors-not-to-launch-app-stores/">continuing lawsuit</a>&nbsp;between the companies.</p>

<p>In a new court filing, Epic alleges Google employees used Google Chat to communicate and intentionally let those conversations be wiped after 24 hours, which is the default setting.&nbsp;</p>

<p>&quot;Any administrator of Google Chats -- an application developed by Google -- could have changed this default setting at any point for all custodians. Google has never claimed otherwise. But Google chose not to change the setting,&quot; the filing read. The filing was reported earlier Friday&nbsp;<a href="https://twitter.com/lutherlowe/status/1580934729024802818" target="_blank">by</a>&nbsp;Luther Lowe, senior vice president of public policy for Yelp (which&nbsp;<a href="https://www.cnet.com/tech/services-and-software/yelp-takes-aim-at-google-with-antitrust-complaint-in-the-eu/">has had</a>&nbsp;its&nbsp;<a href="https://www.cnet.com/news/yelp-ceo-yep-google-can-be-pretty-evil/">own beefs</a>&nbsp;with Google).</p>

<p>Epic Games motioned for a judge to sanction Google and tell the trial jury to assume that these deleted conversations were unfavorable to the company, or at least be made aware that they were deleted. Though we&#39;ll probably never know what was in those chat logs, Epic Games alleges their destruction is suspect enough that jurors should be made aware.</p>

<p>As noted in the filing, Google has alleged its employee chats are &quot;generally non-substantive.&quot;</p>

<p>&quot;Any suggestion that we haven&#39;t preserved and produced responsive documents in this lawsuit is simply wrong,&quot; said a Google spokesperson in a statement provided to CNET. &quot;We&#39;re looking forward to making our case in court and we&#39;re confident that we&#39;ll prevail in this unnecessary discovery dispute.&quot;</p>

<p>Epic Games declined to comment.</p>

<p>This is the latest event in a two-year-long lawsuit that started when Epic Games contrived to get Google to remove the mobile version of its spectacularly popular online shooter Fortnite from the Play Store, in 2020. Epic took a similar course of action to get Fortnite pulled from the App Store and engage in a parallel lawsuit with Apple, though&nbsp;<a href="https://www.cnet.com/tech/gaming/apple-scores-legal-win-over-epic-in-fortnite-lawsuit-what-you-need-to-know/">Apple largely won that case</a>&nbsp;in September 2021.&nbsp;</p>

<p>These legal actions are Epic&#39;s grand endeavor to stop paying both companies a cut of up to 30% of sales from skins, dances and other in-game purchases. Epic is also arguing that Apple and Google shouldn&#39;t have so much control over distribution of apps and services across their devices.</p>

<p>Though the Apple lawsuit wrapped up last year, the lawsuit against Google is ongoing, with continued developments like Epic alleging the search giant&nbsp;<a href="https://www.cnet.com/tech/mobile/fortnite-maker-epic-games-says-google-pushed-competitors-not-to-launch-app-stores/">paid off developers</a>&nbsp;to not launch mobile app stores that would compete with the Play Store.</p>
', CAST(N'2022-10-13T10:10:31.317' AS DateTime), 18, 1, 2)
INSERT [dbo].[blog] ([id], [title], [thumbnail], [description], [content], [createdDate], [authorId], [topicId], [statusId]) VALUES (7, N'Pixel 7 Pro vs. iPhone 14 Pro: Which Phone Camera Is Better?', N'https://www.cnet.com/a/img/resize/ca46a01e1c39ffd791a502e015f6d78f954b796b/hub/2022/10/11/6ff0f44f-8cb4-44d4-a2c3-b5eac65be43c/pixel-7-pro-watch-lanxon-promo-56.jpg?auto=webp&fit=crop&height=675&width=1200', N'A landscape photography shootout between Google''s Pixel 7 Pro and Apple''s iPhone 14 Pro.', N'<p><img alt="Google Pixel phone photographed next to Apple iPhone" src="https://www.cnet.com/a/img/resize/ca46a01e1c39ffd791a502e015f6d78f954b796b/hub/2022/10/11/6ff0f44f-8cb4-44d4-a2c3-b5eac65be43c/pixel-7-pro-watch-lanxon-promo-56.jpg?auto=webp&amp;fit=crop&amp;height=675&amp;width=1200" style="height:675px; width:1200px" /></p>

<p>The Pixel 7 Pro and the iPhone 14 Pro.</p>

<p>Andrew Lanxon/CNET</p>

<p><a href="https://www.cnet.com/feature/focal-point-iphone22/">This story is part of&nbsp;Focal Point iPhone 2022, CNET&#39;s collection of news, tips and advice around Apple&#39;s most popular product.</a></p>

<p>Google&#39;s&nbsp;<a href="https://www.cnet.com/tech/mobile/pixel-7-pro-review-googles-best-flagship-phone-gets-better/">Pixel 7 Pro</a>&nbsp;has an excellent triple-camera setup that&#39;s already seriously impressed me, alongside the phone&#39;s slick new design and streamlined Android 13 software. But the competition is fierce, with Apple&#39;s latest&nbsp;<a href="https://www.cnet.com/tech/mobile/iphone-14-pro-max-review-welcome-apples-dynamic-island/">iPhone 14 Pro</a>&nbsp;also packing some potent specs and a set of cameras that can take truly superb images.&nbsp;</p>

<p>So which one does it best and which one should you consider if you&#39;re looking for the best photography phone around? I took both phones around the stunning Edinburgh suburb of Leith to find out.&nbsp;</p>

<p>It&#39;s an interesting matchup as both phones have similar camera offerings with a main standard lens, an ultrawide lens and a telephoto zoom. And both have already proven their photographic prowess in our full reviews, with rich images and excellent dynamic range being delivered on both sides.&nbsp;</p>

<p><img alt="Photograph of a boat on a river" src="https://www.cnet.com/a/img/resize/9a453b2297f4b2418bc9b5082d2ba0fa49475ddb/hub/2022/10/14/3f3052a0-1055-4fb4-aba8-afea096e77ae/boat-normal-pixel.jpg?auto=webp&amp;width=1200" style="height:904px; width:1200px" /></p>

<p>Pixel 7 Pro, main lens.</p>

<p>Andrew Lanxon/CNET<img alt="Image of a boat on a river" src="https://www.cnet.com/a/img/resize/2afc3360ac281b9474f8b2f2432ce94bf0b071e7/hub/2022/10/14/9d2cb446-1ed8-4b42-8914-078dc75be45f/boat-normal-iphone.jpg?auto=webp&amp;width=1200" style="height:900px; width:1200px" /></p>

<p>iPhone 14 Pro, main lens.</p>

<p>Andrew Lanxon/CNET</p>

<p>Take a look at the photos above from the Pixel 7 Pro&#39;s 50-megapixel and the iPhone 14 Pro&#39;s 48-megapixel main camera lens. Both scenes are well exposed here, with controlled blue skies and plenty of detail to be seen in the more shadowy areas. The iPhone&#39;s color balance is a bit warmer, which I think suits the scene well, although the Pixel&#39;s image is arguably a touch more natural looking.&nbsp;</p>

<p><img alt="A wide-angle image of a boat on a river" src="https://www.cnet.com/a/img/resize/4840e1fb8b7f02dda50288ae4f762a99d6b3f7a8/hub/2022/10/14/cdafd37c-128c-49b1-8c79-fc477e067f13/boat-wide-pixel.jpg?auto=webp&amp;width=1200" style="height:904px; width:1200px" /></p>

<p>Pixel 7 Pro, ultrawide lens.</p>

<p>Andrew Lanxon/CNET<img alt="A wide-angle image of a boat on a river" src="https://www.cnet.com/a/img/resize/0b0bd981be5bb0a3ee0cdd2d675508388730ffdc/hub/2022/10/14/1425b007-7d33-41b5-be87-c8cdf5f9a176/boat-wide-iphone.jpg?auto=webp&amp;width=1200" style="height:900px; width:1200px" /></p>

<p>iPhone 14 Pro, ultrawide lens.</p>

<p>Andrew Lanxon/CNET</p>

<p>Switch to the ultrawide lens, and again both phones have done a great job in capturing this high contrast scene above. There&#39;s very little to choose between them, but I think the Pixel 7 Pro&#39;s more natural color tones might give it the edge.</p>

<p><img alt="An image showing riverside buildings and moored narrowboats." src="https://www.cnet.com/a/img/resize/86f69e0d7c33c130baf515ee3cc75efe2d170f32/hub/2022/10/14/846af7ab-c060-42cb-95b1-eecc3ed8656a/boat-zoom-pixel.jpg?auto=webp&amp;width=1200" style="height:904px; width:1200px" /></p>

<p>Pixel 7 Pro, 5x optical zoom lens.</p>

<p>Andrew Lanxon/CNET<img alt="An image showing riverside buildings and moored narrowboats." src="https://www.cnet.com/a/img/resize/27014c4b6dc9f749f9429784c0a0cb09809b5db4/hub/2022/10/14/620ba4b2-f258-4f6e-8f3e-2156b813b084/boat-zoom-iphone.jpg?auto=webp&amp;width=1200" style="height:900px; width:1200px" /></p>

<p>iPhone 14 Pro, 3x optical zoom lens.</p>

<p>Andrew Lanxon/CNET</p>

<p>Things change when we switch to the zoom lenses though, most notably because the Pixel 7 Pro&#39;s 5x offers a much closer view than the 3x optical zoom of the iPhone 14 Pro. I love a longer zoom as it helps you find different photo compositions in a scene that would be lost to those who only have wide angle lenses. Using the zoom lens for the photos above let me capture a totally different scene, but I didn&#39;t have to physically move to get it.</p>

<p>That extra reach is noticeable on the Pixel&#39;s shot, with a much closer zoom on the buildings in the distance. Both phones have achieved a good exposure however, and while the Pixel&#39;s image is noticeably warmer (particularly on the buildings themselves), I like the color balances of both shots.&nbsp;</p>

<p><img alt="An image showing riverside buildings." src="https://www.cnet.com/a/img/resize/011de2c16b3e8d780a8e8d15584c4744204224d6/hub/2022/10/14/310f59eb-0dae-4a10-94a6-8186ab87ab42/shore-zoom-pixel.jpg?auto=webp&amp;width=1200" style="height:904px; width:1200px" /></p>

<p>Pixel 7 Pro, 5x zoom lens.</p>

<p>Andrew Lanxon/CNET<img alt="An image showing riverside buildings." src="https://www.cnet.com/a/img/resize/4537d00a2ae157a37becf5efad55eff8503a65c6/hub/2022/10/14/7c774b27-4d30-491a-b278-73d10925a1e9/shore-zoom-iphone.jpg?auto=webp&amp;width=1200" style="height:900px; width:1200px" /></p>

<p>iPhone 14 Pro, 3x zoom lens.</p>

<p>Andrew Lanxon/CNET</p>

<p>Again, that extra zoom on the Pixel let me get a tighter composition on the buildings next to the river in the images above, and it&#39;s a better-looking photo as a result. That said, I prefer the tones and exposure of the iPhone&#39;s shot, with brighter whites and a more vibrant pop of orange visible on the central building and richer blue tones in the sky.</p>

<p><img alt="Wide angle image of a riverside scene" src="https://www.cnet.com/a/img/resize/b23ab6151170b97326b27acdd7a5f5292bd5be89/hub/2022/10/14/1063192c-9795-468e-86ce-5dc3a567724b/shore-post-wide-pixel.jpg?auto=webp&amp;width=1200" style="height:904px; width:1200px" /></p>

<p>Pixel 7 Pro, ultrawide lens.</p>

<p>Andrew Lanxon/CNET<img alt="Wide angle image of a riverside scene" src="https://www.cnet.com/a/img/resize/49b2a6951c0aa1cb451754c95c05e514afa8e1a4/hub/2022/10/14/b2dfee54-2269-4996-97f2-7e5977cee92c/shore-post-wide-iphone.jpg?auto=webp&amp;width=1200" style="height:900px; width:1200px" /></p>

<p>iPhone 14 Pro, ultrawide lens.</p>

<p>Andrew Lanxon/CNET</p>

<p>The ultrawide photos above are more mixed however. While both phones achieved a generally decent exposure, they both have slightly blown out highlights visible in the distant clouds. And while I prefer the more natural blue sky of the iPhone 14 Pro, the Pixel 7 Pro has achieved more vibrant color tones on the buildings and trees toward the center of the frame. It&#39;s tough to make a call on which is &quot;better&quot; here.&nbsp;</p>

<p><img alt="An image showing trees around a river" src="https://www.cnet.com/a/img/resize/3c458781c4e54edf1e6190c24a8957ef0c0f79bf/hub/2022/10/14/0f4c9a14-0fbc-4750-bdf1-e3ed514e12b5/river-normal-pixel.jpg?auto=webp&amp;width=1200" style="height:904px; width:1200px" /></p>

<p>Pixel 7 Pro, main lens.</p>

<p>Andrew Lanxon/CNET<img alt="An image showing trees around a river" src="https://www.cnet.com/a/img/resize/aeeb139729cd2b415383b0702de97e4ef9320174/hub/2022/10/14/2f533733-4784-4664-9711-c6fb7b9002e5/river-normal-iphone.jpg?auto=webp&amp;width=1200" style="height:900px; width:1200px" /></p>

<p>iPhone 14 Pro, main lens.</p>

<p>Andrew Lanxon/CNET</p>

<p>Back to the main camera lens, and there&#39;s again very little to choose between the two pictures above. There&#39;s tons of detail in both, and the overall exposure is spot on. If I were nitpicking -- which I am -- I&#39;d say the Pixel 7 Pro&#39;s sky has a bit too much of a purple tinge in it and it&#39;s a slightly more contrasty scene overall. While that&#39;s resulted in deeper orange hues on the fall leaves, it&#39;s less representative of the actual colors of the scene. It&#39;s largely down to personal preference, but I&#39;m marginally erring toward the iPhone&#39;s shot here.</p>

<p><img alt="A wide angle image showing trees around a river" src="https://www.cnet.com/a/img/resize/0a73c4bf7b9117ba6000bac16c9197533f8ff3e9/hub/2022/10/14/ed7409d6-84bf-4950-9333-a4590391f545/river-wide-pixel.jpg?auto=webp&amp;width=1200" style="height:904px; width:1200px" /></p>

<p>Pixel 7 Pro, ultrawide lens.</p>

<p>Andrew Lanxon/CNET<img alt="A wide angle image showing trees around a river" src="https://www.cnet.com/a/img/resize/412ad9a8808a83ec1c3beabb85bf0218548dd5ce/hub/2022/10/14/901b65bb-f8bc-4c6b-b497-816116ae3b09/river-wide-iphone.jpg?auto=webp&amp;width=1200" style="height:900px; width:1200px" /></p>

<p>iPhone 14 Pro, ultrawide lens.</p>

<p>Andrew Lanxon/CNET</p>

<p>The photos above show the same scene but from the ultrawide lens this time. To my eye, it&#39;s an easier win for the iPhone here. The overall color balance is more natural. And while the iPhone kept a decent contrast in the darker area in the bottom left, the Pixel has tried to brighten this area artificially, resulting in a weird-looking grey patch that I&#39;m not keen on.&nbsp;</p>

<p><img alt="An image showing a close up of a flower." src="https://www.cnet.com/a/img/resize/88e5ff71e283b534c29abd88de0a2831bf0d3bc8/hub/2022/10/14/47a9547c-484f-4659-b702-e49ede79ebf8/macro-flower-pixel.jpg?auto=webp&amp;width=1200" style="height:904px; width:1200px" /></p>

<p>Pixel 7 Pro, wide-angle lens with macro focus.</p>

<p>Andrew Lanxon/CNET<img alt="An image showing a close up of a flower." src="https://www.cnet.com/a/img/resize/bc0b21ca5dcf6e7d13f08832991b13a26ef57969/hub/2022/10/14/321c2f4b-d6e3-44e6-be6b-940d1a7859d3/macro-flower-iphone.jpg?auto=webp&amp;width=1200" style="height:900px; width:1200px" /></p>

<p>iPhone 14 Pro, wide-angle lens with macro focus.</p>

<p>Andrew Lanxon/CNET</p>

<p>With the Pixel 7 Pro now packing auto-focus on its ultrawide lens, it&#39;s able to offer macro photography as it can focus within a couple of inches of the lens. It&#39;s something Apple introduced on the&nbsp;<a href="https://www.cnet.com/tech/mobile/iphone-13-pro-max-review/">iPhone 13 Pro</a>, and it&#39;s great fun to experiment with.&nbsp;</p>

<p>In the macro photos above, I prefer the image from the Pixel 7 Pro&#39;s camera. The white balance has resulted in more vibrant -- and more accurate -- blue-purple tones on the flower&#39;s petals. The leaves in the background also have more of an emerald tone, rather than the yellow-green tones seen on the iPhone&#39;s shot.&nbsp;</p>

<p><img alt="A close up image of a dandelion in grass with a cloudy blue sky behind." src="https://www.cnet.com/a/img/resize/bdcb10e4aaba183c13c717778217a4590753781e/hub/2022/10/14/40ca1177-79b2-4d27-8118-1c453de8a02d/macro-dandelion-pixel.jpg?auto=webp&amp;width=1200" style="height:1594px; width:1200px" /></p>

<p>Pixel 7 Pro, wide-angle lens with macro focus.</p>

<p>Andrew Lanxon/CNET<img alt="A close up image of a dandelion in grass with a cloudy blue sky behind." src="https://www.cnet.com/a/img/resize/065dd091d540d9c25857171773444cd3eac49631/hub/2022/10/14/687384d2-49e0-49db-a5c8-f2d6c929173c/macro-dandelion-iphone.jpg?auto=webp&amp;width=1200" style="height:900px; width:1200px" /></p>

<p>iPhone 14 Pro, wide-angle lens with macro focus.</p>

<p>Andrew Lanxon/CNET</p>

<p>And it&#39;s much the same in the pictures above when I used the phones to get a low-down shot of this dandelion, with the blue sky behind it. The Pixel 7 Pro&#39;s shot has much more vibrant green tones in the grasses around the subject. The iPhone 14 Pro captured a warmer scene, with more yellow tones seen in the grasses that I personally don&#39;t like as much.&nbsp;</p>

<p><img alt="A selfie of a man wearing a hat" src="https://www.cnet.com/a/img/resize/c0a1b8ea41cc9482b77527256966c2f7898cd2b1/hub/2022/10/14/d665c58f-27f7-4505-bfc7-97d80d0f7acd/selfie-normal-pixel.jpg?auto=webp&amp;width=1200" style="height:900px; width:1200px" /></p>

<p>Pixel 7 Pro selfie camera test.</p>

<p>Andrew Lanxon/CNET<img alt="A selfie of a man wearing a hat" src="https://www.cnet.com/a/img/resize/f080eb2ca0240e2bf5cf3bbeefcf89eb93dd4b56/hub/2022/10/14/4ad7a759-1c4b-442c-9a66-3fb6c111015b/selfie-normal-iphone.jpg?auto=webp&amp;width=1200" style="height:900px; width:1200px" /></p>

<p>iPhone 14 Pro selfie camera test.</p>

<p>Andrew Lanxon/CNET</p>

<p>The Pixel 7 Pro is packing a 10.8-megapixel front-facing selfie camera, which is slightly below the iPhone 14 Pro&#39;s 12 megapixels. It&#39;s not a huge difference, there is slightly more detail visible when you zoom in. Both shots are generally solid, however, although I think the Pixel has gone a bit too &quot;HDR&quot; by reducing the highlights on my face too much. Personally, I prefer how I look in the iPhone&#39;s image.&nbsp;</p>

<p><img alt="selfie-wide-pixel" src="https://www.cnet.com/a/img/resize/5a3046910b206761a7bf2eec19f97bdd164a90bf/hub/2022/10/14/da9ad34e-938c-48f7-bd0c-aaaa57cfa491/selfie-wide-pixel.jpg?auto=webp&amp;width=1200" style="height:900px; width:1200px" /></p>

<p>Pixel 7 Pro wide-angle selfie test.</p>

<p>Andrew Lanxon/CNET<img alt="selfie-wide-iphone" src="https://www.cnet.com/a/img/resize/b359c7acb6090514697a532721f0a3029fd5b38d/hub/2022/10/14/90fc2de3-57cc-40b0-9ce8-f7d26c743c1c/selfie-wide-iphone.jpg?auto=webp&amp;width=1200" style="height:900px; width:1200px" /></p>

<p>iPhone 14 Pro wide-angle selfie test.</p>

<p>Both phones have a wider-angle option for the front-facing cameras, which is helpful if you want to capture more of your surroundings or want to squash more of your friends into the picture. I took the photos above in this mode, and the Pixel actually has the edge slightly in terms of fine image details. But again, I prefer the exposure and contrast from the iPhone as the Pixel&#39;s HDR has flattened the tones in my face a bit too much for my liking.&nbsp;</p>

<p><img alt="A night time image of a pub on a cobbled street." src="https://www.cnet.com/a/img/resize/660ee991281b3b57387ac5e7426826dbddda4059/hub/2022/10/14/c7f8257d-250c-4df4-878e-c9fe780f6800/night-roseleaf-pixel.jpg?auto=webp&amp;width=1200" style="height:904px; width:1200px" /></p>

<p>Pixel 7 Pro, night mode.</p>

<p>Andrew Lanxon/CNET<img alt="A night time image of a pub on a cobbled street." src="https://www.cnet.com/a/img/resize/f6c6c6dbfdfaf4f116b7ef0288d11d7b9e6e645b/hub/2022/10/14/5681cdba-d551-48f0-a015-8621c3ab323e/night-roseleaf-iphone.jpg?auto=webp&amp;width=1200" style="height:900px; width:1200px" /></p>

<p>iPhone 14 Pro, night mode.</p>

<p>Andrew Lanxon/CNET</p>

<p>When switching to night mode on both phones, I had to give an early win to the iPhone in the photos above. Its white balance produced a nicer-looking shot without the overly warm orange tone seen in the Pixel&#39;s image.&nbsp;</p>

<p><img alt="night-roseleaf-pixel-100-crop" src="https://www.cnet.com/a/img/resize/82f94dd03aeb64652b3486eed5a0e452cebd93c4/hub/2022/10/14/b125403f-75a4-4818-a5db-10724f7b08a5/night-roseleaf-pixel-100-crop.jpg?auto=webp&amp;width=1200" style="height:675px; width:1200px" /></p>

<p>Pixel 7 Pro night mode, 100% crop.</p>

<p>Andrew Lanxon/CNET<img alt="night-roseleaf-iphone-100-crop" src="https://www.cnet.com/a/img/resize/3ffa3f48b8a7cc3876043c9cc61bdc1b2e129d47/hub/2022/10/14/49ff98af-ddd8-4d29-a34b-19d03b984bba/night-roseleaf-iphone-100-crop.jpg?auto=webp&amp;width=1200" style="height:675px; width:1200px" /></p>

<p>iPhone 14 Pro, night mode, 100% crop.</p>

<p>Andrew Lanxon/CNET</p>

<p>It&#39;s also clear that the iPhone&#39;s image is sharper when cropping in to 100% on both images, with the Pixel&#39;s shot showing some motion blur, particularly on the pub sign. Look at the spotlights on the wall sculptures above; the Pixel&#39;s shot hasn&#39;t been able to capture the dynamic range here, resulting in blow-out areas, while the iPhone has done a much better job of keeping those bright tones under control.&nbsp;</p>

<p><img alt="night-shore-pixel" src="https://www.cnet.com/a/img/resize/e7c1d42aab78d17b0bb8ed1c1c9b64aa6ac8a041/hub/2022/10/14/37b3076d-ac38-40de-8ba5-68cb2baaf4e1/night-shore-pixel.jpg?auto=webp&amp;width=1200" style="height:904px; width:1200px" /></p>

<p>Pixel 7 Pro, night mode.</p>

<p>Andrew Lanxon/CNET<img alt="night-shore-iphone" src="https://www.cnet.com/a/img/resize/728a865cb02ff46a2c32e3c49c17a1517b52e9e7/hub/2022/10/14/fd9c1d65-16c5-47b3-a7ac-6c8815d69fb9/night-shore-iphone.jpg?auto=webp&amp;width=1200" style="height:900px; width:1200px" /></p>

<p>iPhone 14 Pro, night mode.</p>

<p>Andrew Lanxon/CNET</p>

<p>There&#39;s not as much to choose between in these night-time shots above that I took overlooking Leith Shore. Both have similar color tones, exposure and only marginal improvements on the iPhone&#39;s shot when viewed at 100%.&nbsp;</p>

<p><img alt="night-shore-zoom-pixel" src="https://www.cnet.com/a/img/resize/6365f22fc76bbceac89f556a43a7df0327b1cc48/hub/2022/10/14/8dc34ad0-7789-47e6-b09a-efff7d6cd100/night-shore-zoom-pixel.jpg?auto=webp&amp;width=1200" style="height:904px; width:1200px" /></p>

<p>Pixel 7 Pro night mode, 5x zoom.</p>

<p>Andrew Lanxon/CNET<img alt="night-shore-zoom-iphone" src="https://www.cnet.com/a/img/resize/0c89d37059dbd6367ace9dabd035cde240762188/hub/2022/10/14/678c5eef-388c-4c09-8ac6-625a8ab1b5fc/night-shore-zoom-iphone.jpg?auto=webp&amp;width=1200" style="height:900px; width:1200px" /></p>

<p>iPhone 14 Pro, night mode, 3x zoom.</p>

<p>Andrew Lanxon/CNET</p>

<p>Switch to the zoom mode, and there&#39;s a bigger difference between the two phones. In the images above, the Pixel&#39;s shot is brighter and more vibrant but suffers hugely from motion blur, despite that fact that I stabilized myself against a bridge wall when taking the shot. I took three images here and this was the best I could get.&nbsp;</p>

<p><img alt="night-shore-zoom-pixel-100-crop" src="https://www.cnet.com/a/img/resize/6fee1bbc05e238dc2adafb594aa993dd767f3945/hub/2022/10/14/797488cc-1985-4cad-bd25-affd9baf5c2a/night-shore-zoom-pixel-100-crop.jpg?auto=webp&amp;width=1200" style="height:675px; width:1200px" /></p>

<p>Pixel 7 Pro, night mode, 5x zoom at 100% crop.</p>

<p>Andrew Lanxon/CNET<img alt="night-shore-zoom-iphone-100-crop" src="https://www.cnet.com/a/img/resize/bc76baa5fd7ed37ebe4a10b4770659b7f3fa7b03/hub/2022/10/14/6c4a7187-3a5a-4d68-9e4a-4fecbd2c2600/night-shore-zoom-iphone-100-crop.jpg?auto=webp&amp;width=1200" style="height:675px; width:1200px" /></p>

<p>iPhone 14 Pro, night mode, 3x zoom at 100% crop.</p>

<p>Andrew Lanxon/CNET</p>

<p>You can really see how blurry the Pixel&#39;s image is when cropping in to 100%. Sure, the iPhone doesn&#39;t have the same reach with its 3x zoom. But its shot is much sharper and clearer, and it easily takes the win here.</p>

<p><img alt="night-flare-pixel" src="https://www.cnet.com/a/img/resize/ce50c7d9f35147904914a003600b4101c30e7d21/hub/2022/10/14/6bace52c-21e9-42cc-8e27-0f1c70c222b9/night-flare-pixel.jpg?auto=webp&amp;width=1200" style="height:904px; width:1200px" /></p>

<p>Pixel 7 Pro, night mode.</p>

<p>Andrew Lanxon/CNET<img alt="night-flare-iphone" src="https://www.cnet.com/a/img/resize/59ff159a07da77595d24d4cf13c5c7347bbb6e0a/hub/2022/10/14/4461cf6d-b81a-44bc-8edf-8fe560c5ca00/night-flare-iphone.jpg?auto=webp&amp;width=1200" style="height:900px; width:1200px" /></p>

<p>iPhone 14 Pro, night mode.</p>

<p>Andrew Lanxon/CNET</p>

<p>I also found that the Pixel 7 Pro is particularly susceptible to lens flare at night when shooting towards bright light sources like the street lamp shown in the pictures above. While both cameras suffer from lens flare, the Pixel&#39;s is particularly problematic since most of the night sky is filled with red-pink flares surrounding the light. It&#39;s a shame because this would otherwise have been a nice night-time scene.&nbsp;</p>

<h2>Which phone takes better pictures?</h2>

<p>Both phones took some truly superb photos during this test, and it&#39;s not easy to give either one the definitive win. Some elements of what makes a &quot;better&quot; photo will come down to personal preference. In well-lit outdoor shots, I found that the Pixel 7 Pro achieved a more natural color tone from its main lens than the iPhone managed. But its colors weren&#39;t as good in some wider-angle shots. Of course, you can set up different photographic styles on the iPhone to customize how the camera captures photos and make them look more natural if that&#39;s your preference.</p>

<p>At night the iPhone is the clear winner though, with better colors, crisper detail and a superior ability to handle bright light sources -- both in terms of exposure and lens flare. However, the Pixel 7 Pro absolutely takes the win with its superior zoom skills, with its 5x zoom letting you snag beautiful, crystal-clear images that are simply out of reach of the iPhone&#39;s 3x zoom. I also preferred the look of the Pixel&#39;s macro images in all of the tests I shot.&nbsp;</p>

<p>So which is &quot;best&quot; will come down to what you want most from your phone camera. If night photography is important, then go for the iPhone 14 Pro. If you want zoom skills to find creative compositions in your landscapes and street photography, then the Pixel 7 Pro is for you.&nbsp;</p>

<p>If you just want a great all around camera to snap vibrant shots of your kids at the beach, your friend&#39;s food at a local market or some stunning woodland scenes on your next hike, then either phone will suit you incredibly well. Your bigger decision will instead come down to whether you want to go with iOS or Android as your operating system and whether spending the extra hundred bucks or so on the iPhone 14 Pro is worth it.&nbsp;</p>
', CAST(N'2022-10-26T11:39:14.100' AS DateTime), 18, 1, 3)
INSERT [dbo].[blog] ([id], [title], [thumbnail], [description], [content], [createdDate], [authorId], [topicId], [statusId]) VALUES (8, N'Friendly Reminder to Clear Your iPhone Cache Every Month', N'https://www.cnet.com/a/img/resize/85cad7f6f7916ff7e95b01ff4b211710ed20c062/hub/2022/10/14/c6c28db8-ba03-4f13-b2f3-503b372faf8d/apple-iphone-14-xx-8083-3.jpg?auto=webp&fit=crop&height=675&width=1200', N'A bloated browser cache could be slowing down your online activity.', N'<p><img alt="iPhone 14 on red and purple background" src="https://www.cnet.com/a/img/resize/85cad7f6f7916ff7e95b01ff4b211710ed20c062/hub/2022/10/14/c6c28db8-ba03-4f13-b2f3-503b372faf8d/apple-iphone-14-xx-8083-3.jpg?auto=webp&amp;fit=crop&amp;height=675&amp;width=1200" style="height:675px; width:1200px" /></p>

<p>Clear your cache regularly to keep your browsing snappy.&nbsp;</p>

<p>James Martin/CNET</p>

<p><a href="https://www.cnet.com/tech/mobile/best-iphone/">iPhone</a>&nbsp;technology has come a long way from the original models, especially the new tech in the&nbsp;<a href="https://www.cnet.com/tech/mobile/iphone-14-pro-max-review-welcome-apples-dynamic-island/">iPhone 14 Pro and Pro Max</a>. Today, iPhones are used by&nbsp;<a href="https://www.cnet.com/tech/m%C3%B3vil/more-americans-have-iphones-than-android-phones-for-the-first-time-since-2010/">more than half of American smartphone owners</a>. Apple&#39;s phones useful, versatile devices that can handle a wide variety of tasks from waking us up in the morning to digging up answers to strange questions. However, you might be undermining that tech if you&#39;re not keeping your device and apps optimized.</p>

<p>Whether you&#39;re browsing in&nbsp;<a href="https://www.cnet.com/tech/services-and-software/google-chrome-will-fix-your-hacked-passwords-with-one-tap/">Chrome</a>, Safari or elsewhere on your iPhone, your cache builds up digital clutter over time. Clearing your cache gives your browser a new start, which can speed up your browsing whether you&#39;re using&nbsp;<a href="https://www.cnet.com/tech/services-and-software/ios-15-whats-in-apples-latest-iphone-os-and-its-updates/">iOS 15</a>&nbsp;or&nbsp;<a href="https://www.cnet.com/tech/services-and-software/ios-16-cheat-sheet-your-complete-guide-to-the-iphone-update/">iOS 16</a>. (And if you&#39;re trying to get your phone to run faster, try&nbsp;<a href="https://www.cnet.com/tech/mobile/how-to-scrub-your-iphone-free-up-storage/">managing your iPhone&#39;s storage</a>.)&nbsp;</p>

<p><a href="https://www.cnet.com/tech-tips/"><img alt="CNET Tech Tips logo" src="https://www.cnet.com/a/img/resize/84f98e1007c230e49f4976192eaeea57349d1e5f/hub/2022/06/27/cc01f410-d3fd-4b99-b86f-0550082fe9f1/tech-tips-logo-final.png?auto=webp&amp;width=270" style="height:270px; width:270px" /></a></p>

<p>Clearing your cache is a form of digital cleaning. Over time, an iPhone stores website data like photos and banners so it doesn&#39;t have to download it every time you visit a site. Most of the time, this speeds up your browsing. Before too long, though, that stored data will be more harmful than helpful.</p>

<p>Eventually, your browser&#39;s cache will become outdated and the data being retrieved will no longer match the data actually being used on the website. The result? Slower load speeds and wonky formatting.</p>

<p>That&#39;s why clearing your cache can help: It gives sites a fresh start in your browser and frees up some space in your storage. Note that clearing your cache will sign you out of sites you&#39;re currently logged into. Still, it&#39;s generally worth that mild inconvenience about every month to keep things moving quickly.&nbsp;</p>

<p>Here are step-by-step guides on how to clear your cache on your iPhone based on the&nbsp;<a href="https://www.cnet.com/tech/services-and-software/change-these-browser-settings-right-now-to-boost-your-privacy/">browser</a>&nbsp;you use.&nbsp;</p>

<h2>How to clear your iPhone cache in Safari</h2>

<p><a href="https://www.cnet.com/tech/mobile/apple-safari-getting-mobile-browser-extensions-before-chrome-and-thats-a-big-deal/">Safari</a>&nbsp;is the default browser on iPhones, and you can clear your Safari cache in a few short steps. Starting with iOS 11, following this process will affect all devices signed in to your&nbsp;<a href="https://www.cnet.com/tech/services-and-software/apples-new-icloud-plus-will-upgrade-your-account-with-more-privacy-features/">iCloud account</a>. As a result all your devices&#39; caches will be cleared, and you&#39;ll need to sign in to everything the next time you use them. Here&#39;s what to do.</p>

<p><strong>1</strong>.<strong>&nbsp;</strong>Open the&nbsp;<strong>Settings&nbsp;</strong>app on your iPhone.</p>

<p><strong>2</strong>. Select&nbsp;<strong>Safari&nbsp;</strong>from the list of apps.</p>

<p><strong>3</strong>. Go to&nbsp;<strong>Advanced &gt; Website Data</strong>.</p>

<p><strong>4</strong>. Scroll down and select&nbsp;<strong>Clear History and Website Data</strong>.</p>

<p><strong>5</strong>. Choose&nbsp;<strong>Remove Now</strong>&nbsp;in the pop-up box.</p>

<p>Then you&#39;re set!</p>

<p><strong>Read more</strong>:<strong>&nbsp;</strong><a href="https://www.cnet.com/tech/mobile/best-iphone/">Best iPhone for 2022</a></p>

<h2>How to clear your iPhone cache in Chrome</h2>

<p><img alt="Google Chrome internet browser logo" src="https://www.cnet.com/a/img/resize/c200424c351b3e644a744ad934997c093d476d53/hub/2022/03/30/64f1f0c6-4a75-477e-b536-7ef2e105e0be/google-chrome-logo.jpg?auto=webp&amp;width=1200" style="height:671px; width:1200px" /></p>

<p>It&#39;s easy to clear your iPhone cache in Chrome.</p>

<p>James Martin/CNET</p>

<p><a href="https://www.cnet.com/news/privacy/google-chrome-privacy-isnt-best-these-browser-extensions-will-help/">Chrome</a>&nbsp;is another popular browser for iPhone users. The overall process for clearing your Chrome cache requires a few more steps, and you&#39;ll need to do things through the Chrome browser itself. Here&#39;s how.&nbsp;</p>

<p><strong>1</strong>. Open the&nbsp;<strong>Chrome&nbsp;</strong>app.</p>

<p><strong>2</strong>. Select the three dots in the bottom right to open more options.</p>

<p><strong>3</strong>. Scroll down and select&nbsp;<strong>Settings</strong>.</p>

<p><strong>4</strong>. Select&nbsp;<strong>Privacy and security&nbsp;</strong>in the next menu.</p>

<p><strong>5</strong>. Then select&nbsp;<strong>Clear Browsing Data&nbsp;</strong>to open up one last menu.</p>

<p><strong>6</strong>. Select the intended time range at the top of the menu (anywhere from Last Hour to All Time).</p>

<p><strong>7</strong>.<strong>&nbsp;</strong>Make sure that&nbsp;<strong>Cookies, Site Data&nbsp;</strong>is selected, along with&nbsp;<strong>Cached Images and Files</strong>. Finally, hit&nbsp;<strong>Clear Browsing Data</strong>&nbsp;at the bottom of the screen.</p>

<p><strong>Read more</strong>:&nbsp;<a href="https://www.cnet.com/tech/services-and-software/stop-iphone-apps-from-tracking-you-with-this-settings-change/">This iPhone Setting Stops Ads From Following You Across the Web</a></p>

<h2>How to clear your iPhone cache in Firefox</h2>

<p>If you&#39;re a&nbsp;<a href="https://www.cnet.com/tech/computing/mozilla-streamlines-firefox-in-browser-rejuvenation-project/">Firefox</a>&nbsp;devotee, don&#39;t worry. Clearing the cache on your iPhone is pretty straightforward. Just follow these steps.&nbsp;</p>

<p><strong>1</strong>. Click the hamburger menu in the bottom right corner to open up options.</p>

<p><strong>2</strong>. Choose<strong>&nbsp;Settings</strong>&nbsp;at the bottom of the menu.</p>

<p><strong>3</strong>. Select&nbsp;<strong>Data Management&nbsp;</strong>in the Privacy section.</p>

<p><strong>4</strong>. You can select&nbsp;<strong>Website Data</strong>&nbsp;to clear data for individual sites, or select&nbsp;<strong>Clear Private Data&nbsp;</strong>at the bottom of the screen to clear data from all selected fields.</p>

<p><strong>Read more</strong>:&nbsp;<a href="https://www.cnet.com/how-to/slow-wi-fi-this-might-be-the-problem/">Experiencing Slow Wi-Fi? It Could Be Caused by Internet Throttling. Here&#39;s How to Tell</a></p>

<h2>What happens when you clear the cache?&nbsp;</h2>

<p>Clearing your cache removes the website data your phone stored locally to prevent having to download that data upon each new visit. The data in your cache builds over time and can end up slowing things down if it becomes too bulky or out of date. (My phone had about 150MB of data stored in Chrome when I checked.) Clearing that data gives sites a fresh start, which may fix some loading errors and speed up your browser. However, clearing your cache also signs you out of pages, so be prepared to sign in to everything again.&nbsp;</p>

<h2>How often do I need to clear my cache?</h2>

<p>Most people only need to clear their caches once every month or two. That&#39;s generally the point when your browser will build up a cache large enough to start slowing things down. If you frequent a large number of sites, you should err on the side of clearing your cache more often.</p>
', CAST(N'2022-10-13T10:36:31.317' AS DateTime), 18, 1, 2)
INSERT [dbo].[blog] ([id], [title], [thumbnail], [description], [content], [createdDate], [authorId], [topicId], [statusId]) VALUES (9, N'My iPhone in Permanent Low Power Mode Gives Me Two Days of Battery', N'https://www.cnet.com/a/img/resize/d3e4e41afda4acc4d39ff985b5d907f79238d20d/hub/2017/12/21/0a4845b2-aeae-4f1f-9c25-3f5e1c30a0c4/04-iphone-battery.jpg?auto=webp&fit=crop&height=675&width=1200', N'Keeping your iPhone in Low Power Mode could save your battery charge, but what do you lose?', N'<p><img alt="An iPhone showing a Low Battery alert" src="https://www.cnet.com/a/img/resize/d3e4e41afda4acc4d39ff985b5d907f79238d20d/hub/2017/12/21/0a4845b2-aeae-4f1f-9c25-3f5e1c30a0c4/04-iphone-battery.jpg?auto=webp&amp;fit=crop&amp;height=675&amp;width=1200" style="height:675px; width:1200px" /></p>

<p>iOS will ask you to choose Low Power Mode when your battery falls to 20%.&nbsp;</p>

<p>Sarah Tew/CNET</p>

<p>We all know the&nbsp;<a href="https://www.cnet.com/tech/mobile/best-iphone/">iPhone</a>&nbsp;drill: a &quot;Low Battery. 20% battery remaining&quot; alert, followed by options to tap Low Power Mode or deny reality by tapping Close. Apple added Low Power Mode as part of&nbsp;<a href="https://www.cnet.com/tech/mobile/how-to-use-low-power-mode-on-ios-9/">iOS 9</a>&nbsp;in order to save battery, so should battery-conscious iPhone users just keep Low Power Mode on all the time now that we&#39;re on&nbsp;<a href="https://www.cnet.com/tech/services-and-software/ios-16-cheat-sheet-your-complete-guide-to-the-iphone-update/">iOS 16</a>?</p>

<p><a href="https://www.cnet.com/tech-tips/"><img alt="CNET Tech Tips logo" src="https://www.cnet.com/a/img/resize/84f98e1007c230e49f4976192eaeea57349d1e5f/hub/2022/06/27/cc01f410-d3fd-4b99-b86f-0550082fe9f1/tech-tips-logo-final.png?auto=webp&amp;width=270" style="height:270px; width:270px" /></a></p>

<p>The reality of keeping Low Power Mode always on is that the pros and cons will depend on your iPhone model, how you use the phone and how much you care about saving your battery charge. Learn exactly what Low Power Mode disables and how to keep it on permanently, if you want to give it a try.</p>

<p>For more, be sure that you&#39;re not&nbsp;<a href="https://www.cnet.com/tech/mobile/9-reasons-why-your-iphone-is-charging-slowly/">charging your iPhone the wrong way</a>, and learn&nbsp;<a href="https://www.cnet.com/tech/mobile/so-many-people-hated-iphones-battery-meter-that-apple-is-fixing-it/">why the iPhone battery meter icon is changing with iOS 16.1</a>.</p>

<h2>What is iPhone Low Power Mode?</h2>

<p>Low Power Mode is an iOS setting that disables some iPhone features to save battery charge when it is low. Your iPhone will ask you if you want to turn on Low Power Mode when your battery drops to 20%, and then again at 10%.</p>

<p><img alt="A screenshot of the battery level graph in the iPhone Settings" src="https://www.cnet.com/a/img/resize/2db6b0fa5d7bab23ce8dad91d1deecd6dd955d32/hub/2022/10/07/a60acf86-ebe0-4dfd-a543-6662cd4eb737/yellow-low-power-mode.png?auto=webp&amp;width=270" style="height:233px; width:270px" /></p>

<p>When your iPhone is in Low Power Mode, it will be tracked in yellow.</p>

<p>Screenshot by Peter Butler/CNET</p>

<p>Apple says that Low Power Mode reduces the amount of power that your iPhone is using to make your battery last longer.</p>

<p>You can tell when you are in Low Power Mode because your battery icon will be yellow. Your iPhone automatically turns off Low Power Mode when your battery charge reaches 80%.&nbsp;</p>

<h2>Which features does iPhone Low Power Mode disable?</h2>

<p>According to the&nbsp;<a href="https://support.apple.com/en-us/HT205234" target="_blank">official Apple support page,</a>&nbsp;Low Power Mode makes these changes to conserve your battery&#39;s charge:</p>

<ul>
	<li>Turns off 5G (except for video streaming)</li>
	<li>Sets your iPhone screen to turn off after 30 seconds of inactivity</li>
	<li>Reduces display brightness</li>
	<li>Lowers display refresh rate for iPhones with ProMotion</li>
	<li>Eliminates some visual effects</li>
	<li>Pauses iCloud Photos sync</li>
	<li>Suspends automatic downloads</li>
	<li>Pauses email fetch</li>
	<li>Stops background apps from refreshing</li>
</ul>

<p>Low Power Mode also disables viewing videos in HDR, turns off the Always On display in iPhone 14 Pro and Pro Max, disables video autoplay, and reduces CPU and GPU performance.</p>

<h2>How do I turn on iPhone Low Power Mode?</h2>

<p>The manual way to keep Low Power Mode on all the time would be to simply put your iPhone into Low Power Mode every time after you charge it. You can turn it on manually by going to&nbsp;<strong>Settings</strong>&nbsp;&gt;&nbsp;<strong>Battery</strong>&nbsp;and toggling on&nbsp;<strong>Low Power Mode.&nbsp;</strong></p>

<p>You can also turn on Low Power Mode manually with the iPhone Control Center or with Siri.</p>

<h2>How do I turn on iPhone Lower Power Mode permanently?</h2>

<p>But there&#39;s a simple way to &quot;set it and forget it.&quot; To automatically keep your iPhone in Low Power Mode at all times, you&#39;ll need to get a little crafty and make your own&nbsp;<strong>Personal Automation</strong>&nbsp;using the&nbsp;<strong>Shortcuts</strong>&nbsp;app.</p>

<p>There are many ways to automatically set Low Power Mode using&nbsp;<strong>Shortcuts</strong>, but for me, the easiest method is to turn on Low Power Mode whenever the battery is less than 100%. That way, your iPhone is essentially in Low Power Mode all the time, but it can also create backups, complete downloads and receive updates when it&#39;s plugged in and charged at 100%.</p>

<p>Scroll all the way to the right on your iPhone home screen to get to your&nbsp;<strong>App Library</strong>, then scroll down and tap&nbsp;<strong>Shortcuts</strong>. Once the app is running, select&nbsp;<strong>Automation</strong>&nbsp;at the bottom of the screen, then tap the blue&nbsp;<strong>Create Personal Automation</strong>&nbsp;button.</p>

<p><img alt="3 iPhone screenshots showing how to make a personal automation in Shortcuts" src="https://www.cnet.com/a/img/resize/47c75a6524ef686685d0559a806a117d6c09572d/hub/2022/10/07/94292128-09ff-489c-aded-355790181103/new-personal-automation.jpg?auto=webp&amp;width=1200" style="height:640px; width:1200px" /></p>

<p>Creating a personal automation in Shortcuts only takes a few steps.</p>

<p>Screenshot by Peter Butler/CNET</p>

<p>On the&nbsp;<strong>New Animation</strong>&nbsp;screen, scroll down and select&nbsp;<strong>Battery Level</strong>. Tap the bottom option,&nbsp;<strong>Falls Below</strong>, and then move the slider all the way to the right for&nbsp;<strong>100%.</strong>&nbsp;Then click&nbsp;<strong>Next</strong>. You&#39;ve set your condition for triggering an action.</p>

<p>Now create the action to set your iPhone to Low Power Mode. On the&nbsp;<strong>Actions</strong>&nbsp;screen, click the blue&nbsp;<strong>Add Action</strong>&nbsp;button. You can then type in &quot;Low&quot; in the search box and tap&nbsp;<strong>Set Low Power Mode</strong>, or tap&nbsp;<strong>Scripting</strong>&nbsp;and find it under&nbsp;<strong>Device</strong>.</p>

<p><img alt="3 iPhone screenshots showing how to add the Set Low Power Mode action" src="https://www.cnet.com/a/img/resize/7f01173e7fa2394a0dbed06d6dd160d45138fe2f/hub/2022/10/07/c6a95944-c723-4412-822e-9432b0825146/actions-box-tight.jpg?auto=webp&amp;width=1200" style="height:637px; width:1200px" /></p>

<p>After you add the Low Power mode action, you can set it to run without asking.</p>

<p>Screenshot by Peter Butler/CNET</p>

<p>Once you&#39;ve selected&nbsp;<strong>Set Low Power Mode</strong>, it will show up on your&nbsp;<strong>Actions</strong>&nbsp;screen as &quot;Turn Low Power Mode On.&quot; Click&nbsp;<strong>Next</strong>. On the following New Automation screen, toggle&nbsp;<strong>Ask Before Running</strong>&nbsp;off to let Lower Power Mode be turned on automatically. If you want, you can request a notification for every time the automation runs.</p>

<p>Confirm &quot;Don&#39;t Ask,&quot; then tap&nbsp;<strong>Done</strong>&nbsp;to finish. You&#39;re all set. Every time your battery drops below 100%, your iPhone will automatically switch into Low Power Mode.</p>

<h2>How much battery charge does Low Power Mode save?</h2>

<p>You&#39;re not going to get a definitive answer here. The value of Low Power Mode has been debated ever since it was introduced. While some estimates say battery charges will last&nbsp;<a href="https://www.wired.com/2015/09/much-longer-will-iphone-last-low-power-mode/" target="_blank">about one and a half times longer</a>&nbsp;using Low Power Mode,&nbsp;<a href="https://www.reddit.com/r/iphone/comments/vlpfcv/a_full_breakdown_of_what_low_power_mode_actually/" target="_blank">others show very little difference</a>&nbsp;in battery usage.</p>

<p>If you&#39;re concerned with making your iPhone battery last longer, you&#39;ll simply need to try out Low Power Mode for yourself and see the difference.&nbsp;</p>

<p>My own experience squares with that early estimate of a battery charge that lasts about 50% longer on Low Power Mode. Anecdotally, I find that Low Power Mode matters less when I am using the phone more. The benefit of Low Power Mode seems greater when my phone is idle, or used sparingly for texts and 2FA messaging.&nbsp;</p>

<p>On weekdays, when I&#39;m working and mostly using my laptop computer, I generally only need to charge my phone every other day if I leave it in Low Power Mode. That still includes activities like posting on social media, streaming music with&nbsp;<a href="https://www.cnet.com/tech/services-and-software/good-reasons-to-pay-for-spotify/">Spotify</a>&nbsp;and&nbsp;<a href="https://www.cnet.com/tech/services-and-software/watch-netflix-anywhere-3-ways-to-download-your-movies-and-shows/">watching downloaded videos on Netflix</a>. If I don&#39;t have Low Power Mode turned on permanently, I usually need to charge my phone every day.</p>

<h2>How to get rid of Low Power Mode</h2>

<p><img alt="2 iPhone screenshots showing how to turn off automatic Low Power Mode" src="https://www.cnet.com/a/img/resize/03230a7cbf7af7201606c99e654e150b89777708/hub/2022/10/07/535d3622-47e6-4325-9f11-8d15280dcae6/turn-off-lpm2.jpg?auto=webp&amp;width=644" style="height:361px; width:644px" /></p>

<p>Turn off automatic Low Power Mode by disabling the automation or deleting it.</p>

<p>If you find that Low Power Mode doesn&#39;t save your battery, you can turn off the automation by going into&nbsp;<strong>Shortcuts</strong>&nbsp;and toggling off&nbsp;<strong>Enable This Animation</strong>. To erase it completely, swipe left on your Low Power Mode automation on the main Automation screen, then tap the red&nbsp;<strong>Delete</strong>&nbsp;button.</p>

<p>You can also create your own custom version of Low Power Mode by tweaking your iPhone settings to take some of the measures that Low Power Mode does. For example you can save significant battery by&nbsp;<a href="https://www.cnet.com/tech/services-and-software/dont-leave-this-battery-and-data-draining-setting-on/">stopping background apps from refreshing</a>&nbsp;or&nbsp;<a href="https://www.cnet.com/tech/mobile/you-can-make-your-iphone-screen-extra-dark-for-reading-at-night/">adjusting your brightness settings</a>.</p>
', CAST(N'2022-10-12T10:31:31.317' AS DateTime), 18, 3, 2)
INSERT [dbo].[blog] ([id], [title], [thumbnail], [description], [content], [createdDate], [authorId], [topicId], [statusId]) VALUES (12, N'iOS 16.0.3 on Your iPhone: Apple Fixes Some Annoying Bugs', N'https://www.cnet.com/a/img/resize/632fdb3d5fb101b6d49f25e008ae61e6dc25be08/hub/2022/08/09/4802287e-8f71-4dfe-afc7-8a562f15a407/ios16.png?auto=webp&fit=crop&height=675&width=1200', N'Learn how to download the latest iOS 16 update today.', N'<p><img alt="iOS 16 logo on a yellow background" src="https://www.cnet.com/a/img/resize/632fdb3d5fb101b6d49f25e008ae61e6dc25be08/hub/2022/08/09/4802287e-8f71-4dfe-afc7-8a562f15a407/ios16.png?auto=webp&amp;fit=crop&amp;height=675&amp;width=1200" style="height:675px; width:1200px" /></p>

<p>iOS 16.0.3 is available for iPhone users now.</p>

<p>&nbsp;</p>

<p>After releasing&nbsp;<a href="https://www.cnet.com/tech/services-and-software/ios-16-cheat-sheet-your-complete-guide-to-the-iphone-update/">iOS 16</a>&nbsp;alongside the&nbsp;<a href="https://www.cnet.com/tech/mobile/iphone-14-plus-review-if-you-just-want-a-huge-screen-heres-your-upgrade/">iPhone 14</a>&nbsp;last month, Apple has now rolled out another software update,&nbsp;<a href="https://support.apple.com/en-us/HT213480" target="_blank">iOS 16.0.3</a>.&nbsp;</p>

<p><img alt="iOS 16.0.3 update information" src="https://www.cnet.com/a/img/resize/955d1d78c74ca86817ab2d3ee4f2afc2887038d9/hub/2022/10/10/df3dc184-0282-4d92-a3ff-f21fabefbeae/img-4042.jpg?auto=webp&amp;width=270" style="height:393px; width:270px" /></p>

<p>Release notes for the iOS 16.0.3 update.</p>

<p>&nbsp;</p>

<p>The latest update addresses bugs on some&nbsp;<a href="https://www.cnet.com/tech/mobile/iphone-14-models-compared-every-new-apple-phone-from-price-to-size/">iPhone 14 models</a>, including delayed or undelivered incoming calls and notifications and low microphone volume during CarPlay phone calls. It also fixes camera issues some iPhone 14 models have experienced, like a slow launch speed or spontaneously switching between camera modes.</p>

<p>The update also offers fixes that are not specific to iPhone 14 models. One change addresses an issue in which a malformed email could cause the Mail app to crash.</p>

<p>Here&#39;s how iPhone users can download the update.</p>

<p><strong>1.</strong>&nbsp;Open&nbsp;<strong>Settings</strong>.</p>

<p><strong>2.</strong>&nbsp;Tap&nbsp;<strong>General</strong>.</p>

<p><strong>3.</strong>&nbsp;Tap&nbsp;<strong>Software Update</strong>.&nbsp;</p>

<p><strong>4.</strong>&nbsp;Tap&nbsp;<strong>Download and Install</strong>.</p>
', CAST(N'2022-10-13T10:36:31.317' AS DateTime), 18, 1, 2)
INSERT [dbo].[blog] ([id], [title], [thumbnail], [description], [content], [createdDate], [authorId], [topicId], [statusId]) VALUES (13, N'Best Mobile Horror Games to Play in the Dark This Halloween', N'https://www.cnet.com/a/img/resize/8bc871e1fcc6da0433e3c6b144d99c69b87b6af3/hub/2017/03/24/f3d3f403-10ee-41bc-9c72-0cfd8bc83019/ios-36.jpg?auto=webp&fit=crop&height=675&width=1200', N'These creepy mobile games will keep you up all night.', N'<p><img alt="ios-36.jpg" src="https://www.cnet.com/a/img/resize/8bc871e1fcc6da0433e3c6b144d99c69b87b6af3/hub/2017/03/24/f3d3f403-10ee-41bc-9c72-0cfd8bc83019/ios-36.jpg?auto=webp&amp;fit=crop&amp;height=675&amp;width=1200" style="height:675px; width:1200px" /></p>

<p>Limbo is a dark and creepy mobile game.</p>

<p>Limbo</p>

<p>Halloween is the perfect time to indulge in the horror genre. Whether you&#39;re into&nbsp;<a href="https://www.cnet.com/tech/services-and-software/best-streaming-services-horror-flicks-guide-scary-movie-apps/">movies, TV shows</a>&nbsp;or braving a Stephen King novel, horror&#39;s scares hit different when the nights draw in. And creepy video games are no different. (<a href="https://www.cnet.com/tech/gaming/the-best-horror-video-games-to-play-on-halloween/">Check out our full list of scary PC and console games</a>.)</p>

<p>We&#39;ve pulled together a list of mobile horror games for Android, iPhone and iPad that&#39;ll make your spooky season extra chilling.&nbsp;</p>

<h2>Oxenfree</h2>

<p><strong>Free with a Netflix subscription</strong></p>

<p><img alt="Oxenfree Title logo" src="https://www.cnet.com/a/img/resize/e20035b6358190161f718bcbd9e379da7830871c/hub/2018/02/26/ac49ac9d-ccc2-4c30-8e29-b3f22be36e3f/oxenfree.jpg?auto=webp&amp;width=1200" style="height:600px; width:1200px" /></p>

<p>Nightschool</p>

<p>A group of friends hanging out on a beach take a turn for the worse when the teens accidentally open a ghostly rift. Soon the group is fighting for survival, struggling through time loops, and doubting if everyone is truly who they say they are.&nbsp;</p>

<p>I can&#39;t speak highly enough of this choice-based game. Oxenfree calls itself a &quot;supernatural teen thriller,&quot; but deftly avoids tropes and cliches, providing characters with depth and a fascinating, eerie plot. It&#39;s a quick game you could play in one sitting, but there&#39;s multiple endings so you can always go back.</p>

<p>After Netflix purchased Night School Studios, Oxenfree is available to play with a subscription to the streaming service at no extra cost.</p>

<p><a href="https://apps.apple.com/us/app/oxenfree-netflix-edition/id1613438096" target="_blank">See at App Store</a></p>

<p><a href="https://play.google.com/store/apps/details?id=com.netflix.NGP.Oxenfree&amp;hl=en_US&amp;gl=US" target="_blank">See at Google Play Store</a></p>

<h2>What Remains of Edith Finch</h2>

<p><strong>iOS: $5&nbsp;</strong></p>

<p><img alt="What Remains of Edith Finch logo" src="https://www.cnet.com/a/img/resize/41589499d4eaf299c57ce92ff8f797151175980b/hub/2020/10/16/016def3f-a9af-4b7a-9f97-83f387dc4232/what-remains-of-edith-finch-logo.jpg?auto=webp&amp;width=1200" style="height:555px; width:1200px" /></p>

<p>Giant Sparrow</p>

<p>What Remains of Edith Finch is a dark, emotional journey through the seemingly cursed Finch family tree. Edith, the last living member of her family, returns to explore her massive ancestral home. The house seems to go on forever and is packed with rooms and secret passages to explore.&nbsp;</p>

<p>The game plays out like a series of short stories, giving the player a snapshot of Edith&#39;s ancestors. As you progress, Edith maps out her family tree in a notebook. What Remains of Edith Finch is a walking simulator and a mystery puzzle game, and it&#39;s engrossing enough to play in one sitting.&nbsp;</p>

<p>Without giving too much away, the game is dark, with themes of human and animal death, suicide, mental illness and more. It&#39;s a good game, but if you&#39;re triggered by any of these topics (or topics that you imagine might be related), know that you&#39;ll encounter a lot of them in this game.</p>

<p><a href="https://apps.apple.com/us/app/what-remains-of-edith-finch/id1508051949" target="_blank">See at App Store</a></p>

<h2>Gone Home&nbsp;</h2>

<p><strong>iOS: $5</strong></p>

<p><img alt="Gone Home title logo" src="https://www.cnet.com/a/img/resize/9fca989ca02436fc861ab28c510b893f7c7e7d7f/hub/2020/05/15/3acd049a-7c15-4da0-90e0-5a4852ba04c4/gone-home.png?auto=webp&amp;width=1200" style="height:675px; width:1200px" /></p>

<p>Annapurna Interactive</p>

<p>Gone Home will suck you in from the very start. You play as Katie Greenbriar, home from a year-long trip in Europe. When you arrive home (in the middle of a thunderstorm no less), your family has seemingly vanished. Explore all the nooks and crannies of the sprawling house. Collect clues and unravel what happened to your family while you were gone.&nbsp;</p>

<p>The tension created in the game through sheer mystery is almost more frightening than if there were jump scares. As a die-hard mystery game fan, I found Gone Home immersive, engrossing and emotional. While playing, I found myself turning on all the lights in the game to stave off the unnerving feeling of being alone in this deserted house. I felt sadness and frustration as I opened doors and found no one behind them, but the emotional payoff was so bittersweet and satisfying.&nbsp;</p>

<p>It&#39;s a bit cumbersome sometimes to play it on iPad and could benefit from adding controller support in the future. But it&#39;s definitely still worth a play.</p>

<p><a href="https://apps.apple.com/us/app/gone-home/id1377366192" target="_blank">See at App Store</a></p>

<h2>Very Little Nightmares</h2>

<p><strong>iOS and Android: $7</strong></p>

<p><img alt="Very Little Nightmares on mobile" src="https://www.cnet.com/a/img/resize/fc825aaf6ddf3b6de03e652b503ae61a5b2993ef/hub/2020/11/12/03eda779-2f0e-411f-b417-2ae5a003218c/very-little-nightmares.jpg?auto=webp&amp;width=1200" style="height:781px; width:1200px" /></p>

<p>Screenshot by Shelby Brown/CNET</p>

<p>Very Little Nightmares is the prequel to the console game Little Nightmares. The Girl in the Yellow Raincoat wakes up in a mysterious mansion and must navigate enemies, unstable architecture and solve puzzles to make it out. I felt Very Little Nightmares was a tad less creepy than the console games, so if you&#39;re not a huge horror fan, this is a tamer game that you can safely check out.&nbsp;</p>

<p><a href="https://apps.apple.com/us/app/very-little-nightmares/id1435140819" target="_blank">See at App Store</a></p>

<p><a href="https://play.google.com/store/apps/details?id=eu.bandainamcoent.verylittlenightmares&amp;hl=en_US&amp;gl=US" target="_blank">See at Google Play Store</a></p>

<h3>Read more</h3>

<ul>
	<li><a href="https://www.cnet.com/tech/gaming/the-best-horror-video-games-to-play-on-halloween/">The 13 Best Horror Games to Play During Halloween</a></li>
	<li><a href="https://www.cnet.com/tech/computadoras/best-gaming-laptop/">Best Gaming Laptop for 2022</a></li>
	<li><a href="https://www.cnet.com/tech/computing/best-cheap-gaming-laptop/">Best Cheap Gaming Laptop Under $1,000 for 2022</a></li>
</ul>

<h2>Limbo</h2>

<p><strong>iOS: $4, Android: $5</strong></p>

<p>Limbo, a side-scrolling platformer that taps into the spooky black-and-white aesthetic, is every bit as creepy as it looks. Waking up as a small boy in a mysterious forest, you have to solve puzzles to navigate through nightmarish chiaroscuro landscapes filled with horrific monsters and traps.&nbsp;</p>

<p><a href="https://apps.apple.com/us/app/playdeads-limbo/id656951157" target="_blank">See at App Store</a></p>

<p><a href="https://play.google.com/store/apps/details?id=com.playdead.limbo.full&amp;hl=en_US&amp;gl=US" target="_blank">See at Google Play Store</a></p>

<h2>Inside<strong>&nbsp;</strong></h2>

<p><strong>iOS: Free</strong></p>

<p><img alt="Inside on iOS" src="https://www.cnet.com/a/img/resize/22bade6d37ce1cd9c746f5e9c5fe6ddc52772ee2/hub/2021/10/27/e7437229-0bed-4c7a-ac77-e799d99135f8/inside.jpg?auto=webp&amp;width=1200" style="height:675px; width:1200px" /></p>

<p>Playdead</p>

<p>Inside, from the makers of Limbo, is a gorgeous, eerie puzzle platformer with an engaging story and creepy, moody background music. Similar to What Remains of Edith Finch, there are some dark and unsettling elements of manipulation and body horror that may be triggering for some. You play as a faceless young boy in an isolated, cold world of muted colors. It doesn&#39;t take long to realize that the other characters you come across in the games don&#39;t have the best intentions and there are dark secrets to uncover. Despite the ambiguity of the main character, the way the developers convey his sadness and exhaustion is unmistakable, adding another layer of atmosphere to the game.&nbsp;</p>

<p><a href="https://apps.apple.com/us/app/playdeads-inside/id1201642309" target="_blank">See at App Store</a></p>

<h2>Sara is Missing</h2>

<p><strong>Free on iOS and Android</strong></p>

<p><img alt="Sarah is Missing on mobile" src="https://www.cnet.com/a/img/resize/c14a8c83933ddc78514ceab9d6d4b867a0c72fb2/hub/2019/10/22/ad044e19-6801-43db-b3db-5c6a7c1ee77f/sim.jpg?auto=webp&amp;width=1200" style="height:671px; width:1200px" /></p>

<p>Kaigan Games/Screenshot by Shelby Brown/CNET</p>

<p>Sara is Missing is a relatively short mobile game, but it&#39;s really immersive. You find a missing girl&#39;s phone, and the app displays as if your smartphone is hers, complete with alerts, texts and error messages.</p>

<p>Once you unlock Sara&#39;s phone, you&#39;ll be plunged into a world of lies, mystery and secrets. Look through text messages and emails, retrieve lost files and data, watch suspicious videos, and search through pictures to piece together Sara&#39;s last moments. Your search is guided by the Siri-like mobile assistant Iris, which might be hiding a few secrets of its own.<br />
<br />
The game has multiple choice-based endings, hidden subplots and quite a few jump scares.</p>

<p><a href="https://apps.apple.com/us/app/sara-is-missing/id1181038779" target="_blank">See at App Store</a></p>

<p><a href="https://play.google.com/store/apps/details?id=com.accurve.game23&amp;hl=en_US&amp;gl=US" target="_blank">See at Google Play Store</a></p>

<h2>I Am Innocent</h2>

<p><strong>Free on iOS and Android</strong></p>

<p><img alt="I Am Innocent on mobile." src="https://www.cnet.com/a/img/resize/4b672d3bf027a42901e9cbd59dd18a0e42c7eb4d/hub/2019/10/22/6752fb6f-1d22-4cd8-956b-c393a1ed21b9/i-am-innocent.jpg?auto=webp&amp;width=1200" style="height:708px; width:1200px" /></p>

<p>Guts United/Screenshot by Shelby Brown/CNET</p>

<p>I Am Innocent is a detective game similar to Sara is Missing. However, the gameplay is longer and more intricate. You&#39;ll investigate a series of murders that somehow link to the disappearance of your sister. No one is who they seem as you dig deeper and unearth secrets.</p>

<p>As in real life, how you interact with the characters can improve or hurt your relationships. You start getting messages from a mysterious person named Ghost, who connects you to a kidnapped person named Finch who needs your help.</p>

<p>Use your resources to enhance photos, collect information, search archives, figure out what happened to your sister and help Finch. There are built-in Tetris-style games that, once you beat them, unlock more information.</p>

<p><a href="https://apps.apple.com/us/app/i-am-innocent/id1040968153" target="_blank">See at App Store</a></p>

<p><a href="https://play.google.com/store/apps/details?id=com.glaznev.innocent&amp;hl=en_US" target="_blank">See at Google Play Store</a></p>

<h2>Thimbleweed Park</h2>

<p><strong>iOS and Android: $10</strong></p>

<p><img alt="Thimbleweed Park on mobile." src="https://www.cnet.com/a/img/resize/04a99ec517f02af171dbbf38a84e8d913ed77500/hub/2019/10/22/52372798-7f78-458d-a283-99d15e828ee3/thimbleweed-park.jpg?auto=webp&amp;width=1200" style="height:675px; width:1200px" /></p>

<p>Microsoft</p>

<p>Explore a haunted hotel, a destroyed pillow factory and an abandoned circus to figure out the secrets of the surreal town of&nbsp;<a href="https://www.gamespot.com/thimbleweed-park/" target="_blank">Thimbleweed Park</a>.</p>

<p>Play as Agent Ray and Junior Agent Reyes -- a Mulder-and-Scully duo -- or Frank the ghost, a cranky clown named Ransome, or game developer Delores. Characters can work together, or make solving the murder more difficult for others.</p>

<p>Thimbleweed Park is a humorous noir parody set in 1987, nostalgic in its pixelated style. If you&#39;re looking for a more lighthearted game for this time of year, this is it.&nbsp;</p>

<p><a href="https://apps.apple.com/us/app/thimbleweed-park/id1228969539" target="_blank">See at App Store</a></p>

<p><a href="https://play.google.com/store/apps/details?id=com.terribletoybox.thimbleweedparkandroid&amp;hl=en_US" target="_blank">See at Google Play Store</a></p>

<h2>Life is Strange</h2>

<p><strong>iOS and Android: Free download for episode 1, then buy individual episodes or season pass ($1-$10)</strong></p>

<p><img alt="Life is Strange on mobile." src="https://www.cnet.com/a/img/resize/43a24692fb84657b0a574f94b9654e1b4858c4c4/hub/2019/10/22/6fe03d8e-f03c-474a-9bd3-c6bc5f956bd0/life-is-strange.jpg?auto=webp&amp;width=1200" style="height:660px; width:1200px" /></p>

<p>Square Enix</p>

<p><a href="https://www.gamespot.com/life-is-strange/" target="_blank">Life is Strange</a>&nbsp;isn&#39;t necessarily a scary game, but it&#39;s worth including for its mystery and suspense. The game tells the story of a girl named Max who starts having visions of an impending disaster. Soon she learns she can bend time and might be able to use her powers to save her best friend Chloe.</p>

<p>When a student goes missing, Chloe and Max start investigating and learn that their hometown has a dark side. As Max changes the past, it affects the future.</p>

<p>The graphics in Life is Strange are beautiful, even on a smartphone screen. The plot is intricate and accompanied by a great soundtrack. The game reacts to your choices, so it can end in different ways. You can also find this game on PS4, Xbox One and PC. There is a second installment,&nbsp;<a href="https://play.google.com/store/apps/details?id=com.squareenix.lis.bts&amp;hl=en_US" target="_blank">Life is Strange: Before the Storm</a>, if you enjoy this one.</p>

<p><a href="https://apps.apple.com/app/life-is-strange/id1180101534" target="_blank">See at App Store</a></p>

<p><a href="https://play.google.com/store/apps/details?id=com.squareenix.lis&amp;hl=en_US" target="_blank">See at Google Play Store</a></p>
', CAST(N'2022-10-13T10:36:31.317' AS DateTime), 18, 4, 2)
INSERT [dbo].[blog] ([id], [title], [thumbnail], [description], [content], [createdDate], [authorId], [topicId], [statusId]) VALUES (14, N'Is Your Android Being Tracked by an AirTag? Here''s How to Find Out.', N'https://www.cnet.com/a/img/resize/c6cbe402899f7d1d2c452466f66cdff176c9b284/hub/2021/04/24/1ef0a83d-1c0d-44b4-a373-843484842592/130-apple-airtags-2021.jpg?auto=webp&fit=crop&height=675&width=1200', N'This third-party app from Apple will let you know if you''re being followed by a rogue AirTag!', N'<p><img alt="An Apple AirTag in one hand and an iPhone in the other showing the location of the AirTag" src="https://www.cnet.com/a/img/resize/c6cbe402899f7d1d2c452466f66cdff176c9b284/hub/2021/04/24/1ef0a83d-1c0d-44b4-a373-843484842592/130-apple-airtags-2021.jpg?auto=webp&amp;fit=crop&amp;height=675&amp;width=1200" style="height:675px; width:1200px" /></p>

<p>An AirTag can be used to secretly track you.</p>

<p>&nbsp;</p>

<p><a href="https://www.cnet.com/tech/mobile/airtags-explained-what-to-know-about-apples-bite-sized-trackers/">AirTags</a>, although designed to act as key, wallet and luggage finders, have been&nbsp;<a href="https://www.cnet.com/tech/mobile/airtags-are-being-linked-to-stalking-and-its-a-problem-apple-cant-solve-alone/">misused by thieves and stalkers</a>&nbsp;to track people&#39;s locations, as well as their personal items, without their knowledge. Over the last year, Apple has released several&nbsp;<a href="https://www.cnet.com/news/privacy/apple-airtags-how-to-protect-yourself-from-being-tracked/">antistalking features</a>&nbsp;to help people find rogue AirTags near them, and that includes an app for&nbsp;<a href="https://www.cnet.com/android-update/">Android</a>&nbsp;users.</p>

<p><img alt="CNET Tech Tips logo" src="https://www.cnet.com/a/img/resize/84f98e1007c230e49f4976192eaeea57349d1e5f/hub/2022/06/27/cc01f410-d3fd-4b99-b86f-0550082fe9f1/tech-tips-logo-final.png?auto=webp&amp;width=270" style="height:270px; width:270px" /></p>

<p>Tracker Detect, an official Apple app on the Google Play Store, allows people who don&#39;t own any Apple devices to scan for nearby&nbsp;<a href="https://www.cnet.com/tech/mobile/airtags-hands-on-apples-impressive-bluetooth-trackers-will-get-an-android-app/">AirTags</a>, in case someone is using the tracking device to follow them around. Here&#39;s how to scan for AirTags on your Android smartphone or tablet.</p>

<h2>Use Tracker Detect on Android to scan for AirTags</h2>

<p>The&nbsp;<a href="https://play.google.com/store/apps/details?id=com.apple.trackerdetect" target="_blank">Tracker Detect</a>&nbsp;app, available in the Google Play Store for free, allows you to use your Android to search for and track items that work with Apple&#39;s Find My network, such as AirTags, and are separated from their owner for at least 15 minutes. No Apple ID account is required.</p>

<p><img alt="Screenshot showing Apple''s Tracker Detect app" src="https://www.cnet.com/a/img/resize/74bee07b8abfdc14f09d7ad0fabb93c08f7412dd/hub/2021/12/15/507ce9a3-36d6-4ae3-8b23-fec98b286a70/tracker.png?auto=webp&amp;width=270" style="height:300px; width:270px" /></p>

<p>Just hit Scan and search for nearby AirTags.</p>

<p>&nbsp;</p>

<p>After downloading Tracker Detect, turn on Bluetooth, open the application, agree to the terms and conditions, and tap the blue&nbsp;<strong>Scan</strong>&nbsp;button to search for nearby items. If this is your first time using Tracker Detect, you&#39;ll be prompted to give the app access to Bluetooth, which it needs to find any AirTags.</p>

<p>Your Android will scan for up to a minute, and if it finds an AirTag near you, it will appear as &quot;Unknown Airtag.&quot; If you don&#39;t find anything, you can try the scan again, especially because the tracker must be separated from its owner for at least 15 minutes to appear.</p>

<h2>What to do if you find an AirTag tracking you</h2>

<p>If Tracker Detect notices an AirTag that&#39;s been following you for at least 10 minutes, the app will then allow you to play a sound from the AirTag so that you can more easily find the physical tracker.</p>

<p>If you do find the AirTag, it&#39;s up to you on how you want to proceed. If the AirTag is with you by accident, meaning it&#39;s not being used to follow you, and &quot;Lost Mode&quot; is enabled, you can tap and hold your NFC-compatible Android to the white side of the tag to get more information on how to return it.</p>

<p>However, if the AirTag is being used to track you, you can also view the serial number by tapping it with your phone, which might prove useful if you&#39;re considering contacting law enforcement and require ID proof of who might be stalking you. You can also take the back cover apart and look inside the AirTag to find the serial number.</p>

<p><img alt="Apple AirTag and CR2032 battery" src="https://www.cnet.com/a/img/resize/f929c17c1e5756f81e5fad94d61b86889231a58a/hub/2021/04/22/b458c001-b659-41f6-ac46-a04bbc9ff6c2/p1005658.jpg?auto=webp&amp;width=1200" style="height:800px; width:1200px" /></p>

<p>The AirTag can be disabled by removing the CR2032 battery.</p>

<p>&nbsp;</p>

<h2>How to disable an AirTag</h2>

<p>If you want to shut down the AirTag and stop if from tracking you, Tracker Detect will provide a brief but concise summary on how to disable it:</p>

<ol>
	<li>Press down on the stainless steel back cover of the AirTag.</li>
	<li>Rotate the cover counter-clockwise until it stops.</li>
	<li>Release your fingers and the cover will come off.</li>
	<li>Remove the button cell battery.</li>
</ol>

<p>Removing the battery will notify the owner that the AirTag has been disabled, so be warned.</p>

<p>Unfortunately, Tracker Detect lacks some of features that are&nbsp;<a href="https://www.cnet.com/tech/mobile/ahead-of-wwdc-apple-bolsters-airtags-privacy-measures-says-developing-android-detector-app/">available natively on the iPhone</a>&nbsp;-- most importantly, automatic background scans. On Tracker Detect, you must manually scan for AirTags each time, which can be a nuisance if you&#39;re constantly worried about being tracked.</p>

<p>Maybe in future updates Apple will consider adding more features to the Android app, but until then, Tracker Detect can help provide some relief if you&#39;re being tracked by AirTag.</p>

<p>If you&#39;re considering purchasing an Apple tracking device, despite the privacy concerns,&nbsp;<a href="https://www.cnet.com/tech/mobile/airtags-explained-what-to-know-about-apples-bite-sized-trackers/">learn more about AirTags</a>, check out some of the&nbsp;<a href="https://www.cnet.com/tech/mobile/best-apple-airtag-accessories/">best AirTag accessories</a>&nbsp;out there and read about how&nbsp;<a href="https://www.cnet.com/tech/mobile/airtags-vs-tile-and-smarttag-apples-bluetooth-tracker-isnt-necessarily-the-best/">AirTags fare against their biggest competitors</a>.</p>
', CAST(N'2022-10-26T11:38:47.927' AS DateTime), 18, 1, 2)
SET IDENTITY_INSERT [dbo].[blog] OFF
GO
SET IDENTITY_INSERT [dbo].[blogStatus] ON 

INSERT [dbo].[blogStatus] ([id], [name]) VALUES (1, N'Pending')
INSERT [dbo].[blogStatus] ([id], [name]) VALUES (2, N'Approved')
INSERT [dbo].[blogStatus] ([id], [name]) VALUES (3, N'Denied')
SET IDENTITY_INSERT [dbo].[blogStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[brand] ON 

INSERT [dbo].[brand] ([id], [name]) VALUES (1, N'Apple')
INSERT [dbo].[brand] ([id], [name]) VALUES (2, N'Samsung')
INSERT [dbo].[brand] ([id], [name]) VALUES (3, N'OPPO')
INSERT [dbo].[brand] ([id], [name]) VALUES (4, N'Xiaomi')
INSERT [dbo].[brand] ([id], [name]) VALUES (5, N'Vivo')
INSERT [dbo].[brand] ([id], [name]) VALUES (6, N'Tecno')
INSERT [dbo].[brand] ([id], [name]) VALUES (7, N'Nokia')
INSERT [dbo].[brand] ([id], [name]) VALUES (8, N'Realme')
INSERT [dbo].[brand] ([id], [name]) VALUES (9, N'Lenovo')
INSERT [dbo].[brand] ([id], [name]) VALUES (10, N'Masstel')
INSERT [dbo].[brand] ([id], [name]) VALUES (11, N'Huawei')
INSERT [dbo].[brand] ([id], [name]) VALUES (12, N'Garmin')
INSERT [dbo].[brand] ([id], [name]) VALUES (13, N'Anker')
INSERT [dbo].[brand] ([id], [name]) VALUES (14, N'iValue')
INSERT [dbo].[brand] ([id], [name]) VALUES (15, N'UmeTravel')
INSERT [dbo].[brand] ([id], [name]) VALUES (16, N'Veger')
INSERT [dbo].[brand] ([id], [name]) VALUES (17, N'Belkin')
INSERT [dbo].[brand] ([id], [name]) VALUES (18, N'Hyperdrive')
INSERT [dbo].[brand] ([id], [name]) VALUES (19, N'Sony')
INSERT [dbo].[brand] ([id], [name]) VALUES (20, N'JBL')
SET IDENTITY_INSERT [dbo].[brand] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [name]) VALUES (1, N'Smartphone')
INSERT [dbo].[category] ([id], [name]) VALUES (2, N'Tablet')
INSERT [dbo].[category] ([id], [name]) VALUES (3, N'Smartwatch')
INSERT [dbo].[category] ([id], [name]) VALUES (4, N'Accessories')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[contact] ON 

INSERT [dbo].[contact] ([id], [fullname], [email], [phone], [message], [date], [statusId]) VALUES (1, N'Nguyen Duy Nam', N'nam2998nam@gmail.com', N'0246891539', N'Good website', CAST(N'2022-10-31T09:31:48.577' AS DateTime), 3)
INSERT [dbo].[contact] ([id], [fullname], [email], [phone], [message], [date], [statusId]) VALUES (2, N'Nguyen Duy Nam', N'nam2998nam@gmail.com', N'0123456789', N'Nice', CAST(N'2022-11-09T10:21:51.460' AS DateTime), 2)
INSERT [dbo].[contact] ([id], [fullname], [email], [phone], [message], [date], [statusId]) VALUES (4, N'Nguyen Duy Nam', N'nam2998nam@gmail.com', N'0546179631', N'nice', CAST(N'2022-11-09T10:23:16.583' AS DateTime), 3)
INSERT [dbo].[contact] ([id], [fullname], [email], [phone], [message], [date], [statusId]) VALUES (7, N'Phuong Nam', N'pnam@gmail.com', N'0111456789', N' good shop', CAST(N'2022-11-11T11:21:45.553' AS DateTime), 1)
INSERT [dbo].[contact] ([id], [fullname], [email], [phone], [message], [date], [statusId]) VALUES (9, N'Trần Huy', N'tienhuyy@gmail.com', N'0571679452', N' User feedback is also important in an internal-facing context. When the product in question is software you’ve purchased and the users are your own employees, it’s important to gauge sentiment and solicit comments about how smooth the onboarding process is, how prevalent new feature adoption is, and how comfortable your team is using apps overall. Doing so will help you make the right decisions to optimize your digital adoption plan.', CAST(N'2022-11-12T15:21:14.033' AS DateTime), 2)
INSERT [dbo].[contact] ([id], [fullname], [email], [phone], [message], [date], [statusId]) VALUES (10, N'Pham Khanh', N'pkhanh@gmail.com', N'0176154792', N' .', CAST(N'2022-11-13T13:55:38.360' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[contact] OFF
GO
SET IDENTITY_INSERT [dbo].[contactStatus] ON 

INSERT [dbo].[contactStatus] ([id], [name]) VALUES (1, N'Unread')
INSERT [dbo].[contactStatus] ([id], [name]) VALUES (2, N'Read')
INSERT [dbo].[contactStatus] ([id], [name]) VALUES (3, N'Replied')
SET IDENTITY_INSERT [dbo].[contactStatus] OFF
GO
INSERT [dbo].[feedback] ([id], [productId], [accountId], [content], [datecreated]) VALUES (1, 103, 1, N'very nice!', CAST(N'2022-05-05' AS Date))
INSERT [dbo].[feedback] ([id], [productId], [accountId], [content], [datecreated]) VALUES (2, 103, 2, N'Not bad!', CAST(N'2022-01-05' AS Date))
INSERT [dbo].[feedback] ([id], [productId], [accountId], [content], [datecreated]) VALUES (3, 103, 3, N'Too expensive!', CAST(N'2021-01-01' AS Date))
INSERT [dbo].[feedback] ([id], [productId], [accountId], [content], [datecreated]) VALUES (6, 60, 2, N'Nice product', CAST(N'2022-01-01' AS Date))
INSERT [dbo].[feedback] ([id], [productId], [accountId], [content], [datecreated]) VALUES (7, 62, 3, N'Not good', CAST(N'2022-01-01' AS Date))
GO
SET IDENTITY_INSERT [dbo].[help] ON 

INSERT [dbo].[help] ([id], [title], [content], [image], [created_date], [tab], [target], [state]) VALUES (1, N'How to Login', N'<div class="row">
                                                <div class="col-9">
                                                    <p><span class="help-step">Step 1: </span><span class="help-content">Enter your user name.</span></p>
                                                    <p><span class="help-step">Step 2: </span><span class="help-content">Enter your password.</span></p>
                                                    <p><span class="help-step">Step 3: </span><span class="help-content">(unneeded action) Selecting "Remember" will save you from having to repeat steps 1 and 2,
                                                            all you have to do is click the "SIGN IN" button.
                                                            The system will automatically fill in your username and password for you.</p>
                                                    <p><span class="help-step">Step 4: </span><span class="help-content">Click on "SIGN IN" button to login to your account.</span></p>
                                                </div>
                                                <div class="col-3">
                                                    <img class="help-img-login" style="height: 375px" src="images/common/login.png"/>
                                                </div>
                                            </div>', N'', CAST(N'2022-03-10' AS Date), N'login-tab', N'#login', N'active    ')
INSERT [dbo].[help] ([id], [title], [content], [image], [created_date], [tab], [target], [state]) VALUES (2, N'How can I sign up', N'<div class="row">
                                                <div class="col-9">
                                                    <p><span class="help-step">Step 1: </span><span class="help-content">Enter your user name.</span></p>
                                                    <p><span class="help-step">Step 2: </span><span class="help-content">Enter your password.</span></p>
                                                    <p><span class="help-step">Step 3: </span><span class="help-content">Re-enter your password above.</p>
                                                    <p><span class="help-step">Step 4: </span><span class="help-content">Enter your full name</p>
                                                    <p><span class="help-step">Step 5: </span><span class="help-content">Enter your email address. In order to retrieve your password if you forget it, please provide the right email address that you are currently using.</p>
                                                    <p><span class="help-step">Step 6: </span><span class="help-content">Enter your phone number.</p>
                                                    <p><span class="help-step">Step 7: </span><span class="help-content">Enter your date of birth.</p>
                                                    <p><span class="help-step">Step 8: </span><span class="help-content">Click on "SIGN UP" button to create a new account.</span></p>
                                                    <p>The registration process is over now. To login into your account, go back to the Sign up tab.</p>
                                                </div>
                                                <div class="col-3">
                                                    <img class="help-img-signup" src="images/common/register.png"/>
                                                </div>
                                            </div>', N'', CAST(N'2022-03-10' AS Date), N'signup-tab', N'#signup', N'          ')
INSERT [dbo].[help] ([id], [title], [content], [image], [created_date], [tab], [target], [state]) VALUES (4, N'qqq', N'qqq', NULL, CAST(N'2022-10-26' AS Date), N'forgot-tab', N'#forgot', N'          ')
SET IDENTITY_INSERT [dbo].[help] OFF
GO
SET IDENTITY_INSERT [dbo].[image] ON 

INSERT [dbo].[image] ([id], [image], [productId]) VALUES (1, N'iphone11-64gb-1.webp', 1)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (2, N'iphone11-64gb-2.webp', 1)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (3, N'iphone11-64gb-3.webp', 1)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (4, N'iphone11-64gb-4.webp', 1)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (5, N'iphone-12-12-mini-1.webp', 2)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (6, N'iphone-12-12-mini-2.webp', 2)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (7, N'iphone-12-12-mini-3.webp', 2)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (8, N'iPhone 13 pro 1.webp', 4)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (9, N'iPhone 13 pro 2.webp', 4)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (10, N'iPhone 13 pro 3.webp', 4)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (11, N'iPhone 13 Promax 1.webp', 5)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (12, N'iPhone 13 Promax 2.webp', 5)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (13, N'iPhone 13 Promax 3.webp', 5)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (14, N'iphone-13-mini-1.webp', 3)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (15, N'iphone-13-mini-2.webp', 3)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (16, N'iphone-13-mini-3.webp', 3)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (17, N'samsung-a52-den-1.webp', 6)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (18, N'samsung-a52-den-2.webp', 6)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (19, N'samsung-a52-den-3.webp', 6)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (20, N'Samsung-galaxy-s22-ultr 1.webp', 7)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (21, N'Samsung-galaxy-s22-ultr 2.webp', 7)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (22, N'Samsung-galaxy-s22-ultr 3.webp', 7)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (23, N'samsungalaxy-s22-plus-1.webp', 8)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (24, N'samsungalaxy-s22-plus-2.webp', 8)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (25, N'samsungalaxy-s22-plus-3.webp', 8)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (26, N'galaxy-flip-3-1.webp', 9)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (27, N'galaxy-flip-3-2.webp', 9)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (28, N'galaxy-flip-3-3.webp', 9)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (29, N'zfold3-1.webp', 10)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (30, N'zfold3-2.webp', 10)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (31, N'zfold3-3.webp', 10)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (32, N'samsung-galaxy-s20-fe-1.webp', 11)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (33, N'samsung-galaxy-s20-fe-2.webp', 11)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (34, N'samsung-galaxy-s20-fe-3.webp', 11)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (35, N'oppo-reno7-4g-1.webp', 12)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (36, N'oppo-reno7-4g-2.webp', 12)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (37, N'oppo-reno7-4g-3.webp', 12)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (38, N'oppo-reno7-z-5g-1.webp', 13)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (39, N'oppo-reno7-z-5g-2.webp', 13)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (40, N'oppo-reno7-z-5g-3.webp', 13)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (41, N'oppo-find-x3-pro-1.webp', 14)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (42, N'oppo-find-x3-pro-2.webp', 14)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (43, N'oppo-find-x3-pro-3.webp', 14)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (44, N'Oppo Reno6 5G-1.webp', 15)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (45, N'Oppo Reno6 5G-2.webp', 15)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (46, N'Oppo Reno6 5G-3.webp', 15)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (47, N'OPPO A95 8GB-128GB-1.webp', 16)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (48, N'OPPO A95 8GB-128GB-2.webp', 16)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (49, N'OPPO A95 8GB-128GB-3.webp', 16)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (50, N'OPPO A55 4GB-64GB 1.webp', 17)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (51, N'OPPO A55 4GB-64GB 2.webp', 17)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (52, N'OPPO A55 4GB-64GB 3.webp', 17)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (53, N'OPPO A16k 3GB-32GB 1.webp', 18)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (54, N'OPPO A16k 3GB-32GB 2.webp', 18)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (55, N'OPPO A16k 3GB-32GB 3.webp', 18)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (56, N'OPPO A94 8GB-128GB-1.webp', 19)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (57, N'OPPO A94 8GB-128GB-2.webp', 19)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (58, N'OPPO A94 8GB-128GB-3.webp', 19)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (59, N'Xiaomi Redmi Note 11 4GB-1.webp', 20)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (60, N'Xiaomi Redmi Note 11 4GB-2.webp', 20)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (61, N'Xiaomi Redmi Note 11 4GB-3.webp', 20)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (62, N'Xiaomi Redmi Note 11S 6GB-1.webp', 21)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (63, N'Xiaomi Redmi Note 11S 6GB-2.webp', 21)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (64, N'Xiaomi Redmi Note 11S 6GB-3.webp', 21)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (65, N'Xiaomi 11T Pro 5G 12GB-1.webp', 22)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (66, N'Xiaomi 11T Pro 5G 12GB-2.webp', 22)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (67, N'Xiaomi 11T Pro 5G 12GB-3.webp', 22)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (68, N'Xiaomi Redmi Note 11 Pro 8GB-1.webp', 23)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (69, N'Xiaomi Redmi Note 11 Pro 8GB-2.webp', 23)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (70, N'Xiaomi Redmi Note 11 Pro 8GB-3.webp', 23)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (71, N'Xiaomi Redmi Note 10S 8GB-1.webp', 24)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (72, N'Xiaomi Redmi Note 10S 8GB-2.webp', 24)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (73, N'Xiaomi Redmi Note 10S 8GB-3.webp', 24)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (74, N'Xiaomi 12 Pro 12GB-1.webp', 25)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (75, N'Xiaomi 12 Pro 12GB-2.webp', 25)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (76, N'Xiaomi 12 Pro 12GB-3.webp', 25)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (77, N'Xiaomi 11 Lite 5G NE 8GB - 256GB-1.webp', 26)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (78, N'Xiaomi 11 Lite 5G NE 8GB - 256GB-2.webp', 26)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (79, N'Xiaomi 11 Lite 5G NE 8GB - 256GB-3.webp', 26)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (80, N'Xiaomi Redmi 10C 4GB - 128GB-1.webp', 27)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (81, N'Xiaomi Redmi 10C 4GB - 128GB-2.webp', 27)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (82, N'Xiaomi Redmi 10C 4GB - 128GB-3.webp', 27)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (83, N'Xiaomi Redmi 9A 2GB-32GB1.webp', 28)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (84, N'Xiaomi Redmi 9A 2GB-32GB2.webp', 28)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (85, N'Xiaomi Redmi 9A 2GB-32GB3.webp', 28)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (86, N'Xiaomi 12 8GB - 256GB1.webp', 29)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (87, N'Xiaomi 12 8GB - 256GB2.webp', 29)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (88, N'Xiaomi 12 8GB - 256GB3.webp', 29)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (89, N'Vivo V23 5G1.webp', 30)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (90, N'Vivo V23 5G2.webp', 30)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (91, N'Vivo V23 5G3.webp', 30)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (92, N'Vivo V23e 8GB - 128GB1.webp', 31)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (93, N'Vivo V23e 8GB - 128GB2.webp', 31)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (94, N'Vivo V23e 8GB - 128GB3.webp', 31)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (95, N'Vivo Y33s 8GB - 128GB1.webp', 32)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (96, N'Vivo Y33s 8GB - 128GB2.webp', 32)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (97, N'Vivo Y33s 8GB - 128GB3.webp', 32)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (98, N'Vivo Y53s 8GB+3GB - 128GB1.webp', 33)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (99, N'Vivo Y53s 8GB+3GB - 128GB2.webp', 33)
GO
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (100, N'Vivo Y53s 8GB+3GB - 128GB3.webp', 33)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (101, N'Vivo Y15s 3GB - 32GB1.webp', 34)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (102, N'Vivo Y15s 3GB - 32GB2.webp', 34)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (103, N'Vivo Y15s 3GB - 32GB3.webp', 34)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (104, N'Vivo Y21s 4GB+1GB - 128GB1.webp', 35)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (105, N'Vivo Y21s 4GB+1GB - 128GB2.webp', 35)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (106, N'Vivo Y21s 4GB+1GB - 128GB3.webp', 35)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (107, N'TECNO POVA 2 4GB-64GB1.webp', 36)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (108, N'TECNO POVA 2 4GB-64GB2.webp', 36)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (109, N'TECNO POVA 2 4GB-64GB3.webp', 36)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (110, N'TECNO SPARK 7T 4GB-64GB1.webp', 37)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (111, N'TECNO SPARK 7T 4GB-64GB2.webp', 37)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (112, N'TECNO SPARK 7T 4GB-64GB3.webp', 37)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (113, N'TECNO POP 5 2GB-32GB1.webp', 38)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (114, N'TECNO POP 5 2GB-32GB2.webp', 38)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (115, N'TECNO POP 5 2GB-32GB3.webp', 38)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (116, N'Nokia G21 6GB-128GB1.webp', 39)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (117, N'Nokia G21 6GB-128GB2.webp', 39)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (118, N'Nokia G21 6GB-128GB3.webp', 39)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (119, N'Nokia C30 3GB-32GB1.webp', 40)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (120, N'Nokia C30 3GB-32GB2.webp', 40)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (121, N'Nokia C30 3GB-32GB3.webp', 40)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (122, N'Nokia C21 Plus 3GB-32GB1.webp', 41)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (123, N'Nokia C21 Plus 3GB-32GB2.webp', 41)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (124, N'Nokia C21 Plus 3GB-32GB3.webp', 41)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (125, N'Realme 9 Pro 5G 8G-128GB1.webp', 42)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (126, N'Realme 9 Pro 5G 8G-128GB2.webp', 42)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (127, N'Realme 9 Pro 5G 8G-128GB3.webp', 42)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (128, N'Realme 8 Pro 8GB - 128GB1.webp', 43)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (129, N'Realme 8 Pro 8GB - 128GB2.webp', 43)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (130, N'Realme 8 Pro 8GB - 128GB3.webp', 43)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (131, N'Realme C25y 4GB-128GB1.webp', 44)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (132, N'Realme C25y 4GB-128GB2.webp', 44)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (133, N'Realme C25y 4GB-128GB3.webp', 44)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (134, N'Realme C21y 3GB - 32GB1.webp', 45)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (135, N'Realme C21y 3GB - 32GB2.webp', 45)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (136, N'Realme C21y 3GB - 32GB3.webp', 45)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (137, N'Realme C35 4GB-128GB1.webp', 46)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (138, N'Realme C35 4GB-128GB2.webp', 46)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (139, N'Realme C35 4GB-128GB3.webp', 46)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (140, N'iPad Pro 11 2021 M1 Wi-Fi 1TB1.webp', 47)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (141, N'iPad Pro 11 2021 M1 Wi-Fi 1TB2.webp', 47)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (142, N'iPad Pro 11 2021 M1 Wi-Fi 1TB3.webp', 47)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (143, N'iPad Pro 12.9 2021 M1 Wi-Fi 5G 128GB1.webp', 48)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (144, N'iPad Pro 12.9 2021 M1 Wi-Fi 5G 128GB2.webp', 48)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (145, N'iPad Pro 12.9 2021 M1 Wi-Fi 5G 128GB3.webp', 48)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (146, N'iPad Air 5 2022 10.9 inch M1 WiFi 64GB1.webp', 49)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (147, N'iPad Air 5 2022 10.9 inch M1 WiFi 64GB2.webp', 49)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (148, N'iPad Air 5 2022 10.9 inch M1 WiFi 64GB3.webp', 49)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (149, N'iPad Mini 6 2021 8.3 inch WiFi 256GB1.webp', 50)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (150, N'iPad Mini 6 2021 8.3 inch WiFi 256GB2.webp', 50)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (151, N'iPad Mini 6 2021 8.3 inch WiFi 256GB3.webp', 50)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (152, N'iPad Air 5 2022 10.9 inch M1 WiFi 64GB1.webp', 51)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (153, N'iPad Air 5 2022 10.9 inch M1 WiFi 64GB2.webp', 51)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (154, N'iPad Air 5 2022 10.9 inch M1 WiFi 64GB3.webp', 51)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (155, N'iPad Gen 9 2021 10.2 inch WiFi Cellular 64GB1.webp', 52)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (156, N'iPad Gen 9 2021 10.2 inch WiFi Cellular 64GB2.webp', 52)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (157, N'iPad Gen 9 2021 10.2 inch WiFi Cellular 64GB3.webp', 52)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (158, N'Samsung Galaxy Tab S8 Ultra1.webp', 53)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (159, N'Samsung Galaxy Tab S8 Ultra2.webp', 53)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (160, N'Samsung Galaxy Tab S8 Ultra3.webp', 53)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (161, N'Samsung Galaxy Tab S8 Plus1.webp', 54)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (162, N'Samsung Galaxy Tab S8 Plus2.webp', 54)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (163, N'Samsung Galaxy Tab S8 Plus3.webp', 54)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (164, N'Samsung Galaxy Tab S7 FE1.webp', 55)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (165, N'Samsung Galaxy Tab S7 FE2.webp', 55)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (166, N'Samsung Galaxy Tab S7 FE3.webp', 55)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (167, N'Samsung Galaxy Tab S6 Lite 20221.webp', 56)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (168, N'Samsung Galaxy Tab S6 Lite 20222.webp', 56)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (169, N'Samsung Galaxy Tab S6 Lite 20223.webp', 56)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (170, N'Samsung Galaxy Tab A8 20221.webp', 57)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (171, N'Samsung Galaxy Tab A8 20222.webp', 57)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (172, N'Samsung Galaxy Tab A8 20223.webp', 57)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (173, N'Samsung Galaxy Tab A7 Lite1.webp', 58)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (174, N'Samsung Galaxy Tab A7 Lite2.webp', 58)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (175, N'Samsung Galaxy Tab A7 Lite3.webp', 58)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (176, N'Masstel Tab 10M 4G1.webp', 59)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (177, N'Masstel Tab 10M 4G2.webp', 59)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (178, N'Masstel Tab 10M 4G3.webp', 59)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (179, N'Masstel Tab 10 Wifi1.webp', 60)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (180, N'Masstel Tab 10 Wifi2.webp', 60)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (181, N'Masstel Tab 10 Wifi3.webp', 60)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (182, N'Lenovo Tab P11 Pro WI-FI 4G 128GB1.webp', 61)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (183, N'Lenovo Tab P11 Pro WI-FI 4G 128GB2.webp', 61)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (184, N'Lenovo Tab P11 Pro WI-FI 4G 128GB3.webp', 61)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (185, N'Lenovo Tab M10 32GB (Gen 2)1.webp', 62)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (186, N'Lenovo Tab M10 32GB (Gen 2)2.webp', 62)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (187, N'Lenovo Tab M10 32GB (Gen 2)3.webp', 62)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (188, N'Lenovo Tab M8-Gen 21.webp', 63)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (189, N'Lenovo Tab M8-Gen 22.webp', 63)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (190, N'Lenovo Tab M8-Gen 23.webp', 63)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (191, N'Apple Watch Series 7 GPS + Cellular 41mm Steel Wire Bezel1.webp', 64)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (192, N'Apple Watch Series 7 GPS + Cellular 41mm Steel Wire Bezel2.webp', 64)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (193, N'Apple Watch Series 7 GPS + Cellular 41mm Steel Wire Bezel3.webp', 64)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (194, N'Apple Watch Series 7 GPS 41mm Aluminum Trim Rubber Band1.webp', 65)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (195, N'Apple Watch Series 7 GPS 41mm Aluminum Trim Rubber Band2.webp', 65)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (196, N'Apple Watch Series 7 GPS 41mm Aluminum Trim Rubber Band3.webp', 65)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (197, N'Apple Watch SE GPS + Cellular 44mm Aluminum Bezel Wire Sport Loop1.webp', 66)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (198, N'Apple Watch SE GPS + Cellular 44mm Aluminum Bezel Wire Sport Loop2.webp', 66)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (199, N'Apple Watch SE GPS + Cellular 44mm Aluminum Bezel Wire Sport Loop3.webp', 66)
GO
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (200, N'Apple Watch SE GPS 40mm Aluminum Trim Rubber Band1.webp', 67)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (201, N'Apple Watch SE GPS 40mm Aluminum Trim Rubber Band2.webp', 67)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (202, N'Apple Watch SE GPS 40mm Aluminum Trim Rubber Band3.webp', 67)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (203, N'Apple Watch Series 3 GPS 38mm Aluminum Trim Rubber Band1.webp', 68)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (204, N'Apple Watch Series 3 GPS 38mm Aluminum Trim Rubber Band2.webp', 68)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (205, N'Apple Watch Series 3 GPS 38mm Aluminum Trim Rubber Band3.webp', 68)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (206, N'Apple Watch Nike Series 7 GPS + Cellular 41mm Aluminum Trim Rubber Band1.webp', 69)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (207, N'Apple Watch Nike Series 7 GPS + Cellular 41mm Aluminum Trim Rubber Band2.webp', 69)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (208, N'Apple Watch Nike Series 7 GPS + Cellular 41mm Aluminum Trim Rubber Band3.webp', 69)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (209, N'Garmin MARQ Smartwatch, Aviator1.webp', 70)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (210, N'Garmin MARQ Smartwatch, Aviator2.webp', 70)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (211, N'Garmin MARQ Smartwatch, Aviator3.webp', 70)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (212, N'Garmin Venu Sq Smartwatch1.webp', 71)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (213, N'Garmin Venu Sq Smartwatch2.webp', 71)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (214, N'Garmin Venu Sq Smartwatch3.webp', 71)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (215, N'Garmin Instinct 2S Smartwatch, Camo PatternEd Version1.webp', 72)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (216, N'Garmin Instinct 2S Smartwatch, Camo PatternEd Version2.webp', 72)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (217, N'Garmin Instinct 2S Smartwatch, Camo PatternEd Version3.webp', 72)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (218, N'Garmin Vivomove 3S smartwatch1.webp', 73)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (219, N'Garmin Vivomove 3S smartwatch2.webp', 73)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (220, N'Garmin Vivomove 3S smartwatch3.webp', 73)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (221, N'Garmin Fenix 7S Smartwatch, Sapphire, Solar, Titanium Yellow Pink1.webp', 74)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (222, N'Garmin Fenix 7S Smartwatch, Sapphire, Solar, Titanium Yellow Pink2.webp', 74)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (223, N'Garmin Fenix 7S Smartwatch, Sapphire, Solar, Titanium Yellow Pink3.webp', 74)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (224, N'Mi Band 6 Smart Bracelet1.webp', 75)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (225, N'Mi Band 6 Smart Bracelet2.webp', 75)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (226, N'Mi Band 6 Smart Bracelet3.webp', 75)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (227, N'Xiaomi Redmi Watch 2 Lite1.webp', 76)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (228, N'Xiaomi Redmi Watch 2 Lite2.webp', 76)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (229, N'Xiaomi Redmi Watch 2 Lite3.webp', 76)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (230, N'Xiaomi Watch S1 Active Smartwatch1.webp', 77)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (231, N'Xiaomi Watch S1 Active Smartwatch2.webp', 77)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (232, N'Xiaomi Watch S1 Active Smartwatch3.webp', 77)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (233, N'Samsung Galaxy Watch 4 40mm1.webp', 78)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (234, N'Samsung Galaxy Watch 4 40mm2.webp', 78)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (235, N'Samsung Galaxy Watch 4 40mm3.webp', 78)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (236, N'Samsung Galaxy Watch 4 Classic 46mm1.webp', 79)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (237, N'Samsung Galaxy Watch 4 Classic 46mm2.webp', 79)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (238, N'Samsung Galaxy Watch 4 Classic 46mm3.webp', 79)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (239, N'Super Hero 4G Childrens Locator Watch1.webp', 80)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (240, N'Super Hero 4G Childrens Locator Watch2.webp', 80)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (241, N'Super Hero 4G Childrens Locator Watch3.webp', 80)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (242, N'OPPO Band Smart Bracelet (OB19B1)1.webp', 81)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (243, N'OPPO Band Smart Bracelet (OB19B1)2.webp', 81)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (244, N'OPPO Band Smart Bracelet (OB19B1)3.webp', 81)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (245, N'Huawei Watch Fit1.webp', 82)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (246, N'Huawei Watch Fit2.webp', 82)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (247, N'Huawei Watch Fit3.webp', 82)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (248, N'Anker PowerCore Select 10000mAh A1223.webp', 83)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (249, N'Anker PowerCore Slim 10000mAh PD - A1231.webp', 84)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (250, N'Anker PowerCore 20000mAh Speed QC 3.0.webp', 85)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (251, N'Samsung Battery Pack 10,000 mAh.webp', 86)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (252, N'Ivalue 20000mAh MT-P200-001 (HK-108).webp', 87)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (253, N'ivalue 10000mAh Y1-5 Port Micro & Type-C.webp', 88)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (254, N'UmeTravel 10000mAH PW1 Wireless.webp', 89)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (255, N'UmeTravel 20000mAh TRIP20000 Quick Charge.webp', 90)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (256, N'Veger 10000mAh L10 PD&QC3.0.webp', 91)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (257, N'Anker 20W Powerport III A2033 Fast Charger.webp', 92)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (258, N'USB-C to Lightning Anker PowerLine Select A8613.webp', 93)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (259, N'MagSafe Duo Charger Double Charging Dock.webp', 94)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (260, N'USB-C to Lightning Apple Cable.webp', 95)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (261, N'Apple Power Adapter 20W Type-C Charger.webp', 96)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (262, N'Belkin 37W 2 Port Fast Charger (USB-C PD 25W + USB-A 12W).webp', 97)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (263, N'Belkin Playa MFI Lightning Cable 1m PVC Shell.webp', 98)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (264, N'UmeTravel 18W A3X 1 Port Fast Charger.webp', 99)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (265, N'UmeTravel Military fibre C3L Lightning Cable.webp', 100)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (266, N'Type-C UmeTravel Military fibre C1 1m Cable.webp', 101)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (267, N'TWS Anker Soundcore Liberty Air 2 Bluetooth Headphones - A39101.webp', 102)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (268, N'TWS Anker Soundcore Liberty Air 2 Bluetooth Headphones - A39102.webp', 102)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (269, N'TWS Anker Soundcore Liberty Air 2 Bluetooth Headphones - A39103.webp', 102)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (270, N'AirPods Pro1.webp', 103)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (271, N'AirPods Pro2.webp', 103)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (272, N'AirPods Pro3.webp', 103)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (273, N'EarPods with Lightning Connector2.webp', 104)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (274, N'Ivalue BT008 Bluetooth Headphones.webp', 105)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (275, N'Sony Extra Bass MDR-EX155AP earbuds.webp', 106)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (276, N'JBL T115TWSREDAS Bluetooth Headphones1.webp', 107)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (277, N'JBL T115TWSREDAS Bluetooth Headphones2.webp', 107)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (278, N'JBL T115TWSREDAS Bluetooth Headphones3.webp', 107)
INSERT [dbo].[image] ([id], [image], [productId]) VALUES (279, N'JBL QUANTUM50BLKAS earbuds with mic.webp', 108)
SET IDENTITY_INSERT [dbo].[image] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([id], [accountId], [stateId], [address], [transportId], [orderTime], [total]) VALUES (1, 7, 1, N'Ha Noi', 1, CAST(N'2022-07-14T03:34:55.107' AS DateTime), 70169000.0000)
INSERT [dbo].[order] ([id], [accountId], [stateId], [address], [transportId], [orderTime], [total]) VALUES (2, 7, 1, N'Ha Noi', 1, CAST(N'2022-07-14T03:36:53.230' AS DateTime), 34721000.0000)
INSERT [dbo].[order] ([id], [accountId], [stateId], [address], [transportId], [orderTime], [total]) VALUES (3, 7, 1, N'Ha Noi', 1, CAST(N'2022-07-14T07:34:54.760' AS DateTime), 55261000.0000)
INSERT [dbo].[order] ([id], [accountId], [stateId], [address], [transportId], [orderTime], [total]) VALUES (4, 7, 1, N'Hanoi', 1, CAST(N'2022-07-19T07:43:42.883' AS DateTime), 9902000.0000)
INSERT [dbo].[order] ([id], [accountId], [stateId], [address], [transportId], [orderTime], [total]) VALUES (5, 7, 2, N'Ha Noi', 1, CAST(N'2022-11-01T00:00:00.000' AS DateTime), 70169000.0000)
INSERT [dbo].[order] ([id], [accountId], [stateId], [address], [transportId], [orderTime], [total]) VALUES (6, 7, 2, N'Ha Noi', 1, CAST(N'2022-11-04T00:00:00.000' AS DateTime), 70169000.0000)
INSERT [dbo].[order] ([id], [accountId], [stateId], [address], [transportId], [orderTime], [total]) VALUES (7, 7, 2, N'Ha Noi', 1, CAST(N'2022-11-07T00:00:00.000' AS DateTime), 70169000.0000)
INSERT [dbo].[order] ([id], [accountId], [stateId], [address], [transportId], [orderTime], [total]) VALUES (8, 7, 2, N'Ha Noi', 1, CAST(N'2022-11-10T00:00:00.000' AS DateTime), 70169000.0000)
INSERT [dbo].[order] ([id], [accountId], [stateId], [address], [transportId], [orderTime], [total]) VALUES (9, 6, 2, N'Hanoi', 1, CAST(N'2022-11-11T13:17:15.527' AS DateTime), 7478000.0000)
INSERT [dbo].[order] ([id], [accountId], [stateId], [address], [transportId], [orderTime], [total]) VALUES (10, 6, 3, N'HCM', 1, CAST(N'2022-11-11T13:17:35.977' AS DateTime), 10490000.0000)
INSERT [dbo].[order] ([id], [accountId], [stateId], [address], [transportId], [orderTime], [total]) VALUES (11, 6, 3, N'HCM', 1, CAST(N'2022-11-11T13:17:49.977' AS DateTime), 33230000.0000)
INSERT [dbo].[order] ([id], [accountId], [stateId], [address], [transportId], [orderTime], [total]) VALUES (13, 6, 1, N'c', 1, CAST(N'2022-11-14T11:00:19.677' AS DateTime), 0.0000)
INSERT [dbo].[order] ([id], [accountId], [stateId], [address], [transportId], [orderTime], [total]) VALUES (14, 10, 1, N'Hanoi', 1, CAST(N'2022-11-14T12:39:50.057' AS DateTime), 24967000.0000)
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[orderDetail] ON 

INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (1, 1, 53, 1, 30990000.0000, 0)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (2, 1, 103, 1, 4799000.0000, 20)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (3, 1, 4, 1, 27271000.0000, 12)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (4, 1, 67, 1, 6749000.0000, 25)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (5, 1, 92, 1, 360000.0000, 10)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (6, 2, 44, 1, 3771000.0000, 10)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (7, 2, 11, 2, 15025000.0000, 3)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (8, 2, 84, 1, 900000.0000, 10)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (9, 3, 103, 1, 4799000.0000, 20)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (10, 3, 69, 1, 13790000.0000, 8)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (11, 3, 39, 1, 4314000.0000, 6)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (12, 3, 50, 1, 18990000.0000, 5)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (13, 3, 44, 1, 3771000.0000, 10)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (14, 3, 85, 1, 1317000.0000, 15)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (15, 3, 77, 1, 4490000.0000, 0)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (16, 3, 59, 1, 3790000.0000, 5)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (17, 4, 62, 2, 4411000.0000, 15)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (18, 4, 92, 3, 360000.0000, 10)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (19, 5, 53, 1, 30990000.0000, 0)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (20, 5, 103, 1, 4799000.0000, 20)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (21, 5, 4, 1, 27271000.0000, 12)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (22, 5, 67, 1, 6749000.0000, 25)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (23, 5, 92, 1, 360000.0000, 10)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (24, 6, 53, 1, 30990000.0000, 0)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (25, 6, 103, 1, 4799000.0000, 20)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (26, 6, 4, 1, 27271000.0000, 12)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (27, 6, 67, 1, 6749000.0000, 25)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (28, 6, 92, 1, 360000.0000, 10)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (29, 7, 53, 1, 30990000.0000, 0)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (30, 7, 103, 1, 4799000.0000, 20)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (31, 7, 4, 1, 27271000.0000, 12)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (32, 7, 67, 1, 6749000.0000, 25)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (33, 7, 92, 1, 360000.0000, 10)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (34, 8, 53, 1, 30990000.0000, 0)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (35, 8, 103, 1, 4799000.0000, 20)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (36, 8, 4, 1, 27271000.0000, 12)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (37, 8, 67, 1, 6749000.0000, 25)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (38, 8, 92, 1, 360000.0000, 10)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (39, 9, 41, 2, 2840000.0000, 5)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (40, 9, 89, 2, 899000.0000, 10)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (41, 10, 13, 1, 10490000.0000, 0)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (42, 11, 12, 1, 8540000.0000, 5)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (43, 11, 8, 1, 24690000.0000, 5)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (45, 14, 3, 1, 20450000.0000, 7)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (46, 14, 41, 1, 2840000.0000, 5)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (47, 14, 92, 1, 360000.0000, 10)
INSERT [dbo].[orderDetail] ([id], [orderId], [productId], [quantity], [price], [discount]) VALUES (48, 14, 85, 1, 1317000.0000, 15)
SET IDENTITY_INSERT [dbo].[orderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[orderStatus] ON 

INSERT [dbo].[orderStatus] ([id], [name]) VALUES (1, N'Processing')
INSERT [dbo].[orderStatus] ([id], [name]) VALUES (2, N'Shipping')
INSERT [dbo].[orderStatus] ([id], [name]) VALUES (3, N'Received')
SET IDENTITY_INSERT [dbo].[orderStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (1, N'iPhone 11 64GB', 1, 1, CAST(N'2019-01-01' AS Date), N'The iPhone 11 with 6 color versions, a camera with outstanding photography capabilities, extremely long battery life and the most powerful processor ever will provide a great experience for you.', N'Display:  6.1 inch, IPS LCD, Liquid Retina HD, 828 x 1792 Pixels<br>Main camera:  12.0 MP + 12.0 MP<br>Selfie camera:  12.0 MP<br>RAM:  4 GB<br>Memory:  64 GB<br>CPU:  Apple A13 Bionic<br>GPU:  Apple GPU 4 cores<br>Battery capacity:  3110 mAh<br>Sim:  2 - 1 eSIM, 1 Nano SIM<br>Operating system:  iOS 14', 14999000.0000, 10, 1003, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (2, N'iPhone 12 64GB', 1, 1, CAST(N'2020-10-05' AS Date), N'The iPhone 12 came out as a whole new era. Super-fast 5G network speeds, the worlds fastest A14 Bionic processor smartphone, stunning edge-to-edge OLED displays and super night cameras, are all available on the iPhone 12.', N'Monitor:  6.1 inch, OLED, Super Retina XDR, 2532 x 1170 Pixels<br>
Rear camera:  12.0 MP + 12.0 MP<br>
Camera Selfie:  12.0 MP<br>
RAM:  4 GB<br>
Internal memory:  64 GB<br>
CPU:  Apple A14 Bionic<br>
Battery capacity:  2815 mAh<br>
Sim card:  2 - 1 eSIM, 1 Nano SIM<br>
Operating system:  iOS 14', 19999000.0000, 6, 55, 1, 3)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (3, N'iPhone 13 mini 128GB', 1, 1, CAST(N'2022-08-22' AS Date), N'The iPhone 13 mini is a phone for those who love compactness. With a cute design, tucked into your hands or pockets, the iPhone 13 mini is even more surprising with incredible power, a super-sharp OLED screen and a professional photography camera.', N'Monitor: 5.4 inches, OLED, Super Retina XDR, 1080 x 2340 Pixels<br>
Rear camera: 12.0 MP + 12.0 MP<br>
Camera Selfie: 12.0 MP<br>
RAM: 4 GB<br>
Internal memory: 128 GB<br>
CPU: Apple A15 Bionic<br>
GPU: Apple GPU 5 Core<br>
Battery capacity: 2406 mAh<br>
Sim card: 1 - 1 eSIM, 1 Nano SIM<br>
Operating system: iOS 15', 21990000.0000, 7, 91, 1, 3)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (4, N'iPhone 13 Pro 128GB', 1, 1, CAST(N'2021-09-09' AS Date), N'Enjoy incredible speeds on the worlds fastest smartphone, the iPhone 13 Pro with a groundbreaking 120Hz ProMotion display, an A15 Bionic processor for unrivalled performance, superior battery life, and a significantly upgraded trio of three cameras, worthy of being the top phone on the market.', N'Monitor: 6.1 inch, OLED, Super Retina XDR, 2532 x 1170 Pixels<br>
Rear camera: 12.0 MP + 12.0 MP + 12.0 MP<br>
Camera Selfie: 12.0 MP<br>
RAM: 6 GB<br>
Internal memory: 128 GB<br>
CPU: Apple A15 Bionic<br>
GPU: Apple GPU 5 Core<br>
Battery capacity: 3095 mAh<br>
Sim card: 1 - 1 eSIM, 1 Nano SIM<br>
Operating system: iOS 15', 30990000.0000, 12, 99, 1, 3)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (5, N'iPhone 13 Pro Max 128GB', 1, 1, CAST(N'2021-10-12' AS Date), N'The iPhone 13 Pro Max deserves to be the largest, most powerful, and longest battery life iPhone ever that will give you a great experience, from normal tasks to professional apps.', N'Monitor: 6.7 inches, OLED, Super Retina XDR, 2778 x 1284 Pixels<br>
Rear camera: 12.0 MP + 12.0 MP + 12.0 MP<br>
Camera Selfie: 12.0 MP<br>
RAM: 6 GB<br>
Internal memory: 128 GB<br>
CPU: Apple A15 Bionic<br>
GPU: Apple GPU 5 Core<br>
Battery capacity: 4352 mAh<br>
Sim card: 1 - 1 eSIM, 1 Nano SIM<br>
Operating system: iOS 15', 33990000.0000, 8, 123, 1, 3)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (6, N'Samsung Galaxy A52s 5G', 1, 2, CAST(N'2021-06-23' AS Date), N'Experience the all-new era of 5G, which is the master of speed and leading the game, Samsung Galaxy A52s 5G with super-fast 5G connectivity, excellent performance power and a quartet of superior OIS optical anti-vibration cameras will take you from surprise to surprise.', N'Monitor: 6.5 inch, Super AMOLED, FHD+, 1080 x 2400 Pixels<br>
Rear camera: 64.0 MP + 12.0 MP + 5.0 MP + 5.0 MP + 5.0 MP<br>
Camera Selfie: 32.0 MP<br>
RAM: 8 GB<br>
Internal memory: 128 GB<br>
CPU: Snapdragon 778G<br>
GPU: Adreno 642L<br>
Battery capacity: 4500 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 11', 10990000.0000, 3, 99, 1, 3)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (7, N'Samsung Galaxy S22 Ultra 5G 128GB', 1, 2, CAST(N'2022-03-01' AS Date), N'Samsung Galaxy S22 Ultra 5G is the successor to the galaxy note elite and breakthrough Galaxy S, creating unparalleled power. The phone has set a new standard for high-end smartphones from the Snapdragon 8 Gen 1 flagship power, the "dark eye" camera, 100x zoom capability, the built-in S-Pen pen and the long all-day usage time. This is the best thing Samsung has ever brought.', N'Monitor: 6.8 inch, Dynamic AMOLED 2X, QHD+, 1440 x 3088 Pixels<br>
Rear camera: 108.0 MP + 12.0 MP + 10.0 MP + 10.0 MP<br>
Camera Selfie: 40.0 MP<br>
RAM: 8 GB<br>
Internal memory: 128 GB<br>
CPU: Snapdragon 8 Gen 1<br>
Battery capacity: 5000 mAh<br>
Sim card: 2 - 2 Nano SIM or 1 eSIM, 1 Nano SIM<br>
Operating system: Android 12', 30990000.0000, 12, 79, 1, 3)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (8, N'Samsung Galaxy S22 Plus 5G 128GB', 1, 2, CAST(N'2022-03-20' AS Date), N'Enjoying samsungs top-notch technologies, the Galaxy S22 Plus 5G will give you a top-notch experience from trendy design, powerful Snapdragon 8 Gen 1 performance, and the most professional night camera system ever.', N'Monitor: 6.6 inches, Dynamic AMOLED 2X, FHD+, 1080 x 2340 Pixels<br>
Rear camera: 50.0 MP + 12.0 MP + 10.0 MP<br>
Camera Selfie: 10.0 MP<br>
RAM: 8 GB<br>
Internal memory: 128 GB<br>
CPU: Snapdragon 8 Gen 1<br>
Battery capacity: 4500 mAh<br>
Sim card: 2 - 2 Nano SIM or 1 eSIM, 1 Nano SIM<br>
Operating system: Android 12', 25990000.0000, 5, 96, 1, 3)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (9, N'Samsung Galaxy Z Flip3 5G 128GB', 1, 2, CAST(N'2021-08-11' AS Date), N'A fashion icon, a masterpiece of the tech world that everyone must be amazed to see the Samsung Galaxy Z Flip3 5G and how you use this smartphone, where foldable phone technology has brought the impossible.', N'Monitor: Sub: 6.7 inches, Main: Dynamic AMOLED, FHD+, 1080 x 2636 Pixels<br>
Rear camera: 12.0 MP + 12.0 MP<br>
Camera Selfie: 10.0 MP<br>
RAM: 8 GB<br>
Internal memory: 128 GB<br>
CPU: Snapdragon 888<br>
Battery capacity: 3300 mAh<br>
Sim card: 1 - 1 eSIM, 1 Nano SIM<br>
Operating system: Android 11', 24990000.0000, 10, 78, 1, 3)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (10, N'Samsung Galaxy Z Fold3 5G 256GB', 1, 2, CAST(N'2021-08-15' AS Date), N'When you open the 7.6-inch folding screen on the Samsung Galaxy Z Fold3 5G, youve opened up a whole new future for the smartphone world, where technology transcends all limits, for the most perfect experience in a compact mobile device.', N'Monitor: Sub: 6.2 inches, Main: 7.6 inches, Dynamic AMOLED 2X, HD+, 1768 x 2208 Pixels<br>
Rear camera: 12.0 MP + 12.0 MP + 12.0 MP<br>
Camera Selfie: 10.0 MP<br>
RAM: 12 GB<br>
Internal memory: 256 GB<br>
CPU: Snapdragon 888<br>
Battery capacity: 4400 mAh<br>
Sim card: 2 - 2 Nano SIM or 1 eSIM, 1 Nano SIM<br>
Operating system: Android 11', 41990000.0000, 15, 99, 1, 3)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (11, N'Samsung Galaxy S20 FE 256GB', 1, 2, CAST(N'2021-04-01' AS Date), N'Experience the premium features of the 256GB Samsung Galaxy S20 FE phone, where you enjoy endless fun with an excellent camera, an ultra-smooth 120Hz infinity display, and enough configuration for comfortable use for years to come.', N'Monitor: 6.5 inch, Super AMOLED, FHD+, 1080 x 2400 Pixels<br>
Rear camera: 12.0 MP + 12.0 MP + 8.0 MP<br>
Camera Selfie: 32.0 MP<br>
RAM: 8 GB<br>
Internal memory: 256 GB<br>
CPU: Snapdragon 865<br>
GPU: Adreno 650<br>
Battery capacity: 4500 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 10', 15490000.0000, 3, 86, 1, 3)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (12, N'OPPO Reno7 8GB-128GB', 1, 3, CAST(N'2022-04-25' AS Date), N'Classic design, with trendy colors, OPPO Reno7 brings unique beauty and creativity to Gen Z users.', N'Monitor: 6.4 inches, AMOLED, FHD+, 1080 x 2400 Pixels<br>
Rear camera: 64.0 MP + 2.0 MP + 2.0 MP<br>
Camera Selfie: 32.0 MP<br>
RAM: 8 GB<br>
Internal memory: 128 GB<br>
CPU: Snapdragon 680<br>
GPU: Adreno 610<br>
Battery capacity: 4500 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 12 (ColorOS 12.1)', 8990000.0000, 5, 72, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (13, N'OPPO Reno7 Z 5G 8GB - 128GB', 1, 3, CAST(N'2022-03-29' AS Date), N'OPPO Reno7 Z 5G conquers users at first sight with the most fashionable design. Inside the phone there is also a powerful internal force from improved technology, a great portrait camera system, Snapdragon 695 5G processor and 33W supercharged charging, making you ready to explore a colorful life.', N'Monitor: 6.43 inches, AMOLED, FHD+, 1080 x 2400 Pixels
<br>Rear camera: 64.0 MP + 2.0 MP + 2.0 MP
<br>Camera Selfie: 16.0 MP
<br>RAM: 8 GB
<br>Internal memory: 128 GB
<br>CPU: Snapdragon 695 5G
<br>GPU: Adreno 619
<br>Battery capacity: 4500 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11 (ColorOS 12)', 10490000.0000, 0, 48, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (14, N'OPPO Find X3 Pro 5G', 1, 3, CAST(N'2021-05-10' AS Date), N'Get ready to look to the future with the OPPO Find X3 Pro 5G, a phone with an honest color camera, a super-smooth 120Hz display, 1 billion vivid colors, and groundbreaking performance with the power of the Qualcomm Snapdragon 888 chip that supports 5G.', N'Monitor: 6.7 inches, AMOLED, QHD+, 1440 x 3216 Pixels
<br>Rear camera: 50.0 MP + 50.0 MP + 13.0 MP + 3.0 MP
<br>Camera Selfie: 32.0 MP
<br>RAM: 12 GB
<br>Internal memory: 256 GB
<br>CPU: Snapdragon 888
<br>GPU: Adreno 660
<br>Battery capacity: 4500 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 26990000.0000, 25, 88, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (15, N'Oppo Reno6 5G', 1, 3, CAST(N'2021-07-27' AS Date), N'Ready to unleash emotions with OPPO Reno6 5G, the phone has an ultra-thin design, a unique Bokeh Flare portrait camera and, above all, a super-fast 5G network connection, with you connecting to the future.', N'Monitor: 6.43 inches, AMOLED, FHD+, 1080 x 2400 Pixels
<br>Rear camera: 64.0 MP + 8.0 MP + 2.0 MP
<br>Camera Selfie: 32.0 MP
<br>RAM: 8 GB
<br>Internal memory: 128 GB
<br>CPU: MediaTek Dimensity 900 5G
<br>GPU: Mali-G68 MC4
<br>Battery capacity: 4300 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 12990000.0000, 10, 87, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (16, N'OPPO A95 8GB-128GB', 1, 3, CAST(N'2021-11-21' AS Date), N'Possessing a modern and stylish appearance, oppo A95 convinces you at first sight. Not only that, the phone also enhances the experience with a large battery, 33W fast charging, impressive performance and RAM expansion technology.', N'Monitor: 6.43 inches, AMOLED, FHD+, 1080 x 2400 Pixels
<br>Rear camera: 48.0 MP + 2.0 MP + 2.0 MP
<br>Camera Selfie: 16.0 MP
<br>RAM: 8 GB
<br>Internal memory: 128 GB
<br>CPU: Snapdragon 662
<br>GPU: Adreno 610
<br>Battery capacity: 5000 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 6990000.0000, 15, 46, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (17, N'OPPO A55 4GB-64GB', 1, 3, CAST(N'2021-10-10' AS Date), N'A beautiful photo-taking phone with enough energy to experience with you the interesting things in life, OPPO A55 with a fresh design, excellent configuration in the cheap range will surely make you satisfied.', N'Monitor: 6.5 inches, IPS LCD, HD+, 720 x 1600 Pixels
<br>Rear camera: 50.0 MP + 2.0 MP + 2.0 MP
<br>Camera Selfie: 16.0 MP
<br>RAM: 4 GB
<br>Internal memory: 64 GB
<br>CPU: Helio G35
<br>GPU: PowerVR GE8320
<br>Battery capacity: 5000 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 4990000.0000, 7, 84, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (18, N'OPPO A16k 3GB-32GB', 1, 3, CAST(N'2021-11-11' AS Date), N'Not only scoring points thanks to the youthful 3D design flattering the eyes and the small body that fits the handle, the OPPO A16k phone also brings more interesting experiences with eye protection screen technology, 4,230mAh battery capacity for a long-term experience and a series of outstanding features.', N'Monitor: 6.52 inch, IPS LCD, HD+, 720 x 1600 Pixels
<br>Rear camera: 13.0 MP
<br>Camera Selfie: 5.0 MP
<br>RAM: 3 GB
<br>Internal memory: 32 GB
<br>CPU: Helio G35
<br>GPU: PowerVR GE8320
<br>Battery capacity: 4230 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 3290000.0000, 0, 99, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (19, N'OPPO A94 8GB-128GB', 1, 3, CAST(N'2021-03-30' AS Date), N'OPPO A94 with innovative video recording, super fast charging and impressive performance will help your life more dynamic, full of fun.', N'Monitor: 6.43 inches, AMOLED, FHD+, 1080 x 2400 Pixels
<br>Rear camera: 48.0 MP + 8.0 MP + 2.0 MP + 2.0 MP + 2.0 MP
<br>Camera Selfie: 32.0 MP
<br>RAM: 8 GB
<br>Internal memory: 128 GB
<br>CPU: Helio P95
<br>GPU: PowerVR GM9446
<br>Battery capacity: 4310 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 5990000.0000, 8, 77, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (20, N'Xiaomi Redmi Note 11 4GB - 64GB', 1, 4, CAST(N'2022-01-01' AS Date), N'Lets experience xiaomi Redmi Note 11, the comprehensive upgraded version of the Redmi Note series has always been very popular so far. The superior power, super-long battery life, super fast charging and professional camera of the product will bring the best hours of entertainment.', N'Monitor: 6.43 inches, AMOLED, FHD+, 1080 x 2400 Pixels
<br>Rear camera: 50.0 MP + 8.0 MP + 2.0 MP + 2.0 MP + 2.0 MP
<br>Camera Selfie: 13.0 MP
<br>RAM: 4 GB
<br>Internal memory: 64 GB
<br>CPU: Snapdragon 680
<br>GPU: Adreno 610
<br>Battery capacity: 5000 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 4690000.0000, 0, 100, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (21, N'Xiaomi Redmi Note 11S 6GB - 128GB', 1, 4, CAST(N'2022-01-15' AS Date), N'Xiaomi has introduced the Redmi Note 11S and this phone carries many improvements in all aspects compared to its predecessor. Professional main cameras, super-fast charging, smooth displays and impressive performance will make for an incredible comprehensiveness, all of which will be in this mid-range smartphone.', N'Monitor: 6.43 inches, AMOLED, FHD+, 1080 x 2400 Pixels
<br>Rear camera: 108.0 MP + 8.0 MP + 2.0 MP + 2.0 MP + 2.0 MP
<br>Camera Selfie: 16.0 MP
<br>RAM: 6 GB
<br>Internal memory: 128 GB
<br>CPU: MediaTek Helio G96
<br>GPU: Mali-G57 MC2
<br>Battery capacity: 5000 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 6190000.0000, 12, 88, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (22, N'Xiaomi 11T Pro 5G 12GB - 256GB', 1, 4, CAST(N'2021-10-10' AS Date), N'Xiaomi 11T Pro is the most expensive high-end phone today. Youll get a 108MP professional camera, 120W super fast charging, a smooth 120Hz AMOLED display that supports Dolby Vision, and a Snapdragon 888 flagship processor, a range of top-notch features that will deliver a more enjoyable experience than ever before.', N'Monitor: 6.67 inches, AMOLED, FHD+, 1080 x 2400 Pixels
<br>Rear camera: 108.0 MP + 8.0 MP + 5.0 MP
<br>Camera Selfie: 16.0 MP
<br>RAM: 12 GB
<br>Internal memory: 256 GB
<br>CPU: Snapdragon 888
<br>Battery capacity: 5000 mAh
<br>Sim card: 2 - 1 Nano SIM
<br>Operating system: Android 11', 14990000.0000, 9, 74, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (23, N'Xiaomi Redmi Note 11 Pro 8GB - 128GB', 1, 4, CAST(N'2022-02-12' AS Date), N'The Xiaomi Redmi Note 11 Pro is one of the latest phones in the recently launched Redmi Note 11 series. The phone is equipped with impressive parameters but is still sold in the mid-range segment. With quality cameras of up to 108MP, a 120Hz screen and 67W fast charging, this is the perfect phone for you when you need it.', N'Monitor: 6.67 inches, AMOLED, FHD+, 1080 x 2400 Pixels
<br>Rear camera: 108.0 MP + 8.0 MP + 2.0 MP + 2.0 MP + 2.0 MP
<br>Camera Selfie: 16.0 MP
<br>RAM: 8 GB
<br>CPU: MediaTek Helio G96
<br>GPU: Mali-G57 MC2
<br>Battery capacity: 5000 mAh
<br>Sim card: 2 - 1 Nano SIM
<br>Operating system: Android 11', 7490000.0000, 10, 100, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (24, N'Xiaomi Redmi Note 10S 8GB-128GB', 1, 4, CAST(N'2021-05-05' AS Date), N'The Xiaomi Redmi Note 10S captures every moment with a professional 64MP camera quartet, stunning AMOLED display experience, and performance that has become the trademark of the Redmi series. Start your adventure in the most exciting way.', N'Monitor: 6.43 inches, AMOLED, FHD+, 1080 x 2400 Pixels
<br>Rear camera: 64.0 MP + 8.0 MP + 2.0 MP + 2.0 MP + 2.0 MP
<br>Camera Selfie: 13.0 MP
<br>RAM: 8 GB
<br>Internal memory: 128 GB
<br>CPU: MediaTek Helio G95
<br>GPU: Mali-G76 MC4
<br>Battery capacity: 5000 mAh
<br>Sim card: 2 - 1 Nano SIM
<br>Operating system: Android 11', 6490000.0000, 15, 100, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (25, N'Xiaomi 12 Pro 12GB - 256GB', 1, 4, CAST(N'2022-03-03' AS Date), N'With the continuous development and improvement of outstanding technologies, Xiaomi has brought a perfect Xiaomi 12 Pro, ready to master all your games. With a trio of 50MP cameras, a 2K+ display, 120W fast charging, and a top-of-the-line processor, the phone will be the top choice for 2022.', N'Monitor: 6.73 inch, AMOLED, FHD+, 1440 x 3200 Pixels
<br>Rear camera: 50.0 MP + 50.0 MP + 50.0 MP
<br>Camera Selfie: 32.0 MP
<br>RAM: 12 GB
<br>Internal memory: 256 GB
<br>CPU: Snapdragon 8 Gen 1
<br>GPU: Adreno 730
<br>Battery capacity: 4600 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 12', 27990000.0000, 6, 49, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (26, N'Xiaomi 11 Lite 5G NE 8GB - 256GB', 1, 4, CAST(N'2021-10-11' AS Date), N'More than just a phone, Xiaomi 11 Lite 5G NE deserves to be called a fashion icon in the smartphone world, where you get to feel the sophistication and sophistication to every line, along with unexpected power, super-fast 5G connectivity, mastering the future.', N'Monitor: 6.55 inch, AMOLED, FHD+, 1080 x 2400 Pixels
<br>Rear camera: 64.0 MP + 8.0 MP + 5.0 MP
<br>Camera Selfie: 20.0 MP
<br>RAM: 8 GB
<br>Internal memory: 256 GB
<br>CPU: Snapdragon 778G
<br>GPU: Adreno 642L
<br>Battery capacity: 4250 mAh
<br>Sim card: 2 - 1 Nano SIM
<br>Operating system: Android 11', 10490000.0000, 10, 87, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (27, N'Xiaomi Redmi 10C 4GB - 128GB', 1, 4, CAST(N'2022-03-01' AS Date), N'The best choice in the segment has appeared, Xiaomi Redmi 10C is equipped with a fast Snapdragon 680 6nm chip, has a 50MP main camera, owns a 5,000 mAh battery that supports 18W charging comes with a 6.71-inch screen and powerful external speakers.', N'Monitor: 6.71 inches, IPS, HD+, 720 x 1560 Pixels
<br>Rear camera: 50.0 MP + 2.0 MP
<br>Camera Selfie: 5.0 MP
<br>RAM: 4 GB
<br>Internal memory: 128 GB
<br>CPU: Snapdragon 680
<br>GPU: Adreno 610
<br>Battery capacity: 5000 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 3890000.0000, 0, 50, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (28, N'Xiaomi Redmi 9A 2GB-32GB', 1, 4, CAST(N'2020-07-25' AS Date), N'Xiaomi Redmi 9A demonstrates the superiority in the low-cost segment when it comes to having a large screen, battery life throughout the day and excellent configuration, giving you a truly satisfying experience.', N'Monitor: 6.53 inches, IPS LCD, HD+, 720 x 1600 Pixels
<br>Rear camera: 13.0 MP
<br>Camera Selfie: 5.0 MP
<br>RAM: 2 GB
<br>Internal memory: 32 GB
<br>CPU: Helio G25
<br>GPU: PowerVR GE8320
<br>Battery capacity: 5000 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 10', 2490000.0000, 10, 44, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (29, N'Xiaomi 12 8GB - 256GB', 1, 4, CAST(N'2022-03-12' AS Date), N'With the Xiaomi 12 in hand, you will easily master all your own fun. Whether its taking photos, playing games, or immersing yourself in movies, your phone will always give you the top experience. This flagship will be one of the hot choices for you today.', N'Monitor: 6.28 inch, AMOLED, FHD+, 1080 x 2400 Pixels
<br>Rear camera: 50.0 MP + 13.0 MP + 5.0 MP
<br>Camera Selfie: 32.0 MP
<br>RAM: 8 GB
<br>Internal memory: 256 GB
<br>CPU: Snapdragon 8 Gen 1
<br>GPU: Adreno 730
<br>Battery capacity: 4500 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 12', 19990000.0000, 8, 77, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (30, N'Vivo V23 5G', 1, 5, CAST(N'2022-01-01' AS Date), N'Vivo V23 5G is introduced as a pioneer in the market in terms of equipping the impressive 50MP dual selfie camera cluster. Not only that, this phone is perfected in terms of design, performance and camera, aiming for the best experience for users.', N'Monitor: 6.44 inches, AMOLED, FHD+, 1080 x 2400 Pixels
<br>Rear camera: 64.0 MP + 8.0 MP + 2.0 MP
<br>Camera Selfie: 50.0 MP + 8.0 MP
<br>RAM: 8 GB + 4 GB
<br>Internal memory: 128 GB
<br>CPU: MediaTek Dimensity 920
<br>GPU: Mali-G68 MC4
<br>Battery capacity: 4200 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 12', 11990000.0000, 10, 100, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (31, N'Vivo V23e 8GB - 128GB', 1, 5, CAST(N'2021-11-11' AS Date), N'With vivo V23e, all your selfies will be beautiful shimmering thanks to the help of a 50MP selfie camera combined with Eye Autofocus technology. In addition, vivo has succeeded in bringing a series of its top-notch features into a thin, stylish, stylish chassis.', N'Monitor: 6.44 inches, AMOLED, FHD+, 1080 x 2400 Pixels
<br>Rear camera: 64.0 MP + 8.0 MP + 2.0 MP
<br>Camera Selfie: 50.0 MP
<br>RAM: 8 GB + 4 GB
<br>Internal memory: 128 GB
<br>CPU: MediaTek Helio G96
<br>GPU: Mali-G57 MC2
<br>Battery capacity: 4050 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 8490000.0000, 9, 81, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (32, N'Vivo Y33s 8GB - 128GB', 1, 5, CAST(N'2022-03-10' AS Date), N'Not only does it score points with its stylish styling, ultra-thin body and flattering colors, the Vivo Y33s also shows irresistible appeal in the mid-range segment thanks to its 5,000 mAh battery, bright 6.58-inch screen, impressive 50MP night camera and superior performance to rivals of the same price range.', N'Monitor: 6.58 inch, IPS LCD, FHD+, 2408 x 1080 Pixels
<br>Rear camera: 50.0 MP + 2.0 MP + 2.0 MP
<br>Camera Selfie: 16.0 MP
<br>RAM: 8 GB
<br>Internal memory: 128 GB
<br>CPU: MediaTek Helio G81
<br>GPU: Mali-G52 MC2
<br>Battery capacity: 5000 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 6690000.0000, 5, 100, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (33, N'Vivo Y53s 8GB+3GB - 128GB', 1, 5, CAST(N'2021-06-06' AS Date), N'Vivo Y53s focuses on smooth experiences with excellent performance, proprietary RAM expansion technology and impressive battery life, making it possible to play games comfortably, with unlimited entertainment.', N'Monitor: 6.58 inch, IPS LCD, FHD+, 2408 x 1080 Pixels
<br>Rear camera: 64.0 MP + 2.0 MP + 2.0 MP
<br>Camera Selfie: 16.0 MP
<br>RAM: 8 GB + 3 GB
<br>Internal memory: 128 GB
<br>CPU: Helio G80
<br>GPU: Mali-G52
<br>Battery capacity: 5000 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 6990000.0000, 12, 65, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (34, N'Vivo Y15s 3GB - 32GB', 1, 5, CAST(N'2021-10-12' AS Date), N'Free to entertain throughout the day with a large battery capacity of 5000mAh, vivo Y15s will join you to enjoy the fun with a lightweight design, a smooth experience on the 6.51-inch Halo overflow screen.', N'Monitor: 6.51 inch, IPS LCD, HD+, 720 x 1600 Pixels
<br>Rear camera: 13.0 MP + 2.0 MP
<br>Camera Selfie: 8.0 MP
<br>RAM: 3 GB
<br>Internal memory: 32 GB
<br>CPU: Helio P35
<br>GPU: PowerVR GE8320
<br>Battery capacity: 5000 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 3490000.0000, 5, 111, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (35, N'Vivo Y21s 4GB+1GB - 128GB', 1, 5, CAST(N'2021-09-19' AS Date), N'Trendy thin design, 3 super-sharp rear cameras with a resolution of up to 50MP, powerful with expanded RAM technology and tremendous battery capacity, vivo Y21s is ready to burn with you in all the fun.', N'Monitor: 6.51 inch, IPS LCD, HD+, 720 x 1600 Pixels
<br>Rear camera: 50.0 MP + 2.0 MP + 2.0 MP
<br>Camera Selfie: 8.0 MP
<br>RAM: 4 GB + 1 GB
<br>Internal memory: 128 GB
<br>CPU: Helio G80
<br>GPU: PowerVR GE8320
<br>Battery capacity: 5000 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 4990000.0000, 4, 56, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (36, N'TECNO POVA 2 4GB-64GB', 1, 6, CAST(N'2021-06-11' AS Date), N'Can you believe it, a phone with a high-end design, extremely large screen, super battery capacity and an impressive 48MP camera quartet are sold at a surprisingly cheap price, the Tecno Pova 2 is the smart choice for everyone.', N'Monitor: 6.9 inch, IPS LCD, FHD+, 1080 x 2460 Pixels<br>
Rear camera: 48.0 MP + 2.0 MP + 2.0 MP + 2.0 MP + 2.0 MP<br>
Camera Selfie: 8.0 MP<br>
RAM: 4 GB<br>
Internal memory: 64 GB<br>
CPU: Helio G85<br>
GPU: Mali-G52 MC2<br>
Battery capacity: 7000 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 11', 39900000.0000, 5, 55, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (37, N'TECNO SPARK 7T 4GB-64GB', 1, 6, CAST(N'2021-10-10' AS Date), N'Ready to explore the endless life with the Tecno Spark 7Ts huge 6000mAh battery capacity, the phone is cheap but offers great features such as a 48MP AI dual camera, a large 6.4-inch screen, large memory capacity and an impressive unique design.', N'Monitor: 6.52 inch, IPS LCD, HD+, 720 x 1600 Pixels<br>
Rear camera: 48.0 MP + 48.0 MP<br>
Camera Selfie: 8.0 MP<br>
RAM: 4 GB<br>
Internal memory: 64 GB<br>
CPU: Mediatek Helio G35<br>
GPU: PowerVR GE8320<br>
Battery capacity: 6000 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 11', 2690000.0000, 0, 80, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (38, N'TECNO POP 5 2GB-32GB', 1, 6, CAST(N'2021-12-01' AS Date), N'Delivering a maximum experience at minimal cost, the Tecno POP 5 truly outpaces every competitor in the same price range in every aspect, from design to configuration, screen, and battery experience. The camera cluster with dual flash delivers excellent shapes that exceed your expectations.', N'Monitor: 6.5 inches, IPS LCD, HD+, 720 x 1600 Pixels<br>
Rear camera: 8.0 MP<br>
Camera Selfie: 5.0 MP<br>
RAM: 2 GB<br>
Internal memory: 32 GB<br>
CPU: Spreadtrum SC9863A<br>
Battery capacity: 5000 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 11', 2390000.0000, 0, 20, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (39, N'Nokia G21 6GB-128GB', 1, 7, CAST(N'2022-03-16' AS Date), N'Coming from the most famous brand in the world of phones, Nokia G21 gives you a superior experience with up to 3 days of battery life, 50MP camera combined with excellent AI technology. In addition, the product is equipped with a sleek polycarbonate chassis, super durable and the operating system is constantly updated for 2 years.', N'Monitor: 6.5 inches, IPS, HD+, 720 x 1600 Pixels<br>
Rear camera: 50.0 MP + 2.0 MP + 2.0 MP<br>
Camera Selfie: 8.0 MP<br>
RAM: 6 GB<br>
Internal memory: 128 GB<br>
CPU: Unisoc T606<br>
Battery capacity: 5050 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 11', 4590000.0000, 6, 44, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (40, N'Nokia C30 3GB-32GB', 1, 7, CAST(N'2021-05-11' AS Date), N'Comfortable experience on the extremely large screen and battery life up to 3 days of the Nokia C30. With a beautiful durable design and regular software updates, the Nokia C30 will accompany you for many years to come in a stable way.', N'Monitor: 6.82 inches, IPS LCD, HD+, 720 x 1600 Pixels<br>
Rear camera: 13.0 MP + 2.0 MP<br>
Camera Selfie: 5.0 MP<br>
RAM: 3 GB<br>
Internal memory: 32 GB<br>
CPU: Spreadtrum SC9863A<br>
Battery capacity: 6000 mAh<br>
Sim card: 2 - 2 Nano SIM', 2990000.0000, 10, 66, 1, 2)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (41, N'Nokia C21 Plus 3GB-32GB', 1, 7, CAST(N'2022-05-11' AS Date), N'Showing off its refined look with European-standard durability, the Nokia C21 Plus phone offers a superior experience over the price range. The product is equipped with a large capacity battery of 5,050 mAh, with a 6.5-inch HD+ screen that promises to bring vivid frames to fully meet all entertainment content.', N'Monitor: 6.52 inch, IPS LCD, HD+, 720 x 1600 Pixels<br>
Rear camera: 13.0 MP + 2.0 MP<br>
Camera Selfie: 5.0 MP<br>
RAM: 3 GB<br>
Internal memory: 32 GB<br>
CPU: Spreadtrum SC9863A<br>
Battery capacity: 5050 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 11', 2990000.0000, 5, 37, 1, 2)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (42, N'Realme 9 Pro 5G 8G-128GB', 1, 8, CAST(N'2022-03-04' AS Date), N'Enjoying strong performance with a 120Hz ultra-smooth display, 5G connectivity and 33W fast charging, the Realme 9 Pro is the ideal companion for an active life. Not only that, the 64MP camera system and the new design also help you catch all the trends in 2022.', N'Monitor: 6.6 inches, IPS LCD, HD+, 1080 x 2412 Pixels<br>
Rear camera: 64.0 MP + 8.0 MP + 2.0 MP<br>
Camera Selfie: 16.0 MP<br>
RAM: 8 GB<br>
Internal memory: 128 GB<br>
CPU: Snapdragon 695 5G<br>
GPU: Adreno 619<br>
Battery capacity: 5000 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 12', 7990000.0000, 15, 58, 1, 2)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (43, N'Realme 8 Pro 8GB - 128GB', 1, 8, CAST(N'2021-04-14' AS Date), N'Realme 8 Pro with a resolution camera of up to 108MP, gives you the most realistic images and footage. Besides, the impressive configuration thanks to the Snapdragon 720G processor will create the peak power mark in a lightweight design.', N'Monitor: 6.4 inch, Super AMOLED, FHD+, 1080 x 2400 Pixels<br>
Rear camera: 108.0 MP + 8.0 MP + 2.0 MP + 2.0 MP + 2.0 MP<br>
Camera Selfie: 16.0 MP<br>
RAM: 8 GB<br>
Internal memory: 128 GB<br>
CPU: Snapdragon 720G<br>
GPU: Adreno 618<br>
Battery capacity: 4500 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 11', 8690000.0000, 15, 42, 1, 2)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (44, N'Realme C25y 4GB-128GB', 1, 8, CAST(N'2021-10-01' AS Date), N'Experiencing super-buffalo battery life and convenient fast charging, the Realme C25y helps your life become more dynamic. The trio of 50MP cameras and large screens are also suitable for young people, for unlimited creativity and entertainment.', N'Monitor: 6.5 inches, IPS LCD, HD+, 720 x 1600 Pixels<br>
Rear camera: 50.0 MP + 2.0 MP + 2.0 MP<br>
Camera Selfie: 8.0 MP<br>
RAM: 4 GB<br>
Internal memory: 128 GB<br>
CPU: Unisoc T618<br>
GPU: Mali-G52 MC2<br>
Battery capacity: 5000 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 11', 4190000.0000, 10, 75, 1, 2)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (45, N'Realme C21y 3GB - 32GB', 1, 8, CAST(N'2021-06-01' AS Date), N'A smooth experience throughout the day thanks to the 5000mAh high capacity battery, enjoying all the content on the big 6.5-inch screen, enjoying the creativity with a set of 3 quality cameras, realme C21Y will make your every day pass with excitement.', N'Monitor: 6.5 inches, IPS LCD, HD+, 720 x 1600 Pixels<br>
Rear camera: 13.0 MP + 2.0 MP + 2.0 MP<br>
Camera Selfie: 5.0 MP<br>
RAM: 3 GB<br>
Internal memory: 32 GB<br>
CPU: Unisoc T610<br>
GPU: Mali-G52 MC2<br>
Battery capacity: 5000 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 11', 3090000.0000, 12, 55, 1, 2)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (46, N'Realme C35 4GB-128GB', 1, 8, CAST(N'2022-04-01' AS Date), N'Boasting a groundbreaking design and using an excellent 6.6-inch Full HD display, the Realme C35 impresses thanks to its cluster of three 50MP AI cameras and a massive 5,000 mAh battery for long all-day performance. Excellent processor chips with ultra-thin body are also factors that make you admire this affordable super product.', N'Monitor: 6.58 inches, IPS LCD, FHD+, 1080 x 2408 Pixels<br>
Rear camera: 50.0 MP + 2.0 MP + 2.0 MP<br>
Camera Selfie: 8.0 MP<br>
RAM: 4 GB<br>
Internal memory: 128 GB<br>
CPU: Unisoc T616<br>
Battery capacity: 5000 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 11', 4990000.0000, 0, 99, 1, 2)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (47, N'iPad Pro 11 2021 M1 Wi-Fi 1TB', 2, 1, CAST(N'2021-04-04' AS Date), N'For those who are truly professional, the 11-inch 2021 M1 iPad Pro has a maximum memory version of up to 2TB for almost infinite storage. Besides, the power of the Apple M1 processor and high-end camera system is waiting for you.', N'Monitor: 11.0 inch, IPS LCD, Liquid Retina HD, 2388 x 1668 Pixels<br>
Rear camera: 12.0 MP + 10.0 MP<br>
Camera Selfie: 12.0 MP<br>
RAM: 16 GB<br>
Internal memory: 1 TB<br>
CPU: Apple M1<br>
GPU: Apple M1', 42999000.0000, 0, 30, 1, 2)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (48, N'iPad Pro 12.9 2021 M1 Wi-Fi 5G 128GB', 2, 1, CAST(N'2021-04-01' AS Date), N'Along with the unprecedented iPad experience, where you enjoy the top-notch performance of the M1 processor, stunning XDR display, and super-fast 5G network connectivity on the 2021 iPad Pro.', N'Monitor: 12.9 inch, IPS LCD, Liquid Retina XDR, 2732 x 2048 Pixels<br>
Rear camera: 12.0 MP + 10.0 MP<br>
Camera Selfie: 12.0 MP<br>
RAM: 8 GB<br>
Internal memory: 128 GB<br>
CPU: Apple M1<br>
GPU: Apple M1<br>
Sim card: 1 - 1 eSIM, 1 Nano SIM', 34999000.0000, 15, 30, 1, 2)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (49, N'iPad Air 5 2022 10.9 inch M1 WiFi 5G 64GB', 2, 1, CAST(N'2022-03-08' AS Date), N'With the introduction of the super-powerful M1 chip, the iPad Air 5 Wifi 5G 2022 marks a leap in performance. A quick 5G connection and a 12MP Ultra Wide selfie camera will give you an unprecedented experience on all previous iPad Air models. The product is compatible with Apple Pencil and Magic Keyboard to improve performance.', N'Monitor: 10.9 inch, Liquid Retina HD, 2360 x 1640 Pixels<br>
RAM: 8 GB<br>
Internal memory: 64 GB<br>
CPU: Apple M1<br>
Battery capacity: 10 Hours<br>
Sim card: 1', 20990000.0000, 5, 45, 1, 2)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (50, N'iPad Mini 6 2021 8.3 inch WiFi 256GB', 2, 1, CAST(N'2021-09-09' AS Date), N'The tremendous power in a lovely compact design, the 2021 iPad Mini 6 marks a powerful return to the iPad mini line that has always been loved by users, where you enjoy the magic inside the gorgeous tablet, top-notch performance and apple pencil support.', N'Monitor: 8.3 inch, IPS LCD, Liquid Retina HD, 2048 x 1536 Pixels<br>
Rear camera: 12.0 MP<br>
Camera Selfie: 12.0 MP<br>
RAM: 4 GB<br>
Internal memory: 256 GB<br>
CPU: Apple A15 Bionic<br>
GPU: Apple GPU 5 Core<br>
Sim card: 0', 19990000.0000, 5, 46, 1, 2)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (51, N'iPad Air 5 2022 10.9 inch M1 WiFi 64GB', 2, 1, CAST(N'2022-03-08' AS Date), N'The performance power of the iPad Air 5 marks a strong step forward with the presence of an excellent M1 processor developed by Apple itself. The product promotes the fashionable design style of the iPad Air series and offers a new experience when video calls thanks to the ultra-wide-angle front camera.', N'Monitor: 10.9 inch, Liquid Retina HD, 2360 x 1640 Pixels<br>
RAM: 8 GB<br>
Internal memory: 64 GB<br>
CPU: Apple M1<br>
Battery capacity: 10 Hours', 16990000.0000, 8, 45, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (52, N'iPad Gen 9 2021 10.2 inch WiFi Cellular 64GB', 2, 1, CAST(N'2021-09-01' AS Date), N'iPad Gen 9 9 10.2 2021 4G LTE brings together all the things that have made you love the iPad line so far. You can work, entertain, create, learn and connect in the most efficient, comfortable way on the new 2021 iPad 10.2.', N'Monitor: 10.2 inch, IPS LCD, Liquid Retina HD, 2160 x 1620 Pixels<br>
Rear camera: 8.0 MP<br>
Camera Selfie: 12.0 MP<br>
RAM: 3 GB<br>
Internal memory: 64 GB<br>
CPU: Apple A13 Bionic<br>
GPU: Apple GPU 4 Core<br>
Sim card: 1', 13990000.0000, 12, 50, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (53, N'Samsung Galaxy Tab S8 Ultra', 2, 2, CAST(N'2022-01-01' AS Date), N'Experience samsungs best tablet version - the Galaxy Tab S8 Ultra, you will see the difference of snapdragon 8 Gen 1 flagship performance, the technology trend-leading design and the perfect convenience of the new generation S-Pen pen.', N'Monitor: 14.0 inch, Super AMOLED, WQHD+, 2800 x 1752 Pixels<br>
Rear camera: 13.0 MP + 5.0 MP<br>
Camera Selfie: 12.0 MP<br>
RAM: 8 GB<br>
Internal memory: 128 GB<br>
CPU: Snapdragon 8 Gen 1<br>
Battery capacity: 11200 mAh<br>
Sim card: 1 - 1 Nano SIM<br>
Operating system: Android 12', 30990000.0000, 0, 29, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (54, N'Samsung Galaxy Tab S8 Plus', 2, 2, CAST(N'2022-01-01' AS Date), N'Holding the Galaxy Tab S8 Plus in your hand, you like to hold the vast world of entertainment with a super smooth 120Hz Super AMOLED display and Snapdragon 8 Gen 1 chip for great performance power. The large capacity battery of 10,090 mAh easily provides operating power to the device for a long time.', N'Monitor: 12.4 inch, Super AMOLED, WQHD+, 2800 x 1752 Pixels<br>
Rear camera: 13.0 MP + 5.0 MP<br>
Camera Selfie: 12.0 MP<br>
RAM: 8 GB<br>
Internal memory: 128 GB<br>
CPU: Snapdragon 8 Gen 1<br>
Battery capacity: 10090 mAh<br>
Sim card: 1 - 1 Nano SIM<br>
Operating system: Android 12', 25990000.0000, 0, 50, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (55, N'Samsung Galaxy Tab S7 FE', 2, 2, CAST(N'2021-07-01' AS Date), N'A large-screen tablet will make every experience, whether learning or playing, extremely attractive. Samsung Galaxy Tab S7 FE With excellent performance and professional S Pen will always bring you fun.', N'Monitor: 12.4 inch, TFT LCD, WQXGA, 2560 x 1600 Pixels<br>
Rear camera: 13.0 MP + 5.0 MP<br>
Camera Selfie: 8.0 MP<br>
RAM: 4 GB<br>
Internal memory: 64 GB<br>
CPU: Snapdragon 750G<br>
Battery capacity: 10090 mAh<br>
Sim card: 1 - 1 Nano SIM<br>
Operating system: Android 10', 13990000.0000, 0, 50, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (56, N'Samsung Galaxy Tab S6 Lite 2022', 2, 2, CAST(N'2022-02-01' AS Date), N'Meet the Samsung Galaxy Tab S6 Lite 2022 - the new version with a strong upgrade in Snapdragon 720G performance, for every smooth task, perfect multitasking from learning, work to entertainment. The support of the S-Pen pen is also a great friend to enjoy creativity, increase work performance.', N'Monitor: 10.4 inch, TFT LCD, FHD, 1200 x 2000 Pixels<br>
Rear camera: 8.0 MP<br>
Camera Selfie: 5.0 MP<br>
RAM: 4 GB<br>
Internal memory: 64 GB<br>
CPU: Snapdragon 720G<br>
Battery capacity: 7040 mAh<br>
Sim card: 1 - 1 Nano SIM<br>
Operating system: Android 12', 9990000.0000, 9, 60, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (57, N'Samsung Galaxy Tab A8 2022', 2, 2, CAST(N'2022-01-01' AS Date), N'The 2022 Samsung Galaxy Tab A8 offers an efficient learning, work and entertainment solution on a spacious 10.5-inch screen. The product features a minimalist elegant design, features a lively Dolby Atmos sound system, recognizes an impressive configuration in the price range and offers a series of handy features that enhance the user experience.', N'Monitor: 10.5 inch, TFT LCD, WUXGA, 1920 x 1200 Pixels<br>
Rear camera: 8.0 MP<br>
Camera Selfie: 5.0 MP<br>
RAM: 4 GB<br>
Internal memory: 64 GB<br>
CPU: Unisoc T618<br>
Battery capacity: 7040 mAh<br>
Sim card: 1 - 1 Nano SIM<br>
Operating system: Android 11', 8490000.0000, 0, 50, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (58, N'Samsung Galaxy Tab A7 Lite', 2, 2, CAST(N'2021-05-01' AS Date), N'With its ultra-thin design, attractive entertainment features and superior performance, the Samsung Galaxy Tab A7 Lite will be a stylish companion for your life. It is free to learn, explore, connect in the inspiration of technology.', N'Monitor: 8.7 inch, TFT LCD, HD+, 1340 x 800 Pixels<br>
Rear camera: 8.0 MP<br>
Camera Selfie: 2.0 MP<br>
RAM: 3 GB<br>
Internal memory: 32 GB<br>
CPU: MediaTek MT8768T<br>
Battery capacity: 5100 mAh<br>
Sim card: 1 - 1 Nano SIM<br>
Operating system: Android 11', 4490000.0000, 0, 45, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (59, N'Masstel Tab 10M 4G', 2, 2, CAST(N'2021-11-01' AS Date), N'Possessing an excellent configuration in the price range and equipped with the new 11-generation Android 11 operating system, the Masstel Tab 10M 4G tablet is the best choice in the low-cost segment when recording a huge battery capacity of 6,000 mAh. The spacious HD screen will help you a lot in the process of entertainment or study, online meetings.', N'Monitor: 10.1 inch, IPS, 800 x 1280 Pixels<br>
Rear camera: 5.0 MP<br>
Camera Selfie: 2.0 MP<br>
RAM: 3 GB<br>
Internal memory: 32 GB<br>
CPU: SCT310<br>
GPU: PowerVR GE8300<br>
Battery capacity: 6000 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 11', 3990000.0000, 5, 58, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (60, N'Masstel Tab 10 Wifi ', 2, 10, CAST(N'2021-10-01' AS Date), N'With a smooth Android 11 Go operating system and a luxurious, high-end metal body, the Masstel Tab 10 Wi-Fi is the choice not to be missed if you are looking for a tablet that excels in the affordable segment. It has a 10.1-inch wide screen and battery life that can be used throughout the day.', N'Monitor: 10.1 inch, IPS, 800 x 1280 Pixels<br>
Rear camera: 5.0 MP<br>
Camera Selfie: 2.0 MP<br>
RAM: 2 GB<br>
Internal memory: 32 GB<br>
GPU: Mali-G52 2EE<br>
Battery capacity: 5000 mAh<br>
Operating system: Android 11', 2990000.0000, 7, 50, 2, 4)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (61, N'Lenovo Tab P11 Pro WI-FI 4G 128GB', 2, 9, CAST(N'2020-09-01' AS Date), N'Enjoy an unlimited entertainment experience with the Lenovo Tab P11 Pro, a high-end Android tablet with an ultra-thin design, extremely powerful performance, and a sharp 2K display. Youll be holding a mobile cinema, a professional means of work and more.', N'Monitor: 11.5 inches, OLED, HD, 2560 x 1600 Pixels<br>
Rear camera: 13.0 MP + 5.0 MP<br>
Camera Selfie: 8.0 MP<br>
RAM: 4 GB<br>
Internal memory: 128 GB<br>
CPU: Snapdragon 730G<br>
GPU: Adreno 618<br>
Battery capacity: 8600 mAh<br>
Sim card: 1 - 1 Nano SIM<br>
Operating system: Android 10', 14590000.0000, 35, 30, 1, 4)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (62, N'Lenovo Tab M10 32GB (Gen 2)', 2, 9, CAST(N'2020-07-01' AS Date), N'Tablets The second-generation Lenovo Tab M10 is a great choice if you want to buy your child a device that is both useful and safe, well-censored in terms of content and has a very affordable price.', N'Monitor: 10.1 inch, IPS, HD, 1280 x 800 Pixels<br>
Rear camera: 8.0 MP<br>
Camera Selfie: 5.0 MP<br>
RAM: 2 GB<br>
Internal memory: 32 GB<br>
CPU: MediaTek Helio P22 (MT6762R)<br>
Battery capacity: 5000 mAh<br>
Sim card: 1 - 1 Nano SIM<br>
Operating system: Android 10', 5190000.0000, 15, 48, 1, 4)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (63, N'Lenovo Tab M8-Gen 2', 2, 9, CAST(N'2019-10-01' AS Date), N'The Lenovo Tab M8-Gen 2 is a multipurpose tablet for those who want to get a smart experience on the big screen at a reasonable cost. The product has an 8-inch wide display space with a resolution of 1280 x 800 pixels and uses Dolby Audio technology. Up to 18 hours of battery life allows you to use throughout the day.', N'Monitor: 8.0 inches, HD, 1280 x 800 Pixels<br>
Rear camera: 5.0 MP<br>
Camera Selfie: 2.0 MP<br>
RAM: 2 GB<br>
Internal memory: 32 GB<br>
CPU: Helio A22<br>
Battery capacity: 5000 mAh<br>
Sim card: 1 - 1 Nano SIM<br>
Operating system: Android 9.0', 3790000.0000, 10, 49, 1, 4)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (64, N'Apple Watch Series 7 GPS + Cellular 41mm Steel Wire Bezel', 3, 1, CAST(N'2021-04-01' AS Date), N'Apple Watch Series 7 GPS + Cellular version made of high-end steel is the perfect combination of technology and fashion. The watch shines right on your wrist not only from its stunning design but also from its top-notch smart features.', N'Monitor: 1.61 inch, LTPO OLED, 430 x 352 Pixels<br>
Internal memory: 32 GB<br>
Material: Machine Border: Stainless Steel<br>
Compatible operating system: IOS<br>
Battery life: 18 hours', 20990000.0000, 10, 88, 1, 4)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (65, N'Apple Watch Series 7 GPS 41mm Aluminum Trim Rubber Band', 3, 1, CAST(N'2021-04-01' AS Date), N'Experiencing an impressive screen smartwatch with the largest, most advanced screen ever, super durable premium design, breakthrough health features and convenient fast charging technology, Apple Watch Series 7 is the complete smartwatch version, Gather all that the user needs.', N'Monitor: 1.61 inch, LTPO OLED, 430 x 352 Pixels<br>
CPU: Apple S7<br>
Internal memory: 32 GB<br>
Material: Glass: Ion-X Strengthened Glass - Wire: Rubber<br>
Operating system: watchOS<br>
Compatible operating system: Ios<br>
Battery life: 18 hours', 11990000.0000, 10, 80, 1, 4)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (66, N'Apple Watch SE GPS + Cellular 44mm Aluminum Bezel Wire Sport Loop', 3, 1, CAST(N'2020-06-01' AS Date), N'Integrated with eSIM and 4G LTE network connectivity, the Apple Watch SE can operate independently, communicate, into the network without the phone on the side. And yet, the impressive design, powerful configuration and sharp Retina display make up the distinct class for the Apple Watch SE.', N'Monitor: 448 x 368 Pixels<br>
Internal memory: 32 GB<br>
Material: Wire: Fabric - Glass Face: Ion-X Strengthened Glass<br>
Operating system: watchOS<br>
Compatible operating system: Ios<br>
Battery life: 18 hours', 11999000.0000, 20, 60, 1, 4)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (67, N'Apple Watch SE GPS 40mm Aluminum Trim Rubber Band', 3, 1, CAST(N'2020-04-04' AS Date), N'A beautifully thin-bezeled retina display, equipped with advanced sensors and top-notch health features, the Apple Watch SE gives you more than youd expect at an attractive price.', N'Monitor: 394 x 324 Pixels<br>
Internal memory: 32 GB<br>
Material: Wire: Rubber - Glass: Ion-X Strengthened Glass<br>
Operating system: watchOS<br>
Compatible operating system: Ios<br>
Battery life: 18 hours', 8999000.0000, 25, 59, 1, 4)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (68, N'Apple Watch Series 3 GPS 38mm Aluminum Trim Rubber Band', 3, 1, CAST(N'2019-04-01' AS Date), N'Apple Watch Series 3 GPS 38mm aluminum trim white rubber band – an Apple-branded watch, possessing a modern and youthful design, suitable for sports activities or picnics. You will be amazed at the features that this watch owns.', N'Monitor: 340 x 272 Pixels<br>
Internal memory: 8 GB<br>
Material: Glass: Ion-X Strengthened Glass - Wire: Rubber<br>
Operating system: watchOS<br>
Compatible operating system: Ios<br>
Battery life: 18 hours', 5999000.0000, 20, 45, 1, 4)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (69, N'Apple Watch Nike Series 7 GPS + Cellular 41mm Aluminum Trim Rubber Band', 3, 1, CAST(N'2021-06-01' AS Date), N'Fashionable, sporty and handy, the Apple Watch Nike Series 7 will accompany you in every workout, helping to improve sportsmanship, while effectively supporting through the Nike Run Club app. The inspiring design and ability to simultaneously support GPS + 4G LTE connectivity provide experiences that cannot be searched in other versions.', N'Monitor: 1.61 inches, OLED, 430 x 352 Pixels<br>
CPU: Apple S7<br>
Internal memory: 32 GB<br>
Material: Glass Surface: Ion-X Strengthened Glass - Wire: Silicone - Bezel Machine: Aluminum<br>
Operating system: watchOS<br>
Compatible operating system: Ios<br>
Battery life: About 1.5 days', 14990000.0000, 8, 48, 1, 4)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (70, N'Garmin MARQ Smartwatch, Aviator', 3, 12, CAST(N'2021-11-01' AS Date), N'A smartwatch built by Garmin specifically for pilots, the MARQ Aviator uses a permanent anti-glare display, and has a special route navigation mode to effectively support pilots on long flights. Garmin MARQ Aviator brings together a series of outstanding features, worthy of its value and class.', N'Monitor: 240 x 240 Pixels<br>
Internal memory: 32 GB<br>
Material: Wire: Titanium - Glass: Sapphire Glass<br>
Compatible operating system: Android, iOS', 48990000.0000, 5, 20, 1, 4)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (71, N'Garmin Venu Sq Smartwatch', 3, 12, CAST(N'2021-07-01' AS Date), N'As part of Garmins recently launched product line, the Venu Sq watch aims at fashion, convenience and price optimization to provide the best experience for users. This is a small, lightweight smartwatch with a unisex appearance suitable for male and female users.', N'Monitor: 1.3 inches, LCD, 240 x 240 Pixels<br>
Material: Glass: Gorilla Glass 3 - Wire: Silicone<br>
Compatible operating system: iOS, Android<br>
Battery life: 6 days', 4990000.0000, 0, 40, 1, 4)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (72, N'Garmin Instinct 2S Smartwatch, Camo PatternEd Version', 3, 12, CAST(N'2022-01-01' AS Date), N'', N'Monitor: 1.13 Inch, MIP Anti-Glare<br>
Material: Polymer<br>
Compatible operating system: Android, iOS<br>
Battery life: 14 days', 9990000.0000, 0, 30, 1, 4)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (73, N'Garmin Vivomove 3S smartwatch ', 3, 12, CAST(N'2021-05-01' AS Date), N'With its elegant appearance, state-of-the-art sensor system and optimal user health care capabilities, the Garmin vivomove 3S is the number one choice in the smart wearables market today.', N'Monitor: OLED<br>
Material: Wire: Silicone - Glass: Gorilla Glass 3<br>
Compatible operating system: Android, iOS', 5990000.0000, 3, 40, 1, 4)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (74, N'Garmin Fenix 7S Smartwatch, Sapphire, Solar, Titanium Yellow Pink', 3, 12, CAST(N'2021-12-01' AS Date), N'', N'Monitor: 1.2 inches, MIP Anti-Glare, 240 x 240 Pixels<br>
Internal memory: 32 GB<br>
Material: Glass: Sapphire Glass - Wire: Silicone<br>
Compatible operating system: iOS, Android<br>
Battery life: 11 days', 24990000.0000, 15, 35, 1, 4)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (75, N'Mi Band 6 Smart Bracelet', 3, 4, CAST(N'2021-06-01' AS Date), N'Inheriting the essence of previous generations, xiaomi Mi Band 6 is the perfect smart bracelet when it comes to having a sharp AMOLED screen, supports heart rate measurement and SpO2, 2-week battery life, professional workout activity and durable water resistance.', N'Monitor: 1.56 inches, 152 x 486 Pixels<br>
CPU: DA14697<br>
Internal memory: 32 MB<br>
Material: Wire: Silicone - Glass Face: Tempered Glass<br>
Operating system: RTOS<br>
Compatible operating system: iOS, Android<br>
Battery life: 14 days', 1290000.0000, 10, 50, 1, 4)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (76, N'Xiaomi Redmi Watch 2 Lite ', 3, 4, CAST(N'2021-10-01' AS Date), N'With the spirit of being the world leader in smart wearables, Xiaomi continues to bring impressive points to the Redmi Watch 2 Lite smartwatch. It is improved over the Mi Watch Lite with a large 1.55-inch screen, over 100 workout modes and integrated SpO2 sensor.', N'Monitor: 1.55 inches, 320 x 360 Pixels<br>
Material: Wire: TPU - Glass: Tempered Glass: Tempered Glass<br>
Compatible operating system: iOS, Android<br>
Battery life: 10 days', 1490000.0000, 12, 40, 1, 4)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (77, N'Xiaomi Watch S1 Active Smartwatch ', 3, 4, CAST(N'2022-03-01' AS Date), N'The Xiaomi Watch S1 Active will put the world of smart technology on top of your wrist. It has a 1.43-inch AMOLED display and records up to 12 days of battery life, supports bluetooth calls, and offers 117 different workout modes.', N'Monitor: 1.43 inches, AMOLED, 466 x 466 pixels<br>
Internal memory: 4 GB<br>
Material: Wire: TPE Plastic - Glass: Gorilla Glass 3<br>
Operating system: RTOS<br>
Compatible operating system: iOS, Android<br>
Battery life: About 18 days', 4490000.0000, 0, 49, 1, 4)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (78, N'Samsung Galaxy Watch 4 40mm', 3, 2, CAST(N'2021-05-01' AS Date), N'Not only is the smartwatch full of both technological features and fashion beauty, Samsung Galaxy Watch 4 is also a companion who always understands your health and what you need, with you perfecting yourself every day.', N'Monitor: 1.2 inches, Super AMOLED, 396 x 396 Pixels<br>
CPU	Exynos: W920<br>
Internal memory: 16 GB<br>
Material: Wire: Silicone - Glass: Gorilla Glass Dx+<br>
Operating system: One UI Watch<br>
Compatible operating system: Android<br>
Battery life: About 1.5 days', 6490000.0000, 15, 60, 1, 4)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (79, N'Samsung Galaxy Watch 4 Classic 46mm', 3, 2, CAST(N'2021-05-05' AS Date), N'Samsung Galaxy Watch 4 Classic is a masterpiece with a beautiful design like high-end classic wristwatches but carries a series of leading smart features today. The most advanced health monitoring and exercise support sensors will help you get healthier and healthier.', N'Monitor: 1.4 inches, 450 x 450 Pixels<br>
Internal memory: 16 GB<br>
Material: Wire: Silicone - Glass: Gorilla Glass Dx+<br>
Operating system: One UI Watch<br>
Compatible operating system: Android<br>
Battery life: About 1.5 days', 8990000.0000, 15, 60, 1, 4)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (80, N'Super Hero 4G Childrens Locator Watch', 3, 10, CAST(N'2021-01-02' AS Date), N'The smart watch in your babys hand is now more useful than ever. Besides location control, you can also make 4G video calls for your child anytime, anywhere and a series of interesting features with Masstel Super HERO 4G.', N'Monitor: 240 x 240 Pixels<br>
Internal memory: 4 GB<br>
Material: Wire: Plastic - Glass: Glass: Glass<br>
Operating system: Android<br>
Compatible operating system: Android<br>
Battery life: 48 hours', 2490000.0000, 15, 99, 1, 4)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (81, N'OPPO Band Smart Bracelet (OB19B1)', 3, 3, CAST(N'2021-06-01' AS Date), N'Oppo Band with a sharp AMOLED color screen, supports heart rate measurement, blood oxygen level measurement, 12 exercise modes and water resistance at a depth of 50m will be the smart bracelet full of energy for you.', N'Monitor: 126 x 294 Pixels<br>
Internal memory: 16 MB<br>
Material: Wire: TPU - Glass: 2.5D Curved Glass<br>
Operating system: Android<br>
Compatible operating system: Android<br>
Battery life: About 12 days', 790000.0000, 5, 66, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (82, N'Huawei Watch Fit', 3, 11, CAST(N'2020-01-01' AS Date), N'The perfect Huawei Watch Fit lightweight watch on your wrist, the stunning AMOLED display will act as a professional trainer, helping your exercises to be more effective and healthy every day.', N'Monitor: 1.64 inches, AMOLED, 456 x 280 Pixels<br>
CPU: Kirin A1<br>
Internal memory: 4 GB<br>
Material: Glass: Gorilla Glass 3 - Wire: Silicone<br>
Operating system: Lite OS<br>
Compatible operating system: Ios<br>
Battery life: 10 days', 3290000.0000, 0, 30, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (83, N'Anker PowerCore Select 10000mAh A1223', 4, 13, CAST(N'2021-09-01' AS Date), N'The PowerCore Select A1223 battery charger comes from Anker, a brand that has long been well known in the manufacturing and sales of phone accessories with high-quality products. The 10,000 mAh battery capacity of the Anker PowerCore Select A1223 combines with modern features that allow users to enjoy charging the battery for the smartphone to be assured of use throughout the day.', N'Battery capacity: 10000 mAh<br>
Battery core: Lithium-ion<br>
Gateway	Input: Micro-USB, Output: USB 2.0<br>
Feature: Automatically balance charging time and line calibration', 699000.0000, 5, 60, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (84, N'Anker PowerCore Slim 10000mAh PD - A1231', 4, 13, CAST(N'2021-10-01' AS Date), N'The Anker PowerCore Slim has a compact design with a thickness of only 14.5mm and an ultra-light weight of 212g. With these parameters, users can easily carry the backup rechargeable battery anywhere without feeling entangled. The compact size of the product also allows it to fit in the pocket of jeans or handbags.', N'Battery capacity: 10000 mAh<br>
Battery core: Lithium-ion<br>
Gateway	Output: USB 2.0, Input: Type C, Output: Type C<br>
Feature: PD standard fast charging', 1000000.0000, 10, 49, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (85, N'Anker PowerCore 20000mAh Speed QC 3.0', 4, 13, CAST(N'2021-11-01' AS Date), N'Designed with a lightweight minimalist style, featuring three leading fast charging technologies and compatible with every smartphone on the market, the PowerCore Speed QC 3.0 20,000mAh is a great solution for busy people to charge their phones and other electronic devices during a long business trip.', N'Battery capacity: 20000 mAh<br>
Battery core: Lithium-ion<br>
Feature: Premium Battery Core, Power Management, Automatic Charging Time Balance and Line Calibration', 1550000.0000, 15, 37, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (86, N'Samsung Battery Pack 10,000 mAh', 4, 2, CAST(N'2022-01-01' AS Date), N'Despite being only a spare rechargeable battery, the Samsung Battery Pack is still taken care of by the manufacturer right from the outside. The entire exterior of the backup charger is completed with aluminum alloy material, giving a high-end and luxurious appearance.', N'Battery capacity: 10000 mAh<br>
Battery core: Lithium polymer<br>
Gateway: Output: USB 2.0, Input: Type C<br>
Feature: Power Management, Premium Battery Core, Automatic Charging Time Balance and Line Calibration', 390000.0000, 5, 50, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (87, N'Ivalue 20000mAh MT-P200-001 (HK-108)', 4, 14, CAST(N'2022-01-01' AS Date), N'', N'Battery capacity: 20000 mAh', 999000.0000, 10, 50, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (88, N'ivalue 10000mAh Y1-5 Port Micro & Type-C', 4, 14, CAST(N'2021-06-02' AS Date), N'', N'Battery capacity: 20000 mAh
		Gateway: Micro & Type-C', 599000.0000, 25, 60, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (89, N'UmeTravel 10000mAH PW1 Wireless ', 4, 15, CAST(N'2022-05-01' AS Date), N'The Umetravel PW1 rechargeable battery has an exterior case design made from ultra-durable ABS resin with effective external resistance. In addition, the spare battery case is added with a shock-proof rubber layer for maximum protection for the battery cells and the inner board. Users can choose Umetravel PW1 in two color options, Black and Blue. Both of these colors are very modern and luxurious.', N'Battery capacity: 10000 mAh<br>
Battery core: Lithium polymer<br>
Gateway: Output: USB 2.0, Output: Type C, Input: Micro-USB<br>
Feature: Automatic balance of charging time and line calibration, Premium battery core, Wireless charging support for qi-enabled devices', 999000.0000, 10, 52, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (90, N'UmeTravel 20000mAh TRIP20000 Quick Charge', 4, 15, CAST(N'2021-12-01' AS Date), N'With a smart design, many modern features and extremely durable, the Quick Charge UMETRAVEL TRIP20000 spare rechargeable battery will be the optimal solution for you to bring your energy reserves with you. The compact size of the product allows the charger to maximize mobility in order to better support the user.', N'Battery capacity: 20000 mAh<br>
Battery core: Lithium polymer<br>
Gateway	Input: Type C, Input: Micro-USB, Output: Type C, Output: USB 2.0<br>
Feature: Premium Battery Core, Automatic Charging Time Balance and Line Correction, Power Manage', 999000.0000, 15, 77, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (91, N'Veger 10000mAh L10 PD&QC3.0 ', 4, 16, CAST(N'2021-02-08' AS Date), N'The Li-Polymer VEGER L10 PD&QC3.0 rechargeable battery pack brings together the most modern technologies in the field including Power Delivery power control and Quick Charge 3.0 fast charging. As a result, the product ensures two key factors: safety and convenience. In addition, the luxurious modern design is also a big plus that VEGER brings to the device', N'Battery capacity: 10000 mAh<br>
Battery core: Lithium polymer<br>
Gateway: Output: Type C, Output: USB 3.0<br>
Feature: Power Management, Automatic Balance of Charging Time and Line Correction, Premium Battery Core', 799000.0000, 5, 66, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (92, N'Anker 20W Powerport III A2033 Fast Charger', 4, 13, CAST(N'2022-02-25' AS Date), N'If youre struggling to find an effective charging solution for the iPhone 12, Android smartphone or tablets in your home, this Anker 20W Powerport III A2633 fast charger is the ideal choice. The ultra-compact nano design, high-speed charging capabilities and guaranteed safety from the worlds leading brand of rechargeable batteries are brief descriptions of this product.', N'Kind: Charging adapter<br>
Material: Resin<br>
Communication port: Type C<br>
Use for equipment: Tablet, iPhone, Phone<br>
Feature: 20W Fast Charging, Quick Charge 3.0 Compatibility', 400000.0000, 10, 64, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (93, N'USB-C to Lightning Anker PowerLine Select A8613', 4, 13, CAST(N'2022-02-25' AS Date), N'PowerLine Select A8613 - the product that Anker is proud to be the fastest and most durable connected cable on the market today. Manufactured to support fast charging technology on compatible models and ensure safe battery charging, both saving waiting time and achieving optimal stability efficiency.', N'Kind: Conversion Cable<br>
Material: Resin<br>
Communication port: Input: Type C, Output: Lightning<br>
Use for equipment: Tablets, Phones<br>
Feature: PD standard fast charging', 500000.0000, 0, 46, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (94, N'MagSafe Duo Charger Double Charging Dock', 4, 1, CAST(N'2022-04-16' AS Date), N'The MagSafe Duo Charger double charging dock helps users power the AirPods, Apple Watch and iPhone in the simplest way. In particular, this wireless charging dock also supports charging two Apple devices at the same time.', N'Communication port: Input: Type C, Output: Magsafe Charger<br>
Current intensity: 14W<br>
Use for equipment: Phone, Apple Watch, iPhone<br>
Feature: Fast charging', 2990000.0000, 5, 45, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (95, N'USB-C to Lightning Apple Cable', 4, 1, CAST(N'2021-07-17' AS Date), N'Lightning to USB-C cable is the best solution for you to connect your iPhone, iPad, or iPod Touch to USB-C devices such as a Macbook or iPad Pro. The product allows you to promote fast charging on supported devices, while also helping to transmit data in the most agile and efficient way.', N'Kind: Charging cable<br>
Communication port: Type C, Lightning<br>
Feature: Fast Charging, Data Transfer<br>
Use for equipment: iPhone, Laptop, Tablet, Phone, iPad, Desktop, Mac', 999000.0000, 15, 50, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (96, N'Apple Power Adapter 20W Type-C Charger', 4, 1, CAST(N'2021-10-11' AS Date), N'Fast charging 20W USB-C Power Adapter is the perfect accessory for iPhone, iPad has fast charging support, especially the newly launched iPhone 12 series. A genuine accessory product from Apple will bring optimal charging performance and safety to your iPhone, iPad.', N'Kind: Charging adapter<br>
Communication port: Type C<br>
Feature: Fast charging<br>
Use for equipment: Tablet, iPhone, Phone, iPad', 500000.0000, 5, 60, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (97, N'Belkin 37W 2 Port Fast Charger (USB-C PD 25W + USB-A 12W)', 4, 17, CAST(N'2021-12-12' AS Date), N'Coming from the worlds leading accessory manufacturer, the Belkin 37W fast charging adapter includes a 25W USB-C charging port and a 12W USB-A port. The product is designed to take advantage of the optimal fast charging capacity on the iPhone of 20W and for Android smartphones is 25W, while also possessing many technologies to ensure the safety of users.', N'Kind: Charging adapter<br>
Material: Premium plastic<br>
Communication port: Type C, USB<br>
Current intensity: 3A<br>
Feature: Fast charging, Charging at the same time is multiple devices, Smart charging protected when overcharged<br>
Use for equipment: Phone, Tablet, Smartwatch', 799000.0000, 8, 65, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (98, N'Belkin Playa MFI Lightning Cable 1m PVC Shell', 4, 17, CAST(N'2021-11-01' AS Date), N'The Belkin Playa 1m Lightning MFI connector cable is a good choice for those who are looking for battery charging accessories and connectivity for iPhone, iPad or AirPods. The product is perfectly compatible with those produced by Apple when it achieves the permanent MFi certification provided by Apple.', N'Kind: Charging cable<br>
Material: Premium plastic<br>
Communication port: Output: Lightning, Input: USB<br>
Feature: Data Transfer, 12W Fast Charging<br>
Use for equipment: Phone, iPad, iPhone, Tablet', 350000.0000, 5, 44, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (99, N'UmeTravel 18W A3X 1 Port Fast Charger', 4, 15, CAST(N'2021-02-09' AS Date), N'With efficient 18W fast charging technology, the Umetravel A3X fast charger will help you quickly restore power to your smartphone or tablet without much waiting time. The product can be well compatible with many mobile devices, from Android models to iPhone or iPad.', N'Kind: Charging adapter<br>
Material: Resin<br>
Communication port: USB<br>
Current intensity: Up to 18W<br>
Feature: Fast charging<br>
Use for equipment: Phone, Tablet', 350000.0000, 4, 55, 1, 1)
GO
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (100, N'UmeTravel Military fibre C3L Lightning Cable', 4, 15, CAST(N'2021-09-27' AS Date), N'The Lightning Umetravel Military fibre C3L cable will greatly support iPhone/iPad users during use when not only supporting efficient battery charging, but also very useful when it comes to connecting a mobile device to a PC or laptop to transmit or copy data.', N'Kind: Charging cable<br>
Material: Fibre yarn<br>
Communication port: Output: Lightning, Input: USB<br>
Feature: Data Transfer, Charging<br>
Use for equipment: Phone, Tablet', 169000.0000, 10, 100, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (101, N'Type-C UmeTravel Military fibre C1 1m Cable', 4, 15, CAST(N'2022-01-01' AS Date), N'Type-C UmeTravel Military fibre C1 1m Cable', N'Kind: Charging cable<br>
Material: Fibre yarn<br>
Communication port: Output: Type C, Input: USB<br>
Use for equipment: Phone, Tablet<br>
Feature: Data Transfer, Charging', 169000.0000, 0, 46, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (102, N'TWS Anker Soundcore Liberty Air 2 Bluetooth Headphones - A3910', 4, 13, CAST(N'2021-07-12' AS Date), N'', N'Headphone type: Wireless headphones<br>
Battery capacity: 1000 mAh<br>
Feature: IPX5 Water Resistance, Noise Protection', 3000000.0000, 10, 70, 1, 1)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (103, N'AirPods Pro ', 4, 1, CAST(N'2021-12-01' AS Date), N'AirPods Pro will immerse you in a deep music space and provide an unprecedented entertainment experience on apple wireless headphones. Powerful upgrades in design and technology make AirPods Pro headphones a true professional music player.', N'Headphone type: Wireless headphones<br>
Feature: Waterproof, Noise Resistant, Listening to Music, Conversation Mic', 5999000.0000, 20, 52, 1, 3)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (104, N'EarPods with Lightning Connector', 4, 1, CAST(N'2021-05-01' AS Date), N'Earpods with Lightning Connection headphones are a great product exclusively for iPhone lines (from the iPhone 7 series onwards). If you are a sound fanatic then this headset will be an option because of its high convenience and good sound.', N'Headphone type: Earbuds', 599000.0000, 12, 90, 1, 3)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (105, N'Ivalue BT008 Bluetooth Headphones ', 4, 14, CAST(N'2022-01-10' AS Date), N'The design of the strap around the mini neck combined with the ear insert mechanism helps the I.value BT008 earbuds maximize the strengths of bluetooth wireless connectivity, thereby supporting users effectively during jogging or sports, avoiding causing unpleasant entanglement.', N'Headphone type: Wireless headphones<br>
Battery capacity: 110 mAh<br>
Feature: Listen to music, talk mic, watch movies', 450000.0000, 0, 60, 1, 3)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (106, N'Sony Extra Bass MDR-EX155AP earbuds', 4, 19, CAST(N'2021-12-09' AS Date), N'', N'Headphone type: Earbuds
Origin: China', 390000.0000, 5, 90, 1, 3)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (107, N'JBL T115TWSREDAS Bluetooth Headphones', 4, 20, CAST(N'2022-03-01' AS Date), N'Designed with a small size, a comfortable feeling on the ears and a subtle bass, the JBL T115TWS is a very bright choice in the True-Wireless headphone market today. The plus point of the product lies in the battery life totaling 21 hours when combined with the included charging case.', N'Headphone type: Wireless headphones<br>
Origin: China', 1490000.0000, 0, 45, 1, 3)
INSERT [dbo].[product] ([id], [name], [categoryId], [brandId], [releaseDate], [description], [specification], [price], [discount], [quantity], [stateId], [storeId]) VALUES (108, N'JBL QUANTUM50BLKAS earbuds with mic', 4, 20, CAST(N'2022-01-01' AS Date), N'Coming from one of the worlds leading audio equipment brands, the JBL Quantum 50 headphones deliver an honest, edgy sound quality thanks to the use of an 8.6mm driver. The product has a youthful design and modern color scheme, which is very suitable for enjoying entertainment tasks such as playing games or watching movies, the built-in microphone on the cable will support clear conversation.', N'Headphone type: Earbuds<br>
Origin: China', 890000.0000, 10, 100, 1, 3)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([id], [name]) VALUES (1, N'Customer')
INSERT [dbo].[role] ([id], [name]) VALUES (2, N'Seller')
INSERT [dbo].[role] ([id], [name]) VALUES (3, N'Admin')
INSERT [dbo].[role] ([id], [name]) VALUES (4, N'Staff')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
SET IDENTITY_INSERT [dbo].[state] ON 

INSERT [dbo].[state] ([id], [name]) VALUES (1, N'Availabe')
INSERT [dbo].[state] ([id], [name]) VALUES (2, N'Stop Business')
SET IDENTITY_INSERT [dbo].[state] OFF
GO
SET IDENTITY_INSERT [dbo].[store] ON 

INSERT [dbo].[store] ([id], [name], [address], [description]) VALUES (0, NULL, NULL, NULL)
INSERT [dbo].[store] ([id], [name], [address], [description]) VALUES (1, N'FPTShop', N'Cau Giay, Ha Noi', N'')
INSERT [dbo].[store] ([id], [name], [address], [description]) VALUES (2, N'CellphoneS', N'Ho Chi Minh', N'')
INSERT [dbo].[store] ([id], [name], [address], [description]) VALUES (3, N'Thegioididong', N'Thu Duc, Ho Chi Minh', N'')
INSERT [dbo].[store] ([id], [name], [address], [description]) VALUES (4, N'Viettel Store', N'Ba Dinh, Ha Noi', N'')
INSERT [dbo].[store] ([id], [name], [address], [description]) VALUES (5, N'abc', N'ac', N'a')
INSERT [dbo].[store] ([id], [name], [address], [description]) VALUES (6, N'shop123', N'thai nguyen', N'')
INSERT [dbo].[store] ([id], [name], [address], [description]) VALUES (7, N'shop1234', N'huy', N'huy')
INSERT [dbo].[store] ([id], [name], [address], [description]) VALUES (8, N'Shop A', N'Hanoi', N'')
INSERT [dbo].[store] ([id], [name], [address], [description]) VALUES (9, N'Shop AB', N'Hanoi', N'.')
SET IDENTITY_INSERT [dbo].[store] OFF
GO
INSERT [dbo].[topic] ([id], [name]) VALUES (1, N'News')
INSERT [dbo].[topic] ([id], [name]) VALUES (2, N'Review')
INSERT [dbo].[topic] ([id], [name]) VALUES (3, N'Tips & Tricks')
INSERT [dbo].[topic] ([id], [name]) VALUES (4, N'App & Game')
GO
SET IDENTITY_INSERT [dbo].[transport] ON 

INSERT [dbo].[transport] ([id], [name], [price]) VALUES (1, N'MyExpress', 0.0000)
INSERT [dbo].[transport] ([id], [name], [price]) VALUES (2, N'Viettel Post', 20000.0000)
INSERT [dbo].[transport] ([id], [name], [price]) VALUES (3, N'Vietnam Post', 30000.0000)
INSERT [dbo].[transport] ([id], [name], [price]) VALUES (4, N'GrabExpress', 45000.0000)
SET IDENTITY_INSERT [dbo].[transport] OFF
GO
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [df_avatar]  DEFAULT ('default.png') FOR [avatar]
GO
ALTER TABLE [dbo].[account] ADD  DEFAULT ((1)) FOR [roleId]
GO
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [df_statusId]  DEFAULT ((1)) FOR [statusId]
GO
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [df_store]  DEFAULT ((0)) FOR [storeId]
GO
ALTER TABLE [dbo].[blog] ADD  CONSTRAINT [df_status]  DEFAULT ((1)) FOR [statusId]
GO
ALTER TABLE [dbo].[help] ADD  CONSTRAINT [DF_help_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[help] ADD  CONSTRAINT [DF_help_state]  DEFAULT ('') FOR [state]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[role] ([id])
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD FOREIGN KEY([statusId])
REFERENCES [dbo].[accountStatus] ([id])
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD FOREIGN KEY([storeId])
REFERENCES [dbo].[store] ([id])
GO
ALTER TABLE [dbo].[blog]  WITH CHECK ADD FOREIGN KEY([authorId])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[blog]  WITH CHECK ADD  CONSTRAINT [FK_blogStatus] FOREIGN KEY([statusId])
REFERENCES [dbo].[blogStatus] ([id])
GO
ALTER TABLE [dbo].[blog] CHECK CONSTRAINT [FK_blogStatus]
GO
ALTER TABLE [dbo].[blog]  WITH CHECK ADD  CONSTRAINT [FK_topicId] FOREIGN KEY([topicId])
REFERENCES [dbo].[topic] ([id])
GO
ALTER TABLE [dbo].[blog] CHECK CONSTRAINT [FK_topicId]
GO
ALTER TABLE [dbo].[contact]  WITH CHECK ADD FOREIGN KEY([statusId])
REFERENCES [dbo].[contactStatus] ([id])
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[image]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([stateId])
REFERENCES [dbo].[orderStatus] ([id])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([transportId])
REFERENCES [dbo].[transport] ([id])
GO
ALTER TABLE [dbo].[orderDetail]  WITH CHECK ADD FOREIGN KEY([orderId])
REFERENCES [dbo].[order] ([id])
GO
ALTER TABLE [dbo].[orderDetail]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([brandId])
REFERENCES [dbo].[brand] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([stateId])
REFERENCES [dbo].[state] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([storeId])
REFERENCES [dbo].[store] ([id])
GO
USE [master]
GO
ALTER DATABASE [ProjectSWP391_2] SET  READ_WRITE 
GO
