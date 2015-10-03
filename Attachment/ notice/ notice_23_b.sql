/****** Object:  Table [dbo].[CategoryMaster]    Script Date: 09/28/2015 00:42:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CategoryMaster]') AND type in (N'U'))
DROP TABLE [dbo].[CategoryMaster]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 09/28/2015 00:42:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
DROP TABLE [dbo].[Employee]
GO
/****** Object:  Table [dbo].[GridView]    Script Date: 09/28/2015 00:42:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GridView]') AND type in (N'U'))
DROP TABLE [dbo].[GridView]
GO
/****** Object:  Table [dbo].[MemberMaster]    Script Date: 09/28/2015 00:42:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MemberMaster]') AND type in (N'U'))
DROP TABLE [dbo].[MemberMaster]
GO
/****** Object:  Table [dbo].[MemberType]    Script Date: 09/28/2015 00:42:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MemberType]') AND type in (N'U'))
DROP TABLE [dbo].[MemberType]
GO
/****** Object:  Table [dbo].[student_detail]    Script Date: 09/28/2015 00:42:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[student_detail]') AND type in (N'U'))
DROP TABLE [dbo].[student_detail]
GO
/****** Object:  Table [dbo].[Table1]    Script Date: 09/28/2015 00:42:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Table1]') AND type in (N'U'))
DROP TABLE [dbo].[Table1]
GO
/****** Object:  Table [dbo].[Table2]    Script Date: 09/28/2015 00:42:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Table2]') AND type in (N'U'))
DROP TABLE [dbo].[Table2]
GO
/****** Object:  Table [dbo].[Table3]    Script Date: 09/28/2015 00:42:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Table3]') AND type in (N'U'))
DROP TABLE [dbo].[Table3]
GO
/****** Object:  Table [dbo].[TypeMaster]    Script Date: 09/28/2015 00:42:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TypeMaster]') AND type in (N'U'))
DROP TABLE [dbo].[TypeMaster]
GO
/****** Object:  Default [DF_CategoryMaster_IsDeleted]    Script Date: 09/28/2015 00:42:53 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_CategoryMaster_IsDeleted]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryMaster]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CategoryMaster_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CategoryMaster] DROP CONSTRAINT [DF_CategoryMaster_IsDeleted]
END


End
GO
/****** Object:  Default [DF_CategoryMaster_UpdatedOn]    Script Date: 09/28/2015 00:42:53 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_CategoryMaster_UpdatedOn]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryMaster]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CategoryMaster_UpdatedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CategoryMaster] DROP CONSTRAINT [DF_CategoryMaster_UpdatedOn]
END


End
GO
/****** Object:  Default [DF_TypeMaster_IsDeleted]    Script Date: 09/28/2015 00:42:54 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TypeMaster_IsDeleted]') AND parent_object_id = OBJECT_ID(N'[dbo].[TypeMaster]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TypeMaster_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TypeMaster] DROP CONSTRAINT [DF_TypeMaster_IsDeleted]
END


End
GO
/****** Object:  Default [DF_TypeMaster_UpdatedOn]    Script Date: 09/28/2015 00:42:54 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TypeMaster_UpdatedOn]') AND parent_object_id = OBJECT_ID(N'[dbo].[TypeMaster]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TypeMaster_UpdatedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TypeMaster] DROP CONSTRAINT [DF_TypeMaster_UpdatedOn]
END


End
GO
/****** Object:  Table [dbo].[TypeMaster]    Script Date: 09/28/2015 00:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TypeMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TypeMaster](
	[TypeID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[TypeDesc] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsDeleted] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedBy] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [UQ__TypeMast__516F039421B6055D] UNIQUE NONCLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[TypeMaster] ON
INSERT [dbo].[TypeMaster] ([TypeID], [TypeDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(13 AS Numeric(18, 0)), N' senate member', N'0', NULL, CAST(0x0000A51A011D6D23 AS DateTime))
INSERT [dbo].[TypeMaster] ([TypeID], [TypeDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(14 AS Numeric(18, 0)), N' syndicate members', N'0', NULL, CAST(0x0000A51A011D7689 AS DateTime))
SET IDENTITY_INSERT [dbo].[TypeMaster] OFF
/****** Object:  Table [dbo].[Table3]    Script Date: 09/28/2015 00:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Table3]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Table3](
	[id] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[name] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Table3] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Table2]    Script Date: 09/28/2015 00:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Table2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Table2](
	[id] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
END
GO
/****** Object:  Table [dbo].[Table1]    Script Date: 09/28/2015 00:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Table1]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Table1](
	[id] [int] NULL,
	[name] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
END
GO
/****** Object:  Table [dbo].[student_detail]    Script Date: 09/28/2015 00:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[student_detail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[student_detail](
	[roll_no] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[s_name] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[age] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[city] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[course] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_student_detail] PRIMARY KEY CLUSTERED 
(
	[roll_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[student_detail] ([roll_no], [s_name], [age], [city], [course]) VALUES (N'1         ', N'soni      ', N'gjhg      ', N'hg        ', N'gh        ')
INSERT [dbo].[student_detail] ([roll_no], [s_name], [age], [city], [course]) VALUES (N'10        ', N'riddhi    ', N'hghg      ', N'ghg       ', N'hghg      ')
INSERT [dbo].[student_detail] ([roll_no], [s_name], [age], [city], [course]) VALUES (N'11        ', N'gg        ', N'ghgh      ', N'ghgh      ', N'ghgh      ')
INSERT [dbo].[student_detail] ([roll_no], [s_name], [age], [city], [course]) VALUES (N'12        ', N'hg        ', N'ghgh      ', N'hg        ', N'ghg       ')
INSERT [dbo].[student_detail] ([roll_no], [s_name], [age], [city], [course]) VALUES (N'13        ', N'jhj       ', N'hjhj      ', N'hjhj      ', N'hjhj      ')
INSERT [dbo].[student_detail] ([roll_no], [s_name], [age], [city], [course]) VALUES (N'14        ', N'hjh       ', N'hjhj      ', N'hjhjh     ', N'hjh       ')
INSERT [dbo].[student_detail] ([roll_no], [s_name], [age], [city], [course]) VALUES (N'15        ', N'jhjh      ', N'hjh       ', N'hjh       ', N'hjh       ')
INSERT [dbo].[student_detail] ([roll_no], [s_name], [age], [city], [course]) VALUES (N'2         ', N'jh        ', N'jhjh      ', N'hjhj      ', N'jhj       ')
INSERT [dbo].[student_detail] ([roll_no], [s_name], [age], [city], [course]) VALUES (N'3         ', N'bjhg      ', N'ghgjh     ', N'ghg       ', N'hgjh      ')
INSERT [dbo].[student_detail] ([roll_no], [s_name], [age], [city], [course]) VALUES (N'4         ', N'kjk       ', N'jkjk      ', N'jkjkj     ', N'jkjk      ')
INSERT [dbo].[student_detail] ([roll_no], [s_name], [age], [city], [course]) VALUES (N'5         ', N'kjhj      ', N'jhjh      ', N'jhjh      ', N'jhjh      ')
INSERT [dbo].[student_detail] ([roll_no], [s_name], [age], [city], [course]) VALUES (N'6         ', N'jjh       ', N'jhjh      ', N'jhjh      ', N'j         ')
INSERT [dbo].[student_detail] ([roll_no], [s_name], [age], [city], [course]) VALUES (N'7         ', N'jhgj      ', N'ghgh      ', N'ghg       ', N'ghg       ')
INSERT [dbo].[student_detail] ([roll_no], [s_name], [age], [city], [course]) VALUES (N'8         ', N'jhj       ', N'hjhj      ', N'hjhj      ', N'hjh       ')
INSERT [dbo].[student_detail] ([roll_no], [s_name], [age], [city], [course]) VALUES (N'9         ', N'hghg      ', N'hgg       ', N'hgh       ', N'hghg      ')
/****** Object:  Table [dbo].[MemberType]    Script Date: 09/28/2015 00:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MemberType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MemberType](
	[MemberID] [numeric](18, 0) NULL,
	[TypeID] [numeric](18, 0) NULL,
	[CategoryID] [numeric](18, 0) NULL,
	[Isdeleted] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedBy] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedOn] [datetime] NULL
)
END
GO
ALTER TABLE [dbo].[MemberType] SET (LOCK_ESCALATION = AUTO)
GO
INSERT [dbo].[MemberType] ([MemberID], [TypeID], [CategoryID], [Isdeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(12 AS Numeric(18, 0)), CAST(14 AS Numeric(18, 0)), CAST(37 AS Numeric(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[MemberType] ([MemberID], [TypeID], [CategoryID], [Isdeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(96 AS Numeric(18, 0)), CAST(14 AS Numeric(18, 0)), CAST(37 AS Numeric(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[MemberType] ([MemberID], [TypeID], [CategoryID], [Isdeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(96 AS Numeric(18, 0)), CAST(13 AS Numeric(18, 0)), CAST(40 AS Numeric(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[MemberType] ([MemberID], [TypeID], [CategoryID], [Isdeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(96 AS Numeric(18, 0)), CAST(14 AS Numeric(18, 0)), CAST(39 AS Numeric(18, 0)), NULL, NULL, NULL)
/****** Object:  Table [dbo].[MemberMaster]    Script Date: 09/28/2015 00:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MemberMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MemberMaster](
	[MemberID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Code] [numeric](18, 0) NULL,
	[MemberName] [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MemberDesc] [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address1] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address2] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PinCode] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contact1] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contact2] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contact3] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmailID] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LoginID] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LoginPass] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsDeleted] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedBy] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_MemberMaster] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[MemberMaster] ON
INSERT [dbo].[MemberMaster] ([MemberID], [Code], [MemberName], [MemberDesc], [Address1], [Address2], [PinCode], [Contact1], [Contact2], [Contact3], [EmailID], [LoginID], [LoginPass], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(74 AS Numeric(18, 0)), CAST(12 AS Numeric(18, 0)), N'ridhi', N'', N'vadodara', N'', N'390006', N'9408344793', N'', N'', N'riddhisoni1324@gmail.com', N'12', N'', NULL, NULL, NULL)
INSERT [dbo].[MemberMaster] ([MemberID], [Code], [MemberName], [MemberDesc], [Address1], [Address2], [PinCode], [Contact1], [Contact2], [Contact3], [EmailID], [LoginID], [LoginPass], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(75 AS Numeric(18, 0)), CAST(96 AS Numeric(18, 0)), N'ty', N'ui', N'', N'', N'', N'', N'', N'', N'er@sdf.c', N'96', N'', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[MemberMaster] OFF
/****** Object:  Table [dbo].[GridView]    Script Date: 09/28/2015 00:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GridView]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GridView](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[age] [int] NOT NULL,
	[salary] [float] NOT NULL,
	[country] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[city] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[photopath] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK__GridView__3213E83F145C0A3F] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 09/28/2015 00:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Email] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Age] [int] NULL,
	[Salary] [float] NULL,
 CONSTRAINT [PK__Employee__3214EC070CBAE877] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[Employee] ON
INSERT [dbo].[Employee] ([Id], [Name], [Email], [Age], [Salary]) VALUES (1, N'ridi', N'ri@dsf.com', 12, 1000)
SET IDENTITY_INSERT [dbo].[Employee] OFF
/****** Object:  Table [dbo].[CategoryMaster]    Script Date: 09/28/2015 00:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CategoryMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CategoryMaster](
	[CategoryID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[TypeID] [numeric](18, 0) NULL,
	[CategoryDesc] [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsDeleted] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedBy] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [UQ__Category__19093A2A24927208] UNIQUE NONCLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[CategoryMaster] ON
INSERT [dbo].[CategoryMaster] ([CategoryID], [TypeID], [CategoryDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(36 AS Numeric(18, 0)), CAST(13 AS Numeric(18, 0)), N' dean - senate member', N'0', NULL, CAST(0x0000A51A013E9663 AS DateTime))
INSERT [dbo].[CategoryMaster] ([CategoryID], [TypeID], [CategoryDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(37 AS Numeric(18, 0)), CAST(14 AS Numeric(18, 0)), N' hod - syndicate members', N'0', NULL, CAST(0x0000A51A013EA429 AS DateTime))
INSERT [dbo].[CategoryMaster] ([CategoryID], [TypeID], [CategoryDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(40 AS Numeric(18, 0)), CAST(13 AS Numeric(18, 0)), N' hii - senate member', N'0', NULL, CAST(0x0000A51F003C226D AS DateTime))
INSERT [dbo].[CategoryMaster] ([CategoryID], [TypeID], [CategoryDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(39 AS Numeric(18, 0)), CAST(14 AS Numeric(18, 0)), N' ty - syndicate members', N'0', NULL, CAST(0x0000A51F0028F1FF AS DateTime))
INSERT [dbo].[CategoryMaster] ([CategoryID], [TypeID], [CategoryDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(41 AS Numeric(18, 0)), CAST(13 AS Numeric(18, 0)), N' new - senate member', N'0', NULL, CAST(0x0000A5200166B5A8 AS DateTime))
SET IDENTITY_INSERT [dbo].[CategoryMaster] OFF
/****** Object:  Default [DF_CategoryMaster_IsDeleted]    Script Date: 09/28/2015 00:42:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_CategoryMaster_IsDeleted]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryMaster]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CategoryMaster_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CategoryMaster] ADD  CONSTRAINT [DF_CategoryMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END


End
GO
/****** Object:  Default [DF_CategoryMaster_UpdatedOn]    Script Date: 09/28/2015 00:42:53 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_CategoryMaster_UpdatedOn]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryMaster]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CategoryMaster_UpdatedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CategoryMaster] ADD  CONSTRAINT [DF_CategoryMaster_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
END


End
GO
/****** Object:  Default [DF_TypeMaster_IsDeleted]    Script Date: 09/28/2015 00:42:54 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TypeMaster_IsDeleted]') AND parent_object_id = OBJECT_ID(N'[dbo].[TypeMaster]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TypeMaster_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TypeMaster] ADD  CONSTRAINT [DF_TypeMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END


End
GO
/****** Object:  Default [DF_TypeMaster_UpdatedOn]    Script Date: 09/28/2015 00:42:54 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TypeMaster_UpdatedOn]') AND parent_object_id = OBJECT_ID(N'[dbo].[TypeMaster]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TypeMaster_UpdatedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TypeMaster] ADD  CONSTRAINT [DF_TypeMaster_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
END


End
GO
