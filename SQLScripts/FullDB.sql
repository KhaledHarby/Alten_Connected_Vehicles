USE [master]
GO
/****** Object:  Database [Alten_Connected_Vehicles]    Script Date: 6/14/2017 7:39:02 PM ******/
CREATE DATABASE [Alten_Connected_Vehicles]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Alten_Connected_Vehicles', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.TIKASQL\MSSQL\DATA\Alten_Connected_Vehicles.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Alten_Connected_Vehicles_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.TIKASQL\MSSQL\DATA\Alten_Connected_Vehicles_log.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Alten_Connected_Vehicles].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET ARITHABORT OFF 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET RECOVERY FULL 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET  MULTI_USER 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Alten_Connected_Vehicles', N'ON'
GO
USE [Alten_Connected_Vehicles]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/14/2017 7:39:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](255) NULL,
	[Active] [bit] NULL CONSTRAINT [DF_Customer_Active]  DEFAULT ((1)),
	[Deleted] [bit] NULL CONSTRAINT [DF_Customer_Deleted]  DEFAULT ((0)),
	[CreatedOn] [datetime] NULL CONSTRAINT [DF_Customer_CreatedOn]  DEFAULT (getdate()),
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RawTransctions]    Script Date: 6/14/2017 7:39:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RawTransctions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RawData] [varbinary](max) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_RawTransctions_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 6/14/2017 7:39:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transactions](
	[RegNo] [varchar](6) NOT NULL,
	[EntryDate] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Transactions_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 6/14/2017 7:39:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vehicles](
	[ID] [varchar](25) NOT NULL,
	[RegNo] [varchar](10) NOT NULL,
	[CustomerID] [uniqueidentifier] NULL,
	[LastUpdateTime] [datetime] NULL,
	[ActiveStatus] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[Active] [bit] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Vehicles_1] PRIMARY KEY CLUSTERED 
(
	[RegNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[RawTransctions] ADD  CONSTRAINT [DF_RawTransctions_EntryDate]  DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [dbo].[Vehicles]  WITH CHECK ADD  CONSTRAINT [FK_Vehicles_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Vehicles] CHECK CONSTRAINT [FK_Vehicles_Customer]
GO
USE [master]
GO
ALTER DATABASE [Alten_Connected_Vehicles] SET  READ_WRITE 
GO
