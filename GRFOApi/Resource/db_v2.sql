CREATE FUNCTION [dbo].[GRFOSplit]  
(  
 @RowData nvarchar(2000),  
 @SplitOn nvarchar(5)  
)    
RETURNS @RtnValue table   
(  
 Id int identity(1,1),  
 Data nvarchar(100)  
)   
AS    
BEGIN   
 Declare @Cnt int  
 Set @Cnt = 1  
  
 While (Charindex(@SplitOn,@RowData)>0)  
 Begin  
  Insert Into @RtnValue (data)  
  Select   
   Data = ltrim(rtrim(Substring(@RowData,1,Charindex(@SplitOn,@RowData)-1)))  
  
  Set @RowData = Substring(@RowData,Charindex(@SplitOn,@RowData)+1,len(@RowData))  
  Set @Cnt = @Cnt + 1  
 End  
   
 Insert Into @RtnValue (data)  
 Select Data = ltrim(rtrim(@RowData))  
  
 Return  
END  



go


/****** Object:  StoredProcedure [dbo].[GetCustomerByIds]    Script Date: 09/02/2024 6:27:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCustomerByIds]
	-- Add the parameters for the stored procedure here
	@customerIds nvarchar(160)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select CustomerId, CustomerName, CustomerType from
	[dbo].[T1T2] where CustomerName in 
	(select data from grfosplit(@customerIds,','))
END
GO



ALTER PROCEDURE [dbo].[Request_Save]
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
	@pbg nvarchar(1000),
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
						,pbg
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
					,@pbg
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
						,pbg=@pbg
						,Comments=@Comments						
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
go


ALTER PROCEDURE [dbo].[Request_SelectAll]
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
				,[pbg]
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