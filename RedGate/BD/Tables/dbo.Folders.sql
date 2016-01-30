CREATE TABLE [dbo].[Folders]
(
[FolderID] [int] NOT NULL IDENTITY(1, 1),
[PortalID] [int] NULL,
[FolderPath] [nvarchar] (300) COLLATE Modern_Spanish_CI_AS NOT NULL,
[StorageLocation] [int] NOT NULL CONSTRAINT [DF_Folders_StorageLocation] DEFAULT ((0)),
[IsProtected] [bit] NOT NULL CONSTRAINT [DF_Folders_IsProtected] DEFAULT ((0)),
[IsCached] [bit] NOT NULL CONSTRAINT [DF_Folders_IsCached] DEFAULT ((0)),
[LastUpdated] [datetime] NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL,
[UniqueId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Folders_UniqueId] DEFAULT (newid()),
[VersionGuid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Folders_VersionGuid] DEFAULT (newid()),
[FolderMappingID] [int] NOT NULL,
[ParentID] [int] NULL,
[IsVersioned] [bit] NOT NULL CONSTRAINT [DF__Folders__IsVersi__7795AE5F] DEFAULT ((0)),
[WorkflowID] [int] NULL,
[MappedPath] [nvarchar] (300) COLLATE Modern_Spanish_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Folders] ADD CONSTRAINT [PK_Folders] PRIMARY KEY CLUSTERED  ([FolderID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Folders] ADD CONSTRAINT [IX_FolderPath] UNIQUE NONCLUSTERED  ([PortalID], [FolderPath]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Folders] ADD CONSTRAINT [IX_Folders_UniqueId] UNIQUE NONCLUSTERED  ([UniqueId]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Folders_FolderID] ON [dbo].[Folders] ([FolderID]) INCLUDE ([FolderMappingID], [FolderPath], [IsCached], [PortalID], [StorageLocation]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Folders_ParentID] ON [dbo].[Folders] ([PortalID], [ParentID], [FolderPath]) INCLUDE ([FolderID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Folders] ADD CONSTRAINT [FK_Folders_FolderMappings] FOREIGN KEY ([FolderMappingID]) REFERENCES [dbo].[FolderMappings] ([FolderMappingID])
GO
ALTER TABLE [dbo].[Folders] ADD CONSTRAINT [FK_Folders_Portals] FOREIGN KEY ([PortalID]) REFERENCES [dbo].[Portals] ([PortalID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Folders] ADD CONSTRAINT [FK_Folders_ContentWorkflows] FOREIGN KEY ([WorkflowID]) REFERENCES [dbo].[ContentWorkflows] ([WorkflowID]) ON DELETE SET NULL
GO
