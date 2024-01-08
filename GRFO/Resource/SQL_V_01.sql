USE [master]
GO
/****** Object:  Database [RMS]    Script Date: 08/01/2024 4:03:28 PM ******/
CREATE DATABASE [RMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RMS', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\RMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RMS_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\RMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [RMS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [RMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RMS] SET RECOVERY FULL 
GO
ALTER DATABASE [RMS] SET  MULTI_USER 
GO
ALTER DATABASE [RMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RMS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RMS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RMS', N'ON'
GO
ALTER DATABASE [RMS] SET QUERY_STORE = OFF
GO
USE [RMS]
GO
/****** Object:  Table [dbo].[BusinessType]    Script Date: 08/01/2024 4:03:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessType](
	[BusinessTypeId] [int] IDENTITY(1,1) NOT NULL,
	[RepairCategoryId] [int] NULL,
	[BusinessType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BusinessType] PRIMARY KEY CLUSTERED 
(
	[BusinessTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerLocations]    Script Date: 08/01/2024 4:03:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerLocations](
	[CustomerLocationId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerLocations] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CustomerLocations] PRIMARY KEY CLUSTERED 
(
	[CustomerLocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hadoopData]    Script Date: 08/01/2024 4:03:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hadoopData](
	[basePartId] [int] IDENTITY(1,1) NOT NULL,
	[basePartNumber] [nvarchar](50) NOT NULL,
	[partDescription] [nvarchar](2000) NOT NULL,
	[stdCostBasePart] [decimal](18, 0) NOT NULL,
	[annualRepairForecast] [decimal](18, 0) NOT NULL,
	[extendedSpendPotential] [decimal](18, 0) NOT NULL,
	[t1CustomerQty] [decimal](18, 0) NOT NULL,
	[t2CustomerQty] [decimal](18, 0) NOT NULL,
	[mg3] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_hadoopData] PRIMARY KEY CLUSTERED 
(
	[basePartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RepairCategory]    Script Date: 08/01/2024 4:03:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepairCategory](
	[RepairCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[RepairCategory] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RepairCategory] PRIMARY KEY CLUSTERED 
(
	[RepairCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RepairLocation]    Script Date: 08/01/2024 4:03:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepairLocation](
	[RepairLocationId] [int] IDENTITY(1,1) NOT NULL,
	[RepairLocation] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RepairLocation] PRIMARY KEY CLUSTERED 
(
	[RepairLocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestMaster]    Script Date: 08/01/2024 4:03:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestMaster](
	[RequestId] [int] IDENTITY(1,1) NOT NULL,
	[RequestCategoryId] [int] NOT NULL,
	[BusinessTypeId] [int] NOT NULL,
	[RequestSourceId] [int] NOT NULL,
	[RequestorProjectGroup] [nvarchar](200) NOT NULL,
	[Requestor] [nvarchar](200) NOT NULL,
	[BasePartNumber] [nvarchar](20) NOT NULL,
	[PartDescription] [nvarchar](200) NOT NULL,
	[SolutionPartNumber] [nvarchar](20) NOT NULL,
	[NeedByDate] [datetime] NOT NULL,
	[BUNameId] [int] NOT NULL,
	[RepairLocationId] [int] NOT NULL,
	[TargetCustomer] [nvarchar](200) NOT NULL,
	[CustomerLocationId] [int] NOT NULL,
	[AnnualRepairForecast1] [numeric](18, 0) NOT NULL,
	[AnnualRepairForecast2] [numeric](18, 0) NOT NULL,
	[STDCostBasePart] [numeric](18, 0) NOT NULL,
	[AnnualRepairForecast] [numeric](18, 0) NOT NULL,
	[ExtendedSpendPotential] [numeric](18, 0) NOT NULL,
	[T1CustomerQty] [numeric](18, 0) NOT NULL,
	[T2CustomerQty] [numeric](18, 0) NOT NULL,
	[MG3] [bit] NOT NULL,
	[Comments] [nvarchar](1000) NOT NULL,
	[ScreeningStatus] [nvarchar](10) NULL,
	[BusinessCaseStatus] [nvarchar](10) NULL,
	[PilotReviewStatus] [nvarchar](10) NULL,
	[PrdImplementation] [bit] NOT NULL,
	[PrdDate] [datetime] NOT NULL,
	[ExectiveName] [nvarchar](100) NULL,
	[GRFOComment] [nvarchar](1000) NULL,
	[CCNumber] [nvarchar](10) NULL,
 CONSTRAINT [PK_RequestMaster] PRIMARY KEY CLUSTERED 
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestorSource]    Script Date: 08/01/2024 4:03:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestorSource](
	[RequestorSourceId] [int] IDENTITY(1,1) NOT NULL,
	[RequestorSource] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RequestorSource] PRIMARY KEY CLUSTERED 
(
	[RequestorSourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BusinessType] ON 
GO
INSERT [dbo].[BusinessType] ([BusinessTypeId], [RepairCategoryId], [BusinessType]) VALUES (1, 1, N'test A sdfdsf')
GO
INSERT [dbo].[BusinessType] ([BusinessTypeId], [RepairCategoryId], [BusinessType]) VALUES (2, 1, N'Test B')
GO
INSERT [dbo].[BusinessType] ([BusinessTypeId], [RepairCategoryId], [BusinessType]) VALUES (3, NULL, N'adsdd')
GO
INSERT [dbo].[BusinessType] ([BusinessTypeId], [RepairCategoryId], [BusinessType]) VALUES (4, NULL, N'asdaddadadad')
GO
INSERT [dbo].[BusinessType] ([BusinessTypeId], [RepairCategoryId], [BusinessType]) VALUES (5, NULL, N'asdasdadadadasdasda')
GO
SET IDENTITY_INSERT [dbo].[BusinessType] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerLocations] ON 
GO
INSERT [dbo].[CustomerLocations] ([CustomerLocationId], [CustomerLocations]) VALUES (1, N'Location 1')
GO
INSERT [dbo].[CustomerLocations] ([CustomerLocationId], [CustomerLocations]) VALUES (2, N'Location 2')
GO
INSERT [dbo].[CustomerLocations] ([CustomerLocationId], [CustomerLocations]) VALUES (3, N'asdad')
GO
SET IDENTITY_INSERT [dbo].[CustomerLocations] OFF
GO
SET IDENTITY_INSERT [dbo].[hadoopData] ON 
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (1, N'0010-4562', N'sddsf', CAST(4 AS Decimal(18, 0)), CAST(6 AS Decimal(18, 0)), CAST(8 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), CAST(12 AS Decimal(18, 0)), CAST(14 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (2, N'0020-4563', N'sddsf', CAST(5 AS Decimal(18, 0)), CAST(7 AS Decimal(18, 0)), CAST(9 AS Decimal(18, 0)), CAST(11 AS Decimal(18, 0)), CAST(13 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (3, N'0030-4564', N'sddsf', CAST(6 AS Decimal(18, 0)), CAST(8 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), CAST(12 AS Decimal(18, 0)), CAST(14 AS Decimal(18, 0)), CAST(16 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (4, N'0040-4565', N'sddsf', CAST(7 AS Decimal(18, 0)), CAST(9 AS Decimal(18, 0)), CAST(11 AS Decimal(18, 0)), CAST(13 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), CAST(17 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (5, N'0050-4566', N'sddsf', CAST(8 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), CAST(12 AS Decimal(18, 0)), CAST(14 AS Decimal(18, 0)), CAST(16 AS Decimal(18, 0)), CAST(18 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (6, N'0060-4567', N'sddsf', CAST(9 AS Decimal(18, 0)), CAST(11 AS Decimal(18, 0)), CAST(13 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), CAST(17 AS Decimal(18, 0)), CAST(19 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (7, N'0070-4568', N'sddsf', CAST(10 AS Decimal(18, 0)), CAST(12 AS Decimal(18, 0)), CAST(14 AS Decimal(18, 0)), CAST(16 AS Decimal(18, 0)), CAST(18 AS Decimal(18, 0)), CAST(20 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (8, N'0080-4569', N'sddsf', CAST(11 AS Decimal(18, 0)), CAST(13 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), CAST(17 AS Decimal(18, 0)), CAST(19 AS Decimal(18, 0)), CAST(21 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (9, N'0090-4570', N'sddsf', CAST(12 AS Decimal(18, 0)), CAST(14 AS Decimal(18, 0)), CAST(16 AS Decimal(18, 0)), CAST(18 AS Decimal(18, 0)), CAST(20 AS Decimal(18, 0)), CAST(22 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (10, N'0100-4571', N'sddsf', CAST(13 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), CAST(17 AS Decimal(18, 0)), CAST(19 AS Decimal(18, 0)), CAST(21 AS Decimal(18, 0)), CAST(23 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (11, N'0110-4572', N'sddsf', CAST(14 AS Decimal(18, 0)), CAST(16 AS Decimal(18, 0)), CAST(18 AS Decimal(18, 0)), CAST(20 AS Decimal(18, 0)), CAST(22 AS Decimal(18, 0)), CAST(24 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (12, N'0120-4573', N'sddsf', CAST(15 AS Decimal(18, 0)), CAST(17 AS Decimal(18, 0)), CAST(19 AS Decimal(18, 0)), CAST(21 AS Decimal(18, 0)), CAST(23 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (13, N'0130-4574', N'sddsf', CAST(16 AS Decimal(18, 0)), CAST(18 AS Decimal(18, 0)), CAST(20 AS Decimal(18, 0)), CAST(22 AS Decimal(18, 0)), CAST(24 AS Decimal(18, 0)), CAST(26 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (14, N'0140-4575', N'sddsf', CAST(17 AS Decimal(18, 0)), CAST(19 AS Decimal(18, 0)), CAST(21 AS Decimal(18, 0)), CAST(23 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), CAST(27 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (15, N'0150-4576', N'sddsf', CAST(18 AS Decimal(18, 0)), CAST(20 AS Decimal(18, 0)), CAST(22 AS Decimal(18, 0)), CAST(24 AS Decimal(18, 0)), CAST(26 AS Decimal(18, 0)), CAST(28 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (16, N'0160-4577', N'sddsf', CAST(19 AS Decimal(18, 0)), CAST(21 AS Decimal(18, 0)), CAST(23 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), CAST(27 AS Decimal(18, 0)), CAST(29 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (17, N'0170-4578', N'sddsf', CAST(20 AS Decimal(18, 0)), CAST(22 AS Decimal(18, 0)), CAST(24 AS Decimal(18, 0)), CAST(26 AS Decimal(18, 0)), CAST(28 AS Decimal(18, 0)), CAST(30 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (18, N'0180-4579', N'sddsf', CAST(21 AS Decimal(18, 0)), CAST(23 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), CAST(27 AS Decimal(18, 0)), CAST(29 AS Decimal(18, 0)), CAST(31 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (19, N'0190-4580', N'sddsf', CAST(22 AS Decimal(18, 0)), CAST(24 AS Decimal(18, 0)), CAST(26 AS Decimal(18, 0)), CAST(28 AS Decimal(18, 0)), CAST(30 AS Decimal(18, 0)), CAST(32 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (20, N'0200-4581', N'sddsf', CAST(23 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), CAST(27 AS Decimal(18, 0)), CAST(29 AS Decimal(18, 0)), CAST(31 AS Decimal(18, 0)), CAST(33 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (21, N'0210-4582', N'sddsf', CAST(24 AS Decimal(18, 0)), CAST(26 AS Decimal(18, 0)), CAST(28 AS Decimal(18, 0)), CAST(30 AS Decimal(18, 0)), CAST(32 AS Decimal(18, 0)), CAST(34 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (22, N'0220-4583', N'sddsf', CAST(25 AS Decimal(18, 0)), CAST(27 AS Decimal(18, 0)), CAST(29 AS Decimal(18, 0)), CAST(31 AS Decimal(18, 0)), CAST(33 AS Decimal(18, 0)), CAST(35 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (23, N'0230-4584', N'sddsf', CAST(26 AS Decimal(18, 0)), CAST(28 AS Decimal(18, 0)), CAST(30 AS Decimal(18, 0)), CAST(32 AS Decimal(18, 0)), CAST(34 AS Decimal(18, 0)), CAST(36 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (24, N'0240-4585', N'sddsf', CAST(27 AS Decimal(18, 0)), CAST(29 AS Decimal(18, 0)), CAST(31 AS Decimal(18, 0)), CAST(33 AS Decimal(18, 0)), CAST(35 AS Decimal(18, 0)), CAST(37 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (25, N'0250-4586', N'sddsf', CAST(28 AS Decimal(18, 0)), CAST(30 AS Decimal(18, 0)), CAST(32 AS Decimal(18, 0)), CAST(34 AS Decimal(18, 0)), CAST(36 AS Decimal(18, 0)), CAST(38 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (26, N'0260-4587', N'sddsf', CAST(29 AS Decimal(18, 0)), CAST(31 AS Decimal(18, 0)), CAST(33 AS Decimal(18, 0)), CAST(35 AS Decimal(18, 0)), CAST(37 AS Decimal(18, 0)), CAST(39 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (27, N'0270-4588', N'sddsf', CAST(30 AS Decimal(18, 0)), CAST(32 AS Decimal(18, 0)), CAST(34 AS Decimal(18, 0)), CAST(36 AS Decimal(18, 0)), CAST(38 AS Decimal(18, 0)), CAST(40 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (28, N'0280-4589', N'sddsf', CAST(31 AS Decimal(18, 0)), CAST(33 AS Decimal(18, 0)), CAST(35 AS Decimal(18, 0)), CAST(37 AS Decimal(18, 0)), CAST(39 AS Decimal(18, 0)), CAST(41 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (29, N'0290-4590', N'sddsf', CAST(32 AS Decimal(18, 0)), CAST(34 AS Decimal(18, 0)), CAST(36 AS Decimal(18, 0)), CAST(38 AS Decimal(18, 0)), CAST(40 AS Decimal(18, 0)), CAST(42 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (30, N'0300-4591', N'sddsf', CAST(33 AS Decimal(18, 0)), CAST(35 AS Decimal(18, 0)), CAST(37 AS Decimal(18, 0)), CAST(39 AS Decimal(18, 0)), CAST(41 AS Decimal(18, 0)), CAST(43 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (31, N'0310-4592', N'sddsf', CAST(34 AS Decimal(18, 0)), CAST(36 AS Decimal(18, 0)), CAST(38 AS Decimal(18, 0)), CAST(40 AS Decimal(18, 0)), CAST(42 AS Decimal(18, 0)), CAST(44 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (32, N'0320-4593', N'sddsf', CAST(35 AS Decimal(18, 0)), CAST(37 AS Decimal(18, 0)), CAST(39 AS Decimal(18, 0)), CAST(41 AS Decimal(18, 0)), CAST(43 AS Decimal(18, 0)), CAST(45 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (33, N'0330-4594', N'sddsf', CAST(36 AS Decimal(18, 0)), CAST(38 AS Decimal(18, 0)), CAST(40 AS Decimal(18, 0)), CAST(42 AS Decimal(18, 0)), CAST(44 AS Decimal(18, 0)), CAST(46 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (34, N'0340-4595', N'sddsf', CAST(37 AS Decimal(18, 0)), CAST(39 AS Decimal(18, 0)), CAST(41 AS Decimal(18, 0)), CAST(43 AS Decimal(18, 0)), CAST(45 AS Decimal(18, 0)), CAST(47 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (35, N'0350-4596', N'sddsf', CAST(38 AS Decimal(18, 0)), CAST(40 AS Decimal(18, 0)), CAST(42 AS Decimal(18, 0)), CAST(44 AS Decimal(18, 0)), CAST(46 AS Decimal(18, 0)), CAST(48 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (36, N'0360-4597', N'sddsf', CAST(39 AS Decimal(18, 0)), CAST(41 AS Decimal(18, 0)), CAST(43 AS Decimal(18, 0)), CAST(45 AS Decimal(18, 0)), CAST(47 AS Decimal(18, 0)), CAST(49 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (37, N'0370-4598', N'sddsf', CAST(40 AS Decimal(18, 0)), CAST(42 AS Decimal(18, 0)), CAST(44 AS Decimal(18, 0)), CAST(46 AS Decimal(18, 0)), CAST(48 AS Decimal(18, 0)), CAST(50 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (38, N'0380-4599', N'sddsf', CAST(41 AS Decimal(18, 0)), CAST(43 AS Decimal(18, 0)), CAST(45 AS Decimal(18, 0)), CAST(47 AS Decimal(18, 0)), CAST(49 AS Decimal(18, 0)), CAST(51 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (39, N'0390-4600', N'sddsf', CAST(42 AS Decimal(18, 0)), CAST(44 AS Decimal(18, 0)), CAST(46 AS Decimal(18, 0)), CAST(48 AS Decimal(18, 0)), CAST(50 AS Decimal(18, 0)), CAST(52 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (40, N'0400-4601', N'sddsf', CAST(43 AS Decimal(18, 0)), CAST(45 AS Decimal(18, 0)), CAST(47 AS Decimal(18, 0)), CAST(49 AS Decimal(18, 0)), CAST(51 AS Decimal(18, 0)), CAST(53 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (41, N'0410-4602', N'sddsf', CAST(44 AS Decimal(18, 0)), CAST(46 AS Decimal(18, 0)), CAST(48 AS Decimal(18, 0)), CAST(50 AS Decimal(18, 0)), CAST(52 AS Decimal(18, 0)), CAST(54 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (42, N'0420-4603', N'sddsf', CAST(45 AS Decimal(18, 0)), CAST(47 AS Decimal(18, 0)), CAST(49 AS Decimal(18, 0)), CAST(51 AS Decimal(18, 0)), CAST(53 AS Decimal(18, 0)), CAST(55 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (43, N'0430-4604', N'sddsf', CAST(46 AS Decimal(18, 0)), CAST(48 AS Decimal(18, 0)), CAST(50 AS Decimal(18, 0)), CAST(52 AS Decimal(18, 0)), CAST(54 AS Decimal(18, 0)), CAST(56 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (44, N'0440-4605', N'sddsf', CAST(47 AS Decimal(18, 0)), CAST(49 AS Decimal(18, 0)), CAST(51 AS Decimal(18, 0)), CAST(53 AS Decimal(18, 0)), CAST(55 AS Decimal(18, 0)), CAST(57 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (45, N'0450-4606', N'sddsf', CAST(48 AS Decimal(18, 0)), CAST(50 AS Decimal(18, 0)), CAST(52 AS Decimal(18, 0)), CAST(54 AS Decimal(18, 0)), CAST(56 AS Decimal(18, 0)), CAST(58 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (46, N'0460-4607', N'sddsf', CAST(49 AS Decimal(18, 0)), CAST(51 AS Decimal(18, 0)), CAST(53 AS Decimal(18, 0)), CAST(55 AS Decimal(18, 0)), CAST(57 AS Decimal(18, 0)), CAST(59 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (47, N'0470-4608', N'sddsf', CAST(50 AS Decimal(18, 0)), CAST(52 AS Decimal(18, 0)), CAST(54 AS Decimal(18, 0)), CAST(56 AS Decimal(18, 0)), CAST(58 AS Decimal(18, 0)), CAST(60 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (48, N'0480-4609', N'sddsf', CAST(51 AS Decimal(18, 0)), CAST(53 AS Decimal(18, 0)), CAST(55 AS Decimal(18, 0)), CAST(57 AS Decimal(18, 0)), CAST(59 AS Decimal(18, 0)), CAST(61 AS Decimal(18, 0)))
GO
INSERT [dbo].[hadoopData] ([basePartId], [basePartNumber], [partDescription], [stdCostBasePart], [annualRepairForecast], [extendedSpendPotential], [t1CustomerQty], [t2CustomerQty], [mg3]) VALUES (49, N'0490-4610', N'sddsf', CAST(52 AS Decimal(18, 0)), CAST(54 AS Decimal(18, 0)), CAST(56 AS Decimal(18, 0)), CAST(58 AS Decimal(18, 0)), CAST(60 AS Decimal(18, 0)), CAST(62 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[hadoopData] OFF
GO
SET IDENTITY_INSERT [dbo].[RepairCategory] ON 
GO
INSERT [dbo].[RepairCategory] ([RepairCategoryId], [RepairCategory]) VALUES (1, N'Repair')
GO
INSERT [dbo].[RepairCategory] ([RepairCategoryId], [RepairCategory]) VALUES (2, N'New')
GO
INSERT [dbo].[RepairCategory] ([RepairCategoryId], [RepairCategory]) VALUES (3, N'asda')
GO
SET IDENTITY_INSERT [dbo].[RepairCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[RepairLocation] ON 
GO
INSERT [dbo].[RepairLocation] ([RepairLocationId], [RepairLocation]) VALUES (1, N'test')
GO
INSERT [dbo].[RepairLocation] ([RepairLocationId], [RepairLocation]) VALUES (2, N'e')
GO
INSERT [dbo].[RepairLocation] ([RepairLocationId], [RepairLocation]) VALUES (3, N'asdasdad')
GO
SET IDENTITY_INSERT [dbo].[RepairLocation] OFF
GO
SET IDENTITY_INSERT [dbo].[RequestMaster] ON 
GO
INSERT [dbo].[RequestMaster] ([RequestId], [RequestCategoryId], [BusinessTypeId], [RequestSourceId], [RequestorProjectGroup], [Requestor], [BasePartNumber], [PartDescription], [SolutionPartNumber], [NeedByDate], [BUNameId], [RepairLocationId], [TargetCustomer], [CustomerLocationId], [AnnualRepairForecast1], [AnnualRepairForecast2], [STDCostBasePart], [AnnualRepairForecast], [ExtendedSpendPotential], [T1CustomerQty], [T2CustomerQty], [MG3], [Comments], [ScreeningStatus], [BusinessCaseStatus], [PilotReviewStatus], [PrdImplementation], [PrdDate], [ExectiveName], [GRFOComment], [CCNumber]) VALUES (7, 1, 1, 3, N'string', N'string', N'string', N'string', N'string', CAST(N'1993-11-03T00:00:00.000' AS DateTime), 1, 1, N'string', 3, CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), 0, N'string', NULL, NULL, NULL, 0, CAST(N'1993-11-03T00:00:00.000' AS DateTime), NULL, NULL, N'ASDADAD')
GO
INSERT [dbo].[RequestMaster] ([RequestId], [RequestCategoryId], [BusinessTypeId], [RequestSourceId], [RequestorProjectGroup], [Requestor], [BasePartNumber], [PartDescription], [SolutionPartNumber], [NeedByDate], [BUNameId], [RepairLocationId], [TargetCustomer], [CustomerLocationId], [AnnualRepairForecast1], [AnnualRepairForecast2], [STDCostBasePart], [AnnualRepairForecast], [ExtendedSpendPotential], [T1CustomerQty], [T2CustomerQty], [MG3], [Comments], [ScreeningStatus], [BusinessCaseStatus], [PilotReviewStatus], [PrdImplementation], [PrdDate], [ExectiveName], [GRFOComment], [CCNumber]) VALUES (8, 2, 1, 3, N'string', N'string', N'string', N'string', N'string', CAST(N'1993-11-03T00:00:00.000' AS DateTime), 1, 1, N'string', 1, CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), 0, N'string', NULL, NULL, NULL, 0, CAST(N'1993-11-03T00:00:00.000' AS DateTime), NULL, NULL, N'AS')
GO
INSERT [dbo].[RequestMaster] ([RequestId], [RequestCategoryId], [BusinessTypeId], [RequestSourceId], [RequestorProjectGroup], [Requestor], [BasePartNumber], [PartDescription], [SolutionPartNumber], [NeedByDate], [BUNameId], [RepairLocationId], [TargetCustomer], [CustomerLocationId], [AnnualRepairForecast1], [AnnualRepairForecast2], [STDCostBasePart], [AnnualRepairForecast], [ExtendedSpendPotential], [T1CustomerQty], [T2CustomerQty], [MG3], [Comments], [ScreeningStatus], [BusinessCaseStatus], [PilotReviewStatus], [PrdImplementation], [PrdDate], [ExectiveName], [GRFOComment], [CCNumber]) VALUES (9, 1, 1, 3, N'string', N'string', N'string', N'string', N'string', CAST(N'1993-11-03T00:00:00.000' AS DateTime), 1, 1, N'string', 1, CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), 0, N'string', NULL, NULL, NULL, 0, CAST(N'1993-11-03T00:00:00.000' AS DateTime), N'string', N'string', N'123')
GO
INSERT [dbo].[RequestMaster] ([RequestId], [RequestCategoryId], [BusinessTypeId], [RequestSourceId], [RequestorProjectGroup], [Requestor], [BasePartNumber], [PartDescription], [SolutionPartNumber], [NeedByDate], [BUNameId], [RepairLocationId], [TargetCustomer], [CustomerLocationId], [AnnualRepairForecast1], [AnnualRepairForecast2], [STDCostBasePart], [AnnualRepairForecast], [ExtendedSpendPotential], [T1CustomerQty], [T2CustomerQty], [MG3], [Comments], [ScreeningStatus], [BusinessCaseStatus], [PilotReviewStatus], [PrdImplementation], [PrdDate], [ExectiveName], [GRFOComment], [CCNumber]) VALUES (11, 1, 2, 2, N'string', N'string', N'0100-4571', N'sddsf', N'string', CAST(N'1993-03-11T00:00:00.000' AS DateTime), 1, 1, N'string', 2, CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(13 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(17 AS Numeric(18, 0)), CAST(19 AS Numeric(18, 0)), CAST(21 AS Numeric(18, 0)), 1, N'string', N'Accepted', N'Accepted', N'Accepted', 0, CAST(N'1993-03-11T00:00:00.000' AS DateTime), N'123', NULL, NULL)
GO
INSERT [dbo].[RequestMaster] ([RequestId], [RequestCategoryId], [BusinessTypeId], [RequestSourceId], [RequestorProjectGroup], [Requestor], [BasePartNumber], [PartDescription], [SolutionPartNumber], [NeedByDate], [BUNameId], [RepairLocationId], [TargetCustomer], [CustomerLocationId], [AnnualRepairForecast1], [AnnualRepairForecast2], [STDCostBasePart], [AnnualRepairForecast], [ExtendedSpendPotential], [T1CustomerQty], [T2CustomerQty], [MG3], [Comments], [ScreeningStatus], [BusinessCaseStatus], [PilotReviewStatus], [PrdImplementation], [PrdDate], [ExectiveName], [GRFOComment], [CCNumber]) VALUES (12, 1, 1, 2, N'asdasd', N'adsasd', N'asdasd', N'sdsdf', N'asdasd', CAST(N'2023-11-29T00:00:00.000' AS DateTime), 1, 1, N'`sfsdf', 1, CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), 0, N'asdasd', NULL, NULL, NULL, 0, CAST(N'2023-12-28T00:00:00.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[RequestMaster] ([RequestId], [RequestCategoryId], [BusinessTypeId], [RequestSourceId], [RequestorProjectGroup], [Requestor], [BasePartNumber], [PartDescription], [SolutionPartNumber], [NeedByDate], [BUNameId], [RepairLocationId], [TargetCustomer], [CustomerLocationId], [AnnualRepairForecast1], [AnnualRepairForecast2], [STDCostBasePart], [AnnualRepairForecast], [ExtendedSpendPotential], [T1CustomerQty], [T2CustomerQty], [MG3], [Comments], [ScreeningStatus], [BusinessCaseStatus], [PilotReviewStatus], [PrdImplementation], [PrdDate], [ExectiveName], [GRFOComment], [CCNumber]) VALUES (13, 1, 1, 2, N'asdsadadd', N'asd', N'1000', N'sdsdf', N'asd', CAST(N'2023-12-05T00:00:00.000' AS DateTime), 1, 2, N'asd', 2, CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), 0, N'asdasd', NULL, NULL, NULL, 0, CAST(N'2023-12-27T00:00:00.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[RequestMaster] ([RequestId], [RequestCategoryId], [BusinessTypeId], [RequestSourceId], [RequestorProjectGroup], [Requestor], [BasePartNumber], [PartDescription], [SolutionPartNumber], [NeedByDate], [BUNameId], [RepairLocationId], [TargetCustomer], [CustomerLocationId], [AnnualRepairForecast1], [AnnualRepairForecast2], [STDCostBasePart], [AnnualRepairForecast], [ExtendedSpendPotential], [T1CustomerQty], [T2CustomerQty], [MG3], [Comments], [ScreeningStatus], [BusinessCaseStatus], [PilotReviewStatus], [PrdImplementation], [PrdDate], [ExectiveName], [GRFOComment], [CCNumber]) VALUES (14, 1, 1, 2, N'GRFO', N'GJ', N'0080-4569', N'sddsf', N'12', CAST(N'2023-12-19T00:00:00.000' AS DateTime), 1, 1, N'Leo', 1, CAST(10 AS Numeric(18, 0)), CAST(12 AS Numeric(18, 0)), CAST(11 AS Numeric(18, 0)), CAST(13 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(17 AS Numeric(18, 0)), CAST(19 AS Numeric(18, 0)), 1, N'leo test', NULL, NULL, NULL, 0, CAST(N'2023-12-19T00:00:00.000' AS DateTime), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[RequestMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[RequestorSource] ON 
GO
INSERT [dbo].[RequestorSource] ([RequestorSourceId], [RequestorSource]) VALUES (1, N'Email')
GO
INSERT [dbo].[RequestorSource] ([RequestorSourceId], [RequestorSource]) VALUES (2, N'Executive Request')
GO
INSERT [dbo].[RequestorSource] ([RequestorSourceId], [RequestorSource]) VALUES (3, N'SBU Crosscut (CC#)')
GO
INSERT [dbo].[RequestorSource] ([RequestorSourceId], [RequestorSource]) VALUES (4, N'GRFO Internal')
GO
INSERT [dbo].[RequestorSource] ([RequestorSourceId], [RequestorSource]) VALUES (5, N'All')
GO
SET IDENTITY_INSERT [dbo].[RequestorSource] OFF
GO
/****** Object:  StoredProcedure [dbo].[hadoop_Data_SelectAll]    Script Date: 08/01/2024 4:03:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[hadoop_Data_SelectAll]
	-- Add the parameters for the stored procedure here
	@basePartNumber nvarchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select
		basePartId	
		,basePartNumber	
		,partDescription	
		,stdCostBasePart	
		,annualRepairForecast	
		,extendedSpendPotential	
		,t1CustomerQty	
		,t2CustomerQty	
		,mg3
	from [dbo].[hadoopData]
	where basePartNumber=@basePartNumber
END
GO
/****** Object:  StoredProcedure [dbo].[master_Data_Save]    Script Date: 08/01/2024 4:03:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[master_Data_Save]
	-- Add the parameters for the stored procedure here
	@Id int,	
	@Value nvarchar(200),
	@columnName nvarchar(200),
	@columnValue nvarchar(200),
	@caption nvarchar(200),
	@tableName nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @Output INT
	SET @Output = 0
			
	
	DECLARE @existsSQL NVARCHAR(max)
	SET @existsSQL = N'select @Output = count('+ @columnName + ') from '+ @tableName +' where '+ @columnName + '=' + CONVERT(NVARCHAR(100),@Id)
	EXECUTE sp_executesql @existsSQL, N'@Output INT OUT', @Output = @Output OUT;


	DECLARE @insertExistsSQL NVARCHAR(max)	
	SET @insertExistsSQL = N'select @Output = count('+ @columnName + ') from '+ @tableName +' where ' + @columnValue + '=''' + @Value + ''''
	
	DECLARE @updateExistsSQL NVARCHAR(max)		
	SET @updateExistsSQL = N'select @Output = count('+ @columnName + ') from '+ @tableName +' where '+ @columnName + '<>' + CONVERT(NVARCHAR(100),@Id) + ' and ' + @columnValue + '=''' + @Value +''''	

	DECLARE @insertupdateSQL NVARCHAR(max)			

	IF(@Output<>1)
		BEGIN		
			EXECUTE sp_executesql @insertExistsSQL, N'@Output INT OUT', @Output = @Output OUT;			
			IF(@Output<>1)
				BEGIN
					SET @insertupdateSQL = N'insert into '+ @tableName +' (' + @columnValue + ') values (N''' + CONVERT(NVARCHAR(100),@Value) +''')'
					EXECUTE sp_executesql @insertupdateSQL
					SELECT 'Successfully Saved'
				END
			ELSE
				BEGIN
					SELECT @caption + ' already exist(s)'
				END	
		END
	ELSE
		BEGIN			
			EXECUTE sp_executesql @updateExistsSQL, N'@Output INT OUT', @Output = @Output OUT;			
			IF(@Output<>1)
				BEGIN
					SET @insertupdateSQL = N'update '+ @tableName +' set ' + @columnValue + '=N''' + CONVERT(NVARCHAR(100),@Value) +''' where '+ @columnName + '=' + CONVERT(NVARCHAR(100),@Id)
					EXECUTE sp_executesql @insertupdateSQL
					SELECT 'Successfully Updated'
				END
			ELSE
				BEGIN
					SELECT @caption + ' already exist(s)'
				END		
		END		
END
GO
/****** Object:  StoredProcedure [dbo].[Request_Report]    Script Date: 08/01/2024 4:03:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Request_Report]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [RequestId]
				[RequestId]
				,[RepairCategory]
				,[BusinessType]
				,[RequestorSource]
				,[RequestorProjectGroup]
				,[Requestor]
				,[BasePartNumber]
				,[PartDescription]
				,[SolutionPartNumber]
				,CONVERT(NVARCHAR(10),[NeedByDate],103) [NeedByDate]
				,[BUNameId]
				,[RepairLocation]
				,[TargetCustomer]
				,[CustomerLocations]
				,[AnnualRepairForecast1]
				,[AnnualRepairForecast2]
				,[STDCostBasePart]
				,[AnnualRepairForecast]
				,[ExtendedSpendPotential]
				,[T1CustomerQty]
				,[T2CustomerQty]
				,[MG3]
				,[Comments]
				,[ScreeningStatus]
				,[BusinessCaseStatus]
				,[PilotReviewStatus]
				,case when [PrdImplementation]=1 then 'true' else 'false' end as [PrdImplementation]
				,CONVERT(NVARCHAR(10),[PrdDate],103) [PrdDate]
				,[ExectiveName]
				,[GRFOComment]
				,CCNumber				
			FROM [dbo].[RequestMaster] RM
			LEFT JOIN [dbo].[RequestorSource] RS ON RM.[RequestSourceId]=RS.[RequestorSourceId]
			LEFT JOIN [dbo].[RepairCategory] RC ON RC.[RepairCategoryId]=RM.[RequestCategoryId]
			LEFT JOIN [dbo].[BusinessType] BT ON BT.[BusinessTypeId]=RM.[BusinessTypeId]
			LEFT JOIN [dbo].[RepairLocation] RL ON RL.[RepairLocationId]=RM.[RepairLocationId]							
			LEFT JOIN [dbo].[CustomerLocations] CL ON CL.[CustomerLocationId]=RM.[CustomerLocationId]				
END
GO
/****** Object:  StoredProcedure [dbo].[Request_Save]    Script Date: 08/01/2024 4:03:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Request_Save]
	-- Add the parameters for the stored procedure here
	@RequestId int,
	@RequestCategoryId int,
	@BusinessTypeId int,
	@RequestSourceId int,
	@RequestorProjectGroup nvarchar(200),
	@Requestor nvarchar(200),
	@BasePartNumber nvarchar(20),
	@PartDescription nvarchar(200),
	@SolutionPartNumber nvarchar(20),
	@NeedByDate nvarchar(10),
	@BUNameId int,
	@RepairLocationId int,
	@TargetCustomer nvarchar(200),
	@CustomerLocationId int,
	@AnnualRepairForecast1 numeric(18, 0),
	@AnnualRepairForecast2 numeric(18, 0),
	@STDCostBasePart numeric(18, 0),
	@AnnualRepairForecast numeric(18, 0),
	@ExtendedSpendPotential numeric(18, 0),
	@T1CustomerQty numeric(18, 0),
	@T2CustomerQty numeric(18, 0),
	@MG3 int,
	@Comments nvarchar(1000),
	@ScreeningStatus nvarchar(10),
	@BusinessCaseStatus nvarchar(10),
	@PilotReviewStatus nvarchar(10),
	@PrdImplementation int,
	@PrdDate nvarchar(10),
	@ExectiveName nvarchar(100),
	@GRFOComment nvarchar(1000),
	@CCNumber nvarchar(10)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF NOT EXISTS (SELECT [RequestId] FROM [dbo].[RequestMaster] WHERE [RequestId]=@RequestId)
		BEGIN
			--IF NOT EXISTS (SELECT [RequestId] FROM [dbo].[RequestMaster] WHERE RequestCategoryId=@RequestCategoryId)
			--	BEGIN
					INSERT INTO [dbo].[RequestMaster]  
						(RequestCategoryId
						,BusinessTypeId
						,RequestSourceId
						,RequestorProjectGroup
						,Requestor
						,BasePartNumber
						,PartDescription
						,SolutionPartNumber
						,NeedByDate
						,BUNameId
						,RepairLocationId
						,TargetCustomer
						,CustomerLocationId
						,AnnualRepairForecast1
						,AnnualRepairForecast2
						,STDCostBasePart
						,AnnualRepairForecast
						,ExtendedSpendPotential
						,T1CustomerQty
						,T2CustomerQty
						,MG3
						,Comments
						,ScreeningStatus
						,BusinessCaseStatus
						,PilotReviewStatus
						,PrdImplementation
						,PrdDate
						,ExectiveName
						,GRFOComment
						,CCNumber)
					VALUES
					(@RequestCategoryId
					,@BusinessTypeId
					,@RequestSourceId
					,@RequestorProjectGroup
					,@Requestor
					,@BasePartNumber
					,@PartDescription
					,@SolutionPartNumber
					,CONVERT(datetime,@NeedByDate,103)
					,@BUNameId
					,@RepairLocationId
					,@TargetCustomer
					,@CustomerLocationId
					,@AnnualRepairForecast1
					,@AnnualRepairForecast2
					,@STDCostBasePart
					,@AnnualRepairForecast
					,@ExtendedSpendPotential
					,@T1CustomerQty
					,@T2CustomerQty
					,@MG3
					,@Comments
					,@ScreeningStatus
					,@BusinessCaseStatus
					,@PilotReviewStatus
					,@PrdImplementation
					,CONVERT(datetime,@PrdDate,103)
					,@ExectiveName
					,@GRFOComment
					,@CCNumber)
					SELECT 'Successully Saved'
			--	END
			--ELSE
			--	BEGIN
			--		SELECT 'Request CategoryId already exists'
			--	END
		END
	ELSE
		BEGIN
			--IF NOT EXISTS (SELECT [RequestId] FROM [dbo].[RequestMaster] WHERE [RequestCategoryId]=@RequestCategoryId AND [RequestId]<>@RequestId)
			--	BEGIN
					update [dbo].[RequestMaster]  
						set 
						RequestCategoryId=@RequestCategoryId
						,BusinessTypeId=@BusinessTypeId
						,RequestSourceId=@RequestSourceId
						,RequestorProjectGroup=@RequestorProjectGroup
						,Requestor=@Requestor
						,BasePartNumber=@BasePartNumber
						,PartDescription=@PartDescription
						,SolutionPartNumber=@SolutionPartNumber
						,NeedByDate=CONVERT(datetime,@NeedByDate,103)
						,BUNameId=@BUNameId
						,RepairLocationId=@RepairLocationId
						,TargetCustomer=@TargetCustomer
						,CustomerLocationId=@CustomerLocationId
						,AnnualRepairForecast1=@AnnualRepairForecast1
						,AnnualRepairForecast2=@AnnualRepairForecast2
						,STDCostBasePart=@STDCostBasePart
						,AnnualRepairForecast=@AnnualRepairForecast
						,ExtendedSpendPotential=@ExtendedSpendPotential
						,T1CustomerQty=@T1CustomerQty
						,T2CustomerQty=@T2CustomerQty
						,MG3=@MG3
						,Comments=@Comments
						--,ScreeningStatus=@ScreeningStatus
						--,BusinessCaseStatus=@BusinessCaseStatus
						--,PilotReviewStatus=@PilotReviewStatus
						,PrdImplementation=@PrdImplementation
						,PrdDate=CONVERT(datetime,@PrdDate,103)
						,ExectiveName=@ExectiveName
						,GRFOComment=@GRFOComment
						,CCNumber=@CCNumber
						where [RequestId]=@RequestId
					SELECT 'Successully Updated'
			--	END
			--ELSE
			--	BEGIN
			--		SELECT 'Request CategoryId already exists'
			--	END		
		END
END
GO
/****** Object:  StoredProcedure [dbo].[Request_SelectAll]    Script Date: 08/01/2024 4:03:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Request_SelectAll]
	-- Add the parameters for the stored procedure here
	@requestId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF(@requestId=0)
		begin
			SELECT [RequestId]
				,[RequestorSource]
				,[RepairCategory]
				,[BusinessType]				
				,[BasePartNumber]
				,[PartDescription]
				,[ScreeningStatus]
				,[BusinessCaseStatus]
				,[PilotReviewStatus]
				,case when [PrdImplementation]=1 then 'true' else 'false' end as [PrdImplementation]
				,[T1CustomerQty]
				,CONVERT(NVARCHAR(10),[NeedByDate],103) NeedByDate
			FROM [dbo].[RequestMaster] RM
			LEFT JOIN [dbo].[RequestorSource] RS ON RM.[RequestSourceId]=RS.[RequestorSourceId]
			LEFT JOIN [dbo].[RepairCategory] RC ON RC.[RepairCategoryId]=RM.[RequestCategoryId]
			LEFT JOIN [dbo].[BusinessType] BT ON BT.[BusinessTypeId]=RM.[BusinessTypeId]		
		end
	IF(@requestId>0)
		BEGIN
			SELECT [RequestId]
				,[RequestCategoryId]
				,[BusinessTypeId]
				,[RequestSourceId]
				,[RequestorProjectGroup]
				,[Requestor]
				,[BasePartNumber]
				,[PartDescription]
				,[SolutionPartNumber]
				,CONVERT(NVARCHAR(10),[NeedByDate],103) [NeedByDate]
				,[BUNameId]
				,[RepairLocationId]
				,[TargetCustomer]
				,[CustomerLocationId]
				,[AnnualRepairForecast1]
				,[AnnualRepairForecast2]
				,[STDCostBasePart]
				,[AnnualRepairForecast]
				,[ExtendedSpendPotential]
				,[T1CustomerQty]
				,[T2CustomerQty]
				,[MG3]
				,[Comments]
				,[ScreeningStatus]
				,[BusinessCaseStatus]
				,[PilotReviewStatus]
				,[PrdImplementation]
				,CONVERT(NVARCHAR(10),[PrdDate],103) [PrdDate]
				,[ExectiveName]
				,[GRFOComment]
				,CCNumber
			FROM [dbo].[RequestMaster]
			where requestId=@requestId
		END
END
GO
/****** Object:  StoredProcedure [dbo].[Request_Status_Update]    Script Date: 08/01/2024 4:03:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Request_Status_Update]
	-- Add the parameters for the stored procedure here
	@RequestId int,	
	@ScreeningStatus nvarchar(10),
	@BusinessCaseStatus nvarchar(10),
	@PilotReviewStatus nvarchar(10),
	@PrdImplementation int,
	@PrdDate nvarchar(10)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update [dbo].[RequestMaster]  
		set 		
		ScreeningStatus=@ScreeningStatus
		,BusinessCaseStatus=@BusinessCaseStatus
		,PilotReviewStatus=@PilotReviewStatus
		,PrdImplementation=@PrdImplementation
		,PrdDate=CONVERT(datetime,@PrdDate,103)		
		where [RequestId]=@RequestId
	SELECT 'Successully Updated'
END
GO
USE [master]
GO
ALTER DATABASE [RMS] SET  READ_WRITE 
GO
