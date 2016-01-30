CREATE TABLE [dbo].[RoleGroups]
(
[RoleGroupID] [int] NOT NULL IDENTITY(0, 1),
[PortalID] [int] NOT NULL,
[RoleGroupName] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL,
[Description] [nvarchar] (1000) COLLATE Modern_Spanish_CI_AS NULL,
[CreatedByUserID] [int] NULL,
[CreatedOnDate] [datetime] NULL,
[LastModifiedByUserID] [int] NULL,
[LastModifiedOnDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RoleGroups] ADD CONSTRAINT [PK_RoleGroups] PRIMARY KEY CLUSTERED  ([RoleGroupID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RoleGroups] ADD CONSTRAINT [IX_RoleGroupName] UNIQUE NONCLUSTERED  ([PortalID], [RoleGroupName]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RoleGroups] ADD CONSTRAINT [FK_RoleGroups_Portals] FOREIGN KEY ([PortalID]) REFERENCES [dbo].[Portals] ([PortalID]) ON DELETE CASCADE
GO
