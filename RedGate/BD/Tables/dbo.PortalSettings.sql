CREATE TABLE [dbo].[PortalSettings]
(
[PortalSettingID] [int] NOT NULL IDENTITY(1, 1),
[PortalID] [int] NOT NULL,
[SettingName] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[SettingValue] [nvarchar] (2000) COLLATE Modern_Spanish_CI_AS NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL,
[CultureCode] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PortalSettings] ADD CONSTRAINT [PK_PortalSettings] PRIMARY KEY NONCLUSTERED  ([PortalSettingID]) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_PortalSettings] ON [dbo].[PortalSettings] ([PortalID], [CultureCode], [SettingName]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PortalSettings] ADD CONSTRAINT [FK_PortalSettings_Portals] FOREIGN KEY ([PortalID]) REFERENCES [dbo].[Portals] ([PortalID]) ON DELETE CASCADE
GO
