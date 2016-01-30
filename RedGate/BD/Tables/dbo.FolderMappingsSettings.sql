CREATE TABLE [dbo].[FolderMappingsSettings]
(
[FolderMappingID] [int] NOT NULL,
[SettingName] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[SettingValue] [nvarchar] (2000) COLLATE Modern_Spanish_CI_AS NOT NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FolderMappingsSettings] ADD CONSTRAINT [PK_FolderMappingsSettings] PRIMARY KEY CLUSTERED  ([FolderMappingID], [SettingName]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FolderMappingsSettings] WITH NOCHECK ADD CONSTRAINT [FK_FolderMappingsSettings_FolderMappings] FOREIGN KEY ([FolderMappingID]) REFERENCES [dbo].[FolderMappings] ([FolderMappingID]) ON DELETE CASCADE
GO
