USE [master]
GO
/****** Object:  Database [GameShopDB]    Script Date: 06.10.2022 10:53:44 ******/
CREATE DATABASE [GameShopDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GameShopDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GameShopDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GameShopDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GameShopDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GameShopDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GameShopDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GameShopDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GameShopDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GameShopDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GameShopDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GameShopDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [GameShopDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GameShopDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GameShopDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GameShopDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GameShopDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GameShopDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GameShopDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GameShopDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GameShopDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GameShopDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GameShopDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GameShopDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GameShopDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GameShopDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GameShopDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GameShopDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GameShopDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GameShopDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GameShopDB] SET  MULTI_USER 
GO
ALTER DATABASE [GameShopDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GameShopDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GameShopDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GameShopDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GameShopDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GameShopDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GameShopDB] SET QUERY_STORE = OFF
GO
USE [GameShopDB]
GO
/****** Object:  Table [dbo].[Achievement]    Script Date: 06.10.2022 10:53:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Achievement](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Achievement] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 06.10.2022 10:53:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameHadAchievement]    Script Date: 06.10.2022 10:53:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameHadAchievement](
	[GameId] [int] NOT NULL,
	[AchievementId] [int] NOT NULL,
 CONSTRAINT [PK_GameHadAchievement] PRIMARY KEY CLUSTERED 
(
	[GameId] ASC,
	[AchievementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameHadGenre]    Script Date: 06.10.2022 10:53:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameHadGenre](
	[GameId] [int] NOT NULL,
	[GenreId] [int] NOT NULL,
 CONSTRAINT [PK_GameHadGenre] PRIMARY KEY CLUSTERED 
(
	[GameId] ASC,
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 06.10.2022 10:53:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GameHadAchievement]  WITH CHECK ADD  CONSTRAINT [FK_GameHadAchievement_Achievement] FOREIGN KEY([AchievementId])
REFERENCES [dbo].[Achievement] ([Id])
GO
ALTER TABLE [dbo].[GameHadAchievement] CHECK CONSTRAINT [FK_GameHadAchievement_Achievement]
GO
ALTER TABLE [dbo].[GameHadAchievement]  WITH CHECK ADD  CONSTRAINT [FK_GameHadAchievement_Game] FOREIGN KEY([GameId])
REFERENCES [dbo].[Game] ([Id])
GO
ALTER TABLE [dbo].[GameHadAchievement] CHECK CONSTRAINT [FK_GameHadAchievement_Game]
GO
ALTER TABLE [dbo].[GameHadGenre]  WITH CHECK ADD  CONSTRAINT [FK_GameHadGenre_Game] FOREIGN KEY([GameId])
REFERENCES [dbo].[Game] ([Id])
GO
ALTER TABLE [dbo].[GameHadGenre] CHECK CONSTRAINT [FK_GameHadGenre_Game]
GO
ALTER TABLE [dbo].[GameHadGenre]  WITH CHECK ADD  CONSTRAINT [FK_GameHadGenre_Genre] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genre] ([Id])
GO
ALTER TABLE [dbo].[GameHadGenre] CHECK CONSTRAINT [FK_GameHadGenre_Genre]
GO
USE [master]
GO
ALTER DATABASE [GameShopDB] SET  READ_WRITE 
GO
