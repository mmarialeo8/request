
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
