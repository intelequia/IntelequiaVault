CREATE TABLE [dbo].[FolderMappings]
(
[FolderMappingID] [int] NOT NULL IDENTITY(1, 1),
[PortalID] [int] NULL,
[MappingName] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[FolderProviderType] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Priority] [int] NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FolderMappings] ADD CONSTRAINT [PK_FolderMappings] PRIMARY KEY CLUSTERED  ([FolderMappingID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FolderMappings] ADD CONSTRAINT [IX_FolderMappings] UNIQUE NONCLUSTERED  ([PortalID], [MappingName]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FolderMappings] ADD CONSTRAINT [FK_FolderMappings_Portals] FOREIGN KEY ([PortalID]) REFERENCES [dbo].[Portals] ([PortalID]) ON DELETE CASCADE
GO
