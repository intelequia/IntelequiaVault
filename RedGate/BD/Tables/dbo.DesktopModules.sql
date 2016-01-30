CREATE TABLE [dbo].[DesktopModules]
(
[DesktopModuleID] [int] NOT NULL IDENTITY(1, 1),
[FriendlyName] [nvarchar] (128) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Description] [nvarchar] (2000) COLLATE Modern_Spanish_CI_AS NULL,
[Version] [nvarchar] (8) COLLATE Modern_Spanish_CI_AS NULL,
[IsPremium] [bit] NOT NULL,
[IsAdmin] [bit] NOT NULL,
[BusinessControllerClass] [nvarchar] (200) COLLATE Modern_Spanish_CI_AS NULL,
[FolderName] [nvarchar] (128) COLLATE Modern_Spanish_CI_AS NOT NULL,
[ModuleName] [nvarchar] (128) COLLATE Modern_Spanish_CI_AS NOT NULL,
[SupportedFeatures] [int] NOT NULL CONSTRAINT [DF_DesktopModules_SupportedFeatures] DEFAULT ((0)),
[CompatibleVersions] [nvarchar] (500) COLLATE Modern_Spanish_CI_AS NULL,
[Dependencies] [nvarchar] (400) COLLATE Modern_Spanish_CI_AS NULL,
[Permissions] [nvarchar] (400) COLLATE Modern_Spanish_CI_AS NULL,
[PackageID] [int] NOT NULL CONSTRAINT [DF_DesktopModules_PackageID] DEFAULT ((-1)),
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL,
[ContentItemId] [int] NOT NULL CONSTRAINT [DF_DesktopModules_ContentItemId] DEFAULT ((-1)),
[Shareable] [int] NOT NULL CONSTRAINT [DF_DesktopModules_Shareable] DEFAULT ((0)),
[AdminPage] [nvarchar] (128) COLLATE Modern_Spanish_CI_AS NULL,
[HostPage] [nvarchar] (128) COLLATE Modern_Spanish_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DesktopModules] ADD CONSTRAINT [PK_DesktopModules] PRIMARY KEY CLUSTERED  ([DesktopModuleID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DesktopModules] ADD CONSTRAINT [IX_DesktopModules_ModuleName] UNIQUE NONCLUSTERED  ([ModuleName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DesktopModules_FriendlyName] ON [dbo].[DesktopModules] ([FriendlyName]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DesktopModules] WITH NOCHECK ADD CONSTRAINT [FK_DesktopModules_Packages] FOREIGN KEY ([PackageID]) REFERENCES [dbo].[Packages] ([PackageID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
