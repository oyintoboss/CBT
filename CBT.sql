USE [master]
GO
/****** Object:  Database [CBT]    Script Date: 2/11/2021 2:04:55 PM ******/
CREATE DATABASE [CBT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CBT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CBT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CBT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CBT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CBT] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CBT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CBT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CBT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CBT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CBT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CBT] SET ARITHABORT OFF 
GO
ALTER DATABASE [CBT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CBT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CBT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CBT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CBT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CBT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CBT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CBT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CBT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CBT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CBT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CBT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CBT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CBT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CBT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CBT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CBT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CBT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CBT] SET  MULTI_USER 
GO
ALTER DATABASE [CBT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CBT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CBT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CBT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CBT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CBT] SET QUERY_STORE = OFF
GO
USE [CBT]
GO
/****** Object:  User [newage]    Script Date: 2/11/2021 2:04:55 PM ******/
CREATE USER [newage] FOR LOGIN [newage] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Candidate]    Script Date: 2/11/2021 2:04:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[Mobile] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Candidate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestScore]    Script Date: 2/11/2021 2:04:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestScore](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Score] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[CandidateId] [int] NOT NULL,
 CONSTRAINT [PK_TestScore] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Candidate] ON 

INSERT [dbo].[Candidate] ([id], [Name], [Email], [Mobile]) VALUES (1, N'wefiorjfio', N'qwuew@fhweuifwe.com', N'83848923')
SET IDENTITY_INSERT [dbo].[Candidate] OFF
GO
ALTER TABLE [dbo].[TestScore]  WITH CHECK ADD  CONSTRAINT [FK_TestScore_Candidate] FOREIGN KEY([CandidateId])
REFERENCES [dbo].[Candidate] ([id])
GO
ALTER TABLE [dbo].[TestScore] CHECK CONSTRAINT [FK_TestScore_Candidate]
GO
USE [master]
GO
ALTER DATABASE [CBT] SET  READ_WRITE 
GO
