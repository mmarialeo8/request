USE [GRFO]
GO
/****** Object:  Table [dbo].[BusinessType]    Script Date: 19/12/2023 12:18:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessType](
	[BusinessTypeId] [int] IDENTITY(1,1) NOT NULL,
	[RepairCategoryId] [int] NOT NULL,
	[BusinessType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BusinessType] PRIMARY KEY CLUSTERED 
(
	[BusinessTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerLocations]    Script Date: 19/12/2023 12:18:20 AM ******/
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
/****** Object:  Table [dbo].[RepairCategory]    Script Date: 19/12/2023 12:18:20 AM ******/
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
/****** Object:  Table [dbo].[RepairLocation]    Script Date: 19/12/2023 12:18:20 AM ******/
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
/****** Object:  Table [dbo].[RequestMaster]    Script Date: 19/12/2023 12:18:20 AM ******/
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
	[ExectiveName] [nvarchar](100) NOT NULL,
	[GRFOComment] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_RequestMaster] PRIMARY KEY CLUSTERED 
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestorSource]    Script Date: 19/12/2023 12:18:20 AM ******/
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
INSERT [dbo].[BusinessType] ([BusinessTypeId], [RepairCategoryId], [BusinessType]) VALUES (1, 1, N'BtoW')
GO
INSERT [dbo].[BusinessType] ([BusinessTypeId], [RepairCategoryId], [BusinessType]) VALUES (2, 1, N'TKM')
GO
SET IDENTITY_INSERT [dbo].[BusinessType] OFF
GO
SET IDENTITY_INSERT [dbo].[RepairCategory] ON 
GO
INSERT [dbo].[RepairCategory] ([RepairCategoryId], [RepairCategory]) VALUES (1, N'Repair')
GO
INSERT [dbo].[RepairCategory] ([RepairCategoryId], [RepairCategory]) VALUES (2, N'New')
GO
SET IDENTITY_INSERT [dbo].[RepairCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[RequestMaster] ON 
GO
INSERT [dbo].[RequestMaster] ([RequestId], [RequestCategoryId], [BusinessTypeId], [RequestSourceId], [RequestorProjectGroup], [Requestor], [BasePartNumber], [PartDescription], [SolutionPartNumber], [NeedByDate], [BUNameId], [RepairLocationId], [TargetCustomer], [CustomerLocationId], [AnnualRepairForecast1], [AnnualRepairForecast2], [STDCostBasePart], [AnnualRepairForecast], [ExtendedSpendPotential], [T1CustomerQty], [T2CustomerQty], [MG3], [Comments], [ScreeningStatus], [BusinessCaseStatus], [PilotReviewStatus], [PrdImplementation], [PrdDate], [ExectiveName], [GRFOComment]) VALUES (7, 1, 1, 1, N'string', N'string', N'string', N'string', N'string', CAST(N'1993-11-03T00:00:00.000' AS DateTime), 0, 0, N'string', 0, CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), 0, N'string', N'string', N'string', N'string', 1, CAST(N'1993-11-03T00:00:00.000' AS DateTime), N'string', N'string')
GO
INSERT [dbo].[RequestMaster] ([RequestId], [RequestCategoryId], [BusinessTypeId], [RequestSourceId], [RequestorProjectGroup], [Requestor], [BasePartNumber], [PartDescription], [SolutionPartNumber], [NeedByDate], [BUNameId], [RepairLocationId], [TargetCustomer], [CustomerLocationId], [AnnualRepairForecast1], [AnnualRepairForecast2], [STDCostBasePart], [AnnualRepairForecast], [ExtendedSpendPotential], [T1CustomerQty], [T2CustomerQty], [MG3], [Comments], [ScreeningStatus], [BusinessCaseStatus], [PilotReviewStatus], [PrdImplementation], [PrdDate], [ExectiveName], [GRFOComment]) VALUES (8, 1, 1, 0, N'string', N'string', N'string', N'string', N'string', CAST(N'1993-11-03T00:00:00.000' AS DateTime), 0, 0, N'string', 0, CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), 0, N'string', N'string', N'string', N'string', 1, CAST(N'1993-11-03T00:00:00.000' AS DateTime), N'string', N'string')
GO
INSERT [dbo].[RequestMaster] ([RequestId], [RequestCategoryId], [BusinessTypeId], [RequestSourceId], [RequestorProjectGroup], [Requestor], [BasePartNumber], [PartDescription], [SolutionPartNumber], [NeedByDate], [BUNameId], [RepairLocationId], [TargetCustomer], [CustomerLocationId], [AnnualRepairForecast1], [AnnualRepairForecast2], [STDCostBasePart], [AnnualRepairForecast], [ExtendedSpendPotential], [T1CustomerQty], [T2CustomerQty], [MG3], [Comments], [ScreeningStatus], [BusinessCaseStatus], [PilotReviewStatus], [PrdImplementation], [PrdDate], [ExectiveName], [GRFOComment]) VALUES (9, 1, 1, 1, N'string', N'string', N'string', N'string', N'string', CAST(N'1993-11-03T00:00:00.000' AS DateTime), 0, 0, N'string', 0, CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), 0, N'string', N'string', N'string', N'string', 1, CAST(N'1993-11-03T00:00:00.000' AS DateTime), N'string', N'string')
GO
INSERT [dbo].[RequestMaster] ([RequestId], [RequestCategoryId], [BusinessTypeId], [RequestSourceId], [RequestorProjectGroup], [Requestor], [BasePartNumber], [PartDescription], [SolutionPartNumber], [NeedByDate], [BUNameId], [RepairLocationId], [TargetCustomer], [CustomerLocationId], [AnnualRepairForecast1], [AnnualRepairForecast2], [STDCostBasePart], [AnnualRepairForecast], [ExtendedSpendPotential], [T1CustomerQty], [T2CustomerQty], [MG3], [Comments], [ScreeningStatus], [BusinessCaseStatus], [PilotReviewStatus], [PrdImplementation], [PrdDate], [ExectiveName], [GRFOComment]) VALUES (11, 1, 2, 0, N'string', N'string', N'string', N'string', N'string', CAST(N'1993-03-11T00:00:00.000' AS DateTime), 0, 0, N'string', 0, CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), 0, N'string', N'string', N'string', N'string', 1, CAST(N'1993-03-11T00:00:00.000' AS DateTime), N'string', N'string')
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
SET IDENTITY_INSERT [dbo].[RequestorSource] OFF
GO
/****** Object:  StoredProcedure [dbo].[Request_Save]    Script Date: 19/12/2023 12:18:20 AM ******/
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
	@GRFOComment nvarchar(1000)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF NOT EXISTS (SELECT [RequestId] FROM [dbo].[RequestMaster] WHERE [RequestId]=@RequestId)
		BEGIN
			IF NOT EXISTS (SELECT [RequestId] FROM [dbo].[RequestMaster] WHERE RequestCategoryId=@RequestCategoryId)
				BEGIN
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
						,GRFOComment)
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
					,@GRFOComment)
					SELECT 'Successully Saved'
				END
			ELSE
				BEGIN
					SELECT 'Request CategoryId already exists'
				END
		END
	ELSE
		BEGIN
			IF NOT EXISTS (SELECT [RequestId] FROM [dbo].[RequestMaster] WHERE [RequestCategoryId]=@RequestCategoryId AND [RequestId]<>@RequestId)
				BEGIN
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
						,ScreeningStatus=@ScreeningStatus
						,BusinessCaseStatus=@BusinessCaseStatus
						,PilotReviewStatus=@PilotReviewStatus
						,PrdImplementation=@PrdImplementation
						,PrdDate=CONVERT(datetime,@PrdDate,103)
						,ExectiveName=@ExectiveName
						,GRFOComment=@GRFOComment
						where [RequestId]=@RequestId
					SELECT 'Successully Updated'
				END
			ELSE
				BEGIN
					SELECT 'Request CategoryId already exists'
				END		
		END
END
GO
/****** Object:  StoredProcedure [dbo].[Request_SelectAll]    Script Date: 19/12/2023 12:18:20 AM ******/
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
				,[NeedByDate]
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
				,[PrdDate]
				,[ExectiveName]
				,[GRFOComment]
			FROM [dbo].[RequestMaster]
			where requestId=@requestId
		END
END
GO
