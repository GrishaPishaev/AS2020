USE [master]
GO
/****** Object:  Database [DronTaxiDB]    Script Date: 31.07.2020 13:09:04 ******/
CREATE DATABASE [DronTaxiDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DronTaxiDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\DronTaxiDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DronTaxiDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\DronTaxiDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DronTaxiDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DronTaxiDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DronTaxiDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DronTaxiDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DronTaxiDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DronTaxiDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DronTaxiDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DronTaxiDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DronTaxiDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DronTaxiDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DronTaxiDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DronTaxiDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DronTaxiDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DronTaxiDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DronTaxiDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DronTaxiDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DronTaxiDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DronTaxiDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DronTaxiDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DronTaxiDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DronTaxiDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DronTaxiDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DronTaxiDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DronTaxiDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DronTaxiDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DronTaxiDB] SET  MULTI_USER 
GO
ALTER DATABASE [DronTaxiDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DronTaxiDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DronTaxiDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DronTaxiDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DronTaxiDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DronTaxiDB] SET QUERY_STORE = OFF
GO
USE [DronTaxiDB]
GO
/****** Object:  Table [dbo].[Dron]    Script Date: 31.07.2020 13:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dron](
	[DronID] [int] IDENTITY(1,1) NOT NULL,
	[IDStamp] [int] NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[RegistrationNumber] [nvarchar](16) NOT NULL,
	[YearOfProduction] [date] NOT NULL,
	[DateOfRegistration] [date] NOT NULL,
	[DateOfDeduction] [date] NULL,
 CONSTRAINT [PK_Dron] PRIMARY KEY CLUSTERED 
(
	[DronID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 31.07.2020 13:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[GenderID] [int] IDENTITY(1,1) NOT NULL,
	[NameGender] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[GenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 31.07.2020 13:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[PlaceOfArrival] [nvarchar](max) NOT NULL,
	[PlaceOfDeparture] [nvarchar](max) NOT NULL,
	[TimeOfOrder] [datetime] NOT NULL,
	[Status] [bit] NULL,
	[Cost] [money] NOT NULL,
	[IDTypeOfTrip] [int] NOT NULL,
	[IDDron] [int] NULL,
	[IDUser] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhotoOfDron]    Script Date: 31.07.2020 13:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhotoOfDron](
	[PhotoOfDronID] [int] IDENTITY(1,1) NOT NULL,
	[Photo] [image] NOT NULL,
	[IDDron] [int] NOT NULL,
 CONSTRAINT [PK_PhotoOfDron] PRIMARY KEY CLUSTERED 
(
	[PhotoOfDronID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Privilege]    Script Date: 31.07.2020 13:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Privilege](
	[PrivilegeOfRole] [int] IDENTITY(1,1) NOT NULL,
	[NamePrivilege] [nvarchar](max) NOT NULL,
	[ShortName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Privilege] PRIMARY KEY CLUSTERED 
(
	[PrivilegeOfRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrivilegeOfRole]    Script Date: 31.07.2020 13:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrivilegeOfRole](
	[PrivilageOfRoleID] [int] IDENTITY(1,1) NOT NULL,
	[IDRole] [int] NOT NULL,
	[IDPrivilege] [int] NOT NULL,
 CONSTRAINT [PK_PrivilegeOfRole] PRIMARY KEY CLUSTERED 
(
	[PrivilageOfRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 31.07.2020 13:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[SystemName] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleOfUser]    Script Date: 31.07.2020 13:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleOfUser](
	[RoleOfUserID] [int] IDENTITY(1,1) NOT NULL,
	[IDUser] [int] NOT NULL,
	[IDRole] [int] NOT NULL,
 CONSTRAINT [PK_RoleOfUser] PRIMARY KEY CLUSTERED 
(
	[RoleOfUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stramp]    Script Date: 31.07.2020 13:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stramp](
	[StrampID] [int] IDENTITY(1,1) NOT NULL,
	[NameStramp] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Stramp] PRIMARY KEY CLUSTERED 
(
	[StrampID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfTrip]    Script Date: 31.07.2020 13:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfTrip](
	[TypeOfTripID] [int] IDENTITY(1,1) NOT NULL,
	[NameTypeOfTrip] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeOfTrip] PRIMARY KEY CLUSTERED 
(
	[TypeOfTripID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 31.07.2020 13:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[Phone] [char](11) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[BirthDay] [date] NOT NULL,
	[IDGender] [int] NOT NULL,
	[Photo] [image] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([GenderID], [NameGender]) VALUES (1, N'Мужской')
INSERT [dbo].[Gender] ([GenderID], [NameGender]) VALUES (2, N'Женский')
SET IDENTITY_INSERT [dbo].[Gender] OFF
SET IDENTITY_INSERT [dbo].[Privilege] ON 

INSERT [dbo].[Privilege] ([PrivilegeOfRole], [NamePrivilege], [ShortName]) VALUES (1, N'Упр. пользователями', N'WOfU')
INSERT [dbo].[Privilege] ([PrivilegeOfRole], [NamePrivilege], [ShortName]) VALUES (2, N'Упр. ролями', N'WOfR')
INSERT [dbo].[Privilege] ([PrivilegeOfRole], [NamePrivilege], [ShortName]) VALUES (3, N'Работа с дронами', N'WOfD')
SET IDENTITY_INSERT [dbo].[Privilege] OFF
SET IDENTITY_INSERT [dbo].[PrivilegeOfRole] ON 

INSERT [dbo].[PrivilegeOfRole] ([PrivilageOfRoleID], [IDRole], [IDPrivilege]) VALUES (1, 1, 1)
INSERT [dbo].[PrivilegeOfRole] ([PrivilageOfRoleID], [IDRole], [IDPrivilege]) VALUES (2, 1, 2)
INSERT [dbo].[PrivilegeOfRole] ([PrivilageOfRoleID], [IDRole], [IDPrivilege]) VALUES (3, 1, 3)
INSERT [dbo].[PrivilegeOfRole] ([PrivilageOfRoleID], [IDRole], [IDPrivilege]) VALUES (4, 2, 1)
INSERT [dbo].[PrivilegeOfRole] ([PrivilageOfRoleID], [IDRole], [IDPrivilege]) VALUES (5, 2, 2)
INSERT [dbo].[PrivilegeOfRole] ([PrivilageOfRoleID], [IDRole], [IDPrivilege]) VALUES (6, 4, 3)
SET IDENTITY_INSERT [dbo].[PrivilegeOfRole] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [SystemName], [Name]) VALUES (1, N'God', N'Супер администратор')
INSERT [dbo].[Role] ([RoleID], [SystemName], [Name]) VALUES (2, N'Admin', N'Администратор')
INSERT [dbo].[Role] ([RoleID], [SystemName], [Name]) VALUES (3, N'User', N'Пользователь')
INSERT [dbo].[Role] ([RoleID], [SystemName], [Name]) VALUES (4, N'Master', N'Мастер')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[RoleOfUser] ON 

INSERT [dbo].[RoleOfUser] ([RoleOfUserID], [IDUser], [IDRole]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [dbo].[RoleOfUser] OFF
SET IDENTITY_INSERT [dbo].[Stramp] ON 

INSERT [dbo].[Stramp] ([StrampID], [NameStramp]) VALUES (1, N'Northrop')
INSERT [dbo].[Stramp] ([StrampID], [NameStramp]) VALUES (2, N'DJI')
INSERT [dbo].[Stramp] ([StrampID], [NameStramp]) VALUES (3, N'Toyota')
INSERT [dbo].[Stramp] ([StrampID], [NameStramp]) VALUES (4, N'Airbus')
SET IDENTITY_INSERT [dbo].[Stramp] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Login], [Password], [LastName], [FirstName], [MiddleName], [Phone], [Email], [BirthDay], [IDGender], [Photo]) VALUES (1, N'Admin', N'QWEasd123', N'Пищаев', N'Григорий', N'Владимирович', NULL, N'grisha.finikoff@yandex.ru', CAST(N'2001-11-02' AS Date), 1, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Dron]  WITH CHECK ADD  CONSTRAINT [FK_Dron_Stramp] FOREIGN KEY([IDStamp])
REFERENCES [dbo].[Stramp] ([StrampID])
GO
ALTER TABLE [dbo].[Dron] CHECK CONSTRAINT [FK_Dron_Stramp]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Dron] FOREIGN KEY([IDDron])
REFERENCES [dbo].[Dron] ([DronID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Dron]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_TypeOfTrip] FOREIGN KEY([IDTypeOfTrip])
REFERENCES [dbo].[TypeOfTrip] ([TypeOfTripID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_TypeOfTrip]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([IDUser])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[PhotoOfDron]  WITH CHECK ADD  CONSTRAINT [FK_PhotoOfDron_Dron] FOREIGN KEY([IDDron])
REFERENCES [dbo].[Dron] ([DronID])
GO
ALTER TABLE [dbo].[PhotoOfDron] CHECK CONSTRAINT [FK_PhotoOfDron_Dron]
GO
ALTER TABLE [dbo].[PrivilegeOfRole]  WITH CHECK ADD  CONSTRAINT [FK_PrivilegeOfRole_Privilege] FOREIGN KEY([IDPrivilege])
REFERENCES [dbo].[Privilege] ([PrivilegeOfRole])
GO
ALTER TABLE [dbo].[PrivilegeOfRole] CHECK CONSTRAINT [FK_PrivilegeOfRole_Privilege]
GO
ALTER TABLE [dbo].[PrivilegeOfRole]  WITH CHECK ADD  CONSTRAINT [FK_PrivilegeOfRole_Role] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[PrivilegeOfRole] CHECK CONSTRAINT [FK_PrivilegeOfRole_Role]
GO
ALTER TABLE [dbo].[RoleOfUser]  WITH CHECK ADD  CONSTRAINT [FK_RoleOfUser_Role] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[RoleOfUser] CHECK CONSTRAINT [FK_RoleOfUser_Role]
GO
ALTER TABLE [dbo].[RoleOfUser]  WITH CHECK ADD  CONSTRAINT [FK_RoleOfUser_User] FOREIGN KEY([IDUser])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[RoleOfUser] CHECK CONSTRAINT [FK_RoleOfUser_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Gender] FOREIGN KEY([IDGender])
REFERENCES [dbo].[Gender] ([GenderID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Gender]
GO
USE [master]
GO
ALTER DATABASE [DronTaxiDB] SET  READ_WRITE 
GO
