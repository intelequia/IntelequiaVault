CREATE TABLE [dbo].[UserPortals]
(
[UserId] [int] NOT NULL,
[PortalId] [int] NOT NULL,
[UserPortalId] [int] NOT NULL IDENTITY(1, 1),
[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_UserPortals_CreatedDate] DEFAULT (getdate()),
[Authorised] [bit] NOT NULL CONSTRAINT [DF_UserPortals_Authorised] DEFAULT ((1)),
[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_UserPortals_IsDeleted] DEFAULT ((0)),
[RefreshRoles] [bit] NOT NULL CONSTRAINT [DF_UserPortals_RefreshRoles] DEFAULT ((0)),
[VanityUrl] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserPortals] ADD CONSTRAINT [PK_UserPortals] PRIMARY KEY CLUSTERED  ([UserId], [PortalId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserPortals] ON [dbo].[UserPortals] ([PortalId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserPortals_PortalId_IsDeleted] ON [dbo].[UserPortals] ([PortalId], [IsDeleted]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserPortals_VanityUrl] ON [dbo].[UserPortals] ([VanityUrl]) INCLUDE ([PortalId], [UserId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserPortals] ADD CONSTRAINT [FK_UserPortals_Portals] FOREIGN KEY ([PortalId]) REFERENCES [dbo].[Portals] ([PortalID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserPortals] ADD CONSTRAINT [FK_UserPortals_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserID]) ON DELETE CASCADE
GO
