/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2008 R2 (10.50.1600)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2008 R2
    Target Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [master]
GO

/****** Object:  Database [deliveries]    Script Date: 1/21/2019 8:25:18 PM ******/
CREATE DATABASE [deliveries] ON  PRIMARY 
( NAME = N'deliveries', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\deliveries.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'deliveries_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\deliveries_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [deliveries] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [deliveries].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [deliveries] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [deliveries] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [deliveries] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [deliveries] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [deliveries] SET ARITHABORT OFF 
GO

ALTER DATABASE [deliveries] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [deliveries] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [deliveries] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [deliveries] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [deliveries] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [deliveries] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [deliveries] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [deliveries] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [deliveries] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [deliveries] SET  DISABLE_BROKER 
GO

ALTER DATABASE [deliveries] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [deliveries] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [deliveries] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [deliveries] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [deliveries] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [deliveries] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [deliveries] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [deliveries] SET RECOVERY FULL 
GO

ALTER DATABASE [deliveries] SET  MULTI_USER 
GO

ALTER DATABASE [deliveries] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [deliveries] SET DB_CHAINING OFF 
GO

ALTER DATABASE [deliveries] SET  READ_WRITE 
GO


