CREATE TABLE [dbo].[Tabs]
(
[TabID] [int] NOT NULL IDENTITY(0, 1),
[TabOrder] [int] NOT NULL CONSTRAINT [DF_Tabs_TabOrder] DEFAULT ((0)),
[PortalID] [int] NULL,
[TabName] [nvarchar] (200) COLLATE Modern_Spanish_CI_AS NOT NULL,
[IsVisible] [bit] NOT NULL CONSTRAINT [DF_Tabs_IsVisible] DEFAULT ((1)),
[ParentId] [int] NULL,
[IconFile] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL,
[DisableLink] [bit] NOT NULL CONSTRAINT [DF_Tabs_DisableLink] DEFAULT ((0)),
[Title] [nvarchar] (200) COLLATE Modern_Spanish_CI_AS NULL,
[Description] [nvarchar] (500) COLLATE Modern_Spanish_CI_AS NULL,
[KeyWords] [nvarchar] (500) COLLATE Modern_Spanish_CI_AS NULL,
[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_Tabs_IsDeleted] DEFAULT ((0)),
[Url] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL,
[SkinSrc] [nvarchar] (200) COLLATE Modern_Spanish_CI_AS NULL,
[ContainerSrc] [nvarchar] (200) COLLATE Modern_Spanish_CI_AS NULL,
[StartDate] [datetime] NULL,
[EndDate] [datetime] NULL,
[RefreshInterval] [int] NULL,
[PageHeadText] [nvarchar] (max) COLLATE Modern_Spanish_CI_AS NULL,
[IsSecure] [bit] NOT NULL CONSTRAINT [DF_Tabs_IsSecure] DEFAULT ((0)),
[PermanentRedirect] [bit] NOT NULL CONSTRAINT [DF_Tabs_PermanentRedirect] DEFAULT ((0)),
[SiteMapPriority] [float] NOT NULL CONSTRAINT [DF_Tabs_SiteMapPriority] DEFAULT ((0.5)),
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL,
[IconFileLarge] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL,
[CultureCode] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL,
[ContentItemID] [int] NULL,
[UniqueId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Tabs_Guid] DEFAULT (newid()),
[VersionGuid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Tabs_VersionGuid] DEFAULT (newid()),
[DefaultLanguageGuid] [uniqueidentifier] NULL,
[LocalizedVersionGuid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Tabs_LocalizedVersionGuid] DEFAULT (newid()),
[Level] [int] NOT NULL CONSTRAINT [DF__Tabs__Level__526429B0] DEFAULT ((0)),
[TabPath] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NOT NULL CONSTRAINT [DF__Tabs__TabPat__53584DE9] DEFAULT (''),
[HasBeenPublished] [bit] NOT NULL CONSTRAINT [DF_Tabs_HasBeenPublished] DEFAULT ((0)),
[IsSystem] [bit] NOT NULL CONSTRAINT [DF__Tabs__IsSystem__1A3FCC1E] DEFAULT ((0))
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tabs] ADD CONSTRAINT [PK_Tabs] PRIMARY KEY CLUSTERED  ([TabID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tabs] ADD CONSTRAINT [IX_Tabs_UniqueId] UNIQUE NONCLUSTERED  ([UniqueId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Tabs_ContentID] ON [dbo].[Tabs] ([ContentItemID]) INCLUDE ([CultureCode], [IsDeleted], [IsVisible], [TabID], [TabName], [Title], [UniqueId]) WHERE ([ContentItemId] IS NOT NULL) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Tabs_ParentId_IsDeleted] ON [dbo].[Tabs] ([ParentId], [IsDeleted]) INCLUDE ([CreatedOnDate]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Tabs_PortalLevelParentOrder] ON [dbo].[Tabs] ([PortalID], [Level], [ParentId], [TabOrder], [IsDeleted]) INCLUDE ([ContainerSrc], [ContentItemID], [CreatedByUserID], [CreatedOnDate], [CultureCode], [DefaultLanguageGuid], [Description], [DisableLink], [EndDate], [IconFile], [IconFileLarge], [IsSecure], [IsVisible], [KeyWords], [LastModifiedByUserID], [LastModifiedOnDate], [LocalizedVersionGuid], [PageHeadText], [PermanentRedirect], [RefreshInterval], [SiteMapPriority], [SkinSrc], [StartDate], [TabID], [TabName], [TabPath], [Title], [UniqueId], [Url], [VersionGuid]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tabs] ADD CONSTRAINT [FK_Tabs_ContentItems] FOREIGN KEY ([ContentItemID]) REFERENCES [dbo].[ContentItems] ([ContentItemID])
GO
ALTER TABLE [dbo].[Tabs] WITH NOCHECK ADD CONSTRAINT [FK_Tabs_Tabs] FOREIGN KEY ([ParentId]) REFERENCES [dbo].[Tabs] ([TabID])
GO
ALTER TABLE [dbo].[Tabs] WITH NOCHECK ADD CONSTRAINT [FK_Tabs_Portals] FOREIGN KEY ([PortalID]) REFERENCES [dbo].[Portals] ([PortalID]) ON DELETE CASCADE
GO
