/****** Object:  Table [dbo].[CategoryMaster]    Script Date: 01/04/2016 07:49:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CategoryMaster]') AND type in (N'U'))
DROP TABLE [dbo].[CategoryMaster]
GO
/****** Object:  Table [dbo].[DocAttach]    Script Date: 01/04/2016 07:49:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DocAttach]') AND type in (N'U'))
DROP TABLE [dbo].[DocAttach]
GO
/****** Object:  Table [dbo].[DocHistory]    Script Date: 01/04/2016 07:49:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DocHistory]') AND type in (N'U'))
DROP TABLE [dbo].[DocHistory]
GO
/****** Object:  Table [dbo].[DocMaster]    Script Date: 01/04/2016 07:49:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DocMaster]') AND type in (N'U'))
DROP TABLE [dbo].[DocMaster]
GO
/****** Object:  Table [dbo].[DocTrans]    Script Date: 01/04/2016 07:49:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DocTrans]') AND type in (N'U'))
DROP TABLE [dbo].[DocTrans]
GO
/****** Object:  Table [dbo].[MemberMaster]    Script Date: 01/04/2016 07:49:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MemberMaster]') AND type in (N'U'))
DROP TABLE [dbo].[MemberMaster]
GO
/****** Object:  Table [dbo].[MemberType]    Script Date: 01/04/2016 07:49:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MemberType]') AND type in (N'U'))
DROP TABLE [dbo].[MemberType]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 01/04/2016 07:49:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permission]') AND type in (N'U'))
DROP TABLE [dbo].[Permission]
GO
/****** Object:  Table [dbo].[TypeMaster]    Script Date: 01/04/2016 07:49:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TypeMaster]') AND type in (N'U'))
DROP TABLE [dbo].[TypeMaster]
GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 01/04/2016 07:49:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserMaster]') AND type in (N'U'))
DROP TABLE [dbo].[UserMaster]
GO
/****** Object:  Default [DF_CategoryMaster_IsDeleted]    Script Date: 01/04/2016 07:49:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_CategoryMaster_IsDeleted]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryMaster]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CategoryMaster_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CategoryMaster] DROP CONSTRAINT [DF_CategoryMaster_IsDeleted]
END


End
GO
/****** Object:  Default [DF_CategoryMaster_UpdatedOn]    Script Date: 01/04/2016 07:49:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_CategoryMaster_UpdatedOn]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryMaster]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CategoryMaster_UpdatedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CategoryMaster] DROP CONSTRAINT [DF_CategoryMaster_UpdatedOn]
END


End
GO
/****** Object:  Default [DF_DocTrans_DocDate]    Script Date: 01/04/2016 07:49:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_DocTrans_DocDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[DocTrans]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DocTrans_DocDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DocTrans] DROP CONSTRAINT [DF_DocTrans_DocDate]
END


End
GO
/****** Object:  Default [DF_Permission_f_add]    Script Date: 01/04/2016 07:49:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Permission_f_add]') AND parent_object_id = OBJECT_ID(N'[dbo].[Permission]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Permission_f_add]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Permission] DROP CONSTRAINT [DF_Permission_f_add]
END


End
GO
/****** Object:  Default [DF_Permission_f_edit]    Script Date: 01/04/2016 07:49:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Permission_f_edit]') AND parent_object_id = OBJECT_ID(N'[dbo].[Permission]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Permission_f_edit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Permission] DROP CONSTRAINT [DF_Permission_f_edit]
END


End
GO
/****** Object:  Default [DF_Permission_f_delete]    Script Date: 01/04/2016 07:49:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Permission_f_delete]') AND parent_object_id = OBJECT_ID(N'[dbo].[Permission]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Permission_f_delete]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Permission] DROP CONSTRAINT [DF_Permission_f_delete]
END


End
GO
/****** Object:  Default [DF_Permission_f_view]    Script Date: 01/04/2016 07:49:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Permission_f_view]') AND parent_object_id = OBJECT_ID(N'[dbo].[Permission]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Permission_f_view]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Permission] DROP CONSTRAINT [DF_Permission_f_view]
END


End
GO
/****** Object:  Default [DF_TypeMaster_IsDeleted]    Script Date: 01/04/2016 07:49:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TypeMaster_IsDeleted]') AND parent_object_id = OBJECT_ID(N'[dbo].[TypeMaster]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TypeMaster_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TypeMaster] DROP CONSTRAINT [DF_TypeMaster_IsDeleted]
END


End
GO
/****** Object:  Default [DF_TypeMaster_UpdatedOn]    Script Date: 01/04/2016 07:49:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TypeMaster_UpdatedOn]') AND parent_object_id = OBJECT_ID(N'[dbo].[TypeMaster]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TypeMaster_UpdatedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TypeMaster] DROP CONSTRAINT [DF_TypeMaster_UpdatedOn]
END


End
GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 01/04/2016 07:49:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserMaster](
	[UserId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[UserDesc] [nchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedBy] [nchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_UserMaster] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[UserMaster] ON
INSERT [dbo].[UserMaster] ([UserId], [UserDesc], [UpdatedBy], [UpdatedOn]) VALUES (CAST(1 AS Numeric(18, 0)), N' Admin                                            ', NULL, NULL)
INSERT [dbo].[UserMaster] ([UserId], [UserDesc], [UpdatedBy], [UpdatedOn]) VALUES (CAST(2 AS Numeric(18, 0)), N' Super User                                       ', NULL, NULL)
INSERT [dbo].[UserMaster] ([UserId], [UserDesc], [UpdatedBy], [UpdatedOn]) VALUES (CAST(3 AS Numeric(18, 0)), N' User                                             ', NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserMaster] OFF
/****** Object:  Table [dbo].[TypeMaster]    Script Date: 01/04/2016 07:49:42 ******/
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
INSERT [dbo].[TypeMaster] ([TypeID], [TypeDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(1 AS Numeric(18, 0)), N' senate', N'0', NULL, CAST(0x0000A5210169AF28 AS DateTime))
INSERT [dbo].[TypeMaster] ([TypeID], [TypeDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(2 AS Numeric(18, 0)), N' syndicate', N'0', NULL, CAST(0x0000A5210169B951 AS DateTime))
INSERT [dbo].[TypeMaster] ([TypeID], [TypeDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(3 AS Numeric(18, 0)), N' newq', N'0', NULL, CAST(0x0000A5240000F153 AS DateTime))
SET IDENTITY_INSERT [dbo].[TypeMaster] OFF
/****** Object:  Table [dbo].[Permission]    Script Date: 01/04/2016 07:49:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Permission](
	[Id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[UserDesc] [nchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Formname] [nchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[f_add] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[f_edit] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[f_delete] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[f_view] [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserId] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[Permission] ON
INSERT [dbo].[Permission] ([Id], [UserDesc], [Formname], [f_add], [f_edit], [f_delete], [f_view], [UserId]) VALUES (CAST(1 AS Numeric(18, 0)), N'Admin                                             ', N'TypeMaster                                        ', N'1', N'0', N'0', N'0', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Permission] ([Id], [UserDesc], [Formname], [f_add], [f_edit], [f_delete], [f_view], [UserId]) VALUES (CAST(2 AS Numeric(18, 0)), N'Admin                                             ', N'Category                                          ', N'1', N'0', N'0', N'0', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Permission] ([Id], [UserDesc], [Formname], [f_add], [f_edit], [f_delete], [f_view], [UserId]) VALUES (CAST(3 AS Numeric(18, 0)), N'Admin                                             ', N'Member                                            ', N'1', N'0', N'0', N'0', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Permission] ([Id], [UserDesc], [Formname], [f_add], [f_edit], [f_delete], [f_view], [UserId]) VALUES (CAST(4 AS Numeric(18, 0)), N'Admin                                             ', N'Document                                          ', N'1', N'0', N'0', N'0', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Permission] ([Id], [UserDesc], [Formname], [f_add], [f_edit], [f_delete], [f_view], [UserId]) VALUES (CAST(5 AS Numeric(18, 0)), N'Admin                                             ', N'DocumnetTrans                                     ', N'1', N'0', N'0', N'0', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Permission] ([Id], [UserDesc], [Formname], [f_add], [f_edit], [f_delete], [f_view], [UserId]) VALUES (CAST(6 AS Numeric(18, 0)), N'Admin                                             ', N'UserMaster                                        ', N'1', N'0', N'0', N'0', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[Permission] ([Id], [UserDesc], [Formname], [f_add], [f_edit], [f_delete], [f_view], [UserId]) VALUES (CAST(7 AS Numeric(18, 0)), N'SuperUser                                         ', N'TypeMaster                                        ', N'0', N'0', N'0', N'0', CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[Permission] ([Id], [UserDesc], [Formname], [f_add], [f_edit], [f_delete], [f_view], [UserId]) VALUES (CAST(8 AS Numeric(18, 0)), N'SuperUser                                         ', N'Category                                          ', N'0', N'0', N'0', N'0', CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[Permission] ([Id], [UserDesc], [Formname], [f_add], [f_edit], [f_delete], [f_view], [UserId]) VALUES (CAST(9 AS Numeric(18, 0)), N'SuperUser                                         ', N'Member                                            ', N'0', N'0', N'0', N'0', CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[Permission] ([Id], [UserDesc], [Formname], [f_add], [f_edit], [f_delete], [f_view], [UserId]) VALUES (CAST(10 AS Numeric(18, 0)), N'SuperUser                                         ', N'Document                                          ', N'0', N'0', N'0', N'0', CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[Permission] ([Id], [UserDesc], [Formname], [f_add], [f_edit], [f_delete], [f_view], [UserId]) VALUES (CAST(11 AS Numeric(18, 0)), N'SuperUser                                         ', N'DocumentTrans                                     ', N'0', N'0', N'0', N'0', CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[Permission] ([Id], [UserDesc], [Formname], [f_add], [f_edit], [f_delete], [f_view], [UserId]) VALUES (CAST(12 AS Numeric(18, 0)), N'SuperUser                                         ', N'UserMaster                                        ', N'0', N'0', N'0', N'0', CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[Permission] ([Id], [UserDesc], [Formname], [f_add], [f_edit], [f_delete], [f_view], [UserId]) VALUES (CAST(13 AS Numeric(18, 0)), N'User                                              ', N'TyperMaster                                       ', N'0', N'0', N'0', N'0', CAST(3 AS Numeric(18, 0)))
INSERT [dbo].[Permission] ([Id], [UserDesc], [Formname], [f_add], [f_edit], [f_delete], [f_view], [UserId]) VALUES (CAST(14 AS Numeric(18, 0)), N'User                                              ', N'Category                                          ', N'0', N'0', N'0', N'0', CAST(3 AS Numeric(18, 0)))
INSERT [dbo].[Permission] ([Id], [UserDesc], [Formname], [f_add], [f_edit], [f_delete], [f_view], [UserId]) VALUES (CAST(15 AS Numeric(18, 0)), N'User                                              ', N'Member                                            ', N'0', N'0', N'0', N'0', CAST(3 AS Numeric(18, 0)))
INSERT [dbo].[Permission] ([Id], [UserDesc], [Formname], [f_add], [f_edit], [f_delete], [f_view], [UserId]) VALUES (CAST(16 AS Numeric(18, 0)), N'User                                              ', N'Document                                          ', N'0', N'0', N'0', N'0', CAST(3 AS Numeric(18, 0)))
INSERT [dbo].[Permission] ([Id], [UserDesc], [Formname], [f_add], [f_edit], [f_delete], [f_view], [UserId]) VALUES (CAST(17 AS Numeric(18, 0)), N'User                                              ', N'DocumnetTrans                                     ', N'0', N'0', N'0', N'0', CAST(3 AS Numeric(18, 0)))
INSERT [dbo].[Permission] ([Id], [UserDesc], [Formname], [f_add], [f_edit], [f_delete], [f_view], [UserId]) VALUES (CAST(18 AS Numeric(18, 0)), N'User                                              ', N'UserMaster                                        ', N'0', N'0', N'0', N'0', CAST(3 AS Numeric(18, 0)))
SET IDENTITY_INSERT [dbo].[Permission] OFF
/****** Object:  Table [dbo].[MemberType]    Script Date: 01/04/2016 07:49:42 ******/
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
INSERT [dbo].[MemberType] ([MemberID], [TypeID], [CategoryID], [Isdeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(123 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[MemberType] ([MemberID], [TypeID], [CategoryID], [Isdeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(159 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[MemberType] ([MemberID], [TypeID], [CategoryID], [Isdeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(95 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[MemberType] ([MemberID], [TypeID], [CategoryID], [Isdeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(95 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[MemberType] ([MemberID], [TypeID], [CategoryID], [Isdeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(159 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), NULL, NULL, NULL)
/****** Object:  Table [dbo].[MemberMaster]    Script Date: 01/04/2016 07:49:42 ******/
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
	[UserType] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_MemberMaster] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[MemberMaster] ON
INSERT [dbo].[MemberMaster] ([MemberID], [Code], [MemberName], [MemberDesc], [Address1], [Address2], [PinCode], [Contact1], [Contact2], [Contact3], [EmailID], [LoginID], [LoginPass], [IsDeleted], [UpdatedBy], [UpdatedOn], [UserType]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(123 AS Numeric(18, 0)), N'riddhi', N'tech', N'', N'', N'', N'', N'', N'', N'riddhisoni1324@gmail.com', N'123', N'', NULL, NULL, NULL, N'1')
INSERT [dbo].[MemberMaster] ([MemberID], [Code], [MemberName], [MemberDesc], [Address1], [Address2], [PinCode], [Contact1], [Contact2], [Contact3], [EmailID], [LoginID], [LoginPass], [IsDeleted], [UpdatedBy], [UpdatedOn], [UserType]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(159 AS Numeric(18, 0)), N'soni', N'123', N'', N'', N'', N'', N'', N'', N'riddhisoni1324@yahoo.com', N'159', N'', NULL, NULL, NULL, N'3')
INSERT [dbo].[MemberMaster] ([MemberID], [Code], [MemberName], [MemberDesc], [Address1], [Address2], [PinCode], [Contact1], [Contact2], [Contact3], [EmailID], [LoginID], [LoginPass], [IsDeleted], [UpdatedBy], [UpdatedOn], [UserType]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(95 AS Numeric(18, 0)), N'new', N'95', N'', N'', N'', N'', N'', N'', N'er@sdf.c', N'95', N'', NULL, NULL, NULL, N'2')
SET IDENTITY_INSERT [dbo].[MemberMaster] OFF
/****** Object:  Table [dbo].[DocTrans]    Script Date: 01/04/2016 07:49:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DocTrans]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DocTrans](
	[DTID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[DocID] [numeric](18, 0) NULL,
	[DocDate] [datetime] NULL,
	[Title] [nvarchar](70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DocDetail] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedBy] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedOn] [datetime] NULL,
	[MailSent] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_DocTrans] PRIMARY KEY CLUSTERED 
(
	[DTID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[DocTrans] ON
INSERT [dbo].[DocTrans] ([DTID], [DocID], [DocDate], [Title], [DocDetail], [UpdatedBy], [UpdatedOn], [MailSent]) VALUES (CAST(31 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(0x0000A5760089465C AS DateTime), N'dg', N'dfg', NULL, NULL, NULL)
INSERT [dbo].[DocTrans] ([DTID], [DocID], [DocDate], [Title], [DocDetail], [UpdatedBy], [UpdatedOn], [MailSent]) VALUES (CAST(32 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000A58300702FF9 AS DateTime), N'ser', N'wre', NULL, NULL, NULL)
INSERT [dbo].[DocTrans] ([DTID], [DocID], [DocDate], [Title], [DocDetail], [UpdatedBy], [UpdatedOn], [MailSent]) VALUES (CAST(33 AS Numeric(18, 0)), NULL, CAST(0x0000A5830079F04E AS DateTime), N'hii', N'hello', NULL, NULL, NULL)
INSERT [dbo].[DocTrans] ([DTID], [DocID], [DocDate], [Title], [DocDetail], [UpdatedBy], [UpdatedOn], [MailSent]) VALUES (CAST(34 AS Numeric(18, 0)), NULL, CAST(0x0000A583007A00CA AS DateTime), N'dfg', N'dfg', NULL, NULL, NULL)
INSERT [dbo].[DocTrans] ([DTID], [DocID], [DocDate], [Title], [DocDetail], [UpdatedBy], [UpdatedOn], [MailSent]) VALUES (CAST(37 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(0x0000A583007BE8A1 AS DateTime), N'sad', N'sd', NULL, NULL, NULL)
INSERT [dbo].[DocTrans] ([DTID], [DocID], [DocDate], [Title], [DocDetail], [UpdatedBy], [UpdatedOn], [MailSent]) VALUES (CAST(38 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(0x0000A583007C1BA4 AS DateTime), N'df', N'dfg', NULL, NULL, NULL)
INSERT [dbo].[DocTrans] ([DTID], [DocID], [DocDate], [Title], [DocDetail], [UpdatedBy], [UpdatedOn], [MailSent]) VALUES (CAST(39 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), CAST(0x0000A583007E036F AS DateTime), N'dsf', N'dsf', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[DocTrans] OFF
/****** Object:  Table [dbo].[DocMaster]    Script Date: 01/04/2016 07:49:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DocMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DocMaster](
	[DocID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[DocDesc] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserID] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_DocMaster] PRIMARY KEY CLUSTERED 
(
	[DocID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[DocMaster] ON
INSERT [dbo].[DocMaster] ([DocID], [DocDesc], [UserID], [UpdatedOn]) VALUES (CAST(1 AS Numeric(18, 0)), N'notice', NULL, NULL)
INSERT [dbo].[DocMaster] ([DocID], [DocDesc], [UserID], [UpdatedOn]) VALUES (CAST(2 AS Numeric(18, 0)), N' circular', NULL, NULL)
INSERT [dbo].[DocMaster] ([DocID], [DocDesc], [UserID], [UpdatedOn]) VALUES (CAST(3 AS Numeric(18, 0)), N' pub', NULL, NULL)
INSERT [dbo].[DocMaster] ([DocID], [DocDesc], [UserID], [UpdatedOn]) VALUES (CAST(4 AS Numeric(18, 0)), N' newone', NULL, NULL)
INSERT [dbo].[DocMaster] ([DocID], [DocDesc], [UserID], [UpdatedOn]) VALUES (CAST(5 AS Numeric(18, 0)), N' newone1', NULL, NULL)
SET IDENTITY_INSERT [dbo].[DocMaster] OFF
/****** Object:  Table [dbo].[DocHistory]    Script Date: 01/04/2016 07:49:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DocHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DocHistory](
	[DHID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[DTID] [numeric](18, 0) NULL,
	[MemberID] [numeric](18, 0) NULL,
	[MailSentDate] [datetime] NULL,
	[MailSentFlag] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedBy] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_DocHistory] PRIMARY KEY CLUSTERED 
(
	[DHID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[DocHistory] ON
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(30 AS Numeric(18, 0)), CAST(123 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(10 AS Numeric(18, 0)), CAST(30 AS Numeric(18, 0)), CAST(159 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(11 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(123 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(12 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(159 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(13 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(95 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(14 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(123 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(15 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(159 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(16 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(95 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(17 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(123 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(18 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(159 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(19 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(95 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(20 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(123 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(21 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(159 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(22 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(95 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(23 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(123 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(24 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(123 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(25 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(123 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(26 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(123 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(27 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(159 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(28 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(95 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(29 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(123 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(30 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(159 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(31 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(95 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(32 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(123 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(33 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(159 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(34 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(95 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(35 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(123 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(36 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(159 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(37 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(95 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(38 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(123 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(39 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(159 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(40 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(95 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(41 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(123 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(42 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(159 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(43 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(95 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(44 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(123 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(45 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(159 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(46 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(95 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(47 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(123 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(48 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(159 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(49 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(95 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(50 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(123 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(51 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(159 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(52 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(95 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(53 AS Numeric(18, 0)), CAST(32 AS Numeric(18, 0)), CAST(123 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(54 AS Numeric(18, 0)), CAST(32 AS Numeric(18, 0)), CAST(159 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(55 AS Numeric(18, 0)), CAST(32 AS Numeric(18, 0)), CAST(95 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(56 AS Numeric(18, 0)), CAST(32 AS Numeric(18, 0)), CAST(123 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(57 AS Numeric(18, 0)), CAST(32 AS Numeric(18, 0)), CAST(123 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(58 AS Numeric(18, 0)), CAST(32 AS Numeric(18, 0)), CAST(123 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(59 AS Numeric(18, 0)), CAST(32 AS Numeric(18, 0)), CAST(123 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(60 AS Numeric(18, 0)), CAST(32 AS Numeric(18, 0)), CAST(159 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(61 AS Numeric(18, 0)), CAST(37 AS Numeric(18, 0)), CAST(159 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(62 AS Numeric(18, 0)), CAST(38 AS Numeric(18, 0)), CAST(159 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(63 AS Numeric(18, 0)), CAST(39 AS Numeric(18, 0)), CAST(123 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
INSERT [dbo].[DocHistory] ([DHID], [DTID], [MemberID], [MailSentDate], [MailSentFlag], [UpdatedBy], [UpdatedOn]) VALUES (CAST(64 AS Numeric(18, 0)), CAST(39 AS Numeric(18, 0)), CAST(123 AS Numeric(18, 0)), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[DocHistory] OFF
/****** Object:  Table [dbo].[DocAttach]    Script Date: 01/04/2016 07:49:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DocAttach]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DocAttach](
	[DAID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[DTID] [numeric](18, 0) NULL,
	[DocFilename] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DocFilepath] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedBy] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedOn] [datetime] NULL,
	[MemberId] [numeric](18, 0) NULL,
 CONSTRAINT [PK_DocAttach] PRIMARY KEY CLUSTERED 
(
	[DAID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[DocAttach] ON
INSERT [dbo].[DocAttach] ([DAID], [DTID], [DocFilename], [DocFilepath], [UpdatedBy], [UpdatedOn], [MemberId]) VALUES (CAST(120 AS Numeric(18, 0)), CAST(39 AS Numeric(18, 0)), N'Capture.PNG_01042016074104306', N'Attachment/notice/notice_39_01042016074104306_Capture.PNG', NULL, NULL, CAST(123 AS Numeric(18, 0)))
SET IDENTITY_INSERT [dbo].[DocAttach] OFF
/****** Object:  Table [dbo].[CategoryMaster]    Script Date: 01/04/2016 07:49:42 ******/
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
 CONSTRAINT [PK_CategoryMaster] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON),
 CONSTRAINT [UQ__Category__19093A2A24927208] UNIQUE NONCLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[CategoryMaster] ON
INSERT [dbo].[CategoryMaster] ([CategoryID], [TypeID], [CategoryDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N' dean - senate', N'0', NULL, CAST(0x0000A5210169CC28 AS DateTime))
INSERT [dbo].[CategoryMaster] ([CategoryID], [TypeID], [CategoryDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N' hod - syndicate', N'0', NULL, CAST(0x0000A5210169D4CF AS DateTime))
INSERT [dbo].[CategoryMaster] ([CategoryID], [TypeID], [CategoryDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N' hello - senate', N'0', NULL, CAST(0x0000A52400010FB8 AS DateTime))
INSERT [dbo].[CategoryMaster] ([CategoryID], [TypeID], [CategoryDesc], [IsDeleted], [UpdatedBy], [UpdatedOn]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), N' hii - newq', N'0', NULL, CAST(0x0000A58200ACD0F1 AS DateTime))
SET IDENTITY_INSERT [dbo].[CategoryMaster] OFF
/****** Object:  Default [DF_CategoryMaster_IsDeleted]    Script Date: 01/04/2016 07:49:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_CategoryMaster_IsDeleted]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryMaster]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CategoryMaster_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CategoryMaster] ADD  CONSTRAINT [DF_CategoryMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END


End
GO
/****** Object:  Default [DF_CategoryMaster_UpdatedOn]    Script Date: 01/04/2016 07:49:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_CategoryMaster_UpdatedOn]') AND parent_object_id = OBJECT_ID(N'[dbo].[CategoryMaster]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CategoryMaster_UpdatedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CategoryMaster] ADD  CONSTRAINT [DF_CategoryMaster_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
END


End
GO
/****** Object:  Default [DF_DocTrans_DocDate]    Script Date: 01/04/2016 07:49:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_DocTrans_DocDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[DocTrans]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DocTrans_DocDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DocTrans] ADD  CONSTRAINT [DF_DocTrans_DocDate]  DEFAULT (getdate()) FOR [DocDate]
END


End
GO
/****** Object:  Default [DF_Permission_f_add]    Script Date: 01/04/2016 07:49:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Permission_f_add]') AND parent_object_id = OBJECT_ID(N'[dbo].[Permission]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Permission_f_add]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Permission] ADD  CONSTRAINT [DF_Permission_f_add]  DEFAULT ((0)) FOR [f_add]
END


End
GO
/****** Object:  Default [DF_Permission_f_edit]    Script Date: 01/04/2016 07:49:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Permission_f_edit]') AND parent_object_id = OBJECT_ID(N'[dbo].[Permission]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Permission_f_edit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Permission] ADD  CONSTRAINT [DF_Permission_f_edit]  DEFAULT ((0)) FOR [f_edit]
END


End
GO
/****** Object:  Default [DF_Permission_f_delete]    Script Date: 01/04/2016 07:49:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Permission_f_delete]') AND parent_object_id = OBJECT_ID(N'[dbo].[Permission]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Permission_f_delete]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Permission] ADD  CONSTRAINT [DF_Permission_f_delete]  DEFAULT ((0)) FOR [f_delete]
END


End
GO
/****** Object:  Default [DF_Permission_f_view]    Script Date: 01/04/2016 07:49:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Permission_f_view]') AND parent_object_id = OBJECT_ID(N'[dbo].[Permission]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Permission_f_view]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Permission] ADD  CONSTRAINT [DF_Permission_f_view]  DEFAULT ((0)) FOR [f_view]
END


End
GO
/****** Object:  Default [DF_TypeMaster_IsDeleted]    Script Date: 01/04/2016 07:49:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TypeMaster_IsDeleted]') AND parent_object_id = OBJECT_ID(N'[dbo].[TypeMaster]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TypeMaster_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TypeMaster] ADD  CONSTRAINT [DF_TypeMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END


End
GO
/****** Object:  Default [DF_TypeMaster_UpdatedOn]    Script Date: 01/04/2016 07:49:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_TypeMaster_UpdatedOn]') AND parent_object_id = OBJECT_ID(N'[dbo].[TypeMaster]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TypeMaster_UpdatedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TypeMaster] ADD  CONSTRAINT [DF_TypeMaster_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
END


End
GO
