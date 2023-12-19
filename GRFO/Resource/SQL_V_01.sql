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
/****** Object:  StoredProcedure [dbo].[master_Data_Save]    Script Date: 19/12/2023 11:20:40 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Request_Save]    Script Date: 19/12/2023 11:20:40 PM ******/
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
						,ScreeningStatus=@ScreeningStatus
						,BusinessCaseStatus=@BusinessCaseStatus
						,PilotReviewStatus=@PilotReviewStatus
						,PrdImplementation=@PrdImplementation
						,PrdDate=CONVERT(datetime,@PrdDate,103)
						,ExectiveName=@ExectiveName
						,GRFOComment=@GRFOComment
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
/****** Object:  StoredProcedure [dbo].[Request_SelectAll]    Script Date: 19/12/2023 11:20:40 PM ******/
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
			FROM [dbo].[RequestMaster]
			where requestId=@requestId
		END
END
GO
/****** Object:  StoredProcedure [dbo].[Request_Status_Update]    Script Date: 19/12/2023 11:20:40 PM ******/
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