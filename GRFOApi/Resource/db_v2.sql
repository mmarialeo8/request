USE [RMS]
GO
/****** Object:  StoredProcedure [dbo].[Request_Save]    Script Date: 19/02/2024 7:35:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	@CCNumber nvarchar(10),	
	@partRequestId int
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
						,CCNumber
						,partRequestId)
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
					,@CCNumber
					,@partRequestId)
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
