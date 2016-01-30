CREATE TABLE [dbo].[TabModules]
(
[TabModuleID] [int] NOT NULL IDENTITY(1, 1),
[TabID] [int] NOT NULL,
[ModuleID] [int] NOT NULL,
[PaneName] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[ModuleOrder] [int] NOT NULL,
[CacheTime] [int] NOT NULL,
[Alignment] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL,
[Color] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL,
[Border] [nvarchar] (1) COLLATE Modern_Spanish_CI_AS NULL,
[IconFile] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL,
[Visibility] [int] NOT NULL,
[ContainerSrc] [nvarchar] (200) COLLATE Modern_Spanish_CI_AS NULL,
[DisplayTitle] [bit] NOT NULL CONSTRAINT [DF_TabModules_DisplayTitle] DEFAULT ((1)),
[DisplayPrint] [bit] NOT NULL CONSTRAINT [DF_TabModules_DisplayPrint] DEFAULT ((1)),
[DisplaySyndicate] [bit] NOT NULL CONSTRAINT [DF_TabModules_DisplaySyndicate] DEFAULT ((1)),
[IsWebSlice] [bit] NOT NULL CONSTRAINT [DF_abModules_IsWebSlice] DEFAULT ((0)),
[WebSliceTitle] [nvarchar] (256) COLLATE Modern_Spanish_CI_AS NULL,
[WebSliceExpiryDate] [datetime] NULL,
[WebSliceTTL] [int] NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL CONSTRAINT [DF_TabModules_CreatedOnDate] DEFAULT (getdate()),
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL CONSTRAINT [DF_TabModules_LastModifiedOnDate] DEFAULT (getdate()),
[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_TabModules_IsDeleted] DEFAULT ((0)),
[CacheMethod] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL,
[ModuleTitle] [nvarchar] (256) COLLATE Modern_Spanish_CI_AS NULL,
[Header] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL,
[Footer] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL,
[CultureCode] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL,
[UniqueId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_TabModules_Guid] DEFAULT (newid()),
[VersionGuid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_TabModules_VersionGuid] DEFAULT (newid()),
[DefaultLanguageGuid] [uniqueidentifier] NULL,
[LocalizedVersionGuid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_TabModules_LocalizedVersionGuid] DEFAULT (newid())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[TabModules] ADD CONSTRAINT [PK_TabModules] PRIMARY KEY CLUSTERED  ([TabModuleID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TabModules] ADD CONSTRAINT [IX_TabModules_UniqueId] UNIQUE NONCLUSTERED  ([UniqueId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TabModules_ModuleID] ON [dbo].[TabModules] ([ModuleID], [TabID]) INCLUDE ([CultureCode], [IsDeleted], [ModuleTitle]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_TabModules_TabID] ON [dbo].[TabModules] ([TabID], [ModuleID]) INCLUDE ([CultureCode], [IsDeleted], [ModuleTitle]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TabModules_ModuleOrder] ON [dbo].[TabModules] ([TabID], [PaneName], [ModuleOrder]) INCLUDE ([Alignment], [Border], [CacheMethod], [CacheTime], [Color], [ContainerSrc], [CreatedByUserID], [CreatedOnDate], [CultureCode], [DefaultLanguageGuid], [DisplayPrint], [DisplaySyndicate], [DisplayTitle], [Footer], [Header], [IconFile], [IsDeleted], [IsWebSlice], [LastModifiedByUserID], [LastModifiedOnDate], [LocalizedVersionGuid], [ModuleID], [ModuleTitle], [TabModuleID], [UniqueId], [VersionGuid], [Visibility], [WebSliceExpiryDate], [WebSliceTitle], [WebSliceTTL]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TabModules] WITH NOCHECK ADD CONSTRAINT [FK_TabModules_Modules] FOREIGN KEY ([ModuleID]) REFERENCES [dbo].[Modules] ([ModuleID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TabModules] WITH NOCHECK ADD CONSTRAINT [FK_TabModules_Tabs] FOREIGN KEY ([TabID]) REFERENCES [dbo].[Tabs] ([TabID]) ON DELETE CASCADE
GO
