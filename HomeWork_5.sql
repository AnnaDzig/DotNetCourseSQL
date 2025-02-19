USE [master]
GO
/****** Object:  Database [MyJoinsDB]    Script Date: 19/02/2025 22.13.44 ******/
CREATE DATABASE [MyJoinsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyJoinsDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MyJoinsDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyJoinsDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MyJoinsDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MyJoinsDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyJoinsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyJoinsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyJoinsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyJoinsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyJoinsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyJoinsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyJoinsDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MyJoinsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyJoinsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyJoinsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyJoinsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyJoinsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyJoinsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyJoinsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyJoinsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyJoinsDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MyJoinsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyJoinsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyJoinsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyJoinsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyJoinsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyJoinsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyJoinsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyJoinsDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyJoinsDB] SET  MULTI_USER 
GO
ALTER DATABASE [MyJoinsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyJoinsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyJoinsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyJoinsDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyJoinsDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyJoinsDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MyJoinsDB] SET QUERY_STORE = OFF
GO
USE [MyJoinsDB]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 19/02/2025 22.13.44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonalInfo]    Script Date: 19/02/2025 22.13.44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalInfo](
	[EmployeeID] [int] NOT NULL,
	[MaritalStatus] [nvarchar](20) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salaries]    Script Date: 19/02/2025 22.13.44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salaries](
	[EmployeeID] [int] NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Salary] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PersonalInfo]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Salaries]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PersonalInfo]  WITH CHECK ADD CHECK  (([MaritalStatus]=N'Неодружений' OR [MaritalStatus]=N'Одружений'))
GO
ALTER TABLE [dbo].[Salaries]  WITH CHECK ADD CHECK  (([Position]=N'Розробник' OR [Position]=N'Менеджер' OR [Position]=N'Головний директор'))
GO
USE [master]
GO
ALTER DATABASE [MyJoinsDB] SET  READ_WRITE 
GO
