USE [SS_MESSENGER]
GO
/****** Object:  Table [dbo].[TypeMaster]    Script Date: 09/28/2015 22:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeMaster](
	[TypeID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[TypeDesc] [nvarchar](50) NULL,
	[IsDeleted] [nvarchar](1) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [UQ__TypeMast__516F039421B6055D] UNIQUE NONCLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberType]    Script Date: 09/28/2015 22:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberType](
	[MemberID] [numeric](18, 0) NULL,
	[TypeID] [numeric](18, 0) NULL,
	[CategoryID] [numeric](18, 0) NULL,
	[Isdeleted] [nvarchar](1) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdatedOn] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberType] SET (LOCK_ESCALATION = AUTO)
GO
/****** Object:  Table [dbo].[MemberMaster]    Script Date: 09/28/2015 22:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberMaster](
	[MemberID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Code] [numeric](18, 0) NULL,
	[MemberName] [nvarchar](70) NULL,
	[MemberDesc] [nvarchar](70) NULL,
	[Address1] [nvarchar](150) NULL,
	[Address2] [nvarchar](150) NULL,
	[PinCode] [nvarchar](6) NULL,
	[Contact1] [nvarchar](15) NULL,
	[Contact2] [nvarchar](15) NULL,
	[Contact3] [nvarchar](15) NULL,
	[EmailID] [nvarchar](100) NULL,
	[LoginID] [nvarchar](15) NULL,
	[LoginPass] [nvarchar](30) NULL,
	[IsDeleted] [nvarchar](1) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_MemberMaster] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocTrans]    Script Date: 09/28/2015 22:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocTrans](
	[DTID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[DocID] [numeric](18, 0) NULL,
	[DocDate] [datetime] NULL,
	[Title] [nvarchar](70) NULL,
	[DocDetail] [nvarchar](200) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_DocTrans] PRIMARY KEY CLUSTERED 
(
	[DTID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocMaster]    Script Date: 09/28/2015 22:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocMaster](
	[DocID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[DocDesc] [nvarchar](50) NULL,
	[UserID] [nvarchar](15) NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_DocMaster] PRIMARY KEY CLUSTERED 
(
	[DocID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocHistory]    Script Date: 09/28/2015 22:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocHistory](
	[DHID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[DTID] [numeric](18, 0) NULL,
	[MemberID] [numeric](18, 0) NULL,
	[MailSentDate] [datetime] NULL,
	[MailSentFlag] [nvarchar](1) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_DocHistory] PRIMARY KEY CLUSTERED 
(
	[DHID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocAttach]    Script Date: 09/28/2015 22:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocAttach](
	[DAID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[DTID] [numeric](18, 0) NULL,
	[DocFilename] [nvarchar](50) NULL,
	[DocFilepath] [nvarchar](200) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_DocAttach] PRIMARY KEY CLUSTERED 
(
	[DAID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryMaster]    Script Date: 09/28/2015 22:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryMaster](
	[CategoryID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[TypeID] [numeric](18, 0) NULL,
	[CategoryDesc] [nvarchar](70) NULL,
	[IsDeleted] [nvarchar](1) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_CategoryMaster] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ__Category__19093A2A24927208] UNIQUE NONCLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_CategoryMaster_IsDeleted]    Script Date: 09/28/2015 22:02:10 ******/
ALTER TABLE [dbo].[CategoryMaster] ADD  CONSTRAINT [DF_CategoryMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_CategoryMaster_UpdatedOn]    Script Date: 09/28/2015 22:02:10 ******/
ALTER TABLE [dbo].[CategoryMaster] ADD  CONSTRAINT [DF_CategoryMaster_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
/****** Object:  Default [DF_TypeMaster_IsDeleted]    Script Date: 09/28/2015 22:02:10 ******/
ALTER TABLE [dbo].[TypeMaster] ADD  CONSTRAINT [DF_TypeMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  Default [DF_TypeMaster_UpdatedOn]    Script Date: 09/28/2015 22:02:10 ******/
ALTER TABLE [dbo].[TypeMaster] ADD  CONSTRAINT [DF_TypeMaster_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
