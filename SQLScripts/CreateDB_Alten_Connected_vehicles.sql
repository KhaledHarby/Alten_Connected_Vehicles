USE [master]
GO

/****** Object:  Database [Alten_Connected_Vehicles]    Script Date: 6/14/2017 7:37:40 PM ******/
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

ALTER DATABASE [Alten_Connected_Vehicles] SET  READ_WRITE 
GO

